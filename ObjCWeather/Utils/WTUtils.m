//
//  WTUtils.m
//  ObjCWeather
//
//  Created by Sergey on 02/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import "WTUtils.h"

@implementation WTUtils

+ (instancetype)instance
{
    static WTUtils *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

- (instancetype)init
{
    if ((self = [super init]))
    {
        self.temperatureFormatter = [NSNumberFormatter new];
        self.temperatureFormatter.minimumIntegerDigits = 1;
        self.temperatureFormatter.minimumFractionDigits = 1;
        self.temperatureFormatter.maximumFractionDigits = 1;

        self.dateFormatter = [NSDateFormatter new];
        self.dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"ru_RU"];
        self.dateFormatter.dateFormat = @"HH:mm, dd MMMM";
    }

    return self;
}

@end
