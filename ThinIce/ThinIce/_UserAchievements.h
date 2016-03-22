// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to UserAchievements.h instead.

#import <CoreData/CoreData.h>

extern const struct UserAchievementsAttributes {
	__unsafe_unretained NSString *achivment_addStatus;
	__unsafe_unretained NSString *achivment_id;
	__unsafe_unretained NSString *achivment_progress;
} UserAchievementsAttributes;

@interface UserAchievementsID : NSManagedObjectID {}
@end

@interface _UserAchievements : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) UserAchievementsID* objectID;

@property (nonatomic, strong) NSNumber* achivment_addStatus;

@property (atomic) BOOL achivment_addStatusValue;
- (BOOL)achivment_addStatusValue;
- (void)setAchivment_addStatusValue:(BOOL)value_;

//- (BOOL)validateAchivment_addStatus:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* achivment_id;

@property (atomic) int32_t achivment_idValue;
- (int32_t)achivment_idValue;
- (void)setAchivment_idValue:(int32_t)value_;

//- (BOOL)validateAchivment_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* achivment_progress;

@property (atomic) float achivment_progressValue;
- (float)achivment_progressValue;
- (void)setAchivment_progressValue:(float)value_;

//- (BOOL)validateAchivment_progress:(id*)value_ error:(NSError**)error_;

@end

@interface _UserAchievements (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveAchivment_addStatus;
- (void)setPrimitiveAchivment_addStatus:(NSNumber*)value;

- (BOOL)primitiveAchivment_addStatusValue;
- (void)setPrimitiveAchivment_addStatusValue:(BOOL)value_;

- (NSNumber*)primitiveAchivment_id;
- (void)setPrimitiveAchivment_id:(NSNumber*)value;

- (int32_t)primitiveAchivment_idValue;
- (void)setPrimitiveAchivment_idValue:(int32_t)value_;

- (NSNumber*)primitiveAchivment_progress;
- (void)setPrimitiveAchivment_progress:(NSNumber*)value;

- (float)primitiveAchivment_progressValue;
- (void)setPrimitiveAchivment_progressValue:(float)value_;

@end
