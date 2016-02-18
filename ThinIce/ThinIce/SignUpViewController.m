//
//  SignUpViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 18.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "SignUpViewController.h"
#import "BluetoothConnectViewController.h"
#import "UserInfoRegViewController.h"
#import "LoginRegViewController.h"

@interface SignUpViewController () <UITextFieldDelegate, UIScrollViewDelegate> {
    
    LoginRegViewController          *loginRegistrationViewController;
    UserInfoRegViewController       *userInfoRegistrationViewController;
    BluetoothConnectViewController  *bluetoothConnectViewController;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createScrollView];
    [self createScrollViewStack];
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
}

- (void)createCustomNavBar {
    
    
}

- (void)createScrollView {
    
    self.scrollView.layer.cornerRadius = 13;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 3, self.scrollView.frame.size.height);
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height) animated:NO];
}

- (void)createScrollViewStack {
    
    loginRegistrationViewController = [self.storyboard instantiateViewControllerWithIdentifier:kLoginRegViewController];
    loginRegistrationViewController.view.frame = CGRectMake(0, CGRectGetMinY(self.scrollView.bounds), self.view.bounds.size.width, self.scrollView.bounds.size.height);
    [self.scrollView addSubview:loginRegistrationViewController.view];
    
    userInfoRegistrationViewController = [self.storyboard instantiateViewControllerWithIdentifier:kUserInfoRegViewController];
    userInfoRegistrationViewController.view.frame = CGRectMake(self.view.bounds.size.width, CGRectGetMinY(self.scrollView.bounds), self.view.bounds.size.width, self.scrollView.bounds.size.height);
    [self.scrollView addSubview:userInfoRegistrationViewController.view];
    
    bluetoothConnectViewController = [self.storyboard instantiateViewControllerWithIdentifier:kBluetoothConnectViewController];
    bluetoothConnectViewController.view.frame = CGRectMake(self.view.bounds.size.width * 2, CGRectGetMinY(self.scrollView.bounds), self.view.bounds.size.width, self.scrollView.bounds.size.height);
    [self.scrollView addSubview:bluetoothConnectViewController.view];
}

@end
