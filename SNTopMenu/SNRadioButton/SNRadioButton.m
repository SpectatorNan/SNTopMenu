//
//  SNRadioButton.m
//  SNTopMenu
//
//  Created by Spectator on 16/5/10.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "SNRadioButton.h"
#import "UIView+FramePoint.h"


static NSMutableDictionary *_checkedGroupDic = nil;

@interface SNRadioButton ()



@end

@implementation SNRadioButton

- (instancetype)initWithDelegate:(id)delegate groupId:(NSString *)groupId {
    self = [super init];
    
    if (self) {
        
        _delegate = delegate;
        _groupId = groupId;
        
        [self createUI];
        [self flagStyleForShow];
        [self addToGroup];
        
        [self addTarget:self action:@selector(radioChecked) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

#pragma mark -- 创建视图
- (void)createUI {
    
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor redColor];
    [self addSubview:bottomView];
    self.flagView = bottomView;
    
    UILabel *RadioLabel = [[UILabel alloc] init];
    RadioLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:RadioLabel];
    self.radioTitleLabel = RadioLabel;
    
}

#pragma mark -- 布局
- (void)layoutSubviews {
    
    self.flagView.frame = CGRectMake(0, [self current_max_y]-2, [self current_w], 2);
    
    self.radioTitleLabel.frame = CGRectMake(([self current_w]-80)/2, ([self current_h]-21)/2, 80, 21);
}

#pragma mark -- 显示状态
- (void)flagStyleForShow {
    if (self.checked) {
        self.flagView.hidden = NO;;
    } else {
        self.flagView.hidden = YES;
    }
}

#pragma mark -- 状态处理
/**
 *  添加当前按钮到组
 */
- (void)addToGroup {
    
    if (!_checkedGroupDic) {
        _checkedGroupDic = [NSMutableDictionary dictionary];
    }
    
    NSMutableArray *sRadios = [_checkedGroupDic objectForKey:self.groupId];
    if (!sRadios) {
        sRadios = [NSMutableArray array];
    }
    [sRadios addObject:self];
    
    [_checkedGroupDic setObject:sRadios forKey:self.groupId];
}
/**
 *  从组移除当前按钮
 */
- (void)removeFromGroup {
    
    if (_checkedGroupDic) {
        
        NSMutableArray *sRadios = [_checkedGroupDic objectForKey:self.groupId];
        
        if (sRadios) {
            [sRadios removeObject:self];
            
            if (sRadios.count == 0) {
                [_checkedGroupDic removeObjectForKey:self.groupId];
            }
        }
    }
}
/**
 *  按钮点击事件
 */
- (void)radioChecked {
    
    if (self.checked) {
        return;
    }
    
    self.selected = !self.selected;
    self.checked = self.selected;

    if (self.selected) {
        [self unCheckedOtherRadios];
    }
    
    if (self.selected && self.delegate && [self.delegate respondsToSelector:@selector(didSelectedRadioButton:groupId:)]) {
        [self.delegate didSelectedRadioButton:self groupId:self.groupId];
    }
}

- (void)setChecked:(BOOL)checked {
    
    if (_checked == checked) {
        return;
    }
    
    _checked = checked;
    self.selected = checked;
    [self flagStyleForShow];
    
    if (self.selected) {
        [self unCheckedOtherRadios];
    }
    
    if (self.selected && self.delegate && [self.delegate respondsToSelector:@selector(didSelectedRadioButton:groupId:)]) {
        [self.delegate didSelectedRadioButton:self groupId:self.groupId];
    }
}

- (void)unCheckedOtherRadios {
    
    NSMutableArray *sRadios = [_checkedGroupDic objectForKey:self.groupId];
    if (sRadios.count > 0) {
        for (SNRadioButton *button in sRadios) {
            if (button && ![button isEqual:self]) {
                button.checked = NO;
                button.flagView.hidden = YES;
            }
        }
    }
}
@end
