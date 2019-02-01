//
//  WTWeatherComponentAssembly.m
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import "WTWeatherComponentAssembly.h"
#import "WTNetworkComponentAssembly.h"
#import "WTSettingsComponentAssembly.h"
#import "WTWeatherComponent.h"

@implementation WTWeatherComponentAssembly

- (WTWeatherComponent *)weatherComponent
{
    return [TyphoonDefinition withClass:[WTWeatherComponent self] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(networkService) with:[self.networkComponentAssembly networkComponent]];
        [definition injectProperty:@selector(settingsService) with:[self.settingsComponentAssembly settingsComponent]];
    }];
}

@end
