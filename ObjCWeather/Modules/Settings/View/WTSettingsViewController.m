//
//  WTSettingsViewController.m
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import "WTSettingsViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "WTSettingsItem.h"
#import "WTSettingsPresenterProtocol.h"

static NSString * const kWTSettingCellID = @"kWTSettingCellID";

@interface WTSettingsViewController ()

@property (nonatomic, strong) RACSubject<NSArray<WTSettingsItem *> *> *itemsSubject;
@property (nonatomic, strong) RACSubject<WTSettingsItem *> *itemSelectedSubject;

@property (nonatomic, strong) NSArray<WTSettingsItem *> *items;

@end

@implementation WTSettingsViewController

- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

// MARK: - Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.itemsSubject = [RACSubject subject];
    self.itemSelectedSubject = [RACSubject subject];

    self.items = @[];

    @weakify(self)
    [[[self.itemsSubject deliverOnMainThread]
        takeUntil:self.rac_willDeallocSignal]
        subscribeNext:^(NSArray<WTSettingsItem *> *items) {
            @strongify(self)
            self.items = items;
            [self.tableView reloadData];
        }];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kWTSettingCellID];

    [self.settingsPresenter setupBindings];
}

// MARK: - WTSettingsViewProtocol

- (id<RACSubscriber>)settingsItems
{
    return self.itemsSubject;
}

// MARK: - Output

- (RACSignal<WTSettingsItem *> *)itemSelected
{
    return self.itemSelectedSubject;
}

// MARK: - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? self.items.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WTSettingsItem *item = self.items[indexPath.row];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kWTSettingCellID forIndexPath:indexPath];
    cell.textLabel.text = item.name;
    cell.accessoryType = item.isCurrent ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return section == 0 ? @"Город" : nil;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     WTSettingsItem *item = self.items[indexPath.row];

     [self.itemSelectedSubject sendNext:item];
}

@end
