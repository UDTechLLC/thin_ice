//
//  AchievementsUnlockerManager.m
//  ThinIce
//
//  Created by Dima Shapovalov on 09.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "AchievementsUnlockerManager.h"

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

@interface AchievementsUnlockerManager ()

@end

@implementation AchievementsUnlockerManager

+ (AchievementsUnlockerManager *)sharedManager {
    
    static AchievementsUnlockerManager *instanceAchievementsUnlockerManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instanceAchievementsUnlockerManager                                 = [[self alloc] init];
    });
    
    return instanceAchievementsUnlockerManager;
}

- (id)init {
    
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (void)showPresentationAchievementsViewControllerWithCurrentAchievement:(Achievement*)achievement {
    
    UIStoryboard                            *storyboard             = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AchievemetsUnlockedViewController       *vc                     = [storyboard instantiateViewControllerWithIdentifier:kAchievemetsUnlockedViewControllerID];
                                            vc.currentAchievements  = achievement;
    self.modalPresentationStyle                                     = UIModalPresentationCurrentContext;
    [[SlideNavigationController sharedInstance] presentViewController:vc animated:YES completion:nil];
}

@end
