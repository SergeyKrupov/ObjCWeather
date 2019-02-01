//
//  WTUtils.h
//  ObjCWeather
//
//  Created by Sergey on 02/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WTUtils : NSObject

+ (instancetype)instance;

@property (strong) NSNumberFormatter *temperatureFormatter;

@property (strong) NSDateFormatter *dateFormatter;

@end

NS_ASSUME_NONNULL_END
