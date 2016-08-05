//
//  CollectionViewItemViewController.m
//  DemoTransitions
//
//  Created by Chris Hu on 16/7/19.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "CollectionViewItemViewController.h"

@interface CollectionViewItemViewController ()

@end

@implementation CollectionViewItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld", (long)_imageIndex]];
    [self.view addSubview:imageView];
    
    imageView.center = self.view.center;
}

@end
