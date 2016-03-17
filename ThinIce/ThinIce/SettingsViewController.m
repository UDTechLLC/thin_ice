//
//  SettingsViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 07.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "SettingsViewController.h"
#import "NotificationsViewController.h"
#import "MeasurementsViewController.h"
#import "CarbonKit.h"

@interface SettingsViewController () <CarbonTabSwipeDelegate> {
    NSArray                                                                 *items;
    
    CarbonTabSwipeNavigation                                                *tabSwipe;
    
    MeasurementsViewController                                              *segmentMeasurements;
    NotificationsViewController                                             *segmentNotifications;
}

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addSettingsBackgroundImage];
    [self addRightBarButtonWithImageName:[NSString stringWithFormat:@"btn_help_normal_%d", (int)kScreenWidth] highlightedImageName:[NSString stringWithFormat:@"btn_help_active_%d", (int)kScreenWidth] selector:@selector(infoView)];
    [self createViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [self addNavigationBarAttributeTitle: @"Settings"];
    self.navigationController.navigationBarHidden = NO;
    [self translucentNavigationBar: YES];
    [super viewWillAppear:YES];
}

- (void)viewDidLayoutSubviews {

}

- (void)createViewController {
    
    [self createCarbonTabSwipe];
    
}

- (void)createCarbonTabSwipe {

    items = @[@"Measurements", @"Notifications"];
    tabSwipe = [[CarbonTabSwipeNavigation alloc] createWithRootViewController:self tabNames:items tintColor:[UIColor clearColor] delegate:self isBuyerEnable:NO];
    [tabSwipe setTranslucent:YES];
    [tabSwipe setIndicatorHeight:3.f];
    [tabSwipe setSelectedColor:[[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0] font:[UIFont boldSystemFontOfSize:17]];
    [tabSwipe setNormalColor:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0] font:[UIFont boldSystemFontOfSize:17]];
}

# pragma mark - Carbon Tab Swipe Delegate
// required
- (UIViewController *)tabSwipeNavigation:(CarbonTabSwipeNavigation *)tabSwipe viewControllerAtIndex:(NSUInteger)index {
    
    switch (index) {
        case 0:
        {
            segmentMeasurements = [self.storyboard instantiateViewControllerWithIdentifier:kMeasurementsViewControllerID];
            return segmentMeasurements;
        }
        case 1:
        {
            segmentNotifications = [self.storyboard instantiateViewControllerWithIdentifier:kNotificationsViewControllerID];
            return segmentNotifications;
        }
        default:
            return [self.storyboard instantiateViewControllerWithIdentifier:kMeasurementsViewControllerID];
    }
}

// optional
- (void)tabSwipeNavigation:(CarbonTabSwipeNavigation *)tabSwipe didMoveAtIndex:(NSInteger)index {
    NSLog(@"Current tab: %d", (int)index);
}

- (void)infoView {
    NSLog(@"INFO TAB");
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    
    return YES;
}

@end
