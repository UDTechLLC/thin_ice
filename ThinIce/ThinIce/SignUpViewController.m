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
    
    int currentPage;
}

@property (strong, nonatomic) UIPageViewController  *pageViewController;
@property (weak, nonatomic) IBOutlet UIView         *pageViewControllerContainer;
@property (strong, nonatomic) NSArray               *pageViewControllerStack;
@property (weak, nonatomic) IBOutlet UIButton       *buttonCreateAccount;
@property (weak, nonatomic) IBOutlet UIPageControl  *pageControl;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addStatusBarBlueView];
    [self addLoginBackgroundImage];
    [self createPageControllerStack];
    [self createPageController];
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

- (void)viewDidLayoutSubviews {
    // Change the size of page view controller
    self.pageViewController.view.frame = self.pageViewControllerContainer.bounds;
}

- (void)createAccountButton {
    
    self.buttonCreateAccount.layer.cornerRadius = 13;
    self.buttonCreateAccount.backgroundColor = [UIColor lightGrayColor];
    self.buttonCreateAccount.tintColor = [[HelperManager sharedServer] colorwithHexString:@"#ffffff" alpha:1.0];
    [self.buttonCreateAccount setTitle:@"Create Account" forState:UIControlStateNormal];
}

- (void)createPageControllerStack {
    
    loginRegistrationViewController = [self.storyboard instantiateViewControllerWithIdentifier:kLoginRegViewControllerID];
    userInfoRegistrationViewController = [self.storyboard instantiateViewControllerWithIdentifier:kUserInfoRegViewControllerID];
    bluetoothConnectViewController = [self.storyboard instantiateViewControllerWithIdentifier:kBluetoothConnectViewControllerID];
    self.pageViewControllerStack = @[loginRegistrationViewController, userInfoRegistrationViewController, bluetoothConnectViewController];
}

- (void)createPageController {
    
    self.pageViewControllerContainer.layer.cornerRadius = 13;
    self.pageViewControllerContainer.backgroundColor = [UIColor clearColor];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:kPageViewControllerID];
    self.pageViewController.dataSource = self;
    
    self.pageViewController.view.layer.cornerRadius = 13;
    self.pageViewController.view.backgroundColor = [UIColor clearColor];
    
    id startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];

    for (UIScrollView *view in self.pageViewController.view.subviews) {
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            
            view.scrollEnabled = NO;
        }
    }
    
    [self addChildViewController:_pageViewController];
    [self.pageViewControllerContainer addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    currentPage = 0;
    self.pageControl.numberOfPages = 3;
}

- (IBAction)changeView:(id)sender {
    
    currentPage++;
    if(currentPage < self.pageViewControllerStack.count) {
        id startingViewController = [self viewControllerAtIndex: currentPage];
        NSArray *viewControllers = @[startingViewController];
        [self changeButtonTitleAndColorWithAnimation];
        [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    }
}

- (IBAction)dismissViewControllerAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index;
    
    if([viewController isKindOfClass:[LoginRegViewController class]]) {
        index = ((LoginRegViewController*)viewController).pageIndex;
    } else if ([viewController isKindOfClass:[UserInfoRegViewController class]]) {
        index = ((UserInfoRegViewController*)viewController).pageIndex;
    } else if ([viewController isKindOfClass:[BluetoothConnectViewController class]]) {
        index = ((BluetoothConnectViewController*)viewController).pageIndex;
    }

    [self.pageControl setCurrentPage:index];
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index;
    
    if([viewController isKindOfClass:[LoginRegViewController class]]) {
        index = ((LoginRegViewController*)viewController).pageIndex;
    } else if ([viewController isKindOfClass:[UserInfoRegViewController class]]) {
        index = ((UserInfoRegViewController*)viewController).pageIndex;
    } else if ([viewController isKindOfClass:[BluetoothConnectViewController class]]) {
        index = ((BluetoothConnectViewController*)viewController).pageIndex;
    }
    
    [self.pageControl setCurrentPage:index];
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageViewControllerStack count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (id)viewControllerAtIndex:(NSUInteger)index
{
    id pageContentViewController;
    
    if (([self.pageViewControllerStack count] == 0) || (index >= [self.pageViewControllerStack count])) {
        return nil;
    }

    // Create a new view controller and pass suitable data.
    switch (index) {
        case 0:
        {
            pageContentViewController = [self.pageViewControllerStack objectAtIndex: index];
            ((LoginRegViewController*)pageContentViewController).pageIndex = index;
            break;
        }
        case 1:
        {
            pageContentViewController = [self.pageViewControllerStack objectAtIndex: index];
            ((UserInfoRegViewController*)pageContentViewController).pageIndex = index;
            break;
        }
        case 2:
        {
            pageContentViewController = [self.pageViewControllerStack objectAtIndex: index];
            ((BluetoothConnectViewController*)pageContentViewController).pageIndex = index;
            break;
        }
        default:
            break;
    }

    return pageContentViewController;
}

- (void)changeButtonTitleAndColorWithAnimation {
    
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
