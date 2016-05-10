//
//  SNTopMenuSubVIew.h
//  SNTopMenu
//
//  Created by Spectator on 16/5/10.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "SNRadioButton.h"

@interface SNTopMenuSubVIew : SNRadioButton

@property (nonatomic, assign) NSInteger menuIndexPath;

+ (instancetype)SNTopMenuWithTarget:(id)target frame:(CGRect)frame;
@end
