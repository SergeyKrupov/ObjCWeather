//
//  WTForecastInteractor.h
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WTForecastInteractorProtocol.h"

@protocol WTWeatherService;
@protocol WTSettingsService;

NS_ASSUME_NONNULL_BEGIN

@interface WTForecastInteractor : NSObject<WTForecastInteractorProtocol>

@property (nonatomic, strong) id<WTWeatherService>  weatherService;
@property (nonatomic, strong) id<WTSettingsService> settingsService;

@end

NS_ASSUME_NONNULL_END
