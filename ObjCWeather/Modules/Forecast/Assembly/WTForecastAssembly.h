//
//  WTForecastAssembly.h
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Typhoon/Typhoon.h>

@class WTForecastViewController;
@class WTWeatherComponentAssembly;
@class WTSettingsComponentAssembly;

NS_ASSUME_NONNULL_BEGIN

@interface WTForecastAssembly : TyphoonAssembly

@property (nonatomic, strong) WTWeatherComponentAssembly  *weatherComponentAssembly;
@property (nonatomic, strong) WTSettingsComponentAssembly *settingsComponentAssembly;

- (WTForecastViewController *)forecastViewController;

@end

NS_ASSUME_NONNULL_END
