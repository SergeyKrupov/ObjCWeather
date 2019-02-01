//
//  WTWeather.h
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WTWeather : NSObject

@property (nonatomic, readonly) NSNumber *temperature;
@property (nonatomic, readonly) NSNumber *minTemperature;
@property (nonatomic, readonly) NSNumber *maxTemperature;
@property (nonatomic, readonly) NSNumber *pressure;
@property (nonatomic, readonly) NSNumber *humidity;
@property (nonatomic, readonly) NSDate   *date;
@property (nonatomic, readonly) NSString *icon;
@property (nonatomic, readonly) NSString *weatherDescription;

@end

@interface WTMutableWeather : WTWeather

@property (nonatomic, strong) NSNumber *temperature;
@property (nonatomic, strong) NSNumber *minTemperature;
@property (nonatomic, strong) NSNumber *maxTemperature;
@property (nonatomic, strong) NSNumber *pressure;
@property (nonatomic, strong) NSNumber *humidity;
@property (nonatomic, strong) NSDate   *date;
@property (nonatomic, copy)   NSString *icon;
@property (nonatomic, copy)   NSString *weatherDescription;

@end


NS_ASSUME_NONNULL_END
