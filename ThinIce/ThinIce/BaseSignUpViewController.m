//
//  BaseSignUpViewController.m
//  ThinIce
//
//  Created by Dmitry on 25.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "BaseSignUpViewController.h"

@interface BaseSignUpViewController ()

@end

@implementation BaseSignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    [super viewWillAppear:animated];
}

- (void)backButtonWasPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)backButtonActions:(id)sender {
    [self backButtonWasPressed];
}

- (void)addLoginBackgroundImage {
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:[NSString stringWithFormat:@"Thin_ice_background_%d", (int)kScreenWidth]]];
}

- (void)addDashboardBackgroundImage {
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:[NSString stringWithFormat:@"thin_ice_dashboard_background_%d", (int)kScreenWidth]]];
}

- (void)translucentNavigationBar:(BOOL)select {
    if(select) {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.shadowImage = [UIImage new];
        self.navigationController.navigationBar.translucent = YES;
    } else {
        [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.shadowImage = nil;
        self.navigationController.navigationBar.translucent = YES;
    }
}

- (void)addStatusBarBlueView {
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    statusBarView.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#222e3b" alpha:1.0];
    [self.view addSubview:statusBarView];
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
