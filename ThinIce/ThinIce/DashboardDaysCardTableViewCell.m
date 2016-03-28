//
//  DashboardDaysCardTableViewCell.m
//  ThinIce
//
//  Created by Dima Shapovalov on 01.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "DashboardDaysCardTableViewCell.h"
#import "BackSideCellViewController.h"

#define OPACITY                         0.55

static NSString * const kDayCardsColor[] = { @"#BA68C8", @"#7E57C2", @"#4B6697", @"#29B6F6", @"#64FFDA", @"#16A086", @"#54A6B7", @"#607d8b" };

@implementation DashboardDaysCardTableViewCell {
    
    BackSideCellViewController                           *vc;
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)awakeFromNib {
    // Initialization code
    
    self.selectionStyle                                     = UITableViewCellSelectionStyleNone;
    self.backgroundColor                                    = [[HelperManager sharedServer] colorwithHexString:@"#346b7d" alpha:0.5];
    self.layer.cornerRadius                                 = CellAndTableCornerRadius;
    self.contentView.layer.cornerRadius                     = CellAndTableCornerRadius;
    self.isFlip                                             = NO;
    vc                                                      = [[UIStoryboard storyboardWithName:kMainStoryBoardIdentifier bundle:nil] instantiateViewControllerWithIdentifier: kBackSideDashboardID];
    vc.cellSelf                                             = self;
}

