// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to UserSettings.m instead.

#import "_UserSettings.h"

const struct UserSettingsAttributes UserSettingsAttributes = {
	.user_Length = @"user_Length",
	.user_Volume = @"user_Volume",
	.user_temperature = @"user_temperature",
	.user_weight = @"user_weight",
};

const struct UserSettingsRelationships UserSettingsRelationships = {
	.user = @"user",
};

@implementation UserSettingsID
@end

@implementation _UserSettings

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"UserSettings" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"UserSettings";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"UserSettings" inManagedObjectContext:moc_];
}

- (UserSettingsID*)objectID {
	return (UserSettingsID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic user_Length;

@dynamic user_Volume;

@dynamic user_temperature;

@dynamic user_weight;

@dynamic user;

@end

