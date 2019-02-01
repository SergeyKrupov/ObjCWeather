//
//  WTWeatherPresenter.h
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WTWeatherPresenterProtocol.h"

@protocol WTWeatherViewProtocol;
@protocol WTWeatherInteractorProtocol;
@protocol WTWeatherRouterProtocol;

NS_ASSUME_NONNULL_BEGIN

@interface WTWeatherPresenter : NSObject<WTWeatherPresenterProtocol>

@property (nonatomic, weak)   id<WTWeatherViewProtocol>       weatherView;
@property (nonatomic, strong) id<WTWeatherInteractorProtocol> weatherInteractor;
@property (nonatomic, strong) id<WTWeatherRouterProtocol>     weatherRouter;

@end

NS_ASSUME_NONNULL_END
