//
//  DemoCATransitionPushedViewController.m
//  DemoTransitions
//
//  Created by Chris Hu on 16/7/28.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "DemoCATransitionPushedViewController.h"

@interface DemoCATransitionPushedViewController ()

@end

@implementation DemoCATransitionPushedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self addBtns];
}

- (void)addBtns{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 100, self.view.frame.size.width, 50)];
    [btn setTitle:@"Back" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(actionButton:) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.borderColor = [UIColor redColor].CGColor;
    btn.layer.borderWidth = 2.0f;
    [self.view addSubview:btn];
}

- (void)actionButton:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
