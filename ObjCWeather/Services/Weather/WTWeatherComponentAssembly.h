//
//  WTWeatherComponentAssembly.h
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Typhoon/Typhoon.h>

@class WTNetworkComponentAssembly;
@class WTSettingsComponentAssembly;
@class WTWeatherComponent;

NS_ASSUME_NONNULL_BEGIN

@interface WTWeatherComponentAssembly : TyphoonAssembly

@property (nonatomic, strong) WTNetworkComponentAssembly  *networkComponentAssembly;
@property (nonatomic, strong) WTSettingsComponentAssembly *settingsComponentAssembly;

- (WTWeatherComponent *)weatherComponent;

@end

NS_ASSUME_NONNULL_END
