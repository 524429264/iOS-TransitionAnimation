//
//  ChildViewController.m
//  DemoTransitions
//
//  Created by Chris Hu on 16/7/15.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "ChildViewController.h"

@interface ChildViewController ()

@end

@implementation ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)actionBack:(UIButton *)sender {
    //    [self dismissViewControllerAnimated:YES completion:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    
    if (self.csTransitionDelegate && [self.csTransitionDelegate respondsToSelector:@selector(reAddChildViewControllers)]) {
        [self.csTransitionDelegate reAddChildViewControllers];
    }
}

@end
