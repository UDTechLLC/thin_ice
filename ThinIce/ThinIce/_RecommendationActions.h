// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RecommendationActions.h instead.

#import <CoreData/CoreData.h>

extern const struct RecommendationActionsAttributes {
	__unsafe_unretained NSString *carbsConsumed;
	__unsafe_unretained NSString *gymSessions;
	__unsafe_unretained NSString *hoursSlept;
	__unsafe_unretained NSString *junkFood;
	__unsafe_unretained NSString *proteinHeavy;
	__unsafe_unretained NSString *waterIntake;
} RecommendationActionsAttributes;

@interface RecommendationActionsID : NSManagedObjectID {}
@end

@interface _RecommendationActions : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) RecommendationActionsID* objectID;

@property (nonatomic, strong) NSNumber* carbsConsumed;

@property (atomic) int16_t carbsConsumedValue;
- (int16_t)carbsConsumedValue;
- (void)setCarbsConsumedValue:(int16_t)value_;

//- (BOOL)validateCarbsConsumed:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* gymSessions;

@property (atomic) int16_t gymSessionsValue;
- (int16_t)gymSessionsValue;
- (void)setGymSessionsValue:(int16_t)value_;

//- (BOOL)validateGymSessions:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* hoursSlept;

@property (atomic) int16_t hoursSleptValue;
- (int16_t)hoursSleptValue;
- (void)setHoursSleptValue:(int16_t)value_;

//- (BOOL)validateHoursSlept:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* junkFood;

@property (atomic) int16_t junkFoodValue;
- (int16_t)junkFoodValue;
- (void)setJunkFoodValue:(int16_t)value_;

//- (BOOL)validateJunkFood:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* proteinHeavy;

@property (atomic) int16_t proteinHeavyValue;
- (int16_t)proteinHeavyValue;
- (void)setProteinHeavyValue:(int16_t)value_;

//- (BOOL)validateProteinHeavy:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* waterIntake;

@property (atomic) int16_t waterIntakeValue;
- (int16_t)waterIntakeValue;
- (void)setWaterIntakeValue:(int16_t)value_;

//- (BOOL)validateWaterIntake:(id*)value_ error:(NSError**)error_;

@end

@interface _RecommendationActions (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveCarbsConsumed;
- (void)setPrimitiveCarbsConsumed:(NSNumber*)value;

- (int16_t)primitiveCarbsConsumedValue;
- (void)setPrimitiveCarbsConsumedValue:(int16_t)value_;

- (NSNumber*)primitiveGymSessions;
- (void)setPrimitiveGymSessions:(NSNumber*)value;

- (int16_t)primitiveGymSessionsValue;
- (void)setPrimitiveGymSessionsValue:(int16_t)value_;

- (NSNumber*)primitiveHoursSlept;
- (void)setPrimitiveHoursSlept:(NSNumber*)value;

- (int16_t)primitiveHoursSleptValue;
- (void)setPrimitiveHoursSleptValue:(int16_t)value_;

- (NSNumber*)primitiveJunkFood;
- (void)setPrimitiveJunkFood:(NSNumber*)value;

- (int16_t)primitiveJunkFoodValue;
- (void)setPrimitiveJunkFoodValue:(int16_t)value_;

- (NSNumber*)primitiveProteinHeavy;
- (void)setPrimitiveProteinHeavy:(NSNumber*)value;

- (int16_t)primitiveProteinHeavyValue;
- (void)setPrimitiveProteinHeavyValue:(int16_t)value_;

- (NSNumber*)primitiveWaterIntake;
- (void)setPrimitiveWaterIntake:(NSNumber*)value;

- (int16_t)primitiveWaterIntakeValue;
- (void)setPrimitiveWaterIntakeValue:(int16_t)value_;

@end
