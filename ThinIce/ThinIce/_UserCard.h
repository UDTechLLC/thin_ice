// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to UserCard.h instead.

#import <CoreData/CoreData.h>

extern const struct UserCardAttributes {
	__unsafe_unretained NSString *allTime;
	__unsafe_unretained NSString *burntCalories;
	__unsafe_unretained NSString *dateOfCard;
	__unsafe_unretained NSString *target;
	__unsafe_unretained NSString *temperature;
} UserCardAttributes;

extern const struct UserCardRelationships {
	__unsafe_unretained NSString *daysCardRecommendation;
} UserCardRelationships;

@class RecommendationActions;

@interface UserCardID : NSManagedObjectID {}
@end

@interface _UserCard : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) UserCardID* objectID;

@property (nonatomic, strong) NSDate* allTime;

//- (BOOL)validateAllTime:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* burntCalories;

@property (atomic) float burntCaloriesValue;
- (float)burntCaloriesValue;
- (void)setBurntCaloriesValue:(float)value_;

//- (BOOL)validateBurntCalories:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* dateOfCard;

//- (BOOL)validateDateOfCard:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* target;

//- (BOOL)validateTarget:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* temperature;

@property (atomic) float temperatureValue;
- (float)temperatureValue;
- (void)setTemperatureValue:(float)value_;

//- (BOOL)validateTemperature:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) RecommendationActions *daysCardRecommendation;

//- (BOOL)validateDaysCardRecommendation:(id*)value_ error:(NSError**)error_;

@end

@interface _UserCard (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveAllTime;
- (void)setPrimitiveAllTime:(NSDate*)value;

- (NSNumber*)primitiveBurntCalories;
- (void)setPrimitiveBurntCalories:(NSNumber*)value;

- (float)primitiveBurntCaloriesValue;
- (void)setPrimitiveBurntCaloriesValue:(float)value_;

- (NSDate*)primitiveDateOfCard;
- (void)setPrimitiveDateOfCard:(NSDate*)value;

- (NSDate*)primitiveTarget;
- (void)setPrimitiveTarget:(NSDate*)value;

- (NSNumber*)primitiveTemperature;
- (void)setPrimitiveTemperature:(NSNumber*)value;

- (float)primitiveTemperatureValue;
- (void)setPrimitiveTemperatureValue:(float)value_;

- (RecommendationActions*)primitiveDaysCardRecommendation;
- (void)setPrimitiveDaysCardRecommendation:(RecommendationActions*)value;

@end
