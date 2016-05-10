//
//  SNTopMenuSubVIew.m
//  SNTopMenu
//
//  Created by Spectator on 16/5/10.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "SNTopMenuSubVIew.h"

@implementation SNTopMenuSubVIew

+ (instancetype)SNTopMenuWithTarget:(id)target frame:(CGRect)frame {
    
    SNTopMenuSubVIew *menu = [[SNTopMenuSubVIew alloc] initWithDelegate:target groupId:@"menu"];
    menu.frame = frame;
    
    return menu;
}

@end
