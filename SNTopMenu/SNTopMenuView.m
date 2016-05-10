//
//  SNTopMenuView.m
//  SNTopMenu
//
//  Created by Spectator on 16/5/6.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "SNTopMenuView.h"
#import "UIView+FramePoint.h"
#import "SNTopMenuSubVIew.h"



#pragma mark -- 菜单父视图
@interface SNTopMenuView()<SNRadioButtonDelegate>


@property (nonatomic, strong) NSMutableArray *subViewArr;

@end
@implementation SNTopMenuView

- (NSMutableArray *)subViewArr {
    
    if (!_subViewArr) {
        _subViewArr = [NSMutableArray array];
    }
    return _subViewArr;
}

- (void)setSelectMenuIndexPath:(NSInteger)selectMenuIndexPath {
    
    _selectMenuIndexPath = selectMenuIndexPath;
    
    for (SNTopMenuSubVIew *subView in self.subViewArr) {
        if (subView.menuIndexPath == selectMenuIndexPath) {
            subView.checked = YES;
        }
    }
    
    
}
#pragma mark -- 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setting];
    }
    
    return self;
}

- (void)setTitleGruops:(NSArray<NSString *> *)titleGruops {
    _titleGruops = titleGruops;
    
    [self createUI];
}

#pragma mark -- 添加子视图

- (void)createUI {
    
    UIView *lastView;
    NSInteger count = 0;
    
    
    
    for (NSString *title in self.titleGruops) {
        


        SNTopMenuSubVIew *subView = [SNTopMenuSubVIew SNTopMenuWithTarget:self frame:CGRectMake(lastView?[lastView current_max_x]+5:10, 0, [self current_w]/5, [self current_h])];
        
        subView.radioTitleLabel.text = title;
        subView.menuIndexPath = count;
        subView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:subView];
        
        if (count == 0) {
            subView.checked = YES;
        }
        
        lastView = subView;
        [self.subViewArr addObject:subView];
        count++;
    }
    
    self.contentSize = CGSizeMake([lastView current_max_x], [self current_h]);
}


- (void)setting {
    
    self.bounces = NO;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
}

#pragma mark -- SNRadioDelegate 
- (void)didSelectedRadioButton:(SNTopMenuSubVIew *)radio groupId:(NSString *)groupId {
    
    self.selectMenuIndexPath = radio.menuIndexPath;
    
    if (self.menuDelegate && [self.menuDelegate respondsToSelector:@selector(didSelectedMenuView:indexPath:)]) {
        [self.menuDelegate didSelectedMenuView:self indexPath:self.selectMenuIndexPath];
    }
}
@end
