//
//  WTNetworkComponent.h
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WTNetworkService.h"

@protocol WTSettingsService;

NS_ASSUME_NONNULL_BEGIN

@interface WTNetworkComponent : NSObject<WTNetworkService>

@property (nonatomic, strong) id<WTSettingsService> settingService;

@end

NS_ASSUME_NONNULL_END
