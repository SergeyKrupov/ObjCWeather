//
//  WTNetworkService.h
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WTNetworkService <NSObject>

- (RACSignal *)requestWithURL:(NSURL *)url parameters:(NSDictionary *)parameters class:(Class)clazz;

@end

NS_ASSUME_NONNULL_END
