// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.m instead.

#import "_User.h"

const struct UserAttributes UserAttributes = {
	.birthday = @"birthday",
	.first_name = @"first_name",
	.last_name = @"last_name",
	.socialityKey = @"socialityKey",
	.userAchievements = @"userAchievements",
	.userCard = @"userCard",
	.userLogin = @"userLogin",
	.userPass = @"userPass",
	.user_height = @"user_height",
	.user_photo_url = @"user_photo_url",
	.user_sex = @"user_sex",
	.user_weight = @"user_weight",
};

const struct UserRelationships UserRelationships = {
	.userSettings = @"userSettings",
	.userStatistics = @"userStatistics",
};

@implementation UserID
@end

@implementation _User

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"User";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"User" inManagedObjectContext:moc_];
}

- (UserID*)objectID {
	return (UserID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"user_heightValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"user_height"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"user_weightValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"user_weight"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic birthday;

@dynamic first_name;

@dynamic last_name;

@dynamic socialityKey;

@dynamic userAchievements;

@dynamic userCard;

@dynamic userLogin;

@dynamic userPass;

@dynamic user_height;

- (float)user_heightValue {
	NSNumber *result = [self user_height];
	return [result floatValue];
}

- (void)setUser_heightValue:(float)value_ {
	[self setUser_height:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveUser_heightValue {
	NSNumber *result = [self primitiveUser_height];
	return [result floatValue];
}

- (void)setPrimitiveUser_heightValue:(float)value_ {
	[self setPrimitiveUser_height:[NSNumber numberWithFloat:value_]];
}

@dynamic user_photo_url;

@dynamic user_sex;

@dynamic user_weight;

- (float)user_weightValue {
	NSNumber *result = [self user_weight];
	return [result floatValue];
}

- (void)setUser_weightValue:(float)value_ {
	[self setUser_weight:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveUser_weightValue {
	NSNumber *result = [self primitiveUser_weight];
	return [result floatValue];
}

- (void)setPrimitiveUser_weightValue:(float)value_ {
	[self setPrimitiveUser_weight:[NSNumber numberWithFloat:value_]];
}

@dynamic userSettings;

@dynamic userStatistics;

@end

