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

@interface ThinIceControlViewController () {
    
    ThinIceControlChangeTemperatureSideViewController           * thinIceControlTemperature;
    ThinIceControlChangeTimerAndDeviceSideViewController        * thinIceControlDevice;
}

@property (weak, nonatomic) IBOutlet UIView                     *thinIceContentView;

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
    self.navigationController.navigationBarHidden                   = NO;
    [self translucentNavigationBar: YES];
    [super viewWillAppear:YES];
}

- (void)createViewController {
    
    [self addThinIceControlBackgroundImage];
    self.thinIceContentView.backgroundColor                         = [UIColor clearColor];
    
    thinIceControlTemperature                                       = [self.storyboard instantiateViewControllerWithIdentifier:ThinIceControlChangeTemperatureSideViewControllerID];
    thinIceControlTemperature.parentVC                              = self;
    thinIceControlDevice                                            = [self.storyboard instantiateViewControllerWithIdentifier:ThinIceControlChangeTimerAndDeviceSideViewControllerID];
    thinIceControlDevice.parentVC                                   = self;
    
    thinIceControlTemperature.view.frame                            = self.thinIceContentView.bounds;
    thinIceControlDevice.view.frame                                 = self.thinIceContentView.bounds;
    
    [self.thinIceContentView addSubview: thinIceControlTemperature.view];
}

- (void)addBluetoothDevice {
    NSLog(@"addBluetoothDevice");
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    
    return YES;
}

- (void)rightFlip {
    
    CGRect cellRect                                                 = self.thinIceContentView.bounds;
    thinIceControlDevice.view.frame                                 = cellRect;
    
    [UIView transitionWithView:self.thinIceContentView duration:0.6 options:UIViewAnimationOptionTransitionFlipFromRight | UIViewAnimationOptionShowHideTransitionViews animations:^{
        
        [thinIceControlTemperature.view removeFromSuperview];
        [self.thinIceContentView addSubview:thinIceControlDevice.view];
        
    } completion:^(BOOL finished) {
    
    }];
}

- (void)leftFlip {
    
    CGRect cellRect                                                 = self.thinIceContentView.bounds;
    thinIceControlTemperature.view.frame                            = cellRect;
    
    [UIView transitionWithView:self.thinIceContentView duration:0.6 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        
        [thinIceControlDevice.view removeFromSuperview];
        [self.thinIceContentView addSubview:thinIceControlTemperature.view];
        
    } completion:^(BOOL finished) {
        
    }];
}

@end
