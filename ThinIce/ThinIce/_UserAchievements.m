// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to UserAchievements.m instead.

#import "_UserAchievements.h"

const struct UserAchievementsAttributes UserAchievementsAttributes = {
	.achivment_addStatus = @"achivment_addStatus",
	.achivment_id = @"achivment_id",
	.achivment_progress = @"achivment_progress",
};

@implementation UserAchievementsID
@end

@implementation _UserAchievements

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"UserAchievements" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"UserAchievements";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"UserAchievements" inManagedObjectContext:moc_];
}

- (UserAchievementsID*)objectID {
	return (UserAchievementsID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"achivment_addStatusValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"achivment_addStatus"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"achivment_idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"achivment_id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"achivment_progressValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"achivment_progress"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic achivment_addStatus;

- (BOOL)achivment_addStatusValue {
	NSNumber *result = [self achivment_addStatus];
	return [result boolValue];
}

- (void)setAchivment_addStatusValue:(BOOL)value_ {
	[self setAchivment_addStatus:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveAchivment_addStatusValue {
	NSNumber *result = [self primitiveAchivment_addStatus];
	return [result boolValue];
}

- (void)setPrimitiveAchivment_addStatusValue:(BOOL)value_ {
	[self setPrimitiveAchivment_addStatus:[NSNumber numberWithBool:value_]];
}

@dynamic achivment_id;

- (int16_t)achivment_idValue {
	NSNumber *result = [self achivment_id];
	return [result shortValue];
}

- (void)setAchivment_idValue:(int16_t)value_ {
	[self setAchivment_id:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveAchivment_idValue {
	NSNumber *result = [self primitiveAchivment_id];
	return [result shortValue];
}

- (void)setPrimitiveAchivment_idValue:(int16_t)value_ {
	[self setPrimitiveAchivment_id:[NSNumber numberWithShort:value_]];
}

@dynamic achivment_progress;

- (float)achivment_progressValue {
	NSNumber *result = [self achivment_progress];
	return [result floatValue];
}

- (void)setAchivment_progressValue:(float)value_ {
	[self setAchivment_progress:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveAchivment_progressValue {
	NSNumber *result = [self primitiveAchivment_progress];
	return [result floatValue];
}

- (void)setPrimitiveAchivment_progressValue:(float)value_ {
	[self setPrimitiveAchivment_progress:[NSNumber numberWithFloat:value_]];
}

@end

