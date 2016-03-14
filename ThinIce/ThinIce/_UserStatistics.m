// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to UserStatistics.m instead.

#import "_UserStatistics.h"

const struct UserStatisticsAttributes UserStatisticsAttributes = {
	.dateOfEndSessions = @"dateOfEndSessions",
	.userSessions = @"userSessions",
};

const struct UserStatisticsRelationships UserStatisticsRelationships = {
	.user = @"user",
};

@implementation UserStatisticsID
@end

@implementation _UserStatistics

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"UserStatistics" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"UserStatistics";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"UserStatistics" inManagedObjectContext:moc_];
}

- (UserStatisticsID*)objectID {
	return (UserStatisticsID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic dateOfEndSessions;

@dynamic userSessions;

@dynamic user;

@end

