//
//  SNTopMenuView.h
//  SNTopMenu
//
//  Created by Spectator on 16/5/6.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SNTopMenuViewDelegate;
@interface SNTopMenuView : UIScrollView

@property (nonatomic, weak) id<UIScrollViewDelegate> scrollDelegate;

@property (nonatomic, weak) id<SNTopMenuViewDelegate> menuDelegate;

@property (nonatomic, strong) NSArray<NSString *> *titleGruops;

@property (nonatomic, assign) NSInteger selectMenuIndexPath;

@end


@protocol SNTopMenuViewDelegate <NSObject>
@optional
- (void)didSelectedMenuView:(SNTopMenuView *)menu indexPath:(NSInteger)indexPath;

@end