//
//  StatisticsViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 02.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "StatisticsViewController.h"
#import "StatisticsContentViewController.h"
#import "CarbonKit.h"

@interface StatisticsViewController () <CarbonTabSwipeDelegate> {
    NSArray                                     *items;
    
    CarbonTabSwipeNavigation                    *tabSwipe;
    
    StatisticsContentViewController             *segmentWeek;
    StatisticsContentViewController             *segmentTwoWeeks;
    StatisticsContentViewController             *segmentMonth;
    StatisticsContentViewController             *segmentAllTime;
}

@end

@implementation StatisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addStatisticsBackgroundImage];
    [self addRightBarButtonWithTitle:@"Clear" normalColorHexName:ColorFromSeparators highlightedColor:ColorForHighlightedButton selector:@selector(clearStatistics)];
    [self createStatisticsViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    [self addNavigationBarAttributeTitle: @"Statistics"];
    self.navigationController.navigationBarHidden = NO;
    [self translucentNavigationBar: YES];
    [super viewWillAppear:YES];
}

- (void)createStatisticsViewController {
    
    [self createCarbonTabSwipe];
}

- (void)createCarbonTabSwipe {
    items = @[@"Week", @"Two Weeks", @"Month", @"All Time"];
    tabSwipe = [[CarbonTabSwipeNavigation alloc] createWithRootViewController:self tabNames:items tintColor:[UIColor clearColor] delegate:self isBuyerEnable:NO];
    [tabSwipe setTranslucent:YES];
    [tabSwipe setIndicatorHeight:3.f];
    [tabSwipe setSelectedColor:[[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0] font:[UIFont boldSystemFontOfSize:17]];
    [tabSwipe setNormalColor:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0] font:[UIFont boldSystemFontOfSize:17]];
}

- (void)clearStatistics {

    NSLog(@"clear Statistics");
}

# pragma mark - Carbon Tab Swipe Delegate
// required
- (UIViewController *)tabSwipeNavigation:(CarbonTabSwipeNavigation *)tabSwipe viewControllerAtIndex:(NSUInteger)index {
    
    switch (index) {
        case 0:
        {
            segmentWeek = [self.storyboard instantiateViewControllerWithIdentifier:kStatisticsContentViewControllerID];
            return segmentWeek;
        }
        case 1:
        {
            segmentTwoWeeks = [self.storyboard instantiateViewControllerWithIdentifier:kStatisticsContentViewControllerID];
            return segmentTwoWeeks;
        }
        case 2:
        {
            segmentMonth = [self.storyboard instantiateViewControllerWithIdentifier:kStatisticsContentViewControllerID];
            return segmentMonth;
        }
        case 3:
        {
            segmentAllTime = [self.storyboard instantiateViewControllerWithIdentifier:kStatisticsContentViewControllerID];
            return segmentAllTime;
        }
        default:
            return [self.storyboard instantiateViewControllerWithIdentifier:kStatisticsContentViewControllerID];
    }
}

// optional
- (void)tabSwipeNavigation:(CarbonTabSwipeNavigation *)tabSwipe didMoveAtIndex:(NSInteger)index {
    NSLog(@"Current tab: %d", (int)index);
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    
    return YES;
}

@end
