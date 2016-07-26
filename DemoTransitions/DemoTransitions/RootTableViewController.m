//
//  RootTableViewController.m
//  DemoTransitions
//
//  Created by Chris Hu on 16/7/26.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "RootTableViewController.h"

#import "DemoViewController.h"
#import "DemoCATransitionTableViewController.h"
#import "DemoViewControllerTransitionTableViewController.h"


#define RootTableViewCell @"RootTableViewCell"

@interface RootTableViewController ()

@end

@implementation RootTableViewController {

    NSArray *_demos;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"TransitionAnimation";
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:RootTableViewCell];
    
    _demos = @[
               @"transitionFromViewController",
               @"CATransition",
               @"ViewControllerTransition",
               ];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RootTableViewCell forIndexPath:indexPath];
    
    cell.textLabel.text = _demos[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            DemoViewController *vc = [[DemoViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1:
        {
            DemoCATransitionTableViewController *vc = [[DemoCATransitionTableViewController alloc] init];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
            [self presentViewController:nav animated:YES completion:nil];
            break;
        }
        case 2:
        {
            DemoViewControllerTransitionTableViewController *vc = [[DemoViewControllerTransitionTableViewController alloc] init];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
            [self presentViewController:nav animated:YES completion:nil];
            break;
        }
        default:
            break;
    }

}

@end
