//
//  ThinIceControlViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 10.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "ThinIceControlViewController.h"

@interface ThinIceControlViewController ()

@end

@implementation ThinIceControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    [self createViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    [self addNavigationBarAttributeTitle: @"Thin Ice Control"];
    self.navigationController.navigationBarHidden = NO;
    [self translucentNavigationBar: YES];
    [super viewWillAppear:YES];
}

- (void)createViewController {
    
    [self addThinIceControlBackgroundImage];
    
    
    
    
    
    
    
    
    
    
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    
    return YES;
}

@end
