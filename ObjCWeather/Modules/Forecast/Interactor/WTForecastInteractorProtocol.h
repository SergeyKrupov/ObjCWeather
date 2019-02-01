//
//  WTForecastInteractorProtocol.h
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

@class WTWeather;

NS_ASSUME_NONNULL_BEGIN

@protocol WTForecastInteractorProtocol <NSObject>

// MARK: - Input
- (id<RACSubscriber>)refresh;

// MARK: - Output
- (RACSignal<NSArray<WTWeather *> *> *)obtainForecast;

@end

NS_ASSUME_NONNULL_END
