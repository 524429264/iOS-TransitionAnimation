# iOS-TransitionAnimation
Transition animation for iOS.

## transitionFromViewController
```
AViewController *a = self.childViewControllers[0];
BViewController *b = self.childViewControllers[1];
CViewController *c = self.childViewControllers[2];

// Curl 翻页效果
// UIViewAnimationOptionTransitionCurlUp, UIViewAnimationOptionTransitionCurlDown
// Flip 翻转效果
// UIViewAnimationOptionTransitionFlipFromLeft, UIViewAnimationOptionTransitionFlipFromRight
// UIViewAnimationOptionTransitionFlipFromTop, UIViewAnimationOptionTransitionFlipFromDown

[self transitionFromViewController:_currentViewController
                  toViewController:b
                          duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight
                        animations:^{
    btn1.transform = CGAffineTransformMakeScale(2.0, 2.0);
} completion:^(BOOL finished) {
    btn1.transform = CGAffineTransformMakeScale(1.0, 1.0);
}];
```

### NewsNavigationBar


## CATransition
### Demo
Fade，Cube，Ripple，PageCurl，CameraIrilHollow，


## Transition

### UIViewControllerTransitioningDelegate
```
presentedVC.transitionDelegate = self;

```
该协议包含的方法：
```
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source;

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed;
```
两个方法都返回的是继承UIViewControllerAnimatedTransitioning协议的对象，其中即为转场动画的细节实现。

### UIViewControllerAnimatedTransitioning
该协议包含的方法：
```
//       prenent       
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source;
//       pop       
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed;
//       prenent       
- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator;
//       pop       
- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator;
```

```
// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext;

// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext;


@optional

// This is a convenience and if implemented will be invoked by the system when the transition context's completeTransition: method is invoked.
- (void)animationEnded:(BOOL) transitionCompleted;
```

- 转场动画时间
- 转场动画细节实现
几个关键变量：
```
_transitionContext = transitionContext;

_containerView = [transitionContext containerView];

_from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
_to = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

// iOS8之后才有
if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
    _fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    _toView = [transitionContext viewForKey:UITransitionContextToViewKey];
} else {
    _fromView = _from.view;
    _toView = _to.view;
}
```

- 动画结束回调方法

### Demo
present/dismiss, presentHalf, Bubble, Drawer，push/pop

### UINavigationControllerDelegate
push/pop
```
//              
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC;
//            
- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
animationController;
interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>)
```


```
#pragma mark - <UINavigationControllerDelegate>

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    // Push/Pop
    AnimatorPushPopTransition *pushPopTransition = [[AnimatorPushPopTransition alloc] init];

    if (operation == UINavigationControllerOperationPush) {
        pushPopTransition.animatorTransitionType = kAnimatorTransitionTypePush;
    } else {
        pushPopTransition.animatorTransitionType = kAnimatorTransitionTypePop;
    }


    NSArray *indexPaths = [_collectionView indexPathsForSelectedItems];
    if (indexPaths.count == 0) {
        return nil;
    }

    NSIndexPath *selectedIndexPath = indexPaths[0];
    UICollectionViewCell *cell = [_collectionView cellForItemAtIndexPath:selectedIndexPath];

    // 一定要加上convertPoint:toView:操作
    pushPopTransition.itemCenter = [_collectionView convertPoint:cell.center toView:self.view];
    pushPopTransition.itemSize = cell.frame.size;
    pushPopTransition.imageName = [NSString stringWithFormat:@"%ld", (long)selectedIndexPath.item];

    return pushPopTransition;
}
```

### UITabBarController

```
//              
- (id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
            animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                              toViewController:(UIViewController *)toVC;
//            
- (id <UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController
                      interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>)animationController;
```

# 交互式
交互式主要用于手势控制。

## UIViewControllerInteractiveTransitioning
## UIViewControllerContextTransitioning
