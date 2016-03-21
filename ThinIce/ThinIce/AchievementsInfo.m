//
//  AchievementsInfo.m
//  ThinIce
//
//  Created by Dima Shapovalov on 14.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "AchievementsInfo.h"

static NSString * const kAchievementsNames[] = {
    @"Fresh Start", @"Moving Forward", @"The Motivated", @"The Enthusiast",
    @"The Marathoner", @"The Dabbler", @"The Schemer", @"The Strategist",
    @"Firestarter", @"Feelin’ the Burn", @"Gettin’ Lean",@"Seeing Results!",
    @"The Button Presser", @"Fresh Face", @"The Tracker", @"Results Oriented",
    @"Results Obsessed"
};

static NSString * const kAchievementsPicNames[] = {
    @"freshStart_", @"MovingForward_", @"TheMotivated_", @"TheEnthusiast_",
    @"TheMarathoner_", @"TheDabbler_", @"TheSchemer_", @"TheStrategist_",
    @"Firestarter_", @"FeelinTheBurn_", @"GettinLean_",@"SeeingResults_",
    @"TheButtonPresser_", @"FreshFace_", @"TheTracker_", @"ResultsOriented_",
    @"ResultsObsessed_"
};

static NSString * const kAchievementsbigPicNames[] = {
    @"FreshStart_unlocked_", @"MovingForward_unlocked_", @"TheMotivated_unlocked_", @"TheEnthusiast_unlocked_",
    @"TheMarathoner_unlocked_", @"TheDabbler_unlocked_", @"TheSchemer_unlocked_", @"TheStrategist_unlocked_",
    @"Firestarter_unlocked_", @"FeelinTheBurn_unlocked_", @"GettinLean_unlocked_",@"SeeingResults_unlocked_",
    @"TheButtonPresser_unlocked_", @"FreshFace_unlocked_", @"TheTracker_unlocked_", @"ResultsOriented_unlocked_",
    @"ResultsObsessed_unlocked_"
};

static NSString * const kAchievementsDescriptions[] = {
    @"You used Thin Ice clothing for your very first 30 minutes!",
    @"You have used Thin Ice clothing for 10 hours!",
    @"You have used Thin Ice clothing for 100 hours!",
    @"You have used Thin Ice clothing for 500 hours!",
    @"You have used Thin Ice clothing for 1000 hours!",
    @"You have successfully created a personal goal!",
    @"You have successfully created 5 personal goals!",
    @"You have successfully created 20 personal goals!",
    @"You have burnt your first 100 calories with Thin Ice clothing!",
    @"You have burnt 1000 calories with Thin Ice clothing!",
    @"You have burnt 10,000 calories with Thin Ice clothing!",
    @"You have burnt 50,000 calories with Thin Ice clothing!",
    @"You have changed a setting!",
    @"You have registered your first Thin Ice profile!",
    @"You’ve checked the tracking screen 5 times!",
    @"You’ve checked the tracking screen 50 times!",
    @"You’ve checked the tracking screen 500 times!"
};

@implementation AchievementsInfo

- (id)init {
    
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (void)createNSArrayAchievements {

    NSManagedObjectContext  *achievementsContext = [NSManagedObjectContext MR_defaultContext];
    NSMutableArray          *achievementsArray = [[NSMutableArray alloc] init];
    
    for (int i = FreshStart ; i <= ResultsObsessed; i ++) {
        
        UserAchievements *achievement = [UserAchievements MR_createEntityInContext: achievementsContext];
        achievement.achivment_addStatus = [NSNumber numberWithBool:NO];
        achievement.achivment_id = [NSNumber numberWithInt:i];
        achievement.achivment_progress = [NSNumber numberWithInt:0];
        
        [achievementsArray addObject:achievement];
    }
    
    [AccountInfoManager sharedManager].userToken.userAchievements = achievementsArray;
    
    [achievementsContext MR_saveToPersistentStoreAndWait];
    
    
}

- (void)loadNSArrayAchievements {
    
    NSMutableArray *currentArrayAhievements = [[NSMutableArray alloc] init];
    
    Achievement *newAchievement;
    
    for (UserAchievements *object in [AccountInfoManager sharedManager].userToken.userAchievements) {
        
        newAchievement                      = [[Achievement alloc] initWithAchievementsID:[NSString stringWithFormat:@"%@", object.achivment_id]
                                                                                     Name:kAchievementsNames[[object.achivment_id intValue]]
                                                                                 Progress:[NSString stringWithFormat:@"%@", object.achivment_progress]
                                                                                  picName:kAchievementsPicNames[[object.achivment_id intValue]]
                                                                                 IsEnable:[object.achivment_addStatus boolValue]
                                                                              Description:kAchievementsDescriptions[[object.achivment_id intValue]]
                                                                               BigPicture:kAchievementsbigPicNames[[object.achivment_id intValue]]];
        
        [currentArrayAhievements addObject:newAchievement];
        newAchievement                      = nil;
    }
}

@end
