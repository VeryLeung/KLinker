//
//  KFilterController.m
//  ydbus
//
//  Created by very on 2018/5/24.
//  Copyright © 2018年 SIBAT. All rights reserved.
//

#import "KFilterController.h"

@implementation KFilterController

+ (void)load {
    [KFilter addFilter:[self class]];
}

+ (BOOL)filter:(KLinkerModel *)model {
    return YES;
}

@end
