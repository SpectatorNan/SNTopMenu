//
//  SNTopMenuMainView.m
//  SNTopMenu
//
//  Created by Spectator on 16/5/6.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "SNTopMenuMainView.h"
#import "SNTopMenuView.h"
#import "SNTopContentView.h"
#import "UIView+FramePoint.h"
#import "SNTopMenuViewModel.h"


@interface SNTopMenuMainView ()<SNTopMenuViewDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) SNTopMenuView *menu;

@property (nonatomic, strong) SNTopContentView *content;
@end

@implementation SNTopMenuMainView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
       
        [self creatAllView];
    }
    
    return self;
}

#pragma mark -- 数据处理
- (void)setMenuTotalDic:(NSDictionary *)menuTotalDic {
    _menuTotalDic = menuTotalDic;

    __weak typeof (self) weakSelf = self;

    SNTopMenuViewModel *menuViewModel = [SNTopMenuViewModel new];
    
    [menuViewModel handleWithTatolData:menuTotalDic complete:^(NSArray *menuTitleArr, NSDictionary *contentDic) {
        
        weakSelf.menu.titleGruops = menuTitleArr;
        
        weakSelf.content.contentDic = contentDic;
    }];
    
    
}

#pragma mark -- 添加子视图
- (void)creatAllView {
    
    [self createMenu];
    
    [self createContent];
}
// 添加顶部菜单
- (void)createMenu {
    
    SNTopMenuView *menu = [[SNTopMenuView alloc] initWithFrame:CGRectMake(0, 5, self.bounds.size.width, 30)];
    [self addSubview:menu];
    menu.menuDelegate = self;
    
    self.menu = menu;
 
    
}
// 添加内容视图
- (void)createContent {
    
    SNTopContentView *content = [[SNTopContentView alloc]initWithFrame:CGRectMake(0, [self.menu current_max_y], self.bounds.size.width, self.bounds.size.height-[self.menu current_max_y])];
    [self addSubview:content];
    
    content.delegate = self;
    self.content = content;
 
}

#pragma mark -- 布局设置
- (void)setMenuHeight:(CGFloat)menuHeight {
    _menuHeight = menuHeight;
    
    [self.menu setFrame:CGRectMake(0, 0, self.bounds.size.width, menuHeight)];
    
    [self.content setFrame:CGRectMake(0, [self.menu current_max_y], self.bounds.size.width, self.bounds.size.height-[self.menu current_h])];
}

#pragma mark -- SNTopMenuViewDelegate

- (void)didSelectedMenuView:(SNTopMenuView *)menu indexPath:(NSInteger)indexPath {
    
    self.content.contentOffset = CGPointMake([self current_w]*indexPath, 0);
}

#pragma mark -- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    self.menu.selectMenuIndexPath = scrollView.contentOffset.x/[self current_w];
}

@end



