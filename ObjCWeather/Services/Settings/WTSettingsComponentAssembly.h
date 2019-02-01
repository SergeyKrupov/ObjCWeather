//
//  WTSettingsComponentAssembly.h
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Typhoon/Typhoon.h>

@class WTSettingsComponent;

NS_ASSUME_NONNULL_BEGIN

@interface WTSettingsComponentAssembly : TyphoonAssembly

- (WTSettingsComponent *)settingsComponent;

@end

NS_ASSUME_NONNULL_END
