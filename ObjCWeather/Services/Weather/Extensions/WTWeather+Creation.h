//
//  WTWeather+Creation.h
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 06.02.2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTWeather.h"

@class WTApiWeather;

NS_ASSUME_NONNULL_BEGIN

@interface WTWeather (Creation)

+ (instancetype)createFromAPIWeather:(WTApiWeather *)apiWeather;

@end

NS_ASSUME_NONNULL_END
