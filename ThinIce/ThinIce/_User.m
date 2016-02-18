// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.m instead.

#import "_User.h"

const struct UserAttributes UserAttributes = {
	.birthday = @"birthday",
	.first_name = @"first_name",
	.last_name = @"last_name",
	.user_height = @"user_height",
	.user_photo_url = @"user_photo_url",
	.user_sex = @"user_sex",
	.user_weight = @"user_weight",
};

const struct UserRelationships UserRelationships = {
	.userSettings = @"userSettings",
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

	return keyPaths;
}

@dynamic birthday;

@dynamic first_name;

@dynamic last_name;

@dynamic user_height;

@dynamic user_photo_url;

@dynamic user_sex;

@dynamic user_weight;

@dynamic userSettings;

@end

