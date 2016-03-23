#import "_UserAchievements.h"

@interface UserAchievements : _UserAchievements <NSCoding> {}
// Custom logic goes here.

- (id)initWithCoder:(NSCoder *)aDecoder;
- (void)encodeWithCoder:(NSCoder *)encoder;

@end
