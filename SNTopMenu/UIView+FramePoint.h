//
//  UIView+FramePoint.h
//  SNTopMenu
//
//  Created by Spectator on 16/5/6.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FramePoint)

//宽度
- (CGFloat)current_w;

//高度
- (CGFloat)current_h;

//当前view.frame的x、y、x+宽、y+高
- (CGFloat)current_x;
- (CGFloat)current_y;
- (CGFloat)current_max_x;
- (CGFloat)current_max_y;

@end
