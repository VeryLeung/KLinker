//
//  KFilter.m
//  ydbus
//
//  Created by very on 2018/5/22.
//  Copyright © 2018年 SIBAT. All rights reserved.
//
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

#import "KFilter.h"

@interface KFilter()

@property(nonatomic)NSMutableArray *filterArray;

@end

@implementation KFilter

+ (instancetype)sharedInstance { 
    static dispatch_once_t once; 
    static id __singleton__; 
    dispatch_once( &once, ^{ __singleton__ = [[self alloc] init]; } ); 
    return __singleton__; 
}

+ (BOOL)filter:(KLinkerModel *)model {
    BOOL flag = YES;
    for (Class clazz in [[self sharedInstance] filterArray]) {
        if ([clazz conformsToProtocol:@protocol(KFilterProtocal)]) {
            flag = flag && [clazz performSelector:NSSelectorFromString(@"filter:") withObject:model];
        }
    }
    return flag;
}

+ (void)addFilter:(Class)filter {
    [[[self sharedInstance] filterArray] addObject:filter];
}

- (NSMutableArray *)filterArray {
    if (!_filterArray) {
        _filterArray = [NSMutableArray array];
    }
    return _filterArray;
}

@end
