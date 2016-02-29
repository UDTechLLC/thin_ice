//
//  DashboardViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 18.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

//
#define iPhone5XCoordinateForImege
#define iPhone5YCoordinateForImege

#define iPhone6XCoordinateForImege
#define iPhone6YCoordinateForImege

#define iPhone6PlusXCoordinateForImege
#define iPhone6PlusYCoordinateForImege


#import "DashboardViewController.h"

@interface DashboardViewController () <SlideNavigationControllerDelegate>
// Image Block
@property (weak, nonatomic) IBOutlet UIImageView *imageViewPhoto;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageXCoordinate;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageYCoordinate;

// ViewController UI
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *userNameLabelYCoordinate;

// insoles Block
@property (weak, nonatomic) IBOutlet UIImageView *insolesPic;
@property (weak, nonatomic) IBOutlet UILabel *powerInsolesLabel;
@property (weak, nonatomic) IBOutlet UIView *powerInsolesBattaryHigherView;
@property (weak, nonatomic) IBOutlet UIView *powerInsolesBattaryMiddleView;
@property (weak, nonatomic) IBOutlet UIView *powerInsolesBattaryLowerView;
// Separators Block
@property (weak, nonatomic) IBOutlet UIView *insolesAndVestVerticalSeparator;
@property (weak, nonatomic) IBOutlet UIView *horisontalSeparator;
// Vest Block
@property (weak, nonatomic) IBOutlet UIImageView *vestPic;
@property (weak, nonatomic) IBOutlet UILabel *powerVestLabel;
@property (weak, nonatomic) IBOutlet UIView *powerVestBattaryHigherView;
@property (weak, nonatomic) IBOutlet UIView *powerVestBattaryMiddleView;
@property (weak, nonatomic) IBOutlet UIView *powerVestBattaryLowerView;

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addDashboardBackgroundImage];
    [self createViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
    [self translucentNavigationBar: YES];
    [super viewWillAppear:YES];
}

- (void)viewDidLayoutSubviews {
    [self createProfilePhotoImageView];
    if((int)kScreenWidth == 375) {
        self.imageXCoordinate.constant = 14;
        self.imageYCoordinate.constant = 88;
    }
    [self.view setNeedsLayout];
    [super viewDidLayoutSubviews];
}

- (void)createViewController {
    
    self.userNameLabel.backgroundColor = [UIColor clearColor];
    self.userNameLabel.textColor = [[HelperManager sharedServer] colorwithHexString:@"#ccccccc" alpha:1.0];
    self.userNameLabel.text = @"Artem Arefin";
    
    [self createInsolesBlock];
    [self createVestBlock];
    
    // Create SeparatorsView
    self.insolesAndVestVerticalSeparator.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0];
    self.horisontalSeparator.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0];
}

- (void)createProfilePhotoImageView {
    
    CGFloat lineWidth    = 2.0;
    UIBezierPath *path   = [self roundedPolygonPathWithRect:self.imageViewPhoto.bounds
                                                  lineWidth:lineWidth
                                                      sides:6
                                               cornerRadius:15];
    
    CAShapeLayer *mask   = [CAShapeLayer layer];
    mask.path            = path.CGPath;
    mask.lineWidth       = lineWidth;
    mask.strokeColor     = [UIColor clearColor].CGColor;
    mask.fillColor       = [UIColor whiteColor].CGColor;
    self.imageViewPhoto.layer.mask = mask;
    
    CAShapeLayer *border = [CAShapeLayer layer];
    border.path          = path.CGPath;
    border.lineWidth     = lineWidth;
    border.strokeColor   = [[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0].CGColor;
    border.fillColor     = [UIColor clearColor].CGColor;
    [self.imageViewPhoto.layer addSublayer:border];
    self.imageViewPhoto.backgroundColor = [UIColor lightGrayColor];
}

- (void)createInsolesBlock {
    
    self.insolesPic.image = [UIImage imageNamed:[NSString stringWithFormat:@"insoles_%d", (int)kScreenWidth]];
    self.insolesPic.contentMode = UIViewContentModeCenter;
    
    self.powerVestLabel.backgroundColor = [UIColor clearColor];
    self.powerVestLabel.textColor = [[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0];
    self.powerVestLabel.text = @"100 %";
    
    self.powerVestBattaryHigherView.backgroundColor = [UIColor clearColor];
    [self addBorderLineFor: self.powerVestBattaryHigherView withColor:[[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0] borderWidth:1.0 radius:5.0];
    self.powerVestBattaryMiddleView.backgroundColor = [UIColor clearColor];
    [self addBorderLineFor: self.powerVestBattaryMiddleView withColor:[[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0] borderWidth:1.0 radius:5.0];
    self.powerVestBattaryLowerView.backgroundColor = [UIColor clearColor];
    [self addBorderLineFor: self.powerVestBattaryLowerView withColor:[[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0] borderWidth:1.0 radius:5.0];
}

- (void)createVestBlock {
    
    self.vestPic.image = [UIImage imageNamed:[NSString stringWithFormat:@"thin_ice_vest_%d", (int)kScreenWidth]];
    self.vestPic.contentMode = UIViewContentModeCenter;
    
    self.powerInsolesLabel.backgroundColor = [UIColor clearColor];
    self.powerInsolesLabel.textColor = [[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0];
    self.powerInsolesLabel.text = @"100 %";
    
    self.powerInsolesBattaryHigherView.backgroundColor = [UIColor clearColor];
    [self addBorderLineFor: self.powerInsolesBattaryHigherView withColor:[[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0] borderWidth:1.0 radius:5.0];
    self.powerInsolesBattaryMiddleView.backgroundColor = [UIColor clearColor];
    [self addBorderLineFor: self.powerInsolesBattaryMiddleView withColor:[[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0] borderWidth:1.0 radius:5.0];
    self.powerInsolesBattaryLowerView.backgroundColor = [UIColor clearColor];
    [self addBorderLineFor: self.powerInsolesBattaryLowerView withColor:[[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0] borderWidth:1.0 radius:5.0];
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    
    return YES;
}

@end
