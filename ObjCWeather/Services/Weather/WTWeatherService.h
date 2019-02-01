//
//  WTWeatherService.h
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

@class WTCity;
@class WTWeather;

NS_ASSUME_NONNULL_BEGIN

@protocol WTWeatherService <NSObject>

- (RACSignal<WTWeather *> *)obtainWeatherForCity:(WTCity *)city;

- (RACSignal<NSArray<WTWeather *> *> *)obtainForecastForCity:(WTCity *)city;

@end

NS_ASSUME_NONNULL_END
