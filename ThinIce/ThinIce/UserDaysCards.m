//
//  UserDaysCards.m
//  ThinIce
//
//  Created by Dima Shapovalov on 25.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "UserDaysCards.h"

#define kcurrentCardsDayID                          @"currentCardsDayID"
#define kCreateDateKey                              @"createDateCards"
#define kTargetTime                                 @"TargetTimeCards"
#define kCurrentTime                                @"CurrentTimeCards"
#define kTemperature                                @"TemperatureCards"
#define kBurntCalories                              @"BurntCaloriesCards"
#define kRecomendationActions                       @"RecomendationActionsCards"


#define RecomendCardTargetTime          60
#define RecomendTemperature             5
#define RecomendBurntCalories           1000

@implementation UserDaysCards

- (instancetype)initCardsWithDaysID:(CardsDaysID)cardsDaysID CurrentCreateDate:(NSDate*)cardsCreateDate {
    
    self = [super init];
    if (self) {
        
        self.currentCardsID             = cardsDaysID;
        self.createCardsDate            = cardsCreateDate;
        self.recomendationDaysActions   = [[RecomendationActions alloc] init];
        self.timeProgress               = [NSNumber numberWithInteger:0];
        [self calculateTargetTimeTemperatureBurntCalories];
    }
    return self;
}

- (void)calculateTargetTimeTemperatureBurntCalories {
    
    // calculate Target Time
    NSDate *mydate                      = [NSDate date];
    NSTimeInterval secondsInEightHours  = RecomendCardTargetTime * 60 * 60;
    NSDate *dateEightHoursAhead         = [mydate dateByAddingTimeInterval:secondsInEightHours];
    
    self.targetTime                     = dateEightHoursAhead;
    
    // calculate Recomend Temperature
    
    self.temperature                    = [NSNumber numberWithInteger:RecomendTemperature];
    
    // calculate Recomend Temperature
    
    self.burntCalories                  = [NSNumber numberWithInteger:RecomendBurntCalories];
}

- (void)changeTemperatureWithValue:(NSNumber*)temperatureValue {
    
    self.temperature = temperatureValue;
    
}

- (void)changeCurrentTimeWithTimer {
    
  //  self.currentTime
}

- (void)changeCardsRecomendationActionsGymSession:(NSNumber*)gymSession WaterIntake:(NSNumber*)waterIntake JunkFood:(NSNumber*)junkFood Hprotein:(NSNumber*)hprotein HoursSlept:(NSNumber*)hoursSlept CarbsConsumed:(NSNumber*)carbsConsumed {
    
    self.recomendationDaysActions.gymSession    = gymSession;
    self.recomendationDaysActions.waterIntake   = waterIntake;
    self.recomendationDaysActions.junkFood      = junkFood;
    self.recomendationDaysActions.hProtein      = hprotein;
    self.recomendationDaysActions.hoursSlept    = hoursSlept;
    self.recomendationDaysActions.carbsConsumed = carbsConsumed;
}


- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        
        self.currentCardsID             = [aDecoder decodeIntegerForKey:kcurrentCardsDayID];
        self.createCardsDate            = [aDecoder decodeObjectForKey:kCreateDateKey];
        self.targetTime                 = [aDecoder decodeObjectForKey:kTargetTime];
        self.currentTime                = [aDecoder decodeObjectForKey:kCurrentTime];
        self.temperature                = [aDecoder decodeObjectForKey:kTemperature];
        self.burntCalories              = [aDecoder decodeObjectForKey:kBurntCalories];
        self.recomendationDaysActions   = [aDecoder decodeObjectForKey:kRecomendationActions];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeInteger:self.currentCardsID forKey:kcurrentCardsDayID];
    [encoder encodeObject:self.createCardsDate forKey:kCreateDateKey];
    [encoder encodeObject:self.targetTime forKey:kTargetTime];
    [encoder encodeObject:self.currentTime forKey:kCurrentTime];
    [encoder encodeObject:self.temperature forKey:kTemperature];
    [encoder encodeObject:self.burntCalories forKey:kBurntCalories];
    [encoder encodeObject:self.recomendationDaysActions forKey:kRecomendationActions];
}

@end
