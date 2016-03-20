//
//  ThinIceControlViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 10.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "ThinIceControlViewController.h"
#import "ThinIceControlChangeTemperatureSideViewController.h"
#import "ThinIceControlChangeTimerAndDeviceSideViewController.h"

@interface ThinIceControlViewController ()

@property (weak, nonatomic) IBOutlet UIView *thinIceContentView;

@end

@implementation ThinIceControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    [self createViewController];
    [self addRightBarButtonWithImageName:[NSString stringWithFormat:@"thiniceplus_normal_%d", (int)kScreenWidth] highlightedImageName:[NSString stringWithFormat:@"thiniceplus_active_%d", (int)kScreenWidth] selector:@selector(addBluetoothDevice)];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [self addNavigationBarAttributeTitle: @"Thin Ice Control"];
    self.navigationController.navigationBarHidden = NO;
    [self translucentNavigationBar: YES];
    [super viewWillAppear:YES];
}

- (void)createViewController {
    
    [self addThinIceControlBackgroundImage];
    self.thinIceContentView.backgroundColor                        = [UIColor clearColor];
}

- (void)addBluetoothDevice {
    NSLog(@"addBluetoothDevice");
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    
    return YES;
}

@end
