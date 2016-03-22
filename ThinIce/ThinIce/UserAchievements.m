#import "UserAchievements.h"

#define kAhievements_addStatus_EntityKey                    @"achivment_addStatus"
#define kAhievements_ID_EntityKey                           @"achivment_id"
#define kAhievements_Progress_EntityKey                     @"achivment_progress"

@interface UserAchievements ()

// Private interface goes here.

@end

@implementation UserAchievements

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        
        self.achivment_addStatus    = [aDecoder decodeObjectForKey:kAhievements_addStatus_EntityKey];
        self.achivment_id           = [aDecoder decodeObjectForKey:kAhievements_ID_EntityKey];
        self.achivment_progress     = [aDecoder decodeObjectForKey:kAhievements_Progress_EntityKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeObject:self.achivment_addStatus forKey:kAhievements_addStatus_EntityKey];
    [encoder encodeObject:self.achivment_id forKey:kAhievements_ID_EntityKey];
    [encoder encodeObject:self.achivment_progress forKey:kAhievements_Progress_EntityKey];
}

@end
