//
//  WTSettingsService.h
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

@class WTCity;

NS_ASSUME_NONNULL_BEGIN

@protocol WTSettingsService <NSObject>

@property (nonatomic, readonly) NSURL *baseURL;

@property (nonatomic, readonly) NSString *secret;

- (id<RACSubscriber>)updateCurrentCityIdentifier;

- (RACSignal<WTCity *> *)obtainCurrentCity;

- (RACSignal<NSArray<WTCity *> *> *)obtainAllCities;

@end

NS_ASSUME_NONNULL_END
