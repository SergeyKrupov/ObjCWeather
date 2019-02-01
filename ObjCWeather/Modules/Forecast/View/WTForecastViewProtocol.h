//
//  WTForecastViewProtocol.h
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

@class WTWeatherItem;

NS_ASSUME_NONNULL_BEGIN

@protocol WTForecastViewProtocol <NSObject>

// MARK: - Input

- (id<RACSubscriber>)weatherItems;

- (id<RACSubscriber>)endRefreshing;

// MARK: - Output

@property (nonatomic, readonly) RACSignal<RACUnit *> *refresh;

@end

NS_ASSUME_NONNULL_END
