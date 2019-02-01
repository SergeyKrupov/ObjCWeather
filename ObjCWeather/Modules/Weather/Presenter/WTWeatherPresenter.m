//
//  WTWeatherPresenter.m
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import "WTWeatherPresenter.h"
#import "WTWeatherInteractorProtocol.h"
#import "WTWeatherViewProtocol.h"
#import "WTUtils.h"
#import "WTWeather.h"
#import "WTCity.h"

@implementation WTWeatherPresenter

// MARK: - WTWeatherPresenterProtocol

- (void)setupBindings
{
    [[[[[[self.weatherInteractor obtainCurrentCity]
        map:^id _Nullable(WTCity * _Nullable value) {
            return value.name;
        }]
        startWith:nil]
        deliverOnMainThread]
        takeUntil:self.rac_willDeallocSignal]
        subscribe:self.weatherView.city];

    RACSignal<WTWeather *> *weather = [[[[[[self.weatherView.refresh startWith:RACUnit.defaultUnit]
        mapReplace:[self.weatherInteractor obtainWeather]]
        switchToLatest]
        replayLazily]
        takeUntil:self.rac_willDeallocSignal]
        deliverOnMainThread];

    [[[weather map:^id(WTWeather *value) {
        return [WTUtils.instance.temperatureFormatter stringFromNumber:value.temperature];
    }]
    startWith:@"--"]
    subscribe:self.weatherView.temperature];

    [[[weather map:^id(WTWeather *value) {
        return value.icon ? [UIImage imageNamed:value.icon] : nil;
    }]
    startWith:[UIImage imageNamed:@"undefined"]]
    subscribe:self.weatherView.weatherImage];

    [[[weather map:^id(WTWeather *value) {
        return value.weatherDescription;
    }]
    startWith:nil]
    subscribe:self.weatherView.weatherDescription];

    @weakify(self)
    [weather subscribeNext:^(WTWeather *weather) {
        @strongify(self)
        [self.weatherView endRefreshing];
    }];

    [[self.weatherView.refresh takeUntil:self.rac_willDeallocSignal]
        subscribe:self.weatherInteractor.refresh];

}

@end
