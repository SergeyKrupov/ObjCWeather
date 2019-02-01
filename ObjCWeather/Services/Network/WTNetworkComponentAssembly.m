//
//  WTNetworkComponentAssembly.m
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import "WTNetworkComponentAssembly.h"
#import "WTNetworkComponent.h"
#import "WTSettingsComponentAssembly.h"

@implementation WTNetworkComponentAssembly

- (WTNetworkComponent *)networkComponent
{
    return [TyphoonDefinition withClass:[WTNetworkComponent class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(settingService) with:[self.settingsComponentAssembly settingsComponent]];
    }];
}

@end
