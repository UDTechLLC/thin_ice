//
//  AchievementsInfo.m
//  ThinIce
//
//  Created by Dima Shapovalov on 14.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "AchievementsInfo.h"

// Achievements rules

#define FreshStart30minutes                     30                  // You used Thin Ice clothing for your very first 30 minutes!
#define MovingForward10hours                    600                 // You have used Thin Ice clothing for 10 hours!
#define TheMotivated100hours                    6000                // You have used Thin Ice clothing for 100 hours!
#define TheEnthusiast500hours                   30000               // You have used Thin Ice clothing for 500 hours!
#define TheMarathoner1000hours                  60000               // You have used Thin Ice clothing for 1000 hours!

#define TheDabblerSuccessfully                  1                   // You have successfully created a personal goal!
#define TheSchemerSuccessfully                  5                   // You have successfully created 5 personal goals!
#define TheStrategistSuccessfully               20                  // You have successfully created 20 personal goals!

#define FirestarterBurnt                        100                 // You have burnt your first 100 calories with Thin Ice clothing!
#define FeelinTheBurnBurnt                      1000                // You have burnt 1000 calories with Thin Ice clothing!
#define GettinLeanBurnt                         10000               // You have burnt 10,000 calories with Thin Ice clothing!
#define SeeingResultsBurnt                      50000               // You have burnt 50,000 calories with Thin Ice clothing!

#define TheButtonPresserSettings                1                 // You have changed a setting!

#define FreshFaceFirstProfile                   1                   // You have registered your first Thin Ice profile!

#define TheTrackerTrackingScreen                5                   // You’ve checked the tracking screen 5 times!
#define ResultsOrientedTrackingScreen           50                  // You’ve checked the tracking screen 50 times!
#define ResultsObsessedTrackingScreen           500                 // You’ve checked the tracking screen 500 times!

#define AchievementFALSE                        NO

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
    @"Firestarter_", @"FeelintheBurn_", @"GettinLean_",@"SeeingResults_",
    @"TheButtonPresser_", @"FreshFace_", @"TheTracker_", @"ResultsOriented_",
    @"ResultsObsessed_"
};

static NSString * const kAchievementsbigPicNames[] = {
    @"FreshStart_unlocked_", @"MovingForward_unlocked_", @"TheMotivated_unlocked_", @"TheEnthusiast_unlocked_",
    @"TheMarathoner_unlocked_", @"TheDabbler_unlocked_", @"TheSchemer_unlocked_", @"TheStrategist_unlocked_",
    @"Firestarter_unlocked_", @"FellingTheBurn_unlocked_", @"GettinLean_unlocked_",@"SeeingResults_unlocked_",
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

@interface AchievementsInfo ()

@property (strong, nonatomic) NSMutableArray       *achievements;

@end

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
        
        Achievement * newAchievement        = [[Achievement alloc] initWithAchievementsID:[NSString stringWithFormat:@"%@", [NSNumber numberWithInt: i]]
                                                                                     Name:kAchievementsNames[i]
                                                                                 Progress:[NSString stringWithFormat:@"%@", [NSNumber numberWithInt: 0]]
                                                                                  picName:kAchievementsPicNames[i]
                                                                                 IsEnable:NO
                                                                              Description:kAchievementsDescriptions[i]
                                                                               BigPicture:kAchievementsbigPicNames[i]];
        [achievementsArray addObject:newAchievement];
    }
    
    [AccountInfoManager sharedManager].userToken.userAchievements = [NSKeyedArchiver archivedDataWithRootObject:achievementsArray];
    [achievementsContext MR_saveToPersistentStoreAndWait];
}

- (void)addValueToAchievement:(NSInteger)achievement Progress:(NSNumber*)value {
    
    [self checkAchievementsStatusWithAchievement: achievement Progress: value];
}

