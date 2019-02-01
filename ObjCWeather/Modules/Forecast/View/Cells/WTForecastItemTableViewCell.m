//
//  WTForecastItemTableViewCell.m
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05.02.2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import "WTForecastItemTableViewCell.h"
#import "WTWeatherItem.h"

@interface WTForecastItemTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;

@end

@implementation WTForecastItemTableViewCell

- (void)setupWithItem:(WTWeatherItem *)item
{
    self.weatherImageView.image = item.image;
    self.dateLabel.text         = item.date;
    self.temperatureLabel.text  = item.temperature;
}

@end
