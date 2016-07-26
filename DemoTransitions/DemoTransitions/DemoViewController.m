//
//  DemoViewController.m
//  DemoTransitions
//
//  Created by Chris Hu on 16/7/15.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "DemoViewController.h"
#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"

#import "DemoCATransitionTableViewController.h"
#import "DemoViewControllerTransitionTableViewController.h"

@interface DemoViewController () <
    CSViewControllerTransitionDelegate
>

@end

@implementation DemoViewController {

    UIViewController *_currentViewController;
    
    UILabel *label;
    
    UIButton *btn1;
    
    UIButton *btn2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self reAddChildViewControllers];
    
    [self addLabel];
    
    [self addBtns];
}

- (void)reAddChildViewControllers {
    for (UIViewController *childView in self.childViewControllers) {
        [childView removeFromParentViewController];
    }
    
    AViewController *a = [[AViewController alloc] init];
    a.csTransitionDelegate = self;
    [self addChildViewController:a];
    
    BViewController *b = [[BViewController alloc] init];
    b.csTransitionDelegate = self;
    [self addChildViewController:b];
    
    CViewController *c = [[CViewController alloc] init];
    c.csTransitionDelegate = self;
    [self addChildViewController:c];
    
    
    [self.view addSubview:a.view];
    
    _currentViewController = a;
    
    [self.view bringSubviewToFront:label];
    [self.view bringSubviewToFront:btn1];
    [self.view bringSubviewToFront:btn2];
}

- (void)addLabel {
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 30)];
    label.text = [NSString stringWithFormat:@"Parent - %@", NSStringFromClass([self class])];
    [self.view addSubview:label];
    
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
}

- (void)addBtns{
    // presentViewController
    btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 30)];
    [btn1 setTitle:@"Parent - presentViewController" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn1 addTarget:self action:@selector(actionPresentViewController:) forControlEvents:UIControlEventTouchUpInside];
    btn1.layer.borderColor = [UIColor redColor].CGColor;
    btn1.layer.borderWidth = 2.0f;
    [self.view addSubview:btn1];
    
    // transitionFromViewController
    btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 30)];
    [btn2 setTitle:@"Parent - transitionFromViewController" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn2 addTarget:self action:@selector(actionTransitionFromViewController:) forControlEvents:UIControlEventTouchUpInside];
    btn2.layer.borderColor = [UIColor redColor].CGColor;
    btn2.layer.borderWidth = 2.0f;
    [self.view addSubview:btn2];
}

- (void)actionPresentViewController:(UIButton *)sender {
    AViewController *aView = [[AViewController alloc] init];
    aView.name = @"presentViewController";
    [self presentViewController:aView animated:YES completion:nil];
}

- (void)actionTransitionFromViewController:(UIButton *)sender {
    AViewController *a = self.childViewControllers[0];
    BViewController *b = self.childViewControllers[1];
    CViewController *c = self.childViewControllers[2];
    
    // Curl 翻页效果
    // UIViewAnimationOptionTransitionCurlUp, UIViewAnimationOptionTransitionCurlDown
    // Flip 翻转效果
    // UIViewAnimationOptionTransitionFlipFromLeft, UIViewAnimationOptionTransitionFlipFromRight
    // UIViewAnimationOptionTransitionFlipFromTop, UIViewAnimationOptionTransitionFlipFromDown
    [self transitionFromViewController:_currentViewController toViewController:b duration:0.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        btn1.transform = CGAffineTransformMakeScale(2.0, 2.0);
    } completion:^(BOOL finished) {
        btn1.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
}

@end
