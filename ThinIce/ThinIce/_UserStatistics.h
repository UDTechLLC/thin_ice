// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to UserStatistics.h instead.

#import <CoreData/CoreData.h>

extern const struct UserStatisticsAttributes {
	__unsafe_unretained NSString *dateOfEndSessions;
	__unsafe_unretained NSString *userSessions;
} UserStatisticsAttributes;

extern const struct UserStatisticsRelationships {
	__unsafe_unretained NSString *user;
} UserStatisticsRelationships;

@class User;

@class NSObject;

@interface UserStatisticsID : NSManagedObjectID {}
@end

@interface _UserStatistics : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) UserStatisticsID* objectID;

@property (nonatomic, strong) NSDate* dateOfEndSessions;

//- (BOOL)validateDateOfEndSessions:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) id userSessions;

//- (BOOL)validateUserSessions:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) User *user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;

@end

@interface _UserStatistics (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveDateOfEndSessions;
- (void)setPrimitiveDateOfEndSessions:(NSDate*)value;

- (id)primitiveUserSessions;
- (void)setPrimitiveUserSessions:(id)value;

- (User*)primitiveUser;
- (void)setPrimitiveUser:(User*)value;

@end
