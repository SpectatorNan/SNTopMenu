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

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
       
    }
    
    return self;
}

#pragma mark -- 添加子视图

- (void)createUI {
    
    UIView *lastView;
    NSInteger count = 0;
    for (NSString *title in self.titleGruops) {
        
        SNTopMenuSubView *subView = [SNTopMenuSubView new];
        [self addSubview:subView];
        
        subView.titleLabel.text = title;
        subView.meunIndexPath = count;
        
        if (!lastView) {
            
        [subView setFrame:CGRectMake(0, 0, [self current_w]/5, [self current_h])];
        } else {
            
            [subView setFrame:CGRectMake([lastView current_max_x], 0, [self current_w]/5, [self current_h])];
        }
        
        lastView = subView;
        count++;
    }
}


- (void)setting {
    
}
@end
