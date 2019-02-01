//
//  WTSettingsItem.h
//  ObjCWeather
//
//  Created by Sergey on 05/02/2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WTSettingsItem : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) BOOL isCurrent;
@property (nonatomic, readonly) NSNumber *identifier;

@end

@interface WTMutableSettingsItem : WTSettingsItem

@property (nonatomic, copy) NSString *name;
@property (nonatomic) BOOL isCurrent;
@property (nonatomic, strong) NSNumber *identifier;

@end

NS_ASSUME_NONNULL_END
