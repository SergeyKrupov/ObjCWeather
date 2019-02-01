//
//  WTSettingsComponent.m
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "WTSettingsComponent.h"
#import "WTCity.h"

static NSString * const kCurrentCityIdentifierKey = @"current.city";

@interface WTSettingsComponent ()

@property (nonatomic, strong) RACSignal<NSArray<WTCity *> *> *allCitiesSignal;
@property (nonatomic, strong) RACSignal<WTCity *> *currentCitySignal;

@end

@implementation WTSettingsComponent

- (instancetype)init
{
    if ((self = [super init]))
    {
        self.allCitiesSignal = [[RACSignal createSignal:^RACDisposable * (id<RACSubscriber> subscriber) {
            NSError *error = nil;
            NSURL *url = [[NSBundle mainBundle] URLForResource:@"Cities" withExtension:@"json"];
            NSData *content = [NSData dataWithContentsOfURL:url];
            NSArray *json = [NSJSONSerialization JSONObjectWithData:content options:0 error:&error];

            if (error)
            {
                [subscriber sendError:error];
            }
            else
            {
                NSValueTransformer *transformer = [MTLJSONAdapter arrayTransformerWithModelClass:[WTCity class]];
                NSArray *cities = [transformer transformedValue:json];
                [subscriber sendNext:cities];
                [subscriber sendCompleted];
            }

            return nil;
        }]
        replayLast];

        self.currentCitySignal = [[[[[NSUserDefaults standardUserDefaults]
            rac_channelTerminalForKey:kCurrentCityIdentifierKey]
            combineLatestWith:self.allCitiesSignal]
            map:^id _Nullable(RACTuple *tuple) {
                NSNumber *identifier = tuple.first;
                NSArray<WTCity *> *cities = tuple.second;

                for (WTCity *city in cities)
                {
                    if ([city.identifier isEqual:identifier])
                    {
                        return city;
                    }
                }

                return cities.firstObject;
            }]
            replayLast];
    }
    return self;
}

- (id<RACSubscriber>)updateCurrentCityIdentifier
{
    return [[NSUserDefaults standardUserDefaults] rac_channelTerminalForKey:kCurrentCityIdentifierKey];
}

- (RACSignal<WTCity *> *)obtainCurrentCity
{
    return self.currentCitySignal;
}

- (RACSignal<NSArray<WTCity *> *> *)obtainAllCities
{
    return self.allCitiesSignal;
}

@end