- (void)checkAchievementsStatusWithAchievement:(NSInteger)achievement Progress:(NSNumber*)progressValue {

    NSManagedObjectContext *contextForSave                          = [NSManagedObjectContext MR_defaultContext];
    NSMutableArray *arrayForChanges                                 = [[NSMutableArray alloc] init];
    arrayForChanges                                                 = [NSKeyedUnarchiver unarchiveObjectWithData: [AccountInfoManager sharedManager].userToken.userAchievements];
    Achievement *achievementObject                                  = [arrayForChanges objectAtIndex:achievement];
    achievementObject.achievementProgress                           = [NSString stringWithFormat:@"%d", (int)[achievementObject.achievementProgress integerValue] + (int)[progressValue integerValue]];
    
    switch (achievement) {
        case FreshStart:
        {
            if([achievementObject.achievementProgress integerValue] == FreshStart30minutes && achievementObject.achievementIsEnable == AchievementFALSE) {
                achievementObject.achievementIsEnable = YES;
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: achievementObject];
            }
        }
            break;
        case MovingForward:
        {
            if([achievementObject.achievementProgress integerValue] == MovingForward10hours && achievementObject.achievementIsEnable == AchievementFALSE) {
                achievementObject.achievementIsEnable = YES;
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: achievementObject];
            }
        }
            break;
        case TheMotivated:
        {
            if([achievementObject.achievementProgress integerValue] == TheMotivated100hours && achievementObject.achievementIsEnable == AchievementFALSE) {
                achievementObject.achievementIsEnable = YES;
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: achievementObject];
            }
        }
            break;
        case TheEnthusiast:
        {
            if([achievementObject.achievementProgress integerValue] == TheEnthusiast500hours && achievementObject.achievementIsEnable == AchievementFALSE) {
                achievementObject.achievementIsEnable = YES;
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: achievementObject];
            }
        }
            break;
        case TheMarathoner:
        {
            if([achievementObject.achievementProgress integerValue] == TheMarathoner1000hours && achievementObject.achievementIsEnable == AchievementFALSE) {
                achievementObject.achievementIsEnable = YES;
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: achievementObject];
            }
        }
            break;
        case TheDabbler:
        {
            if([achievementObject.achievementProgress integerValue] == TheDabblerSuccessfully && achievementObject.achievementIsEnable == AchievementFALSE) {
                achievementObject.achievementIsEnable = YES;
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: achievementObject];
            }
        }
            break;
        case TheSchemer:
        {
            if([achievementObject.achievementProgress integerValue] == TheSchemerSuccessfully && achievementObject.achievementIsEnable == AchievementFALSE) {
                achievementObject.achievementIsEnable = YES;
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: achievementObject];
            }
        }
            break;
        case TheStrategist:
        {
            if([achievementObject.achievementProgress integerValue] == TheStrategistSuccessfully && achievementObject.achievementIsEnable == AchievementFALSE) {
                achievementObject.achievementIsEnable = YES;
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: achievementObject];
            }
        }
            break;
        case Firestarter:
        {
            if([achievementObject.achievementProgress integerValue] == FirestarterBurnt && achievementObject.achievementIsEnable == AchievementFALSE) {
                achievementObject.achievementIsEnable = YES;
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: achievementObject];
            }
        }
            break;
        case FeelintheBurn:
        {
            if([achievementObject.achievementProgress integerValue] == FeelinTheBurnBurnt && achievementObject.achievementIsEnable == AchievementFALSE) {
                achievementObject.achievementIsEnable = YES;
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: achievementObject];
            }
        }
            break;
        case GettinLean:
        {
            if([achievementObject.achievementProgress integerValue] == GettinLeanBurnt && achievementObject.achievementIsEnable == AchievementFALSE) {
                achievementObject.achievementIsEnable = YES;
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: achievementObject];
            }
        }
            break;
        case SeeingResults:
        {
            if([achievementObject.achievementProgress integerValue] == SeeingResultsBurnt && achievementObject.achievementIsEnable == AchievementFALSE) {
                achievementObject.achievementIsEnable = YES;
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: achievementObject];
            }
        }
            break;
        case TheButtonPresser:
        {
            if([achievementObject.achievementProgress integerValue] == TheButtonPresserSettings && achievementObject.achievementIsEnable == AchievementFALSE) {
                achievementObject.achievementIsEnable = YES;
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: achievementObject];
            }
        }
            break;
        case FreshFace:
        {
            if([achievementObject.achievementProgress integerValue] == FreshFaceFirstProfile && achievementObject.achievementIsEnable == AchievementFALSE) {
                achievementObject.achievementIsEnable = YES;
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: achievementObject];
            }
        }
            break;
        case TheTracker:
        {
            if([achievementObject.achievementProgress integerValue] == TheTrackerTrackingScreen && achievementObject.achievementIsEnable == AchievementFALSE) {
                achievementObject.achievementIsEnable = YES;
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: achievementObject];
            }
        }
            break;
        case ResultsOriented:
        {
            if([achievementObject.achievementProgress integerValue] == ResultsOrientedTrackingScreen && achievementObject.achievementIsEnable == AchievementFALSE) {
                achievementObject.achievementIsEnable = YES;
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: achievementObject];
            }
        }
            break;
        case ResultsObsessed:
        {
            if([achievementObject.achievementProgress integerValue] == ResultsObsessedTrackingScreen && achievementObject.achievementIsEnable == AchievementFALSE) {
                achievementObject.achievementIsEnable = YES;
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: achievementObject];
            }
        }
            break;
        default:
            break;
    }
    
    [arrayForChanges replaceObjectAtIndex:achievement withObject:achievementObject];
    [AccountInfoManager sharedManager].userToken.userAchievements   = [NSKeyedArchiver archivedDataWithRootObject:arrayForChanges];
    
    [contextForSave MR_saveToPersistentStoreAndWait];
}

@end
