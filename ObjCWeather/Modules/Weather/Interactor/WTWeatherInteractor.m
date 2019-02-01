//
//  WTWeatherInteractor.m
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import "WTWeatherInteractor.h"
#import "WTWeatherService.h"
#import "WTSettingsService.h"

@interface WTWeatherInteractor ()

@property (nonatomic, strong) RACSubject *refreshSubject;

@end

@implementation WTWeatherInteractor

- (instancetype)init
{
    if ((self = [super init]))
    {
        self.refreshSubject = [RACSubject subject];
    }
    return self;
}

// MARK: - WTWeatherInteractorProtocol

- (id<RACSubscriber>)refresh
{
    return self.refreshSubject;
}

- (RACSignal<WTWeather *> *)obtainWeather
{
    @weakify(self)
    return [[[[self.refreshSubject startWith:RACUnit.defaultUnit]
           mapReplace:[self.settingsService obtainCurrentCity]]
           switchToLatest]
           flattenMap:^RACSignal * (WTCity *city) {
               @strongify(self)
               return [self.weatherService obtainWeatherForCity:city];
           }];
}

- (RACSignal<WTCity *> *)obtainCurrentCity
{
    return self.settingsService.obtainCurrentCity;
}

@end
