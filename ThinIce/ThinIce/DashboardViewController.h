//
//  DashboardViewController.h
//  ThinIce
//
//  Created by Dima Shapovalov on 18.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "BaseViewController.h"

@interface DashboardViewController : BaseViewController

// Day Cards Block

@property (weak, nonatomic) IBOutlet UITableView                        *dayCardsTableView;
@property (weak, nonatomic) IBOutlet UIView                             *dayCardTableViewBackgroundView;

- (void)reloadCellsInTableView;
- (void)flipTableViewWithAnimationsBlock:(void(^)())animBlock ComplitionBlock:(void(^)())complitionblock;

@end
