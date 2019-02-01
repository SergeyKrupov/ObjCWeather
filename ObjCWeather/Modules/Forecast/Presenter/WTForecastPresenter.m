//
//  WTForecastPresenter.m
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import "WTForecastPresenter.h"
#import "WTForecastViewProtocol.h"
#import "WTForecastInteractorProtocol.h"
#import "WTForecastRouterProtocol.h"
#import "WTWeather.h"
#import "WTWeatherItem.h"
#import "WTUtils.h"

@implementation WTForecastPresenter

// MARK: - WTForecastPresenterProtocol

- (void)setupBindings
{
    RACSignal *items = [[[[[[self.forecastView.refresh startWith:RACUnit.defaultUnit]
        mapReplace:[self.forecastInteractor obtainForecast]]
        switchToLatest]
        map:^id _Nullable(NSArray<WTWeather *> *forecast) {
            NSMutableArray *items = [NSMutableArray arrayWithCapacity:forecast.count];

            for (WTWeather *weather in forecast)
            {
                WTMutableWeatherItem *item = [WTMutableWeatherItem new];
                item.image              = [UIImage imageNamed:weather.icon];
                item.weatherDescription = weather.weatherDescription;
                item.temperature        = [[[WTUtils instance] temperatureFormatter] stringFromNumber:weather.temperature];
                item.date               = [[[WTUtils instance] dateFormatter] stringFromDate:weather.date];
                [items addObject: item];
            }

            return items;
        }]
        replayLazily]
        takeUntil:self.rac_willDeallocSignal];

    [items subscribe:self.forecastView.weatherItems];
    [items subscribe:self.forecastView.endRefreshing];

    [[self.forecastView.refresh takeUntil:self.rac_willDeallocSignal]
        subscribe:self.forecastInteractor.refresh];
}

@end
