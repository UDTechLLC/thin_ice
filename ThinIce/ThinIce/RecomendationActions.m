//
//  RecomendationActions.m
//  ThinIce
//
//  Created by Dima Shapovalov on 25.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "RecomendationActions.h"

#define kGymSessionKey          @"GymSessionKey"
#define kWaterIntakeKey         @"kWaterIntakeKey"
#define kJunkFoodKey            @"kJunkFoodKey"
#define kHProteinKey            @"kHProteinKey"
#define kHoursSleptKey          @"HoursSleptKey"
#define kCarbsConsumedKey       @"CarbsConsumedKey"

@implementation RecomendationActions

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.gymSession             = [NSNumber numberWithFloat:0];
        self.waterIntake            = [NSNumber numberWithFloat:0];
        self.junkFood               = [NSNumber numberWithFloat:0];
        self.hProtein               = [NSNumber numberWithFloat:0];
        self.hoursSlept             = [NSNumber numberWithFloat:0];
        self.carbsConsumed          = [NSNumber numberWithFloat:0];
    }
    return self;
}



- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        
        self.gymSession             = [aDecoder decodeObjectForKey:kGymSessionKey];
        self.waterIntake            = [aDecoder decodeObjectForKey:kWaterIntakeKey];
        self.junkFood               = [aDecoder decodeObjectForKey:kJunkFoodKey];
        self.hProtein               = [aDecoder decodeObjectForKey:kHProteinKey];
        self.hoursSlept             = [aDecoder decodeObjectForKey:kHoursSleptKey];
        self.carbsConsumed          = [aDecoder decodeObjectForKey:kCarbsConsumedKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeObject:self.gymSession forKey:kGymSessionKey];
    [encoder encodeObject:self.waterIntake forKey:kWaterIntakeKey];
    [encoder encodeObject:self.junkFood forKey:kJunkFoodKey];
    [encoder encodeObject:self.hProtein forKey:kHProteinKey];
    [encoder encodeObject:self.hoursSlept forKey:kHoursSleptKey];
    [encoder encodeObject:self.carbsConsumed forKey:kCarbsConsumedKey];
}


@end
