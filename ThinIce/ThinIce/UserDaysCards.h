//
//  UserDaysCards.h
//  ThinIce
//
//  Created by Dima Shapovalov on 25.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RecomendationActions.h"

typedef NS_ENUM(NSInteger, CardsDaysID) {
    
    Monday,
    Tuesday,
    Wednesday,
    Thursday,
    Friday,
    Saturday,
    Sunday
    
};

@interface UserDaysCards : NSObject <NSCoding>

@property (nonatomic) CardsDaysID                       currentCardsID;
@property (strong, nonatomic) NSDate                    *createCardsDate;
@property (nonatomic) NSTimeInterval                    targetTime;
@property (nonatomic) NSTimeInterval                    currentTime;
@property (strong, nonatomic) NSNumber                  *temperature;
@property (strong, nonatomic) NSNumber                  *timeProgress;
@property (strong, nonatomic) NSNumber                  *burntCalories;
@property (strong, nonatomic) RecomendationActions      *recomendationDaysActions;

- (instancetype)initCardsWithDaysID:(CardsDaysID)cardsDaysID
                  CurrentCreateDate:(NSDate*)cardsCreateDate;

- (void)changeCardsRecomendationActionsGymSession:(NSNumber*)gymSession
                                      WaterIntake:(NSNumber*)waterIntake
                                         JunkFood:(NSNumber*)junkFood
                                         Hprotein:(NSNumber*)hprotein
                                       HoursSlept:(NSNumber*)hoursSlept
                                    CarbsConsumed:(NSNumber*)carbsConsumed;


- (void)changeTemperatureWithValue:(NSNumber*)temperatureValue;
- (void)changeCurrentTimeWithTimer;


- (id)initWithCoder:(NSCoder *)aDecoder;
- (void)encodeWithCoder:(NSCoder *)encoder;

@end
