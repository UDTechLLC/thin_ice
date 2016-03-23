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

#define TheButtonPresserSettings                [NSNumber numberWithFloat:1.0]                 // You have changed a setting!

#define FreshFaceFirstProfile                   1                   // You have registered your first Thin Ice profile!

#define TheTrackerTrackingScreen                5                   // You’ve checked the tracking screen 5 times!
#define ResultsOrientedTrackingScreen           50                  // You’ve checked the tracking screen 50 times!
#define ResultsObsessedTrackingScreen           500                 // You’ve checked the tracking screen 500 times!

#define AchievementFALSE                        0

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
        [achievement setAchivment_addStatus: [NSNumber numberWithBool:NO]];
        [achievement setAchivment_id: [NSNumber numberWithInt:i]];
        [achievement setAchivment_progress: [NSNumber numberWithInt:0]];
        [achievementsArray addObject:achievement];
    }
    
    [AccountInfoManager sharedManager].userToken.userAchievements = achievementsArray;
    [self loadNSArrayAchievements];
}

- (void)loadNSArrayAchievements {
    
    NSArray *arrayAchiv                     = [[NSArray alloc] initWithArray: [AccountInfoManager sharedManager].userToken.userAchievements];
    NSMutableArray *currentArrayAhievements = [[NSMutableArray alloc] init];

    for (UserAchievements *object in arrayAchiv) {
        
        Achievement * newAchievement        = [[Achievement alloc] initWithAchievementsID:[NSString stringWithFormat:@"%@", object.achivment_id]
                                                                                     Name:kAchievementsNames[[object.achivment_id intValue]]
                                                                                 Progress:[NSString stringWithFormat:@"%@", object.achivment_progress]
                                                                                  picName:kAchievementsPicNames[[object.achivment_id intValue]]
                                                                                 IsEnable: [object achivment_addStatusValue]
                                                                              Description:kAchievementsDescriptions[[object.achivment_id intValue]]
                                                                               BigPicture:kAchievementsbigPicNames[[object.achivment_id intValue]]];
        
        [currentArrayAhievements addObject:newAchievement];
    }
    self.achievements = [NSMutableArray arrayWithArray:currentArrayAhievements];
}

//- (User*)findUserInDataBase {
//    
//    NSPredicate         *peopleFilterWithKey            = [NSPredicate predicateWithFormat:@"socialityKey == %@", [AccountInfoManager sharedManager].userSavedInHomeDirectory.savedSocialityKey];
//    NSFetchRequest      *peopleRequest                  = [User MR_requestAllWithPredicate:peopleFilterWithKey];
//    NSArray             *filteredUser                   = [User MR_executeFetchRequest:peopleRequest];
//    
//    if(filteredUser.count > 0) {
//        
//        return [filteredUser firstObject];
//    } else {
//        
//        return nil;
//    }
//}

//- (UserAchievements*)findUserAchievementInDataBaseWithID:(NSInteger)achievement_ID {
//    
//    NSPredicate         *peopleFilterWithKey            = [NSPredicate predicateWithFormat:@"achivment_id == %d", achievement_ID];
//    NSFetchRequest      *peopleRequest                  = [UserAchievements MR_requestAllWithPredicate:peopleFilterWithKey];
//    NSArray             *filteredUser                   = [UserAchievements MR_executeFetchRequest:peopleRequest];
//    
//    if(filteredUser.count > 0) {
//        
//        return [filteredUser firstObject];
//    } else {
//        
//        return nil;
//    }
//}

- (void)findUserAchievementInDataBaseWithID:(NSInteger)achievement_ID {
    
    NSPredicate         *peopleFilterWithKey            = [NSPredicate predicateWithFormat:@"achivment_id == %d", achievement_ID];
    NSFetchRequest      *peopleRequest                  = [UserAchievements MR_requestAllWithPredicate:peopleFilterWithKey];
    NSArray             *filteredUser                   = [UserAchievements MR_executeFetchRequest:peopleRequest];
    
    NSLog(@"filteredUser - %d", (int)filteredUser.count);

}

