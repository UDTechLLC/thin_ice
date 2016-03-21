//
//  Achievement.m
//  ThinIce
//
//  Created by Dima Shapovalov on 21.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "Achievement.h"

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
@end
