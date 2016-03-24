//
//  Achievement.m
//  ThinIce
//
//  Created by Dima Shapovalov on 21.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "Achievement.h"

#define NSKeyedArchiverAchievementID            @"KeyedArchiverAchievementID"
#define NSKeyedArchiverAchievementName          @"KeyedArchiverAchievementName"
#define NSKeyedArchiverAchievementProgress      @"KeyedArchiverAchievementProgress"
#define NSKeyedArchiverAchievementPicture       @"KeyedArchiverAchievementPicture"
#define NSKeyedArchiverAchievementIsEnable      @"KeyedArchiverAchievementIsEnable"
#define NSKeyedArchiverAchievementDescription   @"KeyedArchiverAchievementDescription"
#define NSKeyedArchiverAchievementBigPicure     @"KeyedArchiverAchievementBigPicure"

@implementation Achievement

- (instancetype)initWithAchievementsID:(NSString*)ID Name:(NSString*)name Progress:(NSString*)progress picName:(NSString*)pictureName IsEnable:(BOOL)isEnable Description:(NSString*)description BigPicture:(NSString*)bigPic {
    
    self = [super init];
    if (self) {
        
        self.achievementID              = ID;
        self.achievementName            = name;
        self.achievementProgress        = progress;
        self.achievementPicture         = pictureName;
        self.achievementIsEnable        = isEnable;
        self.achievementDescription     = description;
        self.achievementBigPicure       = bigPic;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        
        self.achievementID          = [aDecoder decodeObjectForKey:NSKeyedArchiverAchievementID];
        self.achievementName        = [aDecoder decodeObjectForKey:NSKeyedArchiverAchievementName];
        self.achievementProgress    = [aDecoder decodeObjectForKey:NSKeyedArchiverAchievementProgress];
        self.achievementPicture     = [aDecoder decodeObjectForKey:NSKeyedArchiverAchievementPicture];
        self.achievementIsEnable    = [aDecoder decodeBoolForKey:NSKeyedArchiverAchievementIsEnable];
        self.achievementDescription = [aDecoder decodeObjectForKey:NSKeyedArchiverAchievementDescription];
        self.achievementBigPicure   = [aDecoder decodeObjectForKey:NSKeyedArchiverAchievementBigPicure];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeObject:self.achievementID forKey:NSKeyedArchiverAchievementID];
    [encoder encodeObject:self.achievementName forKey:NSKeyedArchiverAchievementName];
    [encoder encodeObject:self.achievementProgress forKey:NSKeyedArchiverAchievementProgress];
    [encoder encodeObject:self.achievementPicture forKey:NSKeyedArchiverAchievementPicture];
    [encoder encodeBool:self.achievementIsEnable forKey:NSKeyedArchiverAchievementIsEnable];
    [encoder encodeObject:self.achievementDescription forKey:NSKeyedArchiverAchievementDescription];
    [encoder encodeObject:self.achievementBigPicure forKey:NSKeyedArchiverAchievementBigPicure];
}

@end
