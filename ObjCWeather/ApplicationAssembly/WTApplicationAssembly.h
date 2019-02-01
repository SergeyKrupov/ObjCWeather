//
//  WTApplicationAssembly.h
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 01.02.2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@class WTWeatherAssembly;
@class WTRootAssembly;

NS_ASSUME_NONNULL_BEGIN

@interface WTApplicationAssembly : TyphoonAssembly

@property (nonatomic, strong) WTWeatherAssembly *weatherAssembly;
@property (nonatomic, strong) WTRootAssembly *rootAssembly;

@end

NS_ASSUME_NONNULL_END
