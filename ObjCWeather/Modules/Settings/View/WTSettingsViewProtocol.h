//
//  WTSettingsViewProtocol.h
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

@class WTSettingsItem;

NS_ASSUME_NONNULL_BEGIN

@protocol WTSettingsViewProtocol <NSObject>

// MARK: - Input

- (id<RACSubscriber>)settingsItems;

// MARK: - Output

@property (nonatomic, readonly) RACSignal<WTSettingsItem *> *itemSelected;

@end

NS_ASSUME_NONNULL_END
