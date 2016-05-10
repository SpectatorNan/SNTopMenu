//
//  SNRadioButton.h
//  SNTopMenu
//
//  Created by Spectator on 16/5/10.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol  SNRadioButtonDelegate;
@interface SNRadioButton : UIButton

@property (nonatomic, copy, readonly) NSString *groupId;

@property (nonatomic, assign) BOOL checked;

@property (nonatomic, weak) id<SNRadioButtonDelegate> delegate;

@property (nonatomic, strong) UIView *flagView;

@property (nonatomic, strong) UILabel *radioTitleLabel;

- (instancetype)initWithDelegate:(id)delegate groupId:(NSString *)groupId;
@end


@protocol SNRadioButtonDelegate <NSObject>

- (void)didSelectedRadioButton:(SNRadioButton *)radio groupId:(NSString *)groupId;

@end