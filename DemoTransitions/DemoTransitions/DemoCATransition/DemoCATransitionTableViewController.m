//
//  DemoCATransitionTableViewController.m
//  DemoTransitions
//
//  Created by Chris Hu on 16/7/15.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "DemoCATransitionTableViewController.h"
#import "DemoCATransitionViewController.h"

#define CellReuseIdentifier @"CellReuseIdentifier"

@interface DemoCATransitionTableViewController ()

@end

@implementation DemoCATransitionTableViewController {

    NSArray *_demos;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addBtns];
    
    self.navigationItem.title = @"DemoCATransition";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellReuseIdentifier];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    _demos = @[
               // 常见四种
               @"Fade",
               @"Push",
               @"MoveIn",
               @"Reveal",
               
               @"Cube",
               @"Flip",
               @"SuckEffect",
               @"RippleEffect",
               @"PageCurl",
               @"PageUnCurl",
               @"CameraIrilHollowOpen",
               @"CameraIrisHollowClose",
               ];
}

- (void)addBtns{
    UIBarButtonItem *btnLeft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(actionBack:)];
    self.navigationItem.leftBarButtonItem = btnLeft;
}

- (void)actionBack:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _demos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = _demos[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DemoCATransitionViewController *demoVC = [[DemoCATransitionViewController alloc] init];
    demoVC.demoType = indexPath.row;
    demoVC.navigationItem.title = _demos[indexPath.row];
    [self.navigationController pushViewController:demoVC animated:YES];
}

@end
