//
//  UIView+FramePoint.m
//  SNTopMenu
//
//  Created by Spectator on 16/5/6.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "UIView+FramePoint.h"

@implementation UIView (FramePoint)

- (CGFloat)current_x{
    return self.frame.origin.x;
}
- (CGFloat)current_y{
    return self.frame.origin.y;
}
- (CGFloat)current_w{
    return self.frame.size.width;
}
- (CGFloat)current_h{
    return self.frame.size.height;
}
- (CGFloat)current_max_x{
    return self.frame.origin.x+self.frame.size.width;
}
- (CGFloat)current_max_y{
    return self.frame.origin.y+self.frame.size.height;
}

@end
