//
//  WTForecastViewController.m
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import "WTForecastViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "WTWeatherItem.h"
#import "WTForecastItemTableViewCell.h"
#import "WTForecastPresenterProtocol.h"

static NSString * const kWTCellIdentifier = @"WTForecastItemTableViewCell";

@interface WTForecastViewController ()

@property (nonatomic, strong) NSArray<WTWeatherItem *> *item;

@property (nonatomic, strong) RACSubject *itemsSubject;
@property (nonatomic, strong) RACSubject *refreshSubject;

@property (nonatomic, strong) NSArray<WTWeatherItem *> *items;

@end

@implementation WTForecastViewController

// MARK: - Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.items = @[];
    self.itemsSubject = [RACSubject subject];
    self.refreshSubject = [RACSubject subject];

    @weakify(self)
    [[[self.itemsSubject deliverOnMainThread]
        takeUntil:self.rac_willDeallocSignal]
        subscribeNext:^(id items) {
            @strongify(self)
            self.items = items;
            [self.tableView reloadData];
        }];

    [[[self.refreshSubject deliverOnMainThread]
        takeUntil:self.rac_willDeallocSignal]
        subscribeNext:^(id  _Nullable x) {
            @strongify(self)
            [self.refreshControl endRefreshing];
        }];

    self.refreshControl = [UIRefreshControl new];

    [self.tableView registerNib:[UINib nibWithNibName:@"WTForecastItemTableViewCell" bundle:nil] forCellReuseIdentifier:kWTCellIdentifier];
    self.tableView.rowHeight = 45.0;

    [self.forecastPresenter setupBindings];
}

// MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WTForecastItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kWTCellIdentifier forIndexPath:indexPath];
    [cell setupWithItem:self.items[indexPath.row]];
    return cell;
}

// MARK: - WTForecastViewProtocol

- (id<RACSubscriber>)weatherItems
{
    return self.itemsSubject;
}

- (id<RACSubscriber>)endRefreshing
{
    return self.refreshSubject;
}

// MARK: - Output

- (RACSignal<RACUnit *> *)refresh
{
    return [[self.refreshControl rac_signalForControlEvents:UIControlEventValueChanged] mapReplace:RACUnit.defaultUnit];
}

@end
