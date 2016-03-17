//
//  AchievementsInfo.h
//  ThinIce
//
//  Created by Dima Shapovalov on 14.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, achievementID) {
    FreshStart,
    MovingForward,
    TheMotivated,
    TheEnthusiast,
    TheMarathoner,
    TheDabbler,
    TheSchemer,
    TheStrategist,
    Firestarter,
    FeelintheBurn,
    GettinLean,
    SeeingResults,
    TheButtonPresser,
    FreshFace,
    TheTracker,
    ResultsOriented,
    ResultsObsessed
};

@interface AchievementsInfo : NSObject

@property (strong, nonatomic) NSArray       *achievementName;

@end
