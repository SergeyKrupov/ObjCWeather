//
//  WTWeatherItem.h
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05.02.2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WTWeatherItem : NSObject

@property (nonatomic, readonly) UIImage  *image;
@property (nonatomic, readonly) NSString *weatherDescription;
@property (nonatomic, readonly) NSString *temperature;
@property (nonatomic, readonly) NSString *date;

@end

@interface WTMutableWeatherItem : WTWeatherItem

@property (nonatomic, strong) UIImage  *image;
@property (nonatomic, copy)   NSString *weatherDescription;
@property (nonatomic, copy)   NSString *temperature;
@property (nonatomic, copy)   NSString *date;

@end

NS_ASSUME_NONNULL_END
