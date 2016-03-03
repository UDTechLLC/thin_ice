//
//  BluetoothConnectViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 18.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "BluetoothConnectViewController.h"

@interface BluetoothConnectViewController ()

@property (weak, nonatomic) IBOutlet UIImageView            *logoPic;

@end

@implementation BluetoothConnectViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
    [super viewWillDisappear:animated];
}

- (void)createViewController {
    
    // Change Background View Color / Radius
    self.view.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#346b7d" alpha: 0.5];
    
    self.logoPic.image = [UIImage imageNamed: @"thinice_logotype"];
    
    // Create TextField Group
    
    
    
    
}
@end
