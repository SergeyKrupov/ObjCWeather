//
//  WTRootAssembly.h
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 03/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Typhoon/Typhoon.h>

@class WTWeatherAssembly;
@class WTForecastAssembly;
@class WTSettingsAssembly;
@class WTRootViewController;

NS_ASSUME_NONNULL_BEGIN

@interface WTRootAssembly : TyphoonAssembly

@property (nonatomic, strong) WTWeatherAssembly  *weatherAssembly;
@property (nonatomic, strong) WTForecastAssembly *forecastAssembly;
@property (nonatomic, strong) WTSettingsAssembly *settingsAssembly;

- (WTRootViewController *)rootViewController;

@end

NS_ASSUME_NONNULL_END