- (void)addValueToAchievement:(NSInteger)achievement Progress:(NSNumber*)value {
    
    NSLog(@"before");
    [self findUserAchievementInDataBaseWithID: achievement];
    //UserAchievements *achievementObject = (UserAchievements*)[AccountInfoManager sharedManager].userToken.userAchievements[achievement]; //[self findUserAchievementInDataBaseWithID: achievement];
    //((UserAchievements*)[AccountInfoManager sharedManager].userToken.userAchievements[achievement]).achivment_progress = [NSNumber numberWithInteger:([((UserAchievements*)[AccountInfoManager sharedManager].userToken.userAchievements[achievement]).achivment_progress integerValue] + [value integerValue])];
    
    UserAchievements *person = [UserAchievements MR_findFirstByAttribute:@"achivment_id"
                                                               withValue: [NSString stringWithFormat:@"%d", (int)achievement]];
    person.achivment_progress = [NSNumber numberWithInteger:([person.achivment_progress integerValue] + [value integerValue])];

    
    NSLog(@"after");
    [self findUserAchievementInDataBaseWithID: achievement];
    //NSLog(@"[achievementObject.achivment_progress integerValue] + [value integerValue]) - %@", achievementObject.achivment_progress);
    [self checkAchievementsStatusWithAchievement: achievement];
}

- (void)checkAchievementsStatusWithAchievement:(NSInteger)achievement {

    UserAchievements *achievementObject = [AccountInfoManager sharedManager].userToken.userAchievements[achievement]; //[self findUserAchievementInDataBaseWithID: achievement];
    
    switch (achievement) {
        case FreshStart:
        {
            if([achievementObject.achivment_progress integerValue] == FreshStart30minutes && achievementObject.achivment_addStatus == AchievementFALSE) {
                achievementObject.achivment_addStatus = [NSNumber numberWithBool:YES];
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: [self.achievements objectAtIndex:achievement]];
            }
        }
            break;
        case MovingForward:
        {
            if([achievementObject.achivment_progress integerValue] == MovingForward10hours && achievementObject.achivment_addStatus == AchievementFALSE) {
                achievementObject.achivment_addStatus = [NSNumber numberWithBool:YES];
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: [self.achievements objectAtIndex:achievement]];
            }
        }
            break;
        case TheMotivated:
        {
            if([achievementObject.achivment_progress integerValue] == TheMotivated100hours && achievementObject.achivment_addStatus == AchievementFALSE) {
                achievementObject.achivment_addStatus = [NSNumber numberWithBool:YES];
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: [self.achievements objectAtIndex:achievement]];
            }
        }
            break;
        case TheEnthusiast:
        {
            if([achievementObject.achivment_progress integerValue] == TheEnthusiast500hours && achievementObject.achivment_addStatus == AchievementFALSE) {
                achievementObject.achivment_addStatus = [NSNumber numberWithBool:YES];
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: [self.achievements objectAtIndex:achievement]];
            }
        }
            break;
        case TheMarathoner:
        {
            if([achievementObject.achivment_progress integerValue] == TheMarathoner1000hours && achievementObject.achivment_addStatus == AchievementFALSE) {
                achievementObject.achivment_addStatus = [NSNumber numberWithBool:YES];
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: [self.achievements objectAtIndex:achievement]];
            }
        }
            break;
        case TheDabbler:
        {
            if([achievementObject.achivment_progress integerValue] == TheDabblerSuccessfully && achievementObject.achivment_addStatus == AchievementFALSE) {
                achievementObject.achivment_addStatus = [NSNumber numberWithBool:YES];
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: [self.achievements objectAtIndex:achievement]];
            }
        }
            break;
        case TheSchemer:
        {
            if([achievementObject.achivment_progress integerValue] == TheSchemerSuccessfully && achievementObject.achivment_addStatus == AchievementFALSE) {
                achievementObject.achivment_addStatus = [NSNumber numberWithBool:YES];
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: [self.achievements objectAtIndex:achievement]];
            }
        }
            break;
        case TheStrategist:
        {
            if([achievementObject.achivment_progress integerValue] == TheStrategistSuccessfully && achievementObject.achivment_addStatus == AchievementFALSE) {
                achievementObject.achivment_addStatus = [NSNumber numberWithBool:YES];
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: [self.achievements objectAtIndex:achievement]];
            }
        }
            break;
        case Firestarter:
        {
            if([achievementObject.achivment_progress integerValue] == FirestarterBurnt && achievementObject.achivment_addStatus == AchievementFALSE) {
                achievementObject.achivment_addStatus = [NSNumber numberWithBool:YES];
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: [self.achievements objectAtIndex:achievement]];
            }
        }
            break;
        case FeelintheBurn:
        {
            if([achievementObject.achivment_progress integerValue] == FeelinTheBurnBurnt && achievementObject.achivment_addStatus == AchievementFALSE) {
                achievementObject.achivment_addStatus = [NSNumber numberWithBool:YES];
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: [self.achievements objectAtIndex:achievement]];
            }
        }
            break;
        case GettinLean:
        {
            if([achievementObject.achivment_progress integerValue] == GettinLeanBurnt && achievementObject.achivment_addStatus == AchievementFALSE) {
                achievementObject.achivment_addStatus = [NSNumber numberWithBool:YES];
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: [self.achievements objectAtIndex:achievement]];
            }
        }
            break;
        case SeeingResults:
        {
            if([achievementObject.achivment_progress integerValue] == SeeingResultsBurnt && achievementObject.achivment_addStatus == AchievementFALSE) {
                achievementObject.achivment_addStatus = [NSNumber numberWithBool:YES];
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: [self.achievements objectAtIndex:achievement]];
            }
        }
            break;
        case TheButtonPresser:
        {
            
            
            
            
            
            if(achievementObject.achivment_progress == TheButtonPresserSettings && [achievementObject primitiveAchivment_addStatus]) {
            
                achievementObject.achivment_addStatus = [NSNumber numberWithBool:YES];
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: [self.achievements objectAtIndex:achievement]];
            }
