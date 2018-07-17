//
//  UIViewController+KLinker.m
//  ydbus
//
//  Created by very on 2018/5/23.
//  Copyright © 2018年 SIBAT. All rights reserved.
//
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

#import "UIViewController+KLinker.h"

const static char *kRouteParams = "kRouteParams";

@implementation UIViewController (KLinker)

+ (void)kl_route:(NSString *)function params:(NSDictionary *)params {
    Class clazz = [self class];
    if ([clazz instancesRespondToSelector:NSSelectorFromString(function)]) {
        UIViewController *controller = [[[UIApplication sharedApplication].keyWindow.rootViewController childViewControllers] lastObject];
        if (![[controller class] isEqual:clazz]) {
            controller = [self instance];   
        }
        [controller performSelector:NSSelectorFromString(function) withObject:params];
    }else {
        SEL selector = NSSelectorFromString(@"kl_route:");
        if ([clazz respondsToSelector:selector]) {
            [clazz performSelector:selector withObject:params];
        }
    }
}

+ (void)kl_route:(NSDictionary *)kl_params {
    UIViewController *controller = [self instance];
    [controller setValue:kl_params forKey:@"kl_params"];
    [UIViewController toController:controller
                             delay:0
                      animateStyle:UIViewControllerAnimateTypePush 
                          animated:YES];
}

- (void)setKl_params:(NSDictionary *)kl_params {
    objc_setAssociatedObject(self, kRouteParams, kl_params, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSDictionary *)kl_params {
    return objc_getAssociatedObject(self, kRouteParams);
}

//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    NSString *routeFunc = @"initWithRoute";
//    if (sel == NSSelectorFromString(routeFunc)) {
//        
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    [super forwardInvocation:anInvocation];
//}
//
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    
//    return nil;
//}
//
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    NSMethodSignature *methodSignature = [super methodSignatureForSelector:aSelector];
//    return methodSignature;
//}

@end
