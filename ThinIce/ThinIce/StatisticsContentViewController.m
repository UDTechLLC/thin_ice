//
//  WeekContentViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 02.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "StatisticsContentViewController.h"
#import "KNCirclePercentView.h"

@interface StatisticsContentViewController () {
    BOOL                                                        isEndAnimation;
    
    NSNumber                                                    *doneCirclePercent;
    NSString                                                    *doneLabelString;
    NSString                                                    *plannedLabelString;
    NSString                                                    *burntCaloriesLabelString;
    NSString                                                    *avgTempString;
}

// Circle Statistics Block

@property (weak, nonatomic) IBOutlet KNCirclePercentView        *autoCalculateCircleView;

    // Done Block
@property (weak, nonatomic) IBOutlet UILabel                    *doneLabel;
@property (weak, nonatomic) IBOutlet UIView                     *doneSeparator;
@property (weak, nonatomic) IBOutlet UILabel                    *doneLabelCountHrs;

    // Planned Block
@property (weak, nonatomic) IBOutlet UILabel                    *plannedLabel;
@property (weak, nonatomic) IBOutlet UIView                     *plannedSeparator;
@property (weak, nonatomic) IBOutlet UILabel                    *plannedLabelCountHrs;

// Burnt Cal Block
@property (weak, nonatomic) IBOutlet UILabel                    *burntLabel;
@property (weak, nonatomic) IBOutlet UIImageView                *burntImageView;
@property (weak, nonatomic) IBOutlet UIView                     *burntSeparator;
@property (weak, nonatomic) IBOutlet UILabel                    *burntLabelCountCal;

// AVG Temp
@property (weak, nonatomic) IBOutlet UILabel                    *avgLabel;
@property (weak, nonatomic) IBOutlet UIImageView                *avgImageView;
@property (weak, nonatomic) IBOutlet UIView                     *avgSeparator;
@property (weak, nonatomic) IBOutlet UILabel                    *avgLabelCount;

@end

@implementation StatisticsContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createStatisticViewController];
}

- (void)viewDidAppear:(BOOL)animated {
    if(isEndAnimation) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.autoCalculateCircleView startAnimation];
            isEndAnimation = NO;
        });
    }
}

- (void)viewDidLayoutSubviews {
    [self createCircleProgressBar];
}

- (void)createStatisticViewController {
    isEndAnimation = YES;
    self.view.backgroundColor = [UIColor clearColor];
    [self calculateDataViewController];
    [self createCircleViewBlock];
    [self createBurntAndAVGBlock];
}

- (void)createCircleProgressBar {
// Auto calculate radius
    self.autoCalculateCircleView.backgroundColor        = [UIColor clearColor];
    [self.autoCalculateCircleView drawCircleWithPercent:[doneCirclePercent integerValue] duration:0.5 lineWidth:25 clockwise:YES lineCap:kCALineCapRound fillColor:[UIColor clearColor] strokeColor:[UIColor clearColor] animatedColors:@[[[HelperManager sharedServer] colorwithHexString:ColorForStatisticsCircleStateFull alpha: 1.0]]];
    self.autoCalculateCircleView.percentLabel.hidden    = YES;
}

- (void)createCircleViewBlock {

    doneCirclePercent = [NSNumber numberWithInteger:arc4random()%70];
    
// Done Block
    self.doneLabel.text                     = @"Done";
    self.doneLabel.textColor                = [[HelperManager sharedServer] colorwithHexString:ColorForStatisticsCircleStateFull alpha:1.0];
    
    self.doneSeparator.backgroundColor      = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.doneLabelCountHrs.text             = [NSString stringWithFormat:@"%@ hrs", doneLabelString];
    self.doneLabelCountHrs.textColor        = [[HelperManager sharedServer] colorwithHexString:ColorForStatisticsCircleStateFull alpha:1.0];
    
// Planned Block
    self.plannedLabel.text                  = @"Planned";
    self.plannedLabel.textColor             = [[HelperManager sharedServer] colorwithHexString:ColorForStatisticsPlannedLabel alpha:1.0];
    
    self.plannedSeparator.backgroundColor   = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.plannedLabelCountHrs.text          = [NSString stringWithFormat:@"%@ hrs", plannedLabelString];
    self.plannedLabelCountHrs.textColor     = [[HelperManager sharedServer] colorwithHexString:ColorForStatisticsPlannedLabel alpha:1.0];
}

- (void)createBurntAndAVGBlock {
    
// Burnt Cal Block
    self.burntLabel.text                    = @"Burnt Calories";
    self.burntLabel.textColor               = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.burntImageView.image               = [UIImage imageNamed:[NSString stringWithFormat:@"icons_statisticsBurnedCal_%d", (int)kScreenWidth]];
    self.burntImageView.contentMode         = UIViewContentModeCenter;
    
    self.burntSeparator.backgroundColor     = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.burntLabelCountCal.text            = [NSString stringWithFormat:@"%@ cal", doneLabelString];
    self.burntLabelCountCal.textColor       = [[HelperManager sharedServer] colorwithHexString:ColorFromInputTextYELLOW alpha:1.0];
    
// AVG Temp
    self.avgLabel.text                      = @"AVG Temp";
    self.avgLabel.textColor                 = [[HelperManager sharedServer] colorwithHexString:ColorFromPlaceHolderText alpha:1.0];
    
    self.avgImageView.image                 = [UIImage imageNamed:[NSString stringWithFormat:@"icons_statisticstemperature_%d", (int)kScreenWidth]];
    self.avgImageView.contentMode           = UIViewContentModeCenter;
    
    self.avgSeparator.backgroundColor       = [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha:1.0];
    
    self.avgLabelCount.text                 = [NSString stringWithFormat:@"%@ ℃", avgTempString];
    self.avgLabelCount.textColor            = [[HelperManager sharedServer] colorwithHexString:ColorFromInputTextYELLOW alpha:1.0];
}

- (void)calculateDataViewController {
    
    float doneTime      = 0.0;
    float plannedTime   = 0.0;
    float avgTemp       = 0.0;
    float burntCalories = 0.0;
    
    for (UserSession *session in self.dataStatisticArray) {
        
        doneTime        += session.doneTimeValue;
        plannedTime     += session.plannedTimeValue;
        avgTemp         += session.avgTemperatureValue;
        burntCalories   += session.doneTimeValue;
    }
    
    doneTime        = doneTime / self.dataStatisticArray.count;
    plannedTime     = plannedTime / self.dataStatisticArray.count;
    avgTemp         = avgTemp / self.dataStatisticArray.count;
    burntCalories   = burntCalories / self.dataStatisticArray.count;
    
    doneCirclePercent           = [NSNumber numberWithFloat:[self calculateCirclePercentDone:doneTime Planned:plannedTime]];
    doneLabelString             = [NSString stringWithFormat:@"%d", (int)doneTime];
    plannedLabelString          = [NSString stringWithFormat:@"%d", (int)plannedTime];
    burntCaloriesLabelString    = [NSString stringWithFormat:@"%d", (int)burntCalories];
    avgTempString               = [NSString stringWithFormat:@"%d", (int)avgTemp];
}

- (float)calculateCirclePercentDone:(float)doneValue Planned:(float)plannedValue {
    
    return doneValue * 100 / plannedValue;
}

@end
