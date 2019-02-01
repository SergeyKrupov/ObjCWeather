//
//  WTWeatherViewProtocol.h
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WTWeatherViewProtocol <NSObject>

// MARK: - Input
@property (nonatomic, readonly) id<RACSubscriber> city;
@property (nonatomic, readonly) id<RACSubscriber> temperature;
@property (nonatomic, readonly) id<RACSubscriber> weatherImage;
@property (nonatomic, readonly) id<RACSubscriber> weatherDescription;

- (void)endRefreshing;

// MARK: - Output
@property (nonatomic, readonly) RACSignal<RACUnit *> *refresh;

@end

NS_ASSUME_NONNULL_END
