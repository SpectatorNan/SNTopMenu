//
//  SNTopMenuViewModel.h
//  SNTopMenu
//
//  Created by Spectator on 16/5/11.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNTopMenuViewModel : NSObject

FOUNDATION_EXPORT NSString * const provinceKey;

FOUNDATION_EXPORT NSString * const cityKey;

FOUNDATION_EXPORT NSString * const countyDistrictKey;

FOUNDATION_EXPORT NSString * const roadTownKey;

typedef void(^SepMenuContent)(NSArray *menuTitleArr, NSDictionary *contentDic);

typedef void(^contentCallBack)(NSArray *contentArr);

- (void)handleWithTatolData:(id)data complete:(SepMenuContent)complete;

- (void)handleWithContentData:(id)data complete:(contentCallBack)complete;
- (void)handleWithContentKey:(NSString *)key complete:(contentCallBack)complete;
@end
