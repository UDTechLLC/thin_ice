//
//  BackSideCellViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 10.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "BackSideCellViewController.h"

@interface BackSideCellViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView                       *scrollView;
@property (weak, nonatomic) IBOutlet UIView                             *backgroundAllView;

// Header View Block
@property (weak, nonatomic) IBOutlet UIView                             *headerCellView;
@property (weak, nonatomic) IBOutlet UIButton                           *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton                           *saveButton;

// Days Instructions Block

    // Gym Session

@property (weak, nonatomic) IBOutlet UIImageView                        *gymSessionImageView;
@property (weak, nonatomic) IBOutlet UILabel                            *gymSessionLabel;
@property (weak, nonatomic) IBOutlet UIView                             *gymSessionSeparator;
@property (weak, nonatomic) IBOutlet UITextField                        *gymSessionCountTextField;

    // Water Intake

@property (weak, nonatomic) IBOutlet UIImageView                        *waterIntakeImageView;
@property (weak, nonatomic) IBOutlet UILabel                            *waterIntakeLabel;
@property (weak, nonatomic) IBOutlet UIView                             *waterIntakeSeparator;
@property (weak, nonatomic) IBOutlet UITextField                        *waterIntakeCountTextField;

    // Junk Food

@property (weak, nonatomic) IBOutlet UIImageView                        *junkFoodImageView;
@property (weak, nonatomic) IBOutlet UILabel                            *junkFoodLabel;
@property (weak, nonatomic) IBOutlet UIView                             *junkFoodSeparator;
@property (weak, nonatomic) IBOutlet UITextField                        *junkFoodCountTextField;

    // H-protein Meals

@property (weak, nonatomic) IBOutlet UIImageView                        *hProteinMealsImageView;
@property (weak, nonatomic) IBOutlet UILabel                            *hProteinMealsLabel;
@property (weak, nonatomic) IBOutlet UIView                             *hProteinMealsSeparator;
@property (weak, nonatomic) IBOutlet UITextField                        *hProteinCountTextField;

    // Hourse Slept

@property (weak, nonatomic) IBOutlet UIImageView                        *hourseSleptImageView;
@property (weak, nonatomic) IBOutlet UILabel                            *hourseSleptLabel;
@property (weak, nonatomic) IBOutlet UIView                             *hourseSleptSeparator;
@property (weak, nonatomic) IBOutlet UITextField                        *hourseSleptCountTextField;

    // Carbs consumed

@property (weak, nonatomic) IBOutlet UIImageView                        *carbsConsumedImageView;
@property (weak, nonatomic) IBOutlet UILabel                            *carbsConsumedLabel;
@property (weak, nonatomic) IBOutlet UIView                             *carbsConsumedSeparator;
@property (weak, nonatomic) IBOutlet UITextField                        *carbsConsumedCountTextField;

@end

@implementation BackSideCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createViewController];
}

- (void)viewDidLayoutSubviews {
    
    [self roundCornersOnView:self.headerCellView onTopLeft:YES topRight:YES bottomLeft:NO bottomRight:NO radius:CellAndTableCornerRadius];
}

