//
//  WTApiWeather.m
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import "WTApiWeather.h"
#import <ReactiveObjC/RACEXTKeyPathCoding.h>

@interface WTWeatherApiWeather : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *weatherDescription;

@end

@implementation WTWeatherApiWeather

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
        @keypath(WTWeatherApiWeather.new, icon)               : @"icon",
        @keypath(WTWeatherApiWeather.new, weatherDescription) : @"description"
    };
}

@end


// =============================================================================

@interface WTApiWeather ()

@property (nonatomic, strong) NSArray<WTWeatherApiWeather *> *weather;
@end

@implementation WTApiWeather

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
        @keypath(WTApiWeather.new, temperature)    : @"main.temp",
        @keypath(WTApiWeather.new, minTemperature) : @"main.temp_min",
        @keypath(WTApiWeather.new, maxTemperature) : @"main.temp_max",
        @keypath(WTApiWeather.new, pressure)       : @"main.pressure",
        @keypath(WTApiWeather.new, humidity)       : @"main.humidity",
        @keypath(WTApiWeather.new, date)           : @"dt",
        @keypath(WTApiWeather.new, weather)        : @"weather",

        //FIXME: Закончить
    };
}

+ (NSValueTransformer *)dateJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        if ([value isKindOfClass:[NSNumber class]])
        {
            return [NSDate dateWithTimeIntervalSince1970:[((NSNumber *)value) doubleValue]];
        }
        else
        {
            *success = NO;
            return nil;
        }
    }];
}

+ (NSValueTransformer *)weatherJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[WTWeatherApiWeather class]];
}

- (NSString *)icon
{
    return self.weather.firstObject.icon;
}

- (NSString *)weatherDescription
{
    return self.weather.firstObject.weatherDescription;
}

@end
