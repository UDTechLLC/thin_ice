// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.h instead.

#import <CoreData/CoreData.h>

extern const struct UserAttributes {
	__unsafe_unretained NSString *birthday;
	__unsafe_unretained NSString *first_name;
	__unsafe_unretained NSString *last_name;
	__unsafe_unretained NSString *user_height;
	__unsafe_unretained NSString *user_photo_url;
	__unsafe_unretained NSString *user_sex;
	__unsafe_unretained NSString *user_weight;
} UserAttributes;

extern const struct UserRelationships {
	__unsafe_unretained NSString *userSettings;
} UserRelationships;

@class UserSettings;

@interface UserID : NSManagedObjectID {}
@end

@interface _User : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) UserID* objectID;

@property (nonatomic, strong) NSString* birthday;

//- (BOOL)validateBirthday:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* first_name;

//- (BOOL)validateFirst_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* last_name;

//- (BOOL)validateLast_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* user_height;

//- (BOOL)validateUser_height:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* user_photo_url;

//- (BOOL)validateUser_photo_url:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* user_sex;

//- (BOOL)validateUser_sex:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* user_weight;

//- (BOOL)validateUser_weight:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) UserSettings *userSettings;

//- (BOOL)validateUserSettings:(id*)value_ error:(NSError**)error_;

@end

@interface _User (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveBirthday;
- (void)setPrimitiveBirthday:(NSString*)value;

- (NSString*)primitiveFirst_name;
- (void)setPrimitiveFirst_name:(NSString*)value;

- (NSString*)primitiveLast_name;
- (void)setPrimitiveLast_name:(NSString*)value;

- (NSString*)primitiveUser_height;
- (void)setPrimitiveUser_height:(NSString*)value;

- (NSString*)primitiveUser_photo_url;
- (void)setPrimitiveUser_photo_url:(NSString*)value;

- (NSString*)primitiveUser_sex;
- (void)setPrimitiveUser_sex:(NSString*)value;

- (NSString*)primitiveUser_weight;
- (void)setPrimitiveUser_weight:(NSString*)value;

- (UserSettings*)primitiveUserSettings;
- (void)setPrimitiveUserSettings:(UserSettings*)value;

@end
