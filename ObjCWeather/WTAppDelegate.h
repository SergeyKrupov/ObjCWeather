//
//  AppDelegate.h
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 01.02.2019.
//  Copyright © 2019 Sergey V. Krupov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WTRootViewController;

@interface WTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) WTRootViewController *rootViewController;

@end

