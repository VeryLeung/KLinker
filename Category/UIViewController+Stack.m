//
//  UIViewController+Stack.m
//  ydbus
//
//  Created by very on 2018/5/23.
//  Copyright © 2018年 SIBAT. All rights reserved.
//

#import "UIViewController+Stack.h"

@implementation UIViewController(Stack)

+ (void)toController:(UIViewController *)controller 
               delay:(NSTimeInterval)delay 
        animateStyle:(UIViewControllerAnimateType)animateStyle 
            animated:(BOOL)animated {
    if (controller && [controller isKindOfClass:[UIViewController class]]) {
        if (delay > 0) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [UIViewController toController:controller animateStyle:animateStyle animated:animated];
            });
        }else {
            [UIViewController toController:controller animateStyle:animateStyle animated:animated];
        }
    }
}

+ (UIViewController *)toClass:(Class)clazz 
          delay:(NSTimeInterval)delay 
   animateStyle:(UIViewControllerAnimateType)animateStyle 
       animated:(BOOL)animated {
    if ([clazz isSubclassOfClass:[UIViewController class]]) {
        UIViewController *controller = [clazz instance];
        [UIViewController toController:controller
                                 delay:delay
                          animateStyle:animateStyle 
                              animated:animated];
        return controller;
    }
    return nil;
}

+ (void)toController:(UIViewController *)controller 
        animateStyle:(NSInteger)animateStyle 
            animated:(BOOL)animated {
        if (animateStyle == UIViewControllerAnimateTypePush) {
            [[UIViewController parentNavigationController] pushViewController:controller animated:animated];
        }else if (animateStyle == UIViewControllerAnimateTypePresent){
            [[UIViewController parentNavigationController] presentViewController:controller animated:animated completion:nil];
        }
}

- (void)popToController:(Class)clazz 
                  delay:(NSTimeInterval)delay
               animated:(BOOL)animated {
        if (delay > 0) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self popToController:clazz animated:animated];
            });
        }else {
            [self popToController:clazz animated:animated];
        }
}

- (void)popToController:(Class)clazz 
               animated:(BOOL)animated {
    if (!clazz) {
        [self.navigationController popViewControllerAnimated:animated];
    }
    NSArray *controllers = [self.navigationController viewControllers];
    for (NSInteger i=controllers.count-1; i>=0; i--) {
        if ([controllers[i] class] == clazz) {
            [self.navigationController popToViewController:controllers[i] animated:animated];
        }
    }
}

+ (UINavigationController *)parentNavigationController {
    UIViewController *navi = [UIApplication sharedApplication].keyWindow.rootViewController;
    if ([navi isKindOfClass:[UINavigationController class]]) {
        return (UINavigationController *)navi;
    }else {
        return navi.navigationController;
    }
}


/**
 *  获取最顶层的 UIViewController
 */
+ (UIViewController *)topViewController;
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}

+ (instancetype)instance {
    return [[self alloc] init];
}

@end
