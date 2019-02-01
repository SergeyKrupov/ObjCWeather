//
//  WTWeatherInteractor.h
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WTWeatherInteractorProtocol.h"

@protocol WTWeatherService;
@protocol WTSettingsService;

NS_ASSUME_NONNULL_BEGIN

@interface WTWeatherInteractor : NSObject<WTWeatherInteractorProtocol>

@property (nonatomic, strong) id<WTWeatherService>  weatherService;
@property (nonatomic, strong) id<WTSettingsService> settingsService;

@end

NS_ASSUME_NONNULL_END
