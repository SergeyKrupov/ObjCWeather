//
//  WTRootAssembly.m
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 03/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import "WTRootAssembly.h"
#import "WTWeatherAssembly.h"
#import "WTForecastAssembly.h"
#import "WTSettingsAssembly.h"
#import "WTRootInteractor.h"
#import "WTRootPresenter.h"
#import "WTRootRouter.h"
#import "WTRootViewController.h"

@implementation WTRootAssembly

- (WTRootViewController *)rootViewController
{
    return [TyphoonDefinition withClass:[WTRootViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(rootPresenter) with:[self rootPresenter]];
        NSArray *pages = @[
            self.weatherAssembly.weatherViewController,
            self.forecastAssembly.forecastViewController,
            self.settingsAssembly.settingsViewController
        ];
        [definition injectProperty:@selector(pages) with:pages];
    }];
}

- (WTRootInteractor *)rootInteractor
{
    return [TyphoonDefinition withClass:[WTRootInteractor class] configuration:^(TyphoonDefinition *definition) {
        // Inject services
    }];
}

- (WTRootPresenter *)rootPresenter
{
    return [TyphoonDefinition withClass:[WTRootPresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(rootView) with:[self rootViewController]];
        [definition injectProperty:@selector(rootInteractor) with:[self rootInteractor]];
        [definition injectProperty:@selector(rootRouter) with:[self rootRouter]];
    }];
}

- (WTRootRouter *)rootRouter
{
    return [TyphoonDefinition withClass:[WTRootRouter class] configuration:^(TyphoonDefinition *definition) {
    }];
}

@end
