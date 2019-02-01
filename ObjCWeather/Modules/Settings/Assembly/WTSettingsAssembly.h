//
//  WTSettingsAssembly.h
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Typhoon/Typhoon.h>

@class WTSettingsViewController;
@class WTSettingsComponentAssembly;

NS_ASSUME_NONNULL_BEGIN

@interface WTSettingsAssembly : TyphoonAssembly

@property (nonatomic, strong) WTSettingsComponentAssembly *settingsComponentAssembly;

- (WTSettingsViewController *)settingsViewController;

@end

NS_ASSUME_NONNULL_END
