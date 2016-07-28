//
//  DemoCATransitionViewController.m
//  DemoTransitions
//
//  Created by Chris Hu on 16/7/15.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "DemoCATransitionViewController.h"
#import "DemoCATransitionPresentedViewController.h"
#import "DemoCATransitionPushedViewController.h"

@interface DemoCATransitionViewController ()

@end

@implementation DemoCATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"0"]];
    
    [self addBtns];
}

- (void)addBtns{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 100, self.view.frame.size.width, 50)];
    [btn setTitle:@"Demo" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(actionButton:) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.borderColor = [UIColor redColor].CGColor;
    btn.layer.borderWidth = 2.0f;
    [self.view addSubview:btn];
}

- (void)actionButton:(UIButton *)sender {
    CATransition *animation = [CATransition animation];
    animation.duration = 0.5;
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    /* 过渡效果
     fade           //交叉淡化过渡(不支持过渡方向)
     push           //新视图把旧视图推出去
     moveIn         //新视图移到旧视图上面
     reveal         //将旧视图移开,显示下面的新视图
     cube           //立方体翻滚效果
     oglFlip        //上下左右翻转效果
     suckEffect     //收缩效果，如一块布被抽走(不支持过渡方向)
     rippleEffect   //滴水效果(不支持过渡方向)
     pageCurl       //向上翻页效果
     pageUnCurl     //向下翻页效果
     cameraIrisHollowOpen  //相机镜头打开效果(不支持过渡方向)
     cameraIrisHollowClose //相机镜头关上效果(不支持过渡方向)
     */
    
    switch (_demoType) {
        // 常见四种
        case DemoCATransitionTypeFade:
            animation.type = kCATransitionFade;
            break;
        case DemoCATransitionTypePush:
            animation.type = kCATransitionPush;
            animation.subtype = kCATransitionFromRight;
            break;
        case DemoCATransitionTypeMoveIn:
            animation.type = kCATransitionMoveIn;
            animation.subtype = kCATransitionFromRight;
            break;
        case DemoCATransitionTypeReveal:
            animation.type = kCATransitionReveal;
            animation.subtype = kCATransitionFromRight;
            break;
        
            
        case DemoCATransitionTypeCube:
        {
            animation.type = @"cube";
            animation.subtype = kCATransitionFromRight;
            
//            [self.view.window.layer addAnimation:animation forKey:@"kTransitionAnimation"];
            [self.navigationController.view.layer addAnimation:animation forKey:@"kTransitionAnimation"];
            
            DemoCATransitionPushedViewController *pushedVC = [[DemoCATransitionPushedViewController alloc] init];
            [self.navigationController pushViewController:pushedVC animated:NO];
            
            return;
        }
        case DemoCATransitionTypeOglFlip:
            animation.type = kCATransitionReveal;
            animation.subtype = kCATransitionFromRight;
            break;
        case DemoCATransitionTypeSuckEffect:
            animation.type = @"suckEffect";
            break;
        case DemoCATransitionTypeRippleEffect:
            animation.type = @"rippleEffect";
            break;
        case DemoCATransitionTypePageCurl:
            animation.type = @"pageCurl";
            animation.subtype = kCATransitionFromRight;
            break;
        case DemoCATransitionTypePageUnCurl:
            animation.type = @"pageUnCurl";
            animation.subtype = kCATransitionFromRight;
            break;
        case DemoCATransitionTypeCameraIrisHollowOpen:
            animation.type = @"cameraIrisHollowOpen";
            break;
        case DemoCATransitionTypeCameraIrisHollowClose:
            animation.type = @"cameraIrisHollowClose";
            break;
        default:
            break;
    }

    // 在当前view上执行CATransition动画
    // [self.view.layer addAnimation:animation forKey:@"animation"];
    
    // 在window上执行CATransition, 即可在ViewController转场时执行动画。
    [self.view.window.layer addAnimation:animation forKey:@"kTransitionAnimation"];
    
    
    DemoCATransitionPresentedViewController *presentedVC = [[DemoCATransitionPresentedViewController alloc] init];
    [self presentViewController:presentedVC animated:NO completion:nil];
}

@end
