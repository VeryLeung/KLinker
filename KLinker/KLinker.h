//
//  KLinker.h
//  BANMAZ
//
//  Created by very on 2018/5/22.
//  Copyright © 2018年 KLINKER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIViewController+KLinker.h"

#ifndef KLINKER_ANNOTAION

#define KLINKER_ANNOTAION(key) \
+ (void)load { \
[super load]; \
[KLinker kl_registClass:[self class] name:key]; \
} \

#endif

@interface KLinker : NSObject

+ (void)kl_route:(NSString *)url;

+ (void)kl_registClass:(Class)clazz name:(NSString *)key;

@end
