//
//  WTApiWeather.h
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

NS_ASSUME_NONNULL_BEGIN

@interface WTApiWeather : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly) NSNumber *temperature;
@property (nonatomic, readonly) NSNumber *minTemperature;
@property (nonatomic, readonly) NSNumber *maxTemperature;
@property (nonatomic, readonly) NSNumber *pressure;
@property (nonatomic, readonly) NSNumber *humidity;
@property (nonatomic, readonly) NSDate   *date;
@property (nonatomic, readonly) NSString *icon;
@property (nonatomic, readonly) NSString *weatherDescription;

@end

NS_ASSUME_NONNULL_END
