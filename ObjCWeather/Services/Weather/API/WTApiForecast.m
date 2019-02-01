//
//  WTApiForecast.m
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05.02.2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import "WTApiForecast.h"
#import "WTApiWeather.h"
#import <ReactiveObjC/RACEXTKeyPathCoding.h>

@implementation WTApiForecast

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
        @keypath(WTApiForecast.new, list) : @"list"
    };
}

+ (NSValueTransformer *)listJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[WTApiWeather class]];
}

@end
