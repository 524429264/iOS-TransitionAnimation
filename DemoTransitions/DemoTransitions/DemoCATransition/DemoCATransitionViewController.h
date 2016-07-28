//
//  DemoCATransitionViewController.h
//  DemoTransitions
//
//  Created by Chris Hu on 16/7/15.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import <UIKit/UIKit.h>

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

typedef NS_ENUM(NSInteger, DemoCATransitionType) {
    DemoCATransitionTypeFade = 0,
    DemoCATransitionTypePush,
    DemoCATransitionTypeMoveIn,
    DemoCATransitionTypeReveal,
    DemoCATransitionTypeCube,
    DemoCATransitionTypeOglFlip,
    DemoCATransitionTypeSuckEffect,
    DemoCATransitionTypeRippleEffect,
    DemoCATransitionTypePageCurl,
    DemoCATransitionTypePageUnCurl,
    DemoCATransitionTypeCameraIrisHollowOpen,
    DemoCATransitionTypeCameraIrisHollowClose,
};

@interface DemoCATransitionViewController : UIViewController

@property (nonatomic, assign) DemoCATransitionType demoType;

@end
