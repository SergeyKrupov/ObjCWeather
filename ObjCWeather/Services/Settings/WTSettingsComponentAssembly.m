//
//  WTSettingsComponentAssembly.m
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import "WTSettingsComponentAssembly.h"
#import "WTSettingsComponent.h"

@implementation WTSettingsComponentAssembly

- (WTSettingsComponent *)settingsComponent
{
    return [TyphoonDefinition withClass:[WTSettingsComponent class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(baseURL) with:TyphoonConfig(@"base.url")];
        [definition injectProperty:@selector(secret) with:TyphoonConfig(@"secret")];
    }];
}

- (id)configure
{
    return [TyphoonDefinition withConfigName:@"Configuration.plist"];
}

@end
