//
//  Achievement.h
//  ThinIce
//
//  Created by Dima Shapovalov on 21.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Achievement : NSObject

@property (strong, nonatomic) NSString      *achievementID;
@property (strong, nonatomic) NSString      *achievementName;
@property (strong, nonatomic) NSString      *achievementProgress;
@property (strong, nonatomic) NSString      *achievementPicture;
@property (strong, nonatomic) NSString      *achievementBigPicure;
@property (nonatomic) BOOL                  achievementIsEnable;              // Enable / Disable Achievement
@property (strong, nonatomic) NSString      *achievementDescription;

- (instancetype)initWithAchievementsID:(NSString*)ID Name:(NSString*)name Progress:(NSString*)progress picName:(NSString*)pictureName IsEnable:(BOOL)isEnable Description:(NSString*)description BigPicture:(NSString*)bigPic;

@end
