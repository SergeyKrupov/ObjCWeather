//
//  WTSettingsInteractor.h
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WTSettingsInteractorProtocol.h"

@protocol WTSettingsService;

NS_ASSUME_NONNULL_BEGIN

@interface WTSettingsInteractor : NSObject<WTSettingsInteractorProtocol>

@property (nonatomic, strong) id<WTSettingsService> settingsService;

@end

NS_ASSUME_NONNULL_END
