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

@interface SignUpViewController () <UITextFieldDelegate, UIPageViewControllerDataSource> {
    
    LoginRegViewController          *loginRegistrationViewController;
    UserInfoRegViewController       *userInfoRegistrationViewController;
    BluetoothConnectViewController  *bluetoothConnectViewController;
    
    float currentPageSizeWidth;
    int currentPage;
}
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *buttonCreateAccount;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addLoginBackgroundImage];
    [self createScrollViewAndPageControl];
    [self createScrollViewStack];
    [self createAccountButton];
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


#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

- (void)viewDidLayoutSubviews {
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 3, self.scrollView.frame.size.height);
    
    loginRegistrationViewController.view.frame = CGRectMake(0, CGRectGetMinY(self.scrollView.bounds), self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
    [self.scrollView addSubview: loginRegistrationViewController.view];
    
    userInfoRegistrationViewController.view.frame = CGRectMake(CGRectGetMaxX(self.scrollView.bounds), CGRectGetMinY(self.scrollView.bounds), self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
    [self.scrollView addSubview:userInfoRegistrationViewController.view];
    
    bluetoothConnectViewController.view.frame = CGRectMake(CGRectGetMaxX(self.scrollView.bounds) * 2, CGRectGetMinY(self.scrollView.bounds), self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
    [self.scrollView addSubview:bluetoothConnectViewController.view];
}

- (void)createAccountButton {
    
    self.buttonCreateAccount.layer.cornerRadius = 13;
    self.buttonCreateAccount.backgroundColor = [UIColor lightGrayColor];
    self.buttonCreateAccount.tintColor = [[HelperManager sharedServer] colorwithHexString:@"#ffffff" alpha:1.0];
    [self.buttonCreateAccount setTitle:@"Create Account" forState:UIControlStateNormal];
}

- (void)createScrollViewAndPageControl {
    
    currentPage = 0;
    currentPageSizeWidth = 0;
    [self.pageControl setPageIndicatorTintColor:[[HelperManager sharedServer] colorwithHexString:@"#6a818f" alpha:1.0]];
    [self.pageControl setCurrentPageIndicatorTintColor:[[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0]];
    self.pageControl.numberOfPages = 3;
    self.pageControl.currentPage = 0;
    self.pageControl.userInteractionEnabled = NO;
    
    self.scrollView.layer.cornerRadius = 13;
    self.scrollView.delaysContentTouches = NO;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height) animated:NO];
    self.scrollView.backgroundColor = [UIColor lightGrayColor];
}

- (void)createScrollViewStack {
    
    loginRegistrationViewController = [self.storyboard instantiateViewControllerWithIdentifier:kLoginRegViewControllerID];
    userInfoRegistrationViewController = [self.storyboard instantiateViewControllerWithIdentifier:kUserInfoRegViewControllerID];
    bluetoothConnectViewController = [self.storyboard instantiateViewControllerWithIdentifier:kBluetoothConnectViewControllerID];
}

- (IBAction)changeView:(id)sender {
    currentPageSizeWidth += CGRectGetMaxX(self.scrollView.frame);
    currentPage += pluseOnePage;
    [self changeTutorialScreenWithButton];
}

- (IBAction)dismissViewControllerAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)changeTutorialScreenWithButton {
    if(currentPage < 3) {
        [self.scrollView scrollRectToVisible:CGRectMake(currentPageSizeWidth , 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height) animated: YES];
        [self.pageControl setCurrentPage:currentPage];
        [self changeButtonWithAnimatiion];
    }
}

- (void)changeButtonWithAnimatiion {
    __weak __typeof(self) weakSelf = self;
    switch (currentPage) {
        case 1:
        {
            [UIView animateWithDuration:0 animations:^{
                weakSelf.buttonCreateAccount.enabled = NO;
                [weakSelf.buttonCreateAccount setTitle:@"Next" forState:UIControlStateNormal];
                weakSelf.buttonCreateAccount.enabled = YES;
            } completion:nil];
            break;
        }
        case 2:
        {
            [UIView animateWithDuration:0 animations:^{
                weakSelf.buttonCreateAccount.enabled = NO;
                [weakSelf.buttonCreateAccount setBackgroundColor: [[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha: 1.0]];
                [weakSelf.buttonCreateAccount setTitle:@"Search Thin Ice" forState:UIControlStateNormal];
                weakSelf.buttonCreateAccount.enabled = YES;
            } completion:nil];
            break;
        }
        default:
            break;
    }
}

@end
