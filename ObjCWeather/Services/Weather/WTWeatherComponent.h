//
//  WTWeatherComponent.h
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WTWeatherService.h"

@protocol WTNetworkService;
@protocol WTSettingsService;

NS_ASSUME_NONNULL_BEGIN

@interface WTWeatherComponent : NSObject<WTWeatherService>

@property (nonatomic, strong) id<WTNetworkService>  networkService;
@property (nonatomic, strong) id<WTSettingsService> settingsService;

@end

NS_ASSUME_NONNULL_END
