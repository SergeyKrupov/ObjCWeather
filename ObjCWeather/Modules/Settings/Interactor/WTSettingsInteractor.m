//
//  WTSettingsInteractor.m
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 05/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import "WTSettingsInteractor.h"
#import "WTSettingsService.h"

@implementation WTSettingsInteractor

// MARK: - WTSettingsInteractorProtocol

- (id<RACSubscriber>)updateCurrentCityIdentifier
{
    return [self.settingsService updateCurrentCityIdentifier];
}

- (RACSignal<WTCity *> *)obtainCurrentCity
{
    return [self.settingsService obtainCurrentCity];
}

- (RACSignal<NSArray<WTCity *> *> *)obtainAllCities
{
    return [self.settingsService obtainAllCities];
}

@end
