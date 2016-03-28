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

#define weekStatistics                           @"weekStat"
#define twoWeeksStatistics                       @"twoWeekStat"
#define monthStatistics                          @"monthStat"
#define allTimeStatistics                        @"allTimeStat"

#define week                                     7
#define twoWeeks                                14
#define month                                   31


@interface StatisticsViewController () <CarbonTabSwipeDelegate> {
    NSArray                                     *items;
    
    CarbonTabSwipeNavigation                    *tabSwipe;
    
    StatisticsContentViewController             *segmentWeek;
    StatisticsContentViewController             *segmentTwoWeeks;
    StatisticsContentViewController             *segmentMonth;
    StatisticsContentViewController             *segmentAllTime;
    
    NSMutableDictionary                         *blockStatistics;
}

@end

@implementation StatisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addStatisticsBackgroundImage];
    [self addRightBarButtonWithTitle:@"Clear" normalColorHexName:ColorFromSeparators highlightedColor:ColorForHighlightedButton selector:@selector(clearStatistics)];
    [self createStatisticsViewController];
    
    [[AccountInfoManager sharedManager].userAchievements addValueToAchievement: TheTracker Progress:[NSNumber numberWithInt:1]];
    [[AccountInfoManager sharedManager].userAchievements addValueToAchievement: ResultsOriented Progress:[NSNumber numberWithInt:1]];
    [[AccountInfoManager sharedManager].userAchievements addValueToAchievement: ResultsObsessed Progress:[NSNumber numberWithInt:1]];
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
    
    [self createStatisticsData];
}

- (void)clearStatistics {

    NSLog(@"CLear All Statistics");
}

# pragma mark - Carbon Tab Swipe Delegate
// required
- (UIViewController *)tabSwipeNavigation:(CarbonTabSwipeNavigation *)tabSwipe viewControllerAtIndex:(NSUInteger)index {
    
    switch (index) {
        case 0:
        {
            segmentWeek = [self.storyboard instantiateViewControllerWithIdentifier:kStatisticsContentViewControllerID];
            segmentWeek.dataStatisticArray = [blockStatistics objectForKey: weekStatistics];
            return segmentWeek;
        }
        case 1:
        {
            segmentTwoWeeks = [self.storyboard instantiateViewControllerWithIdentifier:kStatisticsContentViewControllerID];
            segmentWeek.dataStatisticArray = [blockStatistics objectForKey: twoWeeksStatistics];
            return segmentTwoWeeks;
        }
        case 2:
        {
            segmentMonth = [self.storyboard instantiateViewControllerWithIdentifier:kStatisticsContentViewControllerID];
            segmentWeek.dataStatisticArray = [blockStatistics objectForKey: monthStatistics];
            return segmentMonth;
        }
        case 3:
        {
            segmentAllTime = [self.storyboard instantiateViewControllerWithIdentifier:kStatisticsContentViewControllerID];
            segmentWeek.dataStatisticArray = [blockStatistics objectForKey: allTimeStatistics];
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

- (void)createStatisticsData {
    
    NSMutableArray *weekStat        = [[NSMutableArray alloc] init];
    NSMutableArray *twoWeeksStat    = [[NSMutableArray alloc] init];
    NSMutableArray *monthStat       = [[NSMutableArray alloc] init];
    NSMutableArray *allTimeStat     = [[NSMutableArray alloc] init];
    
    for (UserSession *session in [AccountInfoManager sharedManager].userToken.userStatistics.userSessions) {
        
        if(session.dateOfSessions >= [[NSDate date] dateByAddingTimeInterval:-week*60*60*24]) {
            [weekStat addObject:session];
        }
        if(session.dateOfSessions >= [[NSDate date] dateByAddingTimeInterval:-twoWeeks*60*60*24]) {
            [twoWeeksStat addObject:session];
        }
        if(session.dateOfSessions >= [[NSDate date] dateByAddingTimeInterval:-month*60*60*24]) {
            [monthStat addObject:session];
        }
        [allTimeStat addObject:session];
    }
    
    [blockStatistics setObject:weekStat forKey:weekStatistics];
    [blockStatistics setObject:twoWeeksStat forKey:twoWeeksStatistics];
    [blockStatistics setObject:monthStat forKey:monthStatistics];
    [blockStatistics setObject:allTimeStat forKey:allTimeStatistics];
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    
    return YES;
}

@end
