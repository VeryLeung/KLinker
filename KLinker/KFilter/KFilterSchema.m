//
//  KFilterSchema.m
//  ydbus
//
//  Created by very on 2018/5/24.
//  Copyright © 2018年 SIBAT. All rights reserved.
//

#import "KFilterSchema.h"

@implementation KFilterSchema

+ (void)load {
    [KFilter addFilter:[self class]];
}

+ (BOOL)filter:(KLinkerModel *)model {
    if ([model.schema isEqualToString:@"ydbus"] ||
        [model.schema isEqualToString:@"https"] ||
        [model.schema isEqualToString:@"http"]) {
        return YES;
    }
    return NO;
}

@end
