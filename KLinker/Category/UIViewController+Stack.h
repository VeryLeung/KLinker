//
//  UIViewController+Stack.h
//  ydbus
//
//  Created by very on 2018/5/23.
//  Copyright © 2018年 SIBAT. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIViewControllerAnimateType) {
    UIViewControllerAnimateTypePush,
    UIViewControllerAnimateTypePresent,
};

@interface UIViewController(Stack)

+ (void)toController:(UIViewController *)controller 
               delay:(NSTimeInterval)delay 
        animateStyle:(UIViewControllerAnimateType)animateStyle 
            animated:(BOOL)animated;

+ (UIViewController *)toClass:(Class)clazz 
          delay:(NSTimeInterval)delay 
   animateStyle:(UIViewControllerAnimateType)animateStyle 
       animated:(BOOL)animated;

- (void)popToController:(Class)clazz 
                  delay:(NSTimeInterval)delay
               animated:(BOOL)animated;

+ (UINavigationController *)parentNavigationController;

/**
 *  获取最顶层的 UIViewController
 */
+ (UIViewController *)topViewController;

+ (instancetype)instance;

@end
