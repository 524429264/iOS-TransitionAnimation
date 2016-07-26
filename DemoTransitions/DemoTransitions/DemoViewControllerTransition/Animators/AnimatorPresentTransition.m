//
//  AnimatorPresentTransition.m
//  DemoTransitions
//
//  Created by Chris Hu on 16/7/16.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "AnimatorPresentTransition.h"

@implementation AnimatorPresentTransition

- (instancetype)init {
    self = [super init];
    if (self) {
    
    }
    return self;
}

// 动画的持续时间
// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 1.0;
}

// This method can only be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    [super animateTransition:transitionContext];
}

- (void)animationPresent {
    //// 类似只有一半屏幕大小的toView的情况
    
    /*
    // 解决toView只有一半屏幕的时候, 不明白为何会有另一半的黑屏的问题.
    UIView *tmpFromView;
    tmpFromView = [[UIScreen mainScreen] snapshotViewAfterScreenUpdates:YES];
    
    tmpFromView.frame = self.fromView.frame;
    [self.containerView addSubview:tmpFromView];
    
    // fromView的另一半, 点击执行dismiss操作.
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionTapToDismiss:)];
    tmpFromView.userInteractionEnabled = YES;
    [tmpFromView addGestureRecognizer:tapGesture];
    */
    
    //// 类似只有一半屏幕大小的toView的情况
    
    
    
    // fromView的起始frame
    self.fromView.frame = [self.transitionContext initialFrameForViewController:self.from];
    
    
    // 设置toView在转场开始时的位置和alpha.
    self.toView.frame = [self.transitionContext initialFrameForViewController:self.to]; // 全为0, 则toView从左上角扩散出来
//    toView.frame = CGRectMake(CGRectGetMinX(fromView.frame),
//                              CGRectGetHeight(fromView.frame),
////                              CGRectGetMaxY(fromView.frame) / 2, // 从中间往上弹出来
////                              CGRectGetMinY(fromView.frame), // 在fromView之上渐变出现
//                              CGRectGetWidth(fromView.frame),
//                              CGRectGetHeight(fromView.frame));
    self.toView.alpha = 0.0f;
    
    // containerView为transitionContext所包含的, 所有的动画都在该view中进行.
    [self.containerView addSubview:self.toView];

    NSTimeInterval duration = [self transitionDuration:self.transitionContext];
    typeof (&*self) __weak weakSelf = self;
    
    // 最后就是UIView动画的过程了, 动画的过程可以任意实现.
//    [UIView animateWithDuration:duration animations:^{
//        weakSelf.toView.frame = [transitionContext finalFrameForViewController:weakSelf.to];
//        weakSelf.toView.alpha = 1.0f;
//    } completion:^(BOOL finished) {
//        BOOL wasCancelled = [transitionContext transitionWasCancelled];
//        [transitionContext completeTransition:!wasCancelled];
//    }];
    
    self.toView.transform = CGAffineTransformMakeScale(0.001, 0.001);
    
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
//        weakSelf.toView.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(weakSelf.toView.frame) / 2);
        
        /*
        tmpFromView.transform = CGAffineTransformMakeScale(0.9, 0.9);
        */
        
        weakSelf.toView.transform = CGAffineTransformIdentity;
        
        // 指定位置
        weakSelf.toView.frame = [weakSelf.transitionContext finalFrameForViewController:weakSelf.to];
//        // toView只有一半屏幕的时候, 不明白为何会有另一半的黑屏
//        weakSelf.toView.frame = CGRectMake(CGRectGetMinX(weakSelf.fromView.frame),
//                                           CGRectGetHeight(weakSelf.fromView.frame) / 2,
//                                           CGRectGetWidth(weakSelf.fromView.frame),
//                                           CGRectGetHeight(weakSelf.fromView.frame) / 2);
        weakSelf.toView.alpha = 1.0f;
    } completion:^(BOOL finished) {
        BOOL wasCancelled = [weakSelf.transitionContext transitionWasCancelled];
        [weakSelf.transitionContext completeTransition:!wasCancelled];
    }];
    
}

- (void)animationDismiss {
    self.toView.frame = [self.transitionContext finalFrameForViewController:self.to];
    [self.containerView insertSubview:self.toView belowSubview:self.fromView];
    
    
    NSTimeInterval duration = [self transitionDuration:self.transitionContext];
    typeof (&*self) __weak weakSelf = self;
    
    [UIView animateWithDuration:duration animations:^{
        weakSelf.fromView.transform = CGAffineTransformMakeScale(0.001, 0.001);
        weakSelf.fromView.frame = CGRectZero;
        weakSelf.fromView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        BOOL wasCancelled = [weakSelf.transitionContext transitionWasCancelled];
        [weakSelf.transitionContext completeTransition:!wasCancelled];
    }];
}

// @optional
// This is a convenience and if implemented will be invoked by the system when the transition context's completeTransition: method is invoked.
- (void)animationEnded:(BOOL) transitionCompleted {
    NSLog(@"%s", __func__);
}


- (void)actionTapToDismiss:(UITapGestureRecognizer *)sender {
    [self.to dismissViewControllerAnimated:YES completion:nil];
}

@end
