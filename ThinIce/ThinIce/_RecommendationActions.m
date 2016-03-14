// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RecommendationActions.m instead.

#import "_RecommendationActions.h"

const struct RecommendationActionsAttributes RecommendationActionsAttributes = {
	.carbsConsumed = @"carbsConsumed",
	.gymSessions = @"gymSessions",
	.hoursSlept = @"hoursSlept",
	.junkFood = @"junkFood",
	.proteinHeavy = @"proteinHeavy",
	.waterIntake = @"waterIntake",
};

@implementation RecommendationActionsID
@end

@implementation _RecommendationActions

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"RecommendationActions" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"RecommendationActions";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"RecommendationActions" inManagedObjectContext:moc_];
}

- (RecommendationActionsID*)objectID {
	return (RecommendationActionsID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"carbsConsumedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"carbsConsumed"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"gymSessionsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"gymSessions"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"hoursSleptValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"hoursSlept"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"junkFoodValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"junkFood"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"proteinHeavyValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"proteinHeavy"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"waterIntakeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"waterIntake"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic carbsConsumed;

- (int16_t)carbsConsumedValue {
	NSNumber *result = [self carbsConsumed];
	return [result shortValue];
}

- (void)setCarbsConsumedValue:(int16_t)value_ {
	[self setCarbsConsumed:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveCarbsConsumedValue {
	NSNumber *result = [self primitiveCarbsConsumed];
	return [result shortValue];
}

- (void)setPrimitiveCarbsConsumedValue:(int16_t)value_ {
	[self setPrimitiveCarbsConsumed:[NSNumber numberWithShort:value_]];
}

@dynamic gymSessions;

- (int16_t)gymSessionsValue {
	NSNumber *result = [self gymSessions];
	return [result shortValue];
}

- (void)setGymSessionsValue:(int16_t)value_ {
	[self setGymSessions:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveGymSessionsValue {
	NSNumber *result = [self primitiveGymSessions];
	return [result shortValue];
}

- (void)setPrimitiveGymSessionsValue:(int16_t)value_ {
	[self setPrimitiveGymSessions:[NSNumber numberWithShort:value_]];
}

@dynamic hoursSlept;

- (int16_t)hoursSleptValue {
	NSNumber *result = [self hoursSlept];
	return [result shortValue];
}

- (void)setHoursSleptValue:(int16_t)value_ {
	[self setHoursSlept:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveHoursSleptValue {
	NSNumber *result = [self primitiveHoursSlept];
	return [result shortValue];
}

- (void)setPrimitiveHoursSleptValue:(int16_t)value_ {
	[self setPrimitiveHoursSlept:[NSNumber numberWithShort:value_]];
}

@dynamic junkFood;

- (int16_t)junkFoodValue {
	NSNumber *result = [self junkFood];
	return [result shortValue];
}

- (void)setJunkFoodValue:(int16_t)value_ {
	[self setJunkFood:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveJunkFoodValue {
	NSNumber *result = [self primitiveJunkFood];
	return [result shortValue];
}

- (void)setPrimitiveJunkFoodValue:(int16_t)value_ {
	[self setPrimitiveJunkFood:[NSNumber numberWithShort:value_]];
}

@dynamic proteinHeavy;

- (int16_t)proteinHeavyValue {
	NSNumber *result = [self proteinHeavy];
	return [result shortValue];
}

- (void)setProteinHeavyValue:(int16_t)value_ {
	[self setProteinHeavy:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveProteinHeavyValue {
	NSNumber *result = [self primitiveProteinHeavy];
	return [result shortValue];
}

- (void)setPrimitiveProteinHeavyValue:(int16_t)value_ {
	[self setPrimitiveProteinHeavy:[NSNumber numberWithShort:value_]];
}

@dynamic waterIntake;

- (int16_t)waterIntakeValue {
	NSNumber *result = [self waterIntake];
	return [result shortValue];
}

- (void)setWaterIntakeValue:(int16_t)value_ {
	[self setWaterIntake:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveWaterIntakeValue {
	NSNumber *result = [self primitiveWaterIntake];
	return [result shortValue];
}

- (void)setPrimitiveWaterIntakeValue:(int16_t)value_ {
	[self setPrimitiveWaterIntake:[NSNumber numberWithShort:value_]];
}

@end

