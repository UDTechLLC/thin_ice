//
//  BaseViewController.m
//  Point
//
//  Created by Dima Shapovalov on 30.09.15.
//  Copyright (c) 2015 Dima Shapovalov. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"
#import "SlideMenuTableCell.h"

@interface LeftMenuViewController ()


@end

@implementation LeftMenuViewController

#pragma mark - UIViewController Methods -

- (id)initWithCoder:(NSCoder *)aDecoder {
    
	self.slideOutAnimationEnabled = YES;
	return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad {
    
	[super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.leftMenuTableView deselectRowAtIndexPath:[self.leftMenuTableView indexPathForSelectedRow] animated:YES];
    [self.leftMenuTableView reloadData];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super viewWillDisappear:animated];
}

- (void)viewDidLayoutSubviews {
    [self createLeftSwipeTableView];
}

- (void)createLeftSwipeTableView {
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:SlideMenuBackgroundImage]];
    self.leftMenuTableView.backgroundColor = [UIColor clearColor];
    self.leftMenuTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

#pragma mark - UITableView Delegate & Datasrouce -

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ([UIScreen mainScreen].bounds.size.height - 20) / numberOfSlideMenuCells;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return numberOfSlideMenuCells;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SlideMenuTableCell *cell = nil;
    
    switch (indexPath.row)
    {
        case 0:
            cell = (SlideMenuTableCell*)[tableView dequeueReusableCellWithIdentifier:kDashboardCellID];
            [cell loadCellViewWithCellImage:[UIImage imageNamed:kIcons_dashboardImage] andCellName:@"Dashboard"];
            break;
        case 1:
            cell = (SlideMenuTableCell*)[tableView dequeueReusableCellWithIdentifier:kStatisticCellID];
            [cell loadCellViewWithCellImage:[UIImage imageNamed:kIcons_statisticImage] andCellName:@"Statistic"];
            break;
        case 2:
            cell = (SlideMenuTableCell*)[tableView dequeueReusableCellWithIdentifier:kThinIceControllCellID];
            [cell loadCellViewWithCellImage:[UIImage imageNamed:kIcons_thinIceControlImage] andCellName:@"Thin Ice Control"];
            break;
        case 3:
            cell = (SlideMenuTableCell*)[tableView dequeueReusableCellWithIdentifier:kAccountCellID];
            [cell loadCellViewWithCellImage:[UIImage imageNamed:kIcons_accountImage] andCellName:@"Account"];
            break;
        case 4:
            cell = (SlideMenuTableCell*)[tableView dequeueReusableCellWithIdentifier:kAchievementsCellID];
            [cell loadCellViewWithCellImage:[UIImage imageNamed:kIcons_achievementsImage] andCellName:@"Achievements"];
            break;
        case 5:
            cell = (SlideMenuTableCell*)[tableView dequeueReusableCellWithIdentifier:kSettingsCellID];
            [cell loadCellViewWithCellImage:[UIImage imageNamed:kIcon_SettingsImage] andCellName:@"Settings"];
            break;
        default:
            return nil;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UIViewController *vc;	
	switch (indexPath.row)
	{
        case 0:
        {
            
            break;
        }
		case 1:
        {
            
            break;
        }
		case 2:
        {
            
            break;
        }
        default:
        {
//            [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
//            [[SlideNavigationController sharedInstance] popToRootViewControllerAnimated:YES];
//            return;
            break;
        }
	}
	
//	[[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
//															 withSlideOutAnimation:self.slideOutAnimationEnabled
//																	 andCompletion:nil];
//    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (void)checkViewControllerInNavStack:(UIViewController*)vc {
    [self.navigationController setViewControllers:[NSArray arrayWithObject:vc] animated:YES];
}

@end
