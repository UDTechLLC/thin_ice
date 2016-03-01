//
//  DashboardDaysCardTableViewCell.m
//  ThinIce
//
//  Created by Dima Shapovalov on 01.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//


#define ColorFromSeparators                 @"#33c6cb"
#define ColorFromPlaceHolderText            @"#cccccc"
#define ColorFromInputTextTELLOW            @"#cddc39"
#define ColorFromInputTextGYMSession        @"#00e676"
#define ColorFromInputTextWaterIntake       @"#4285f4"
#define ColorFromInputTextJunkFood          @"#64ffda"
#define ColorFromHproteinMeals              @"#b2ff59"

#define BurntCaloriesLength                 16

#import "DashboardDaysCardTableViewCell.h"

@implementation DashboardDaysCardTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)loadCellWithData:(id)data {
    // INIT Header View Block
    
    self.headerCellView.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#6568a1" alpha:1.0];
    
    self.flipButton.backgroundColor = [UIColor clearColor];
    self.flipButton.tintColor       = [UIColor clearColor];
    [self.flipButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"icons_dashboardFlip_normal_%d", (int)kScreenWidth]] forState:UIControlStateNormal];
    [self.flipButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"icons_dashboardFlip_active_%d", (int)kScreenWidth]] forState:UIControlStateHighlighted];
    [self.flipButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"icons_dashboardFlip_active_%d", (int)kScreenWidth]] forState:UIControlStateSelected];
    
    self.daysAgoLabel.backgroundColor = [UIColor clearColor];
    self.daysAgoLabel.textColor = [UIColor whiteColor];
    
    self.dateLabel.backgroundColor = [UIColor clearColor];
    self.dateLabel.textColor = [UIColor whiteColor];
    
    // INIT Thin Ice Time Cell Block
    
    self.thinIceCellLogoImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"icons_thinIceCellLogo_%d", (int)kScreenWidth]];
    self.thinIceCellLogoImageView.contentMode = UIViewContentModeCenter;
    
    self.thinIceTimeInfoLabel.text = @"Thin Ice Time, hrs";
    self.thinIceTimeInfoLabel.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.temperatureImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"icons_temperature_%d", (int)kScreenWidth]];
    self.temperatureImageView.contentMode = UIViewContentModeCenter;
    
    self.clockImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"icons_clock_%d", (int)kScreenWidth]];
    self.clockImageView.contentMode = UIViewContentModeCenter;
    
    self.temperature.text = @"12C";
    self.temperature.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromInputTextTELLOW alpha:1.0];
    
    self.timeInfoLabel.text = @"5:31:16";
    self.timeInfoLabel.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromInputTextTELLOW alpha:1.0];
    
    self.targetLabel.text = @"Target:";
    self.targetLabel.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.targetTimeLabel.text = @"7 hrs";
    self.targetTimeLabel.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromInputTextTELLOW alpha:1.0];
    
    self.progressBar.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#6b8896" alpha:1.0];
    self.progressBar.layer.cornerRadius = self.progressBar.frame.size.height / 2;
    
    self.separatorView.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
                                      
    // INIT Thin Ice Burn Calories Cell Block
    
    
    self.burntCaloriesImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"icons_burntCalories_%d", (int)kScreenWidth]];
    self.burntCaloriesImageView.contentMode = UIViewContentModeCenter;
    
    NSMutableAttributedString * stringCalWithColors = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Burnt Calories - %@", @"2500 cal"]];
    [stringCalWithColors addAttribute:NSForegroundColorAttributeName value:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0] range:NSMakeRange(0,BurntCaloriesLength)];
    [stringCalWithColors addAttribute:NSForegroundColorAttributeName value:[[HelperManager sharedServer] colorwithHexString:ColorFromInputTextTELLOW alpha:1.0] range:NSMakeRange(BurntCaloriesLength, [NSString stringWithFormat:@"Burnt Calories - %@", @"2500 cal"].length - BurntCaloriesLength)];
    self.burntCaloriesTitleLabelAndInfoLabel.attributedText = stringCalWithColors;
    
    self.burntCaloriesSeparator.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    // INIT Days Instructions Cell Block
    
        // Gym Session
    
    self.gymSessionImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"icons_gymSession_%d", (int)kScreenWidth]];
    self.gymSessionImageView.contentMode = UIViewContentModeCenter;
    
    self.gymSessionLabel.text = @"Gym Session, hrs";
    self.gymSessionLabel.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.gymSessionSeparator.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.gymSessionCountLabel.text = @"2";
    self.gymSessionCountLabel.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromInputTextGYMSession alpha:1.0];
    
        // Water Intake
    
    self.waterIntakeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"icons_waterIntake_%d", (int)kScreenWidth]];
    self.waterIntakeImageView.contentMode = UIViewContentModeCenter;
    
    self.waterIntakeLabel.text = @"Water Intake, ml";
    self.waterIntakeLabel.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.waterIntakeSeparator.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.waterIntakeCountLabel.text = @"2000";
    self.waterIntakeCountLabel.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromInputTextWaterIntake alpha:1.0];
    
        // Junk Food
    
    self.junkFoodImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"icons_JunkFood_%d", (int)kScreenWidth]];
    self.junkFoodImageView.contentMode = UIViewContentModeCenter;
    
    self.junkFoodLabel.text = @"Junk Food, Servings";
    self.junkFoodLabel.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.junkFoodSeparator.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.junkFoodCountLabel.text = @"2";
    self.junkFoodCountLabel.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromInputTextJunkFood alpha:1.0];
    
        // H-protein Meals

    self.hProteinMealsImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"icons_H_protein_%d", (int)kScreenWidth]];
    self.hProteinMealsImageView.contentMode = UIViewContentModeCenter;
    
    self.hProteinMealsLabel.text = @"H - protein Meals";
    self.hProteinMealsLabel.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.hProteinMealsSeparator.backgroundColor = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.hProteinCountLabel.text = @"1";
    self.hProteinCountLabel.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromHproteinMeals alpha:1.0];
}

@end