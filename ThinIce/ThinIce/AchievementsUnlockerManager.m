//
//  AchievementsUnlockerManager.m
//  ThinIce
//
//  Created by Dima Shapovalov on 09.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "AchievementsUnlockerManager.h"

@interface AchievementsUnlockerManager ()

@end

@implementation AchievementsUnlockerManager

+ (AchievementsUnlockerManager *)sharedManager {
    static AchievementsUnlockerManager *instanceAchievementsUnlockerManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instanceAchievementsUnlockerManager = [[self alloc] init];
    });
    return instanceAchievementsUnlockerManager;
}

- (id)init {
    self = [super init];
    if (self) {
        [self showPresentationAchievementsViewController];
    }
    return self;
}

- (void)showPresentationAchievementsViewController {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:kAchievemetsUnlockedViewControllerID];

    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    [[SlideNavigationController sharedInstance] presentViewController:vc animated:YES completion:nil];
}



@end
