//
//  WTApiForecast.h
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05.02.2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@class WTWeather;

NS_ASSUME_NONNULL_BEGIN

@interface WTApiForecast : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly) NSArray<WTWeather *> *list;

@end

NS_ASSUME_NONNULL_END
