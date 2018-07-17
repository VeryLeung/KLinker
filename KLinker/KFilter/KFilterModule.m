//
//  KFilterModule.m
//  ydbus
//
//  Created by very on 2018/5/25.
//  Copyright © 2018年 SIBAT. All rights reserved.
//

#import "KFilterModule.h"

@implementation KFilterModule

+ (void)load {
    [KFilter addFilter:[self class]];
}

+ (BOOL)filter:(KLinkerModel *)model {
    if ([model.module isEqualToString:@"line"] ||
        [model.module isEqualToString:@"station"] ||
        [model.module isEqualToString:@"user"] ||
        [model.module isEqualToString:@"ticket"]) {
        return YES;
    }
    return NO;
}

@end
