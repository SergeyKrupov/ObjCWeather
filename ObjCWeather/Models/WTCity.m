//
//  WTCity.m
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import "WTCity.h"
#import <ReactiveObjC/RACEXTKeyPathCoding.h>

@implementation WTCity

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
        @keypath(WTCity.new, identifier) : @"id",
        @keypath(WTCity.new, name)       : @"name",
        @keypath(WTCity.new, country)    : @"country"
    };
}

@end
