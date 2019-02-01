//
//  WTWeatherInteractorProtocol.h
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

@class WTWeather;
@class WTCity;

NS_ASSUME_NONNULL_BEGIN

@protocol WTWeatherInteractorProtocol <NSObject>

// MARK: - Input
@property (nonatomic, readonly) id<RACSubscriber> refresh;

// MARK: - Output
- (RACSignal<WTWeather *> *)obtainWeather;
- (RACSignal<WTCity *> *)obtainCurrentCity;

@end

NS_ASSUME_NONNULL_END