//            
//            
//            NSLog(@"-------------------------------------");
//            NSManagedObjectContext  *achievementsContext = [NSManagedObjectContext MR_defaultContext];
//            
//            
//            User *user = [self findUserInDataBase];
//            [user.userAchievements replaceObjectAtIndex:TheButtonPresser withObject:achievementObject];
//            [achievementsContext MR_saveToPersistentStoreAndWait];
//            
//            User *useri = [self findUserInDataBase];
//            NSLog(@"LOAD - %@ %@", ((UserAchievements*)[useri.userAchievements objectAtIndex:TheButtonPresser]).achivment_progress, ((UserAchievements*)[useri.userAchievements objectAtIndex:TheButtonPresser]).achivment_id);
//            
            
        }
            break;
        case FreshFace:
        {
            if([achievementObject.achivment_progress integerValue] == FreshFaceFirstProfile && achievementObject.achivment_addStatus == AchievementFALSE) {
                achievementObject.achivment_addStatus = [NSNumber numberWithBool:YES];
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: [self.achievements objectAtIndex:achievement]];
            }
        }
            break;
        case TheTracker:
        {
            if([achievementObject.achivment_progress integerValue] == TheTrackerTrackingScreen && achievementObject.achivment_addStatus == AchievementFALSE) {
                achievementObject.achivment_addStatus = [NSNumber numberWithBool:YES];
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: [self.achievements objectAtIndex:achievement]];
            }
        }
            break;
        case ResultsOriented:
        {
            if([achievementObject.achivment_progress integerValue] == ResultsOrientedTrackingScreen && [achievementObject achivment_addStatusValue] == NO) {
                achievementObject.achivment_addStatus = [NSNumber numberWithBool:YES];
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: [self.achievements objectAtIndex:achievement]];
            }
        }
            break;
        case ResultsObsessed:
        {
            if([achievementObject.achivment_progress integerValue] == ResultsObsessedTrackingScreen && achievementObject.achivment_addStatus == AchievementFALSE) {
                achievementObject.achivment_addStatus = [NSNumber numberWithBool:YES];
                [[AchievementsUnlockerManager sharedManager] showPresentationAchievementsViewControllerWithCurrentAchievement: [self.achievements objectAtIndex:achievement]];
            }
        }
            break;
        default:
            break;
    }
    
    [self loadNSArrayAchievements];
}

@end
