//
//  WTSettingsPresenter.m
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import "WTSettingsPresenter.h"
#import "WTSettingsViewProtocol.h"
#import "WTSettingsInteractorProtocol.h"
#import "WTSettingsRouterProtocol.h"
#import "WTSettingsItem.h"
#import "WTCity.h"

@implementation WTSettingsPresenter

// MARK: - WTSettingsPresenterProtocol

- (void)setupBindings
{
    [[[[[[self.settingsInteractor obtainAllCities]
        combineLatestWith:[self.settingsInteractor obtainCurrentCity]]
        map:^id (RACTwoTuple *value) {
            NSArray<WTCity *> *cities = value.first;
            WTCity *currentCity = value.second;

            NSMutableArray<WTSettingsItem *> *items = [NSMutableArray arrayWithCapacity:cities.count];
            for (WTCity *city in cities)
            {
                WTMutableSettingsItem *item = [WTMutableSettingsItem new];
                item.name = city.name;
                item.isCurrent = [city.identifier isEqual:currentCity.identifier];
                item.identifier = city.identifier;
                [items addObject:item];
            }

            return items;
        }]
        deliverOnMainThread]
        takeUntil:self.rac_willDeallocSignal]
        subscribe:self.settingsView.settingsItems];

    [[[self.settingsView.itemSelected map:^id _Nullable(WTSettingsItem *value) {
            return value.identifier;
        }]
        takeUntil:self.rac_willDeallocSignal]
        subscribe:self.settingsInteractor.updateCurrentCityIdentifier];
}

@end
