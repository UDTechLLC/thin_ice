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

@implementation AchievementsInfo

- (id)init {
    
    self = [super init];
    if (self) {
        
        [self createNSArrayAchievementsName];
    }
    
    return self;
}

- (void)createNSArrayAchievementsName {
    
    NSMutableArray *tmpAchievementsMutableArray = [[NSMutableArray alloc] init];
    
    for (int i = 0 ; i < AchievementsCount; i ++) {
        
        [tmpAchievementsMutableArray addObject:kAchievementsNames[i]];
    }
    self.achievementName = [NSArray arrayWithArray:tmpAchievementsMutableArray];
}

@end
