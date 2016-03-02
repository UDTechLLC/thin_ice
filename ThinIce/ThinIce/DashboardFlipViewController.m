//
//  DashboardFlipViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 02.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "DashboardFlipViewController.h"

@interface DashboardFlipViewController ()

@end

@implementation DashboardFlipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    self.view.layer.cornerRadius = 15;
}

@end
