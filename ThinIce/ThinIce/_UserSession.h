// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to UserSession.h instead.

#import <CoreData/CoreData.h>

extern const struct UserSessionAttributes {
	__unsafe_unretained NSString *avgTemperature;
	__unsafe_unretained NSString *burntCalories;
	__unsafe_unretained NSString *dateOfSessions;
	__unsafe_unretained NSString *doneTime;
	__unsafe_unretained NSString *plannedTime;
} UserSessionAttributes;

@interface UserSessionID : NSManagedObjectID {}
@end

@interface _UserSession : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) UserSessionID* objectID;

@property (nonatomic, strong) NSNumber* avgTemperature;

@property (atomic) float avgTemperatureValue;
- (float)avgTemperatureValue;
- (void)setAvgTemperatureValue:(float)value_;

//- (BOOL)validateAvgTemperature:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* burntCalories;

@property (atomic) float burntCaloriesValue;
- (float)burntCaloriesValue;
- (void)setBurntCaloriesValue:(float)value_;

//- (BOOL)validateBurntCalories:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* dateOfSessions;

//- (BOOL)validateDateOfSessions:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* doneTime;

@property (atomic) float doneTimeValue;
- (float)doneTimeValue;
- (void)setDoneTimeValue:(float)value_;

//- (BOOL)validateDoneTime:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* plannedTime;

@property (atomic) float plannedTimeValue;
- (float)plannedTimeValue;
- (void)setPlannedTimeValue:(float)value_;

//- (BOOL)validatePlannedTime:(id*)value_ error:(NSError**)error_;

@end

@interface _UserSession (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveAvgTemperature;
- (void)setPrimitiveAvgTemperature:(NSNumber*)value;

- (float)primitiveAvgTemperatureValue;
- (void)setPrimitiveAvgTemperatureValue:(float)value_;

- (NSNumber*)primitiveBurntCalories;
- (void)setPrimitiveBurntCalories:(NSNumber*)value;

- (float)primitiveBurntCaloriesValue;
- (void)setPrimitiveBurntCaloriesValue:(float)value_;

- (NSDate*)primitiveDateOfSessions;
- (void)setPrimitiveDateOfSessions:(NSDate*)value;

- (NSNumber*)primitiveDoneTime;
- (void)setPrimitiveDoneTime:(NSNumber*)value;

- (float)primitiveDoneTimeValue;
- (void)setPrimitiveDoneTimeValue:(float)value_;

- (NSNumber*)primitivePlannedTime;
- (void)setPrimitivePlannedTime:(NSNumber*)value;

- (float)primitivePlannedTimeValue;
- (void)setPrimitivePlannedTimeValue:(float)value_;

@end