- (void)loadCellWithData:(UserDaysCards*)data isToday:(BOOL)todaystate {
    // INIT Header View Block
    
    self.headerCellView.backgroundColor                     = [[HelperManager sharedServer] colorwithHexString: kDayCardsColor[data.currentCardsID] alpha:OPACITY];
    
    self.flipButton.backgroundColor                         = [UIColor clearColor];
    self.flipButton.tintColor                               = [UIColor clearColor];
    
    [self.flipButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"icons_dashboardFlip_normal_%d", (int)kScreenWidth]] forState:UIControlStateNormal];
    [self.flipButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"icons_dashboardFlip_active_%d", (int)kScreenWidth]] forState:UIControlStateHighlighted];
    [self.flipButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"icons_dashboardFlip_active_%d", (int)kScreenWidth]] forState:UIControlStateSelected];
    
    self.daysAgoLabel.backgroundColor                       = [UIColor clearColor];
    self.daysAgoLabel.textColor                             = [UIColor whiteColor];
    
    self.dateLabel.backgroundColor                          = [UIColor clearColor];
    self.dateLabel.textColor                                = [UIColor whiteColor];
    self.dateLabel.text                                     = [[HelperManager sharedServer] currentDateText: data.createCardsDate];
    
    // INIT Thin Ice Time Cell Block
    
    self.thinIceCellLogoImageView.image                     = [UIImage imageNamed:[NSString stringWithFormat:@"icons_thinIceCellLogo_%d", (int)kScreenWidth]];
    self.thinIceCellLogoImageView.contentMode               = UIViewContentModeCenter;
    
    self.thinIceTimeInfoLabel.text                          = @"Thin Ice Time, hrs";
    self.thinIceTimeInfoLabel.textColor                     = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.temperatureImageView.image                         = [UIImage imageNamed:[NSString stringWithFormat:@"icons_temperature_%d", (int)kScreenWidth]];
    self.temperatureImageView.contentMode                   = UIViewContentModeCenter;
    
    self.clockImageView.image                               = [UIImage imageNamed:[NSString stringWithFormat:@"icons_clock_%d", (int)kScreenWidth]];
    self.clockImageView.contentMode                         = UIViewContentModeCenter;
    
    self.temperature.text                                   = [NSString stringWithFormat:@"%@", [[HelperManager sharedServer] calculateCelsiusFahrenheitValue: [[AccountInfoManager sharedManager].userDaysCard.currentCard.temperature intValue]]];
    self.temperature.textColor                              = [[HelperManager sharedServer] colorwithHexString:ColorFromInputTextYELLOW alpha:1.0];
    NSLog(@"%@", [AccountInfoManager sharedManager].userDaysCard.currentCard.temperature);
    
    
    
    [[HelperManager sharedServer] updateElapsedTimeDisplay:[AccountInfoManager sharedManager].userDaysCard.currentCard.currentTime ToLabel:self.timeInfoLabel];
    self.timeInfoLabel.textColor                            = [[HelperManager sharedServer] colorwithHexString:ColorFromInputTextYELLOW alpha:1.0];
    
    self.targetLabel.text                                   = @"Target:";
    self.targetLabel.textColor                              = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    [[HelperManager sharedServer] updateElapsedTimeDisplay:[AccountInfoManager sharedManager].userDaysCard.currentCard.targetTime ToLabel:self.targetTimeLabel];
    self.targetTimeLabel.textColor                          = [[HelperManager sharedServer] colorwithHexString:ColorFromInputTextYELLOW alpha:1.0];
    
    
    self.progressBar.barFillColor                           = [[HelperManager sharedServer] colorwithHexString:@"#33c6cb" alpha:1.0];
    self.progressBar.barInnerBorderColor                    = [[HelperManager sharedServer] colorwithHexString:@"#6b8896" alpha:1.0];
    self.progressBar.barBorderColor                         = [[HelperManager sharedServer] colorwithHexString:@"#6b8896" alpha:1.0];
    self.progressBar.barBackgroundColor                     = [[HelperManager sharedServer] colorwithHexString:@"#6b8896" alpha:1.0];
    self.progressBar.barBorderWidth                         = 0.0;
    self.progressBar.barInnerPadding                        = 0.0;
    self.progressBar.autoresizingMask                       = UIViewAutoresizingFlexibleWidth;
    self.progressBar.progress                               = [AccountInfoManager sharedManager].userDaysCard.currentCard.currentTime * 1.0 / [AccountInfoManager sharedManager].userDaysCard.currentCard.targetTime;
    
    
    self.separatorView.backgroundColor                      = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
                                      
    // INIT Thin Ice Burn Calories Cell Block
    
    self.burntCaloriesImageView.image                       = [UIImage imageNamed:[NSString stringWithFormat:@"icons_burntCalories_%d", (int)kScreenWidth]];
    self.burntCaloriesImageView.contentMode                 = UIViewContentModeCenter;
    
    NSMutableAttributedString * stringCalWithColors         = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Burnt Calories - %d cal", [[AccountInfoManager sharedManager].userDaysCard.currentCard.burntCalories intValue]]];
    [stringCalWithColors addAttribute:NSForegroundColorAttributeName value:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0] range:NSMakeRange(0,BurntCaloriesLength)];
    [stringCalWithColors addAttribute:NSForegroundColorAttributeName value:[[HelperManager sharedServer] colorwithHexString:ColorFromInputTextYELLOW alpha:1.0] range:NSMakeRange(BurntCaloriesLength, [NSString stringWithFormat:@"Burnt Calories - %d cal", [[AccountInfoManager sharedManager].userDaysCard.currentCard.burntCalories intValue]].length - BurntCaloriesLength)];
    self.burntCaloriesTitleLabelAndInfoLabel.attributedText = stringCalWithColors;
    
    self.burntCaloriesSeparator.backgroundColor             = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    // INIT Days Instructions Cell Block
    
        // Gym Session
    
    self.gymSessionImageView.image                          = [UIImage imageNamed:[NSString stringWithFormat:@"icons_gymSession_%d", (int)kScreenWidth]];
    self.gymSessionImageView.contentMode                    = UIViewContentModeCenter;
    
    self.gymSessionSeparator.backgroundColor                = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.gymSessionCountLabel.text                          = [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.gymSession stringValue];
    self.gymSessionCountLabel.textColor                     = [[HelperManager sharedServer] colorwithHexString:ColorFromInputTextGYMSession alpha:1.0];
    
        // Water Intake
    
    self.waterIntakeImageView.image                         = [UIImage imageNamed:[NSString stringWithFormat:@"icons_waterIntake_%d", (int)kScreenWidth]];
    self.waterIntakeImageView.contentMode                   = UIViewContentModeCenter;
    
    self.waterIntakeSeparator.backgroundColor               = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.waterIntakeCountLabel.text                         = [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.waterIntake stringValue];
    self.waterIntakeCountLabel.textColor                    = [[HelperManager sharedServer] colorwithHexString:ColorFromInputTextWaterIntake alpha:1.0];
    
        // Junk Food
    
    self.junkFoodImageView.image                            = [UIImage imageNamed:[NSString stringWithFormat:@"icons_JunkFood_%d", (int)kScreenWidth]];
    self.junkFoodImageView.contentMode                      = UIViewContentModeCenter;
    
    self.junkFoodSeparator.backgroundColor                  = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.junkFoodCountLabel.text                            = [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.junkFood stringValue];
    self.junkFoodCountLabel.textColor                       = [[HelperManager sharedServer] colorwithHexString:ColorFromInputTextJunkFood alpha:1.0];
    
        // H-protein Meals

    self.hProteinMealsImageView.image                       = [UIImage imageNamed:[NSString stringWithFormat:@"icons_H_protein_%d", (int)kScreenWidth]];
    self.hProteinMealsImageView.contentMode                 = UIViewContentModeCenter;
    
    self.hProteinMealsSeparator.backgroundColor             = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.hProteinCountLabel.text                            = [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.hProtein stringValue];
    self.hProteinCountLabel.textColor                       = [[HelperManager sharedServer] colorwithHexString:ColorFromHproteinMeals alpha:1.0];
    
        // Hours Slapt
    
    self.hourseSleptImageView.image                         = [UIImage imageNamed:[NSString stringWithFormat:@"icons_hours_slapt_%d", (int)kScreenWidth]];
    self.hourseSleptImageView.contentMode                   = UIViewContentModeCenter;
    
    self.hourseSleptSeparator.backgroundColor               = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.hourseSleptCountLabel.text                         = [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.hoursSlept stringValue];
    self.hourseSleptCountLabel.textColor                    = [[HelperManager sharedServer] colorwithHexString:ColorFromHproteinMeals alpha:1.0];
    
        // Carbs Consumed
    
    self.carbsConsumedImageView.image                       = [UIImage imageNamed:[NSString stringWithFormat:@"icons_carbs_consumed_%d", (int)kScreenWidth]];
    self.carbsConsumedImageView.contentMode                 = UIViewContentModeCenter;
    
    self.carbsConsumedSeparator.backgroundColor             = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.carbsConsumedCountLabel.text                       = [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.carbsConsumed stringValue];
    self.carbsConsumedCountLabel.textColor                  = [[HelperManager sharedServer] colorwithHexString:ColorFromHproteinMeals alpha:1.0];
    
    vc.cellData = data;
}

