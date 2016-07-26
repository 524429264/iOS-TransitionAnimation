//
//  ViewCATransition_Fade.m
//  DemoTransitions
//
//  Created by Chris Hu on 16/7/15.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "ViewCATransition_Fade.h"

@implementation ViewCATransition_Fade

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self transition];
    }
    return self;
}

- (void)transition {
    CATransition *animation = [CATransition animation];
    animation.duration = 5.0;
    animation.type = kCATransitionFade;
    
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    [self.layer addAnimation:animation forKey:@"animation"];
}

@end
