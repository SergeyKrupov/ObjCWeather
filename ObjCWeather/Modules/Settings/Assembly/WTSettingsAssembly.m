//
//  WTSettingsAssembly.m
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import "WTSettingsAssembly.h"
#import "WTSettingsComponentAssembly.h"
#import "WTSettingsInteractor.h"
#import "WTSettingsPresenter.h"
#import "WTSettingsRouter.h"
#import "WTSettingsViewController.h"

@implementation WTSettingsAssembly

- (WTSettingsViewController *)settingsViewController
{
    return [TyphoonDefinition withClass:[WTSettingsViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(settingsPresenter) with:[self settingsPresenter]];
    }];
}

- (WTSettingsInteractor *)settingsInteractor
{
    return [TyphoonDefinition withClass:[WTSettingsInteractor class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(settingsService) with:[self.settingsComponentAssembly settingsComponent]];
    }];
}

- (WTSettingsPresenter *)settingsPresenter
{
    return [TyphoonDefinition withClass:[WTSettingsPresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(settingsView) with:[self settingsViewController]];
        [definition injectProperty:@selector(settingsInteractor) with:[self settingsInteractor]];
        [definition injectProperty:@selector(settingsRouter) with:[self settingsRouter]];
    }];
}

- (WTSettingsRouter *)settingsRouter
{
    return [TyphoonDefinition withClass:[WTSettingsRouter class] configuration:^(TyphoonDefinition *definition) {
    }];
}

@end
