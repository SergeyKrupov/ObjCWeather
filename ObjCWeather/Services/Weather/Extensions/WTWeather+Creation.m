//
//  WTWeather+Creation.m
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 06.02.2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import "WTWeather+Creation.h"
#import "WTApiWeather.h"

@implementation WTWeather(Creation)

+ (instancetype)createFromAPIWeather:(WTApiWeather *)apiWeather
{
    WTMutableWeather *weather = [WTMutableWeather new];

    weather.temperature        = apiWeather.temperature;
    weather.minTemperature     = apiWeather.minTemperature;
    weather.maxTemperature     = apiWeather.maxTemperature;
    weather.pressure           = apiWeather.pressure;
    weather.humidity           = apiWeather.humidity;
    weather.date               = apiWeather.date;
    weather.icon               = apiWeather.icon;
    weather.weatherDescription = apiWeather.weatherDescription;

    return weather;
}

@end
