//
//  SNTopContentView.m
//  SNTopMenu
//
//  Created by Spectator on 16/5/6.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "SNTopContentView.h"
#import "UIView+FramePoint.h"

#pragma mark -- 内容子视图
@interface SNTopContentSubView : UIView <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign) NSInteger contentIndexPath;

@property (nonatomic, strong) NSArray *tableArr;

typedef void(^cityName)(NSString * cityname);
@property (nonatomic, copy) cityName selectName;

@end

@implementation SNTopContentSubView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self createUI];
    }
    
    return self;
}

- (void)createUI {
    
    UITableView *listTable = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    [self addSubview:listTable];
    
    listTable.delegate = self;
    listTable.dataSource = self;
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tableArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cityCell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cityCell"];
    }
    
    cell.textLabel.text = self.tableArr[indexPath.row];
    
    return cell;
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (self.selectName) {
        self.selectName(cell.textLabel.text);
    }
}
@end

#pragma mark -- 内容父视图
@implementation SNTopContentView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
//        [self createUI];
        [self setting];
    }
    
    return self;
}

- (void)setContentGroups:(NSArray *)contentGroups {
    _contentGroups = contentGroups;
    
    [self createUI];
}

- (void)createUI {
    
    UIView *lastView;
    NSInteger count = 0;
    
    for (NSArray *array in self.contentGroups) {
        
        SNTopContentSubView *subView = [[SNTopContentSubView alloc] initWithFrame:CGRectMake(lastView?[lastView current_max_x]:0, 0, [self current_w], [self current_h])];
        
        subView.tableArr = self.contentGroups;
        subView.contentIndexPath = count;
        
        __weak __typeof(&*self)weakSelf = self;
        __block NSString *address = @"";
        subView.selectName = ^(NSString * cityname){
            
            address = [NSString stringWithFormat:@"%@%@",address,cityname];
            
            if (weakSelf.addressName&&count==self.contentGroups.count-1) {
                weakSelf.addressName(cityname);
            }
            
        };
        subView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:subView];
        
        lastView = subView;
        count++;
    }
    
    self.contentSize = CGSizeMake([lastView current_max_x], [self current_h]);
    
}


- (void)setting {
    
    self.bounces = NO;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.pagingEnabled = YES;
}

@end
