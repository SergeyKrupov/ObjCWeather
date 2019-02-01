//
//  WTSettingsComponent.h
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WTSettingsService.h"

NS_ASSUME_NONNULL_BEGIN

@interface WTSettingsComponent : NSObject<WTSettingsService>

@property (nonatomic, strong) NSURL *baseURL;

@property (nonatomic, strong) NSString *secret;

@end

NS_ASSUME_NONNULL_END
