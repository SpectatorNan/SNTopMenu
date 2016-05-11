//
//  SNTopContentView.m
//  SNTopMenu
//
//  Created by Spectator on 16/5/6.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "SNTopContentView.h"
#import "UIView+FramePoint.h"
#import "SNTopMenuViewModel.h"

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
    listTable.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 43, [self current_w], 1)];
    line.backgroundColor = [UIColor blackColor];
    [cell.contentView addSubview:line];
    
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
@interface SNTopContentView()


@property (nonatomic, strong) NSMutableArray *contentListArr;

@end

@implementation SNTopContentView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {

        [self setting];
    }
    
    return self;
}

- (NSMutableArray *)contentListArr {
    
    if (!_contentListArr) {
        _contentListArr = [NSMutableArray array];
    }
    
    return _contentListArr;
}

#pragma mark -- 数据处理
- (void)setContentGroups:(NSArray *)contentGroups {
    _contentGroups = contentGroups;
    
    [self createUI];
  
}

- (void)setContentDic:(NSDictionary *)contentDic {
    
    _contentDic = contentDic;
/*
    NSArray *provinceArr = contentDic.allKeys;
    
    NSDictionary *cityDic = contentDic[@"湖南省"];
    NSArray *cityArr = cityDic.allKeys;
    
    NSDictionary *areaDic = cityDic[@"长沙市"];
    NSArray *areaArr = areaDic.allKeys;
    
    NSArray *roadArr = areaDic[@"雨花区"];
    
    
    [self.contentListArr addObject:provinceArr];
    [self.contentListArr addObject:cityArr];
    [self.contentListArr addObject:areaArr];
    [self.contentListArr addObject:roadArr];
  */
    __weak typeof (self) weakSelf = self;
    
    SNTopMenuViewModel *viewModel = [SNTopMenuViewModel new];
    [viewModel handleWithContentData:contentDic complete:^(NSArray *contentArr) {
        [weakSelf.contentListArr addObject:contentArr];
    }];
    
    [self createUI];
}

- (void)createUI {
    
    UIView *lastView;
    NSInteger count = 0;
    
    for (NSArray *array in self.contentListArr) {
        
        SNTopContentSubView *subView = [[SNTopContentSubView alloc] initWithFrame:CGRectMake(lastView?[lastView current_max_x]:0, 0, [self current_w], [self current_h])];
        
        subView.tableArr = array;
        subView.contentIndexPath = count;
        
        __weak __typeof(&*self)weakSelf = self;
        __block NSString *address = @"";
        __weak SNTopContentSubView *weakSubView = subView;
        subView.selectName = ^(NSString * cityname){
            
            address = [NSString stringWithFormat:@"%@%@",address,cityname];
            NSLog(@"打印当前点击页面的号码---%ld",weakSubView.contentIndexPath);
            if (weakSelf.addressName&&subView.contentIndexPath==self.contentListArr.count-1) {
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
