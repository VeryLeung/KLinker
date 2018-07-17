//
//  KFilterFunction.m
//  ydbus
//
//  Created by very on 2018/5/25.
//  Copyright © 2018年 SIBAT. All rights reserved.
//

#import "KFilterFunction.h"

@implementation KFilterFunction

+ (void)load {
    [KFilter addFilter:[self class]];
}

+ (BOOL)filter:(KLinkerModel *)model {
    if ([model.function isEqualToString:@""] ||
        [model.function hasPrefix:@"get"] ||
        [model.function hasPrefix:@"init"] ||
        [model.function hasPrefix:@"setup"]) {
        return YES;
    }
    return NO;
}

@end
