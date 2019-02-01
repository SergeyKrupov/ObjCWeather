//
//  WTForecastViewController.h
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "WTForecastViewProtocol.h"

@protocol WTForecastPresenterProtocol;

NS_ASSUME_NONNULL_BEGIN

@interface WTForecastViewController : UITableViewController<WTForecastViewProtocol>

@property (nonatomic, strong) id<WTForecastPresenterProtocol> forecastPresenter;

@end

NS_ASSUME_NONNULL_END
