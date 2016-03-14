// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to UserSession.m instead.

#import "_UserSession.h"

const struct UserSessionAttributes UserSessionAttributes = {
	.avgTemperature = @"avgTemperature",
	.burntCalories = @"burntCalories",
	.dateOfSessions = @"dateOfSessions",
	.doneTime = @"doneTime",
	.plannedTime = @"plannedTime",
};

@implementation UserSessionID
@end

@implementation _UserSession

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"UserSession" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"UserSession";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"UserSession" inManagedObjectContext:moc_];
}

- (UserSessionID*)objectID {
	return (UserSessionID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"avgTemperatureValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"avgTemperature"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"burntCaloriesValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"burntCalories"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"doneTimeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"doneTime"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"plannedTimeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"plannedTime"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic avgTemperature;

- (float)avgTemperatureValue {
	NSNumber *result = [self avgTemperature];
	return [result floatValue];
}

- (void)setAvgTemperatureValue:(float)value_ {
	[self setAvgTemperature:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveAvgTemperatureValue {
	NSNumber *result = [self primitiveAvgTemperature];
	return [result floatValue];
}

- (void)setPrimitiveAvgTemperatureValue:(float)value_ {
	[self setPrimitiveAvgTemperature:[NSNumber numberWithFloat:value_]];
}

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

@dynamic dateOfSessions;

@dynamic doneTime;

- (float)doneTimeValue {
	NSNumber *result = [self doneTime];
	return [result floatValue];
}

- (void)setDoneTimeValue:(float)value_ {
	[self setDoneTime:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveDoneTimeValue {
	NSNumber *result = [self primitiveDoneTime];
	return [result floatValue];
}

- (void)setPrimitiveDoneTimeValue:(float)value_ {
	[self setPrimitiveDoneTime:[NSNumber numberWithFloat:value_]];
}

@dynamic plannedTime;

- (float)plannedTimeValue {
	NSNumber *result = [self plannedTime];
	return [result floatValue];
}

- (void)setPlannedTimeValue:(float)value_ {
	[self setPlannedTime:[NSNumber numberWithFloat:value_]];
}

- (float)primitivePlannedTimeValue {
	NSNumber *result = [self primitivePlannedTime];
	return [result floatValue];
}

- (void)setPrimitivePlannedTimeValue:(float)value_ {
	[self setPrimitivePlannedTime:[NSNumber numberWithFloat:value_]];
}

@end

