//
//  KFilter.h
//  ydbus
//
//  Created by very on 2018/5/22.
//  Copyright © 2018年 SIBAT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLinkerModel.h"

@protocol KFilterProtocal <NSObject>

+ (BOOL)filter:(KLinkerModel *)model;

@end

@interface KFilter : NSObject<KFilterProtocal>

+ (void)addFilter:(Class)filter;

@end
