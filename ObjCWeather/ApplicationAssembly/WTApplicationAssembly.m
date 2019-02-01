//
//  WTApplicationAssembly.m
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 01.02.2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import "WTApplicationAssembly.h"

#import "WTAppDelegate.h"
#import "WTRootViewController.h"

#import <Typhoon/Typhoon.h>
#import "WTWeatherAssembly.h"
#import "WTRootAssembly.h"

@implementation WTApplicationAssembly

- (WTAppDelegate *)appDelegate
{
    return [TyphoonDefinition withClass:[WTAppDelegate class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(window) with:self.mainWindow];
        [definition injectProperty:@selector(rootViewController) with:[self.rootAssembly rootViewController]];
    }];
}

- (UIWindow *)mainWindow
{
    return [TyphoonDefinition withClass:[UIWindow class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithFrame:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:@(UIScreen.mainScreen.bounds)];
        }];
        [definition injectProperty:@selector(rootViewController) with:[self.rootAssembly rootViewController]];
    }];
}

@end
