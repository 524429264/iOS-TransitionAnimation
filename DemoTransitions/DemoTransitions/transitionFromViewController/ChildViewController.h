//
//  ChildViewController.h
//  DemoTransitions
//
//  Created by Chris Hu on 16/7/15.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CSViewControllerTransitionDelegate <NSObject>

- (void)reAddChildViewControllers;

@end


@interface ChildViewController : UIViewController

@property (nonatomic, weak) id<CSViewControllerTransitionDelegate> csTransitionDelegate;


- (void)actionBack:(UIButton *)sender;

@end
