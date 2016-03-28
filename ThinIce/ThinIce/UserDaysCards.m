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


#define RecomendCardTargetTime          1
#define RecomendTemperature             5
#define RecomendBurntCalories           1500

@implementation UserDaysCards

- (instancetype)initCardsWithDaysID:(CardsDaysID)cardsDaysID CurrentCreateDate:(NSDate*)cardsCreateDate {
    
    self = [super init];
    if (self) {
        
        self.currentCardsID             = cardsDaysID;
        self.createCardsDate            = cardsCreateDate;
        self.recomendationDaysActions   = [[RecomendationActions alloc] init];
        self.timeProgress               = [NSNumber numberWithInteger:0];
        [self calculateTargetTimeTemperatureBurntCalories];
        [self changeCurrentTimeWithTimer];
    }
    return self;
}

- (void)calculateTargetTimeTemperatureBurntCalories {
    
    self.targetTime                     = RecomendCardTargetTime * 60 * 60;
    
    // calculate Recomend Temperature
    
    self.temperature                    = [NSNumber numberWithInteger:RecomendTemperature];
    
    // calculate Recomend Temperature
    
    self.burntCalories                  = [NSNumber numberWithInteger:0];
}

- (void)changeTemperatureWithValue:(NSNumber*)temperatureValue {
    
    self.temperature                    = temperatureValue;
    
    self.targetTime                     = 18 * [self.temperature integerValue] * 60;
}

- (void)changeCurrentTimeWithTimer {
    
    [self updateElapsedTimeDisplay];
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
        self.targetTime                 = [aDecoder decodeDoubleForKey:kTargetTime];
        self.currentTime                = [aDecoder decodeDoubleForKey:kCurrentTime];
        self.temperature                = [aDecoder decodeObjectForKey:kTemperature];
        self.burntCalories              = [aDecoder decodeObjectForKey:kBurntCalories];
        self.recomendationDaysActions   = [aDecoder decodeObjectForKey:kRecomendationActions];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeInteger:self.currentCardsID forKey:kcurrentCardsDayID];
    [encoder encodeObject:self.createCardsDate forKey:kCreateDateKey];
    [encoder encodeDouble:self.targetTime forKey:kTargetTime];
    [encoder encodeDouble:self.currentTime forKey:kCurrentTime];
    [encoder encodeObject:self.temperature forKey:kTemperature];
    [encoder encodeObject:self.burntCalories forKey:kBurntCalories];
    [encoder encodeObject:self.recomendationDaysActions forKey:kRecomendationActions];
}

- (void)updateElapsedTimeDisplay {
    
    // You could also have stored the start time using
    // CFAbsoluteTimeGetCurrent()
    NSTimeInterval elapsedTime = [[NSDate date] timeIntervalSinceNow];
    self.currentTime = elapsedTime;
    
    // Divide the interval by 3600 and keep the quotient and remainder
    div_t h = div(elapsedTime, 3600);
    int hours = h.quot;
    // Divide the remainder by 60; the quotient is minutes, the remainder
    // is seconds.
    div_t m = div(h.rem, 60);
    int minutes = m.quot;
    int seconds = m.rem;
    
    // If you want to get the individual digits of the units, use div again
    // with a divisor of 10.
    
    NSLog(@"%d:%d:%d", hours, minutes, seconds);
}

@end
