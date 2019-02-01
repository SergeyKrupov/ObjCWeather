//
//  WTWeatherViewController.h
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "WTWeatherViewProtocol.h"

@protocol WTWeatherPresenterProtocol;

NS_ASSUME_NONNULL_BEGIN

@interface WTWeatherViewController : UIViewController<WTWeatherViewProtocol>

@property(nonatomic, strong) id<WTWeatherPresenterProtocol> weatherPresenter;

@end

NS_ASSUME_NONNULL_END