- (void)addCellsObservers {
    
    [[AccountInfoManager sharedManager].userDaysCard.currentCard addObserver:self forKeyPath:@"temperature" options:NSKeyValueObservingOptionNew context:NULL];
    [[AccountInfoManager sharedManager].userDaysCard.currentCard addObserver:self forKeyPath:@"currentTime" options:NSKeyValueObservingOptionNew context:NULL];
    [[AccountInfoManager sharedManager].userDaysCard.currentCard addObserver:self forKeyPath:@"targetTime" options:NSKeyValueObservingOptionNew context:NULL];
    [[AccountInfoManager sharedManager].userDaysCard.currentCard addObserver:self forKeyPath:@"timeProgress" options:NSKeyValueObservingOptionNew context:NULL];
    [[AccountInfoManager sharedManager].userDaysCard.currentCard addObserver:self forKeyPath:@"burntCalories" options:NSKeyValueObservingOptionNew context:NULL];
    
    [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions addObserver:self forKeyPath:@"gymSession" options:NSKeyValueObservingOptionNew context:NULL];
    [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions addObserver:self forKeyPath:@"waterIntake" options:NSKeyValueObservingOptionNew context:NULL];
    [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions addObserver:self forKeyPath:@"junkFood" options:NSKeyValueObservingOptionNew context:NULL];
    [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions addObserver:self forKeyPath:@"hProtein" options:NSKeyValueObservingOptionNew context:NULL];
    [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions addObserver:self forKeyPath:@"hoursSlept" options:NSKeyValueObservingOptionNew context:NULL];
    [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions addObserver:self forKeyPath:@"carbsConsumed" options:NSKeyValueObservingOptionNew context:NULL];
}

// Observers

