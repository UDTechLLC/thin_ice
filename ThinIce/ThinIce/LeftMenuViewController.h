//
//  BaseViewController.m
//  Point
//
//  Created by Dima Shapovalov on 30.09.15.
//  Copyright (c) 2015 Dima Shapovalov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"

@interface LeftMenuViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *leftMenuTableView;
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;

@end
