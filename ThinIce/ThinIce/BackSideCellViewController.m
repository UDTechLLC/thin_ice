//
//  BackSideCellViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 10.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "BackSideCellViewController.h"

#define OPACITY                         0.55

static NSString * const kDayCardsColor[] = { @"#BA68C8", @"#7E57C2", @"#4B6697", @"#29B6F6", @"#64FFDA", @"#16A086", @"#54A6B7", @"#607d8b" };

@interface BackSideCellViewController () {
    NSNumberFormatter *formatter;
}

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
    
    formatter = [[NSNumberFormatter alloc] init];
    
    self.view.backgroundColor                                       = [[HelperManager sharedServer] colorwithHexString:@"#346b7d" alpha:0.5];
    self.view.layer.cornerRadius                                    = CellAndTableCornerRadius;
    
    self.headerCellView.backgroundColor                             = [[HelperManager sharedServer] colorwithHexString: kDayCardsColor[self.cellData.currentCardsID] alpha:OPACITY];
    
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
    
    self.gymSessionCountTextField.text                              = [NSString stringWithFormat:@"%@", [AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.gymSession];
    self.gymSessionCountTextField.textColor                         = [UIColor whiteColor];
    self.gymSessionCountTextField.keyboardAppearance                = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.gymSessionCountTextField.keyboardType                      = UIKeyboardTypeDecimalPad;
    // Water Intake
    
    self.waterIntakeImageView.image                                 = [UIImage imageNamed:[NSString stringWithFormat:@"icons_waterIntake_%d", (int)kScreenWidth]];
    self.waterIntakeImageView.contentMode                           = UIViewContentModeScaleAspectFit;
    self.waterIntakeImageView.clipsToBounds                         = YES;
    
    self.waterIntakeLabel.text                                      = [NSString stringWithFormat:@"Water Intake, %@", [AccountInfoManager sharedManager].userToken.userSettings.user_Volume];
    self.waterIntakeLabel.textColor                                 = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.waterIntakeSeparator.backgroundColor                       = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.waterIntakeCountTextField.text                             = [NSString stringWithFormat:@"%@", [AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.waterIntake];
    self.waterIntakeCountTextField.textColor                        = [UIColor whiteColor];
    self.waterIntakeCountTextField.keyboardAppearance               = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.waterIntakeCountTextField.keyboardType                     = UIKeyboardTypeDecimalPad;
    
    // Junk Food
    
    self.junkFoodImageView.image                                    = [UIImage imageNamed:[NSString stringWithFormat:@"icons_JunkFood_%d", (int)kScreenWidth]];
    self.junkFoodImageView.contentMode                              = UIViewContentModeScaleAspectFit;
    
    self.junkFoodLabel.text                                         = @"Junk Food, Servings";
    self.junkFoodLabel.textColor                                    = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.junkFoodSeparator.backgroundColor                          = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.junkFoodCountTextField.text                                = [NSString stringWithFormat:@"%@", [AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.junkFood];
    self.junkFoodCountTextField.textColor                           = [UIColor whiteColor];
    self.junkFoodCountTextField.keyboardAppearance                  = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.junkFoodCountTextField.keyboardType                        = UIKeyboardTypeDecimalPad;
    
    // H-protein Meals
    
    self.hProteinMealsImageView.image                               = [UIImage imageNamed:[NSString stringWithFormat:@"icons_H_protein_%d", (int)kScreenWidth]];
    self.hProteinMealsImageView.contentMode                         = UIViewContentModeScaleAspectFit;
    
    self.hProteinMealsLabel.text                                    = @"H - protein Meals";
    self.hProteinMealsLabel.textColor                               = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.hProteinMealsSeparator.backgroundColor                     = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.hProteinCountTextField.text                                = [NSString stringWithFormat:@"%@", [AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.hProtein];
    self.hProteinCountTextField.textColor                           = [UIColor whiteColor];
    self.hProteinCountTextField.keyboardAppearance                  = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.hProteinCountTextField.keyboardType                        = UIKeyboardTypeDecimalPad;
    
    // Hours Slapt
    
    self.hourseSleptImageView.image                                 = [UIImage imageNamed:[NSString stringWithFormat:@"icons_hours_slapt_%d", (int)kScreenWidth]];
    self.hourseSleptImageView.contentMode                           = UIViewContentModeScaleAspectFit;
    
    self.hourseSleptLabel.text                                      = @"Hours Slept, hrs";
    self.hourseSleptLabel.textColor                                 = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.hourseSleptSeparator.backgroundColor                       = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.hourseSleptCountTextField.text                             = [NSString stringWithFormat:@"%@", [AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.hoursSlept];
    self.hourseSleptCountTextField.textColor                        = [UIColor whiteColor];
    self.hourseSleptCountTextField.keyboardAppearance               = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.hourseSleptCountTextField.keyboardType                     = UIKeyboardTypeDecimalPad;
    
    // Carbs Consumed
    
    self.carbsConsumedImageView.image                               = [UIImage imageNamed:[NSString stringWithFormat:@"icons_carbs_consumed_%d", (int)kScreenWidth]];
    self.carbsConsumedImageView.contentMode                         = UIViewContentModeScaleAspectFit;
    
    self.carbsConsumedLabel.text                                    = @"Carbs consumed, g";
    self.carbsConsumedLabel.textColor                               = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.carbsConsumedSeparator.backgroundColor                     = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.carbsConsumedCountTextField.text                           = [NSString stringWithFormat:@"%@", [AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.carbsConsumed];
    self.carbsConsumedCountTextField.textColor                      = [UIColor whiteColor];
    self.carbsConsumedCountTextField.keyboardAppearance             = (SYSTEM_VERSION_LESS_THAN(@"7.0") ? UIKeyboardAppearanceAlert : UIKeyboardAppearanceDark);
    self.carbsConsumedCountTextField.keyboardType                   = UIKeyboardTypeDecimalPad;
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

- (IBAction)saveButtonActionHendlier:(UIButton *)sender {
    
    [AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.gymSession     = [self convertText:self.gymSessionCountTextField.text];
    [AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.waterIntake    = [self convertText:self.waterIntakeCountTextField.text];
    [AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.junkFood       = [self convertText:self.junkFoodCountTextField.text];
    [AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.hProtein       = [self convertText:self.hProteinCountTextField.text];
    [AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.hoursSlept     = [self convertText:self.hourseSleptCountTextField.text];
    [AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.carbsConsumed  = [self convertText:self.carbsConsumedCountTextField.text];
    
    [[AccountInfoManager sharedManager].userAchievements addValueToAchievement: TheDabbler Progress:[NSNumber numberWithInt:1]];
    [[AccountInfoManager sharedManager].userAchievements addValueToAchievement: TheSchemer Progress:[NSNumber numberWithInt:1]];
    [[AccountInfoManager sharedManager].userAchievements addValueToAchievement: TheStrategist Progress:[NSNumber numberWithInt:1]];
    
    [self.cellSelf updateLabelText];
    [self.cellSelf leftFlip];
}

- (IBAction)backflip:(UIButton *)sender {
    
    [self.cellSelf leftFlip];
}

- (NSNumber*)convertText:(NSString*)text {
    
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    return [formatter numberFromString: text];
}

@end
