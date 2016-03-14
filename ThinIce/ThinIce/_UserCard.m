// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to UserCard.m instead.

#import "_UserCard.h"

const struct UserCardAttributes UserCardAttributes = {
	.allTime = @"allTime",
	.burntCalories = @"burntCalories",
	.dateOfCard = @"dateOfCard",
	.target = @"target",
	.temperature = @"temperature",
};

const struct UserCardRelationships UserCardRelationships = {
	.daysCardRecommendation = @"daysCardRecommendation",
};

@implementation UserCardID
@end

@implementation _UserCard

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"UserCard" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"UserCard";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"UserCard" inManagedObjectContext:moc_];
}

- (UserCardID*)objectID {
	return (UserCardID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"burntCaloriesValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"burntCalories"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"temperatureValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"temperature"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic allTime;

@dynamic burntCalories;

- (float)burntCaloriesValue {
	NSNumber *result = [self burntCalories];
	return [result floatValue];
}

- (void)setBurntCaloriesValue:(float)value_ {
	[self setBurntCalories:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveBurntCaloriesValue {
	NSNumber *result = [self primitiveBurntCalories];
	return [result floatValue];
}

- (void)setPrimitiveBurntCaloriesValue:(float)value_ {
	[self setPrimitiveBurntCalories:[NSNumber numberWithFloat:value_]];
}

@dynamic dateOfCard;

@dynamic target;

@dynamic temperature;

- (float)temperatureValue {
	NSNumber *result = [self temperature];
	return [result floatValue];
}

- (void)setTemperatureValue:(float)value_ {
	[self setTemperature:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveTemperatureValue {
	NSNumber *result = [self primitiveTemperature];
	return [result floatValue];
}

- (void)setPrimitiveTemperatureValue:(float)value_ {
	[self setPrimitiveTemperature:[NSNumber numberWithFloat:value_]];
}

@dynamic daysCardRecommendation;

@end

