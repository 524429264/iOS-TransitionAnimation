//
//  DemoViewControllerTransitionViewController.m
//  DemoTransitions
//
//  Created by Chris Hu on 16/7/16.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "DemoViewControllerTransitionViewController.h"
#import "DemoViewControllerTransitionPresentedViewController.h"

#import "AnimatorPresentTransition.h"
#import "AnimatorBubbleTransition.h"

@interface DemoViewControllerTransitionViewController () <

    UIViewControllerTransitioningDelegate
>

@end

@implementation DemoViewControllerTransitionViewController {

    UIButton *button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self demo];
}

- (void)demo {
    [self prepareBubble];
}

- (void)prepareBubble {
    self.view.backgroundColor = [UIColor redColor];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake((self.view.frame.size.width - 80) / 2,
                              self.view.frame.size.height - 80 - 64,
                              80,
                              80);
    [self.view addSubview:button];
    [button setTitle:@"+" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor purpleColor];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:60];
    
    button.layer.cornerRadius = 40;
    [button addTarget:self action:@selector(actionBubble:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)actionBubble:(UIButton *)sender {
    DemoViewControllerTransitionPresentedViewController *presentedVC = [[DemoViewControllerTransitionPresentedViewController alloc] init];
    
    // 设置transitioningDelegate, 然后在其中实现协议方法即可.
    presentedVC.transitioningDelegate = self;
    [self presentViewController:presentedVC animated:YES completion:nil];
}

#pragma mark - <UIViewControllerTransitioningDelegate>

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    // 指定的继承UIViewControllerAnimatedTransitioning协议的对象.
    // 其中的协议方法即指定了转场动画.
    
    switch (_demoType) {
        case DemoViewControllerTransitionTypePresent:
        {
            // Present
            AnimatorPresentTransition *presentTransition = [[AnimatorPresentTransition alloc] init];
            presentTransition.animatorTransitionType = kAnimatorTransitionTypePresent;
            return presentTransition;
        }
        case DemoViewControllerTransitionTypeBubble:
        {
            // Bubble
            AnimatorBubbleTransition *bubbleTransition = [[AnimatorBubbleTransition alloc] init];
            bubbleTransition.bubbleCenter = button.center;
            bubbleTransition.animatorTransitionType = kAnimatorTransitionTypePresent;
            return bubbleTransition;
        }
        default:
            break;
    }
    
    AnimatorPresentTransition *presentTransition = [[AnimatorPresentTransition alloc] init];
    presentTransition.animatorTransitionType = kAnimatorTransitionTypePresent;
    return presentTransition;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    switch (_demoType) {
        case DemoViewControllerTransitionTypePresent:
        {
            // Present
            AnimatorPresentTransition *presentTransition = [[AnimatorPresentTransition alloc] init];
            presentTransition.animatorTransitionType = kAnimatorTransitionTypeDismiss;
            return presentTransition;
        }
        case DemoViewControllerTransitionTypeBubble:
        {
            // Bubble
            AnimatorBubbleTransition *bubbleTransition = [[AnimatorBubbleTransition alloc] init];
            bubbleTransition.animatorTransitionType = kAnimatorTransitionTypeDismiss;
            bubbleTransition.bubbleCenter = button.center;
            return bubbleTransition;
        }
        default:
            break;
    }
    
    AnimatorPresentTransition *presentTransition = [[AnimatorPresentTransition alloc] init];
    presentTransition.animatorTransitionType = kAnimatorTransitionTypeDismiss;
    return presentTransition;
}

@end
