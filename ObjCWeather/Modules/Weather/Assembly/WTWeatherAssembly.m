//
//  WTWeatherAssembly.m
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import "WTWeatherAssembly.h"
#import "WTWeatherViewController.h"
#import "WTWeatherComponentAssembly.h"
#import "WTSettingsComponentAssembly.h"
#import "WTWeatherInteractor.h"
#import "WTWEatherPresenter.h"
#import "WTWeatherRouter.h"

@implementation WTWeatherAssembly

- (WTWeatherViewController *)weatherViewController
{
    return [TyphoonDefinition withClass:[WTWeatherViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(weatherPresenter) with:[self weatherPresenter]];
    }];
}

- (WTWeatherInteractor *)weatherInteractor
{
    return [TyphoonDefinition withClass:[WTWeatherInteractor class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(weatherService) with:[self.weatherComponentAssembly weatherComponent]];
        [definition injectProperty:@selector(settingsService) with:[self.settingsComponentAssembly settingsComponent]];
    }];
}

- (WTWeatherPresenter *)weatherPresenter
{
    return [TyphoonDefinition withClass:[WTWeatherPresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(weatherView) with:[self weatherViewController]];
        [definition injectProperty:@selector(weatherInteractor) with:[self weatherInteractor]];
        [definition injectProperty:@selector(weatherRouter) with:[self weatherRouter]];
    }];
}

- (WTWeatherRouter *)weatherRouter
{
    return [TyphoonDefinition withClass:[WTWeatherRouter class] configuration:^(TyphoonDefinition *definition) {
    }];
}

@end
