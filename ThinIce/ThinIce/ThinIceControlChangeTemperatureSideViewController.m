//
//  ThinIceControlChangeTemperatureSideViewController.m
//  ThinIce
//
//  Created by Dmitry on 20.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "ThinIceControlChangeTemperatureSideViewController.h"

@interface ThinIceControlChangeTemperatureSideViewController ()

//Header StoryBoard Connections

@property (weak, nonatomic) IBOutlet UIView             *headerContentView;
@property (weak, nonatomic) IBOutlet UILabel            *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView        *timerImage;
@property (weak, nonatomic) IBOutlet UILabel            *timerLabel;
@property (weak, nonatomic) IBOutlet UIButton           *flipButton;

// Charge Block

@property (weak, nonatomic) IBOutlet UILabel            *chargeLabel;
@property (weak, nonatomic) IBOutlet UIView             *chargeSeparator;

// VestPic

@property (weak, nonatomic) IBOutlet UIImageView        *vestPic;

// Charge Indicator Block

@property (weak, nonatomic) IBOutlet UILabel            *percentLabel;

@property (weak, nonatomic) IBOutlet UIView             *highEnergyView;
@property (weak, nonatomic) IBOutlet UIView             *midEnergyView;
@property (weak, nonatomic) IBOutlet UIView             *lowEnergyView;

// Temperature Block

@property (weak, nonatomic) IBOutlet UILabel            *temperatureLabel;
@property (weak, nonatomic) IBOutlet UIView             *temperatureSeparator;

// Change Temperature Block

@property (weak, nonatomic) IBOutlet UILabel            *changeTemperatureLabel;
@property (weak, nonatomic) IBOutlet UIButton           *plusButton;
@property (weak, nonatomic) IBOutlet UIButton           *minusButton;

@end

@implementation ThinIceControlChangeTemperatureSideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
}

- (void)createViewController {
    
    self.view.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"346b7d" alpha:1.0];
    
    [self createHeaderBlock];
    [self createChargeBlock];
    [self createVestPickBlock];
    [self createTemperatureBlock];
    [self createChangeTemperatureBlock];
    
}

- (void)createHeaderBlock {
    
    self.headerContentView.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"" alpha:1.0];
    
    
}

- (void)createChargeBlock {
    
    
    
}

- (void)createVestPickBlock {
    
    
    
}

- (void)createTemperatureBlock {
    
    
    
}

- (void)createChangeTemperatureBlock {
    
    
    
}

@end
