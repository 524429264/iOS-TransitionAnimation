//
//  DemoCATransitionViewController.m
//  DemoTransitions
//
//  Created by Chris Hu on 16/7/15.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "DemoCATransitionViewController.h"
#import "ViewCATransition_Fade.h"


@interface DemoCATransitionViewController ()

@end

@implementation DemoCATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self demo];
}

- (void)demo {
    switch (_demoType) {
        case DemoCATransitionTypeFade:
        {
            ViewCATransition_Fade *fade = [[ViewCATransition_Fade alloc] initWithFrame:self.view.frame];
            [self.view addSubview:fade];
        }
        break;
        default:
            break;
    }

}

@end
