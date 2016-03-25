//
//  DashboardDaysCardTableViewCell.h
//  ThinIce
//
//  Created by Dima Shapovalov on 01.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DashboardViewController.h"
#import "AccountInfoManager.h"

@interface DashboardDaysCardTableViewCell : UITableViewCell

@property (nonatomic) BOOL                                              isFlip;

// Header View Block
@property (weak, nonatomic) IBOutlet UIView                             *headerCellView;
@property (weak, nonatomic) IBOutlet UIButton                           *flipButton;
@property (weak, nonatomic) IBOutlet UILabel                            *daysAgoLabel;
@property (weak, nonatomic) IBOutlet UILabel                            *dateLabel;

// Thin Ice Time Cell Block

@property (weak, nonatomic) IBOutlet UIImageView                        *thinIceCellLogoImageView;
@property (weak, nonatomic) IBOutlet UILabel                            *thinIceTimeInfoLabel;
@property (weak, nonatomic) IBOutlet UIImageView                        *temperatureImageView;
@property (weak, nonatomic) IBOutlet UIImageView                        *clockImageView;
@property (weak, nonatomic) IBOutlet UILabel                            *temperature;
@property (weak, nonatomic) IBOutlet UILabel                            *timeInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel                            *targetLabel;
@property (weak, nonatomic) IBOutlet UILabel                            *targetTimeLabel;
@property (weak, nonatomic) IBOutlet UIView                             *progressBar;
@property (weak, nonatomic) IBOutlet UIView                             *separatorView;

// Thin Ice Burn Calories Cell Block

@property (weak, nonatomic) IBOutlet UIImageView                        *burntCaloriesImageView;
@property (weak, nonatomic) IBOutlet UILabel                            *burntCaloriesTitleLabelAndInfoLabel;
@property (weak, nonatomic) IBOutlet UIView                             *burntCaloriesSeparator;

// Days Instructions Cell Block

    // Gym Session

@property (weak, nonatomic) IBOutlet UIImageView                        *gymSessionImageView;
@property (weak, nonatomic) IBOutlet UILabel                            *gymSessionLabel;
@property (weak, nonatomic) IBOutlet UIView                             *gymSessionSeparator;
@property (weak, nonatomic) IBOutlet UILabel                            *gymSessionCountLabel;

    // Water Intake

@property (weak, nonatomic) IBOutlet UIImageView                        *waterIntakeImageView;
@property (weak, nonatomic) IBOutlet UILabel                            *waterIntakeLabel;
@property (weak, nonatomic) IBOutlet UIView                             *waterIntakeSeparator;
@property (weak, nonatomic) IBOutlet UILabel                            *waterIntakeCountLabel;

    // Junk Food

@property (weak, nonatomic) IBOutlet UIImageView                        *junkFoodImageView;
@property (weak, nonatomic) IBOutlet UILabel                            *junkFoodLabel;
@property (weak, nonatomic) IBOutlet UIView                             *junkFoodSeparator;
@property (weak, nonatomic) IBOutlet UILabel                            *junkFoodCountLabel;

    // H-protein Meals

@property (weak, nonatomic) IBOutlet UIImageView                        *hProteinMealsImageView;
@property (weak, nonatomic) IBOutlet UILabel                            *hProteinMealsLabel;
@property (weak, nonatomic) IBOutlet UIView                             *hProteinMealsSeparator;
@property (weak, nonatomic) IBOutlet UILabel                            *hProteinCountLabel;

    // Hourse Slept

@property (weak, nonatomic) IBOutlet UIImageView                        *hourseSleptImageView;
@property (weak, nonatomic) IBOutlet UILabel                            *hourseSleptLabel;
@property (weak, nonatomic) IBOutlet UIView                             *hourseSleptSeparator;
@property (weak, nonatomic) IBOutlet UILabel                            *hourseSleptCountLabel;

    // Carbs consumed

@property (weak, nonatomic) IBOutlet UIImageView                        *carbsConsumedImageView;
@property (weak, nonatomic) IBOutlet UILabel                            *carbsConsumedLabel;
@property (weak, nonatomic) IBOutlet UIView                             *carbsConsumedSeparator;
@property (weak, nonatomic) IBOutlet UILabel                            *carbsConsumedCountLabel;

// Dashboard Self Point

@property(strong, nonatomic) DashboardViewController                    *dashboardSelf;


- (void)loadCellWithData:(UserDaysCards*)data;
- (IBAction)cellflipActionButton:(UIButton *)sender;
- (void)addCellsObservers;
- (void)leftFlip;

@end
