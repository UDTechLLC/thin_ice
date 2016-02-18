// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to UserSettings.h instead.

#import <CoreData/CoreData.h>

extern const struct UserSettingsAttributes {
	__unsafe_unretained NSString *user_Length;
	__unsafe_unretained NSString *user_Volume;
	__unsafe_unretained NSString *user_temperature;
	__unsafe_unretained NSString *user_weight;
} UserSettingsAttributes;

@interface UserSettingsID : NSManagedObjectID {}
@end

@interface _UserSettings : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) UserSettingsID* objectID;

@property (nonatomic, strong) NSString* user_Length;

//- (BOOL)validateUser_Length:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* user_Volume;

//- (BOOL)validateUser_Volume:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* user_temperature;

//- (BOOL)validateUser_temperature:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* user_weight;

//- (BOOL)validateUser_weight:(id*)value_ error:(NSError**)error_;

@end

@interface _UserSettings (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveUser_Length;
- (void)setPrimitiveUser_Length:(NSString*)value;

- (NSString*)primitiveUser_Volume;
- (void)setPrimitiveUser_Volume:(NSString*)value;

- (NSString*)primitiveUser_temperature;
- (void)setPrimitiveUser_temperature:(NSString*)value;

- (NSString*)primitiveUser_weight;
- (void)setPrimitiveUser_weight:(NSString*)value;

@end
