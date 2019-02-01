//
//  WTNetworkComponentAssembly.h
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Typhoon/Typhoon.h>

@class WTNetworkComponent;
@class WTSettingsComponentAssembly;

NS_ASSUME_NONNULL_BEGIN

@interface WTNetworkComponentAssembly : TyphoonAssembly

@property (nonatomic, strong) WTSettingsComponentAssembly *settingsComponentAssembly;
- (WTNetworkComponent *)networkComponent;

@end

NS_ASSUME_NONNULL_END
