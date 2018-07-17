//
//  KLinkerModel.m
//  ydbus
//
//  Created by very on 2018/5/22.
//  Copyright © 2018年 SIBAT. All rights reserved.
//

#import "KLinkerModel.h"

@implementation KLinkerModel

+ (instancetype)modelForUrl:(NSString *)url {
    KLinkerModel *model = [KLinkerModel new];
    
    model.schema = [KLinkerModel schemaForUrl:url];
    if (!model.schema) {
        return nil;
    }
    
    NSArray *paths = [[KLinkerModel pathForUrl:url] componentsSeparatedByString:@"/"];
    if (paths && [paths isKindOfClass:[NSArray class]] && paths.count >= 1) {
        if (paths.count >= 1) {
            model.module = paths[0];
        }
        if (paths.count >= 2) {
            model.controller = paths[1];
        }
        if (paths.count >= 3) {
            model.function = paths[2];
        }
    }
    
    model.params = [KLinkerModel paramsForUrl:url];
    
    return model;
}

+ (NSString *)schemaForUrl:(NSString *)url {
    NSArray *tempArray = [url componentsSeparatedByString:@"://"];
    if (tempArray && [tempArray isKindOfClass:[NSArray class]] && tempArray.count > 1) {
        return tempArray[0];
    }
    return nil;
}

+ (NSString *)pathForUrl:(NSString *)url {
    NSArray *tempArray = [url componentsSeparatedByString:@"://"];
    if (tempArray && [tempArray isKindOfClass:[NSArray class]] && tempArray.count > 1) {
        tempArray = [tempArray[1] componentsSeparatedByString:@"?"];
        if (tempArray && [tempArray isKindOfClass:[NSArray class]] && tempArray.count > 1) {
            return tempArray[0];
        }
    }
    return nil;
}

+ (NSMutableDictionary *)paramsForUrl:(NSString *)url {
    NSArray *tempArray = [url componentsSeparatedByString:@"?"];
    if (tempArray && [tempArray isKindOfClass:[NSArray class]] && tempArray.count > 1) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        NSArray *paramsArray = [tempArray[1] componentsSeparatedByString:@"&"];
        for (NSString *segment in paramsArray) {
            NSArray *param = [segment componentsSeparatedByString:@"="];
            if (param && param.count==2) {
                [dict setValue:param[1] forKey:param[0]];
            }
        }
        return dict;
    }
    return nil;
}

@end