- (void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context {
    
    if ([keyPath isEqual:@"temperature"]) {
        
        self.temperature.text = [[AccountInfoManager sharedManager].userDaysCard.currentCard.temperature stringValue];
    }
    if ([keyPath isEqual:@"currentTime"]) {
        
        [[HelperManager sharedServer] updateElapsedTimeDisplay:[AccountInfoManager sharedManager].userDaysCard.currentCard.currentTime ToLabel:self.timeInfoLabel];
    }
    if ([keyPath isEqual:@"targetTime"]) {
        
        [[HelperManager sharedServer] updateElapsedTimeDisplay:[AccountInfoManager sharedManager].userDaysCard.currentCard.targetTime ToLabel:self.targetTimeLabel];
    }
    if ([keyPath isEqual:@"timeProgress"]) {
        
        self.progressBar.progress = [[AccountInfoManager sharedManager].userDaysCard.currentCard.timeProgress doubleValue];
    }
    if ([keyPath isEqual:@"burntCalories"]) {
        
        NSMutableAttributedString * stringCalWithColors         = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Burnt Calories - %d cal", [[AccountInfoManager sharedManager].userDaysCard.currentCard.burntCalories intValue]]];
        [stringCalWithColors addAttribute:NSForegroundColorAttributeName value:[[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0] range:NSMakeRange(0,BurntCaloriesLength)];
        [stringCalWithColors addAttribute:NSForegroundColorAttributeName value:[[HelperManager sharedServer] colorwithHexString:ColorFromInputTextYELLOW alpha:1.0] range:NSMakeRange(BurntCaloriesLength, [NSString stringWithFormat:@"Burnt Calories - %d cal", [[AccountInfoManager sharedManager].userDaysCard.currentCard.burntCalories intValue]].length - BurntCaloriesLength)];
        self.burntCaloriesTitleLabelAndInfoLabel.attributedText = stringCalWithColors;
    }
    
// ====================================================================================================================================================================================
    
    if ([keyPath isEqual:@"gymSession"]) {
        
        self.gymSessionCountLabel.text                          = [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.junkFood stringValue];
    }
    if ([keyPath isEqual:@"waterIntake"]) {
        
        self.waterIntakeCountLabel.text                         = [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.junkFood stringValue];
    }
    if ([keyPath isEqual:@"junkFood"]) {
        
        self.junkFoodCountLabel.text                            = [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.junkFood stringValue];
    }
    if ([keyPath isEqual:@"hProtein"]) {
        
        self.hProteinCountLabel.text                            = [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.hProtein stringValue];
    }
    if ([keyPath isEqual:@"hoursSlept"]) {
        
        self.hourseSleptCountLabel.text                         = [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.hoursSlept stringValue];
    }
    if ([keyPath isEqual:@"carbsConsumed"]) {
        
        self.carbsConsumedCountLabel.text                       = [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.carbsConsumed stringValue];
    }
}

- (void)updateLabelText {
    
    self.gymSessionCountLabel.text                          = [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.gymSession stringValue];
    self.waterIntakeCountLabel.text                         = [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.waterIntake stringValue];
    self.junkFoodCountLabel.text                            = [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.junkFood stringValue];
    self.hProteinCountLabel.text                            = [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.hProtein stringValue];
    self.hourseSleptCountLabel.text                         = [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.hoursSlept stringValue];
    self.carbsConsumedCountLabel.text                       = [[AccountInfoManager sharedManager].userDaysCard.currentCard.recomendationDaysActions.carbsConsumed stringValue];
}

// RightFlip

- (IBAction)cellflipActionButton:(UIButton *)sender {

    CGRect cellRect             = self.bounds;
    vc.view.frame               = cellRect;
    self.clipsToBounds          = YES;
    
    [UIView transitionWithView:self duration:0.6 options:UIViewAnimationOptionTransitionFlipFromRight | UIViewAnimationOptionShowHideTransitionViews animations:^{
        
        if(self.isFlip) {
            
            [vc.view removeFromSuperview];
            for (UIView *view in self.contentView.subviews) {
                
                view.hidden     = NO;
            }
            self.isFlip         = NO;
        } else {
            
            for (UIView *view in self.contentView.subviews) {
                
                if(view == self.headerCellView) {
                    
                    view.hidden = YES;
                } else if (view == self.dateLabel) {
                    
                    view.hidden = YES;
                } else if (view == self.daysAgoLabel) {
                    
                    view.hidden = YES;
                } else if (view == self.flipButton) {
                    
                    view.hidden = YES;
                } else {
                    
                    view.hidden = YES;
                }
            }
            self.isFlip         = YES;
            [self.contentView addSubview:vc.view];
        }

    } completion:^(BOOL finished) {
        
        [self.dashboardSelf reloadCellsInTableView];
    }];
}

// LeftFlip

- (void)leftFlip {

    CGRect cellRect             = self.bounds;
    vc.view.frame               = cellRect;
    
    [UIView transitionWithView:self duration:0.6 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        
        if(self.isFlip) {
            
            [vc.view removeFromSuperview];
            for (UIView *view in self.contentView.subviews) {
                
                view.hidden     = NO;
            }
            self.isFlip = NO;
            
        } else {
            for (UIView *view in self.contentView.subviews) {
                
                if(view == self.headerCellView) {
                    
                    view.hidden = NO;
                } else if (view == self.dateLabel) {
                    
                    view.hidden = NO;
                } else if (view == self.daysAgoLabel) {
                    
                    view.hidden = NO;
                } else if (view == self.flipButton) {
                    
                    view.hidden = NO;
                } else {
                    
                    view.hidden = YES;
                }
            }
            
            self.isFlip         = YES;
            [self.contentView addSubview:vc.view];
        }
    } completion:^(BOOL finished) {
        
    }];
}

@end
