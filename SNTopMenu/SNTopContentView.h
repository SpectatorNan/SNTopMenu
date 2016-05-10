//
//  SNTopContentView.h
//  SNTopMenu
//
//  Created by Spectator on 16/5/6.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SNTopContentView : UIScrollView

@property (nonatomic, strong) NSArray *contentGroups;
@property (nonatomic, strong) NSDictionary *contentDic;

typedef void(^addressName)(NSString *addressName);
@property (nonatomic, copy) addressName addressName;


@end
