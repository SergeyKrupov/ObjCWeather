//
//  WTSettingsViewController.h
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveObjC/ReactiveObjC.h>

#import "WTSettingsViewProtocol.h"
@protocol WTSettingsPresenterProtocol;

NS_ASSUME_NONNULL_BEGIN

@interface WTSettingsViewController : UITableViewController<WTSettingsViewProtocol>

@property (nonatomic, strong) id<WTSettingsPresenterProtocol> settingsPresenter;

@end

NS_ASSUME_NONNULL_END
