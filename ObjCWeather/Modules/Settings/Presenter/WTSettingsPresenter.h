//
//  WTSettingsPresenter.h
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WTSettingsPresenterProtocol.h"
@protocol WTSettingsViewProtocol;
@protocol WTSettingsInteractorProtocol;
@protocol WTSettingsRouterProtocol;

NS_ASSUME_NONNULL_BEGIN

@interface WTSettingsPresenter : NSObject<WTSettingsPresenterProtocol>

@property (nonatomic, weak)   id<WTSettingsViewProtocol>       settingsView;
@property (nonatomic, strong) id<WTSettingsInteractorProtocol> settingsInteractor;
@property (nonatomic, strong) id<WTSettingsRouterProtocol>     settingsRouter;

@end

NS_ASSUME_NONNULL_END
