//
//  ViewController.m
//  SNTopMenu
//
//  Created by Spectator on 16/5/6.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "ViewController.h"
#import "SNTopMenuMainView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self createUI];
}

- (void)createUI {
    
    SNTopMenuMainView *mainView = [[SNTopMenuMainView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:mainView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
