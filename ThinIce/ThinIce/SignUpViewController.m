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
    
    int currentPage;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *buttonCreateAccount;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createAccountButton];
    [self createScrollViewAndPageControl];
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

- (void)viewDidLayoutSubviews {
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width * 3, self.scrollView.bounds.size.height);
    
    loginRegistrationViewController.view.frame = CGRectMake(0, CGRectGetMinY(self.scrollView.bounds), self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
    [self.scrollView addSubview: loginRegistrationViewController.view];
    
    userInfoRegistrationViewController.view.frame = CGRectMake(CGRectGetMaxX(self.scrollView.bounds), CGRectGetMinY(self.scrollView.bounds), self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
    [self.scrollView addSubview:userInfoRegistrationViewController.view];
    
    bluetoothConnectViewController.view.frame = CGRectMake(CGRectGetMaxX(self.scrollView.bounds) * 2, CGRectGetMinY(self.scrollView.bounds), self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
    [self.scrollView addSubview:bluetoothConnectViewController.view];
    
    [super viewDidLayoutSubviews];
}

- (void)createAccountButton {
    
    self.buttonCreateAccount.layer.cornerRadius = 13;
    self.buttonCreateAccount.backgroundColor = [UIColor lightGrayColor];
    self.buttonCreateAccount.tintColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    [self.buttonCreateAccount setTitle:@"Create Account" forState:UIControlStateNormal];
}

- (IBAction)changeView:(id)sender {
    currentPage += self.scrollView.frame.size.width;
    [self changeTutorialScreenWithButton];
}

- (void)createScrollViewAndPageControl {
    
    currentPage = 0;
    [self.pageControl setPageIndicatorTintColor:[[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0]];
    [self.pageControl setCurrentPageIndicatorTintColor:[[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0]];
    self.pageControl.numberOfPages = 3;
    self.pageControl.currentPage = 0;
    
    self.scrollView.layer.cornerRadius = 13;
    self.scrollView.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.scrollView.contentInset = UIEdgeInsetsZero;
    self.scrollView.scrollIndicatorInsets = UIEdgeInsetsZero;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height) animated:NO];
}

- (void)createScrollViewStack {
    
    loginRegistrationViewController = [self.storyboard instantiateViewControllerWithIdentifier:kLoginRegViewController];
    userInfoRegistrationViewController = [self.storyboard instantiateViewControllerWithIdentifier:kUserInfoRegViewController];
    bluetoothConnectViewController = [self.storyboard instantiateViewControllerWithIdentifier:kBluetoothConnectViewController];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.bounds.size.width;
    int page = scrollView.contentOffset.x / pageWidth;
    [self.pageControl setCurrentPage:page];
}

- (void)changeTutorialScreenWithButton {
    
    [self.scrollView scrollRectToVisible:CGRectMake(currentPage , 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height) animated:YES];
}

- (IBAction)dismissViewControllerAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
