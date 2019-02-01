//
//  WTRootViewController.m
//  ObjCWeather
//
//  Created by Sergey V. Krupov on 03/02/2019.
//  Copyright © 2019 Home. All rights reserved.
//

#import "WTRootViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "WTRootViewProtocol.h"
#import "WTRootPresenterProtocol.h"

@interface WTRootViewController () <UIPageViewControllerDataSource>

@end

@implementation WTRootViewController

- (instancetype)init
{
    return [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                    navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                  options:nil];
}

// MARK: - Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.dataSource = self;

    if (self.pages.count > 0)
    {
        [self setViewControllers:@[self.pages.firstObject] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    }
}

// MARK: - UIPageViewControllerDataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger index = [self.pages indexOfObject:viewController];
    if (index != NSNotFound)
    {
        return self.pages[(index + self.pages.count - 1) % self.pages.count];
    }
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = [self.pages indexOfObject:viewController];
    if (index != NSNotFound)
    {
        return self.pages[(index + 1) % self.pages.count];
    }
    return nil;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return self.pages.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    UIViewController *viewController = pageViewController.viewControllers.firstObject;
    NSInteger index = [self.pages indexOfObject:viewController];
    return index == NSNotFound ? 0 : index;
}

@end
