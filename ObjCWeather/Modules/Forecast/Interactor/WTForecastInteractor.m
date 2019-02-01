//
//  WTForecastInteractor.m
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import "WTForecastInteractor.h"
#import "WTWeatherService.h"
#import "WTSettingsService.h"

@interface WTForecastInteractor ()

@property (nonatomic, strong) RACSubject *refreshSubject;

@end

@implementation WTForecastInteractor

- (instancetype)init
{
    if ((self = [super init]))
    {
        self.refreshSubject = [RACSubject subject];
    }
    return self;
}

// MARK: - WTForecastInteractorProtocol

- (id<RACSubscriber>)refresh
{
    return self.refreshSubject;
}

- (RACSignal<NSArray<WTWeather *> *> *)obtainForecast
{
    @weakify(self)
    return [[[[self.refreshSubject startWith:RACUnit.defaultUnit]
           mapReplace:[self.settingsService obtainCurrentCity]]
           switchToLatest]
           flattenMap:^RACSignal * (WTCity *city) {
               @strongify(self)
               return [self.weatherService obtainForecastForCity:city];
           }];
}

@end
