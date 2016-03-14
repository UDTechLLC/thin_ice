//
//  AchievemetsUnlockedViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 09.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "AchievemetsUnlockedViewController.h"

@interface AchievemetsUnlockedViewController ()

@property (weak, nonatomic) IBOutlet UIImageView                *picViewer;
@property (weak, nonatomic) IBOutlet UILabel                    *ahievementName;
@property (weak, nonatomic) IBOutlet UILabel                    *achievementDescription;
@property (weak, nonatomic) IBOutlet UILabel                    *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton                   *dismissButton;


@end

@implementation AchievemetsUnlockedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createViewController];
}

- (void)createViewController {
    
    [self addNewAchievementBackgroundImage];
    
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.text = @"Achievements Unlocked!";
    
    self.picViewer.contentMode = UIViewContentModeCenter;
    self.picViewer.image = [UIImage imageNamed: [NSString stringWithFormat:@"badges_%d", (int)kScreenWidth]];
    
    self.ahievementName.textColor = [UIColor whiteColor];
    self.ahievementName.text = @"Newbie";
    
    self.achievementDescription.textColor = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    self.achievementDescription.text = @"Forget those \"Bender\" and \"Crunked\" badges - you've conquered the playground circult!";
    
    self.dismissButton.layer.cornerRadius = 13;
    [self.dismissButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"btn_save_normal_%d", (int)kScreenWidth]] forState:UIControlStateNormal];
    [self.dismissButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"btn_save_active_%d", (int)kScreenWidth]] forState:UIControlStateSelected];
    [self.dismissButton setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat:@"btn_save_active_%d", (int)kScreenWidth]] forState:UIControlStateHighlighted];
    [self.dismissButton setTitle:@"Done" forState:UIControlStateNormal];
}

- (IBAction)dismissButtonHendlier:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
