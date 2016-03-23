//
//  AchievementsInfo.h
//  ThinIce
//
//  Created by Dima Shapovalov on 14.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FreshStart                      0
#define MovingForward                   1
#define TheMotivated                    2
#define TheEnthusiast                   3
#define TheMarathoner                   4
#define TheDabbler                      5
#define TheSchemer                      6
#define TheStrategist                   7
#define Firestarter                     8
#define FeelintheBurn                   9
#define GettinLean                      10
#define SeeingResults                   11
#define TheButtonPresser                12
#define FreshFace                       13
#define TheTracker                      14
#define ResultsOriented                 15
#define ResultsObsessed                 16

@interface AchievementsInfo : NSObject

@property (strong, nonatomic) NSMutableArray       *achievements;


- (void)createNSArrayAchievements;
- (void)loadNSArrayAchievements;
- (void)addValueToAchievement:(NSInteger)achievement Progress:(NSNumber*)value;

@end
