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
/*
#pragma mark -- 菜单子视图
@interface SNTopMenuSubView : UIView

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, assign) NSInteger meunIndexPath;

@property (nonatomic, assign) BOOL selected;

@end

@implementation SNTopMenuSubView


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self createUI];
    }
    
    return self;
}

#pragma mark -- 创建子视图
- (void)createUI {
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
    [self addSubview:titleLabel];
    
    self.titleLabel = titleLabel;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
}

@end
*/
#pragma mark -- 菜单父视图
@interface SNTopMenuView()<SNRadioButtonDelegate>


@end
@implementation SNTopMenuView


//- (NSArray<NSString *> *)titleGruops {
//    
//    if (!_titleGruops) {
//        _titleGruops = @[@"111",@"222",@"333",@"444",@"666",@"777",@"888"];
//    }
//    return _titleGruops;
//}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
//        [self createUI];
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
        
//        SNTopMenuSubVIew *subView = [[SNTopMenuSubVIew alloc] initWithFrame:CGRectMake(lastView?[lastView current_max_x]+5:10, 0, [self current_w]/5, [self current_h])];
        SNRadioButton *subView = [[SNRadioButton alloc] initWithDelegate:self groupId:@"menu"];
        subView.frame = CGRectMake(lastView?[lastView current_max_x]+5:10, 0, [self current_w]/5, [self current_h]);
//        subView.titleLabel.text = title;
//        subView.meunIndexPath = count;
//        subView.delegate = self;
        subView.radioTitleLabel.text = title;
        subView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:subView];
        
        if (count == 0) {
            subView.checked = YES;
        }
        
        lastView = subView;
        count++;
    }
    
    self.contentSize = CGSizeMake([lastView current_max_x], [self current_h]);
}


- (void)setting {
    
    self.bounces = NO;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
}
@end
