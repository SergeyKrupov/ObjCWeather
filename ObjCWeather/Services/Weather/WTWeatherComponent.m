//
//  WTWeatherComponent.m
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import "WTWeatherComponent.h"
#import "WTNetworkService.h"
#import "WTSettingsService.h"
#import "WTApiWeather.h"
#import "WTApiForecast.h"
#import "WTWeather.h"
#import "WTCity.h"
#import "WTWEather+Creation.h"

@implementation WTWeatherComponent

- (RACSignal *)obtainWeatherForCity:(WTCity *)city
{
    @weakify(self)
    return [[[self.settingsService obtainCurrentCity]
        flattenMap:^__kindof RACSignal * _Nullable(WTCity *city) {
            @strongify(self)

            NSURL *url = [self.settingsService.baseURL URLByAppendingPathComponent:@"data/2.5/weather"];

            NSDictionary *parameters = @{
                @"id":    city.identifier,
                @"appid": self.settingsService.secret,
                @"units": @"metric"
            };

            return [self.networkService requestWithURL:url parameters:parameters class:WTApiWeather.class];
        }]
        map:^id _Nullable(WTApiWeather *weather) {
            WTWeather *model = [WTWeather createFromAPIWeather:weather];
            return model;
        }];
}

- (RACSignal<NSArray<WTWeather *> *> *)obtainForecastForCity:(WTCity *)city
{
    @weakify(self)
    return [[[self.settingsService obtainCurrentCity]
        flattenMap:^__kindof RACSignal * _Nullable(WTCity *city) {
            @strongify(self)
            NSURL *url = [self.settingsService.baseURL URLByAppendingPathComponent:@"data/2.5/forecast"];

            NSDictionary *parameters = @{
                @"id":    city.identifier,
                @"appid": self.settingsService.secret,
                @"units": @"metric"
            };

            return [self.networkService requestWithURL:url parameters:parameters class:WTApiForecast.class];
        }]
        map:^NSArray *(WTApiForecast *forecast) {
            NSMutableArray *models = [NSMutableArray arrayWithCapacity:forecast.list.count];

            for (WTApiWeather *weather in forecast.list)
            {
                WTWeather *model = [WTWeather createFromAPIWeather:weather];
                [models addObject:model];
            }

            return models;
        }];
}

@end
