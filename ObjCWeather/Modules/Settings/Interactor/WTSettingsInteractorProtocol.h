//
//  WTSettingsInteractorProtocol.h
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

@class WTCity;

NS_ASSUME_NONNULL_BEGIN

@protocol WTSettingsInteractorProtocol <NSObject>

// MARK: - Input

- (id<RACSubscriber>)updateCurrentCityIdentifier;

// MARK: - Output

- (RACSignal<WTCity *> *)obtainCurrentCity;

- (RACSignal<NSArray<WTCity *> *> *)obtainAllCities;

@end

NS_ASSUME_NONNULL_END
