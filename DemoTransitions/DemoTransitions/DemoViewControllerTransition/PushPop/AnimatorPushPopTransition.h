//
//  AnimatorPushPopTransition.h
//  DemoTransitions
//
//  Created by Chris Hu on 16/7/18.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "AnimatorBaseTransition.h"

@interface AnimatorPushPopTransition : AnimatorBaseTransition

@property (nonatomic, assign) CGSize itemSize;

@property (nonatomic, assign) CGPoint itemCenter;

@property (nonatomic, copy) NSString *imageName;

@end
