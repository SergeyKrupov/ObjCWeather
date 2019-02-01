//
//  WTWeatherViewController.m
//  ObjCWeather
//
//  Created by Sergey on 01/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import "WTWeatherViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "WTWeatherPresenterProtocol.h"

@interface WTWeatherViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *weatherDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation WTWeatherViewController

// MARK: - Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.refreshControl = [UIRefreshControl new];
    self.scrollView.refreshControl = self.refreshControl;

    [self.weatherPresenter setupBindings];
}

// MARK: - WTWeatherViewProtocol

- (id<RACSubscriber>)city
{
    return RACChannelTo(self.cityLabel, text, nil);
}

- (id<RACSubscriber>)temperature
{
    return RACChannelTo(self.temperatureLabel, text, nil);
}

- (id<RACSubscriber>)weatherImage
{
    return RACChannelTo(self.weatherImageView, image, nil);
}

- (id<RACSubscriber>)weatherDescription
{
    return RACChannelTo(self.weatherDescriptionLabel, text, nil);
}

- (void)endRefreshing
{
    [self.refreshControl endRefreshing];
}

- (RACSignal<RACUnit *> *)refresh
{
    return [[self.refreshControl rac_signalForControlEvents:UIControlEventValueChanged]
           mapReplace:RACUnit.defaultUnit];
}

@end
