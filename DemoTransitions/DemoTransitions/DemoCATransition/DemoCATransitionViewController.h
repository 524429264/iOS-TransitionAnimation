//
//  DemoCATransitionViewController.h
//  DemoTransitions
//
//  Created by Chris Hu on 16/7/15.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DemoCATransitionType) {
    DemoCATransitionTypeFade = 0,

};

@interface DemoCATransitionViewController : UIViewController

@property (nonatomic, assign) DemoCATransitionType demoType;

@end
