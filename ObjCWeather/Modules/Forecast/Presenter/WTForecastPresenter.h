//
//  WTForecastPresenter.h
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WTForecastPresenterProtocol.h"

@protocol WTForecastViewProtocol;
@protocol WTForecastInteractorProtocol;
@protocol WTForecastRouterProtocol;

NS_ASSUME_NONNULL_BEGIN

@interface WTForecastPresenter : NSObject<WTForecastPresenterProtocol>

@property (nonatomic, weak)   id<WTForecastViewProtocol>       forecastView;
@property (nonatomic, strong) id<WTForecastInteractorProtocol> forecastInteractor;
@property (nonatomic, strong) id<WTForecastRouterProtocol>     forecastRouter;

@end

NS_ASSUME_NONNULL_END
