//
//  WTWeatherAssembly.h
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Typhoon/Typhoon.h>

@class WTWeatherComponentAssembly;
@class WTSettingsComponentAssembly;
@class WTWeatherViewController;

NS_ASSUME_NONNULL_BEGIN

@interface WTWeatherAssembly : TyphoonAssembly

@property (nonatomic, strong) WTWeatherComponentAssembly  *weatherComponentAssembly;
@property (nonatomic, strong) WTSettingsComponentAssembly *settingsComponentAssembly;

- (WTWeatherViewController *)weatherViewController;

@end

NS_ASSUME_NONNULL_END
