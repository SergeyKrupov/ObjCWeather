//
//  WTRootPresenter.h
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 03/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WTRootPresenterProtocol.h"

@protocol WTRootViewProtocol;
@protocol WTRootInteractorProtocol;
@protocol WTRootRouterProtocol;

NS_ASSUME_NONNULL_BEGIN

@interface WTRootPresenter : NSObject<WTRootPresenterProtocol>

@property (nonatomic, weak)   id<WTRootViewProtocol>       rootView;
@property (nonatomic, strong) id<WTRootInteractorProtocol> rootInteractor;
@property (nonatomic, strong) id<WTRootRouterProtocol>     rootRouter;

@end

NS_ASSUME_NONNULL_END
