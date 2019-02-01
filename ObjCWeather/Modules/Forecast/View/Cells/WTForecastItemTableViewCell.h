//
//  WTForecastItemTableViewCell.h
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05.02.2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WTWeatherItem;

NS_ASSUME_NONNULL_BEGIN

@interface WTForecastItemTableViewCell : UITableViewCell

- (void)setupWithItem:(WTWeatherItem *)item;

@end

NS_ASSUME_NONNULL_END