- (void)createViewController {
    
    self.view.backgroundColor                                       = [[HelperManager sharedServer] colorwithHexString:@"#346b7d" alpha:0.5];
    self.view.layer.cornerRadius                                    = CellAndTableCornerRadius;
    
    self.backgroundAllView.backgroundColor                          = [UIColor clearColor];
    
    self.scrollView.backgroundColor                                 = [UIColor clearColor];
    
    self.headerCellView.backgroundColor                             = [[HelperManager sharedServer] colorwithHexString:@"#6568a1" alpha:1.0];
    
    [self.cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
    
    
// INIT Days Instructions Cell Block
    
    // Gym Session
    
    self.gymSessionImageView.image                                  = [UIImage imageNamed:[NSString stringWithFormat:@"icons_gymSession_%d", (int)kScreenWidth]];
    self.gymSessionImageView.contentMode                            = UIViewContentModeScaleAspectFit;
    self.gymSessionImageView.clipsToBounds                          = YES;
    
    self.gymSessionLabel.text                                       = @"Gym Session, hrs";
    self.gymSessionLabel.textColor                                  = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.gymSessionSeparator.backgroundColor                        = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.gymSessionCountTextField.text                              = @"0";
    self.gymSessionCountTextField.textColor                         = [UIColor whiteColor];
    self.gymSessionCountTextField.keyboardAppearance                = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    
    // Water Intake
    
    self.waterIntakeImageView.image                                 = [UIImage imageNamed:[NSString stringWithFormat:@"icons_waterIntake_%d", (int)kScreenWidth]];
    self.waterIntakeImageView.contentMode                           = UIViewContentModeScaleAspectFit;
    self.waterIntakeImageView.clipsToBounds                         = YES;
    
    self.waterIntakeLabel.text                                      = @"Water Intake, ml";
    self.waterIntakeLabel.textColor                                 = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.waterIntakeSeparator.backgroundColor                       = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.waterIntakeCountTextField.text                             = @"0";
    self.waterIntakeCountTextField.textColor                        = [UIColor whiteColor];
    self.waterIntakeCountTextField.keyboardAppearance               = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    
    // Junk Food
    
    self.junkFoodImageView.image                                    = [UIImage imageNamed:[NSString stringWithFormat:@"icons_JunkFood_%d", (int)kScreenWidth]];
    self.junkFoodImageView.contentMode                              = UIViewContentModeCenter;
    
    self.junkFoodLabel.text                                         = @"Junk Food, Servings";
    self.junkFoodLabel.textColor                                    = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.junkFoodSeparator.backgroundColor                          = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.junkFoodCountTextField.text                                = @"0";
    self.junkFoodCountTextField.textColor                           = [UIColor whiteColor];
    self.junkFoodCountTextField.keyboardAppearance                  = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    
    // H-protein Meals
    
    self.hProteinMealsImageView.image                               = [UIImage imageNamed:[NSString stringWithFormat:@"icons_H_protein_%d", (int)kScreenWidth]];
    self.hProteinMealsImageView.contentMode                         = UIViewContentModeCenter;
    
    self.hProteinMealsLabel.text                                    = @"H - protein Meals";
    self.hProteinMealsLabel.textColor                               = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.hProteinMealsSeparator.backgroundColor                     = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.hProteinCountTextField.text                                = @"0";
    self.hProteinCountTextField.textColor                           = [UIColor whiteColor];
    self.hProteinCountTextField.keyboardAppearance                  = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    
    // Hours Slapt
    
    self.hourseSleptImageView.image                                 = [UIImage imageNamed:[NSString stringWithFormat:@"icons_H_protein_%d", (int)kScreenWidth]];
    self.hourseSleptImageView.contentMode                           = UIViewContentModeCenter;
    
    self.hourseSleptLabel.text                                      = @"Hours Slept, hrs";
    self.hourseSleptLabel.textColor                                 = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.hourseSleptSeparator.backgroundColor                       = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.hourseSleptCountTextField.text                             = @"0";
    self.hourseSleptCountTextField.textColor                        = [UIColor whiteColor];
    self.hourseSleptCountTextField.keyboardAppearance               = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    
    // Carbs Consumed
    
    self.carbsConsumedImageView.image                               = [UIImage imageNamed:[NSString stringWithFormat:@"icons_H_protein_%d", (int)kScreenWidth]];
    self.carbsConsumedImageView.contentMode                         = UIViewContentModeCenter;
    
    self.carbsConsumedLabel.text                                    = @"Carbs consumed, g";
    self.carbsConsumedLabel.textColor                               = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.carbsConsumedSeparator.backgroundColor                     = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.carbsConsumedCountTextField.text                           = @"0";
    self.carbsConsumedCountTextField.textColor                      = [UIColor whiteColor];
    self.carbsConsumedCountTextField.keyboardAppearance             = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
}

- (UIView *)roundCornersOnView:(UIView *)view onTopLeft:(BOOL)tl topRight:(BOOL)tr bottomLeft:(BOOL)bl bottomRight:(BOOL)br radius:(float)radius {
    
    if (tl || tr || bl || br) {
        UIRectCorner corner = 0; //holds the corner
        //Determine which corner(s) should be changed
        if (tl) {
            
            corner = corner | UIRectCornerTopLeft;
        }
        if (tr) {
            
            corner = corner | UIRectCornerTopRight;
        }
        if (bl) {
            
            corner = corner | UIRectCornerBottomLeft;
        }
        if (br) {
            
            corner = corner | UIRectCornerBottomRight;
        }
        
        UIView          *roundedView    = view;
        UIBezierPath    *maskPath       = [UIBezierPath bezierPathWithRoundedRect:roundedView.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer    *maskLayer      = [CAShapeLayer layer];
        maskLayer.frame                 = roundedView.bounds;
        maskLayer.path                  = maskPath.CGPath;
        roundedView.layer.mask          = maskLayer;
        return roundedView;
    } else {
        
        return view;
    }
}

- (IBAction)backflip:(UIButton *)sender {

    [self.cellSelf leftFlip];
}

@end
