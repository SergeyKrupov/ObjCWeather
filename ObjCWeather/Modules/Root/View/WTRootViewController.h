//
//  WTRootViewController.h
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 03/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "WTRootViewProtocol.h"

@protocol WTRootPresenterProtocol;

NS_ASSUME_NONNULL_BEGIN

@interface WTRootViewController : UIPageViewController<WTRootViewProtocol>

@property (nonatomic, strong) id<WTRootPresenterProtocol> rootPresenter;

@property (nonatomic, strong) NSArray<UIViewController *> *pages;

@end

NS_ASSUME_NONNULL_END
