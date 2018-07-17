//
//  KLinker.m
//  ydbus
//
//  Created by very on 2018/5/22.
//  Copyright © 2018年 SIBAT. All rights reserved.
//

#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

#import "KLinker.h"
#import "KFilter.h"

@interface KLinker()

@property(nonatomic)NSMutableDictionary<NSString *,Class> *clazzs;

@end

@implementation KLinker

+ (instancetype)sharedInstance { 
    static dispatch_once_t once; 
    static id __singleton__; 
    dispatch_once( &once, ^{ __singleton__ = [[self alloc] init]; } ); 
    return __singleton__; 
}

+ (void)kl_route:(NSString *)url {
    KLinkerModel *model = [KLinkerModel modelForUrl:url];
    BOOL flag = [KFilter filter:model];
    if (flag) {
        [KLinker routeInNative:model];
    }
}

+ (void)kl_registClass:(Class)clazz name:(NSString *)key {
    if (!key || [key isEqualToString:@""]) {
        [[KLinker sharedInstance].clazzs setValue:clazz forKey:NSStringFromClass(clazz)];
    }else {
        [[KLinker sharedInstance].clazzs setValue:clazz forKey:key];
    }
}

+ (void)routeInNative:(KLinkerModel *)model {
    Class controller = [KLinker sharedInstance].clazzs[model.controller];
    if (controller && 
        [controller isSubclassOfClass:[UIViewController class]]) {
        SEL routeFunc = NSSelectorFromString(@"kl_route:params:");
        [controller performSelector:routeFunc withObject:model.function withObject:model.params];
    }

}

- (NSMutableDictionary<NSString *,Class> *)clazzs {
    if (!_clazzs) {
        _clazzs = [NSMutableDictionary dictionary];
    }
    return _clazzs;
}

@end
