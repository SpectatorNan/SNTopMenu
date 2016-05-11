//
//  SNTopMenuViewModel.m
//  SNTopMenu
//
//  Created by Spectator on 16/5/11.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "SNTopMenuViewModel.h"


static NSMutableDictionary *contentArrDic = nil;

 NSString * const provinceKey = @"province";

 NSString * const cityKey = @"city";

 NSString * const countyDistrictKey = @"countyDistrict";

 NSString * const roadTownKey = @"roadTown";

@interface SNTopMenuViewModel()
{
    NSArray *_parsingArr;
}

@end

@implementation SNTopMenuViewModel

#pragma mark -- MainHandle
- (void)handleWithTatolData:(id)data complete:(SepMenuContent)complete {
    
    NSDictionary *dataDic = (NSDictionary *)data;
    
    NSArray *menuTitleArr = dataDic[@"title"];
    
    NSDictionary *provinceDic = dataDic[@"content"];
    
    complete(menuTitleArr,provinceDic);
}

#pragma mark -- ContentHandle
- (void)handleWithContentData:(id)data complete:(contentCallBack)complete {
    
    if ([data isKindOfClass:[NSDictionary class]]) {
        NSDictionary *contentDic = (NSDictionary *)data;
        if ([contentDic[contentDic.allKeys[0]] hasSuffix:@"省"]) {
            [self addToDicValue:contentDic.allKeys forKey:provinceKey];
            
        } else if ([contentDic[contentDic.allKeys[0]] hasSuffix:@"市"]) {
            [self addToDicValue:contentDic.allKeys forKey:cityKey];
            
        } else if ([contentDic[contentDic.allKeys[0]] hasSuffix:@"县"] || [contentDic[contentDic.allKeys[0]] hasSuffix:@"区"]) {
            [self addToDicValue:contentDic.allKeys forKey:countyDistrictKey];
            
        } else if ([contentDic[contentDic.allKeys[0]] hasSuffix:@"镇"] || [contentDic[contentDic.allKeys[0]] hasSuffix:@"道"] || [contentDic[contentDic.allKeys[0]] hasSuffix:@"路"]) {
            [self addToDicValue:contentDic.allKeys forKey:roadTownKey];
        }
        
        complete(contentDic.allKeys);
        
    } else if( [data isKindOfClass:[NSArray class]]) {
        NSArray *contentArr = (NSArray *)data;
        
        [self addToDicValue:contentArr forKey:roadTownKey];
        
        complete(contentArr);
    }
    
}

- (void)handleWithContentKey:(NSString *)key complete:(contentCallBack)complete {
    
    NSMutableArray *contentArr = [contentArrDic objectForKey:key];
    
    complete(contentArr);
    
}

- (void)addToDicValue:(id)value forKey:(NSString *)key {
    
    if (!contentArrDic) {
        contentArrDic = [NSMutableDictionary dictionary];
    }
    
    NSMutableArray *valueArr = [contentArrDic objectForKey:key];
    
    if (!valueArr) {
        valueArr = (NSMutableArray *)value;
    } else {
        NSArray *oldArr = (NSMutableArray *)value;
        if ([valueArr isEqual:oldArr]) {
            return;
        }
    }
    [contentArrDic setObject:valueArr forKey:key];
}

@end
