//
//  SNTopMenuView.m
//  SNTopMenu
//
//  Created by Spectator on 16/5/6.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "SNTopMenuView.h"
#import "UIView+FramePoint.h"

@interface SNTopMenuSubView : UIView

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, assign) NSInteger meunIndexPath;

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


@implementation SNTopMenuView


- (NSArray<NSString *> *)titleGruops {
    
    if (!_titleGruops) {
        _titleGruops = @[@"111",@"222",@"333",@"444",@"666",@"777",@"888"];
    }
    return _titleGruops;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self createUI];
        [self setting];
    }
    
    return self;
}



#pragma mark -- 添加子视图

- (void)createUI {
    
    UIView *lastView;
    NSInteger count = 0;
    
    NSLog(@"fram -- %@",self);
    
    NSLog(@"width -- %f",[self current_w]);
    
    NSLog(@"height -- %f",[self current_h]);
    
    for (NSString *title in self.titleGruops) {
        
        SNTopMenuSubView *subView;// = [SNTopMenuSubView new];
        
        
       
        
        if (!lastView) {
            
//        [subView setFrame:CGRectMake(0, 0, [self current_w]/5, [self current_h])];
            subView = [[SNTopMenuSubView alloc] initWithFrame:CGRectMake(0, 0, [self current_w]/5, [self current_h])];
        } else {
            subView = [[SNTopMenuSubView alloc] initWithFrame:CGRectMake([lastView current_max_x]+10, 0, [self current_w]/5, [self current_h])];
//            [subView setFrame:CGRectMake([lastView current_max_x]+10, 0, [self current_w]/5, [self current_h])];
        }
        
        subView.titleLabel.text = title;
        subView.meunIndexPath = count;
        subView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:subView];
        
        lastView = subView;
        count++;
    }
    
    self.contentSize = CGSizeMake([lastView current_max_x], [self current_h]);
}


- (void)setting {
    
    self.bounces = NO;
}
@end
