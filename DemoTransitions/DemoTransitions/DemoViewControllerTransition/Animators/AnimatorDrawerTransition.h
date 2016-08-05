//
//  AnimatorDrawerTransition.h
//  DemoTransitions
//
//  Created by Chris Hu on 16/8/4.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "AnimatorBaseTransition.h"

@protocol AnimatorDrawerTransitionDelegate <NSObject>

- (void)AnimatorDrawerTransitionDismissViaTapGesture;

@end

@interface AnimatorDrawerTransition : AnimatorBaseTransition

@property (nonatomic, weak) id<AnimatorDrawerTransitionDelegate> delegate;

@property (nonatomic, assign) CGFloat offset;

@end
