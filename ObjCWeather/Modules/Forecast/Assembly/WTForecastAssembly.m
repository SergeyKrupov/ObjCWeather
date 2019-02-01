//
//  WTForecastAssembly.m
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import "WTForecastAssembly.h"
#import "WTForecastInteractor.h"
#import "WTForecastPresenter.h"
#import "WTForecastRouter.h"
#import "WTForecastViewController.h"
#import "WTWeatherComponentAssembly.h"
#import "WTSettingsComponentAssembly.h"

@implementation WTForecastAssembly

- (WTForecastViewController *)forecastViewController
{
    return [TyphoonDefinition withClass:[WTForecastViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(forecastPresenter) with:[self forecastPresenter]];
    }];
}

- (WTForecastInteractor *)forecastInteractor
{
    return [TyphoonDefinition withClass:[WTForecastInteractor class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(weatherService) with:[self.weatherComponentAssembly weatherComponent]];
        [definition injectProperty:@selector(settingsService) with:[self.settingsComponentAssembly settingsComponent]];
    }];
}

- (WTForecastPresenter *)forecastPresenter
{
    return [TyphoonDefinition withClass:[WTForecastPresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(forecastView) with:[self forecastViewController]];
        [definition injectProperty:@selector(forecastInteractor) with:[self forecastInteractor]];
        [definition injectProperty:@selector(forecastRouter) with:[self forecastRouter]];
    }];
}

- (WTForecastRouter *)forecastRouter
{
    return [TyphoonDefinition withClass:[WTForecastRouter class] configuration:^(TyphoonDefinition *definition) {
    }];
}

@end
