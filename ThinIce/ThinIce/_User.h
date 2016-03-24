// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.h instead.

#import <CoreData/CoreData.h>

extern const struct UserAttributes {
	__unsafe_unretained NSString *birthday;
	__unsafe_unretained NSString *first_name;
	__unsafe_unretained NSString *last_name;
	__unsafe_unretained NSString *socialityKey;
	__unsafe_unretained NSString *userAchievements;
	__unsafe_unretained NSString *userCard;
	__unsafe_unretained NSString *userLogin;
	__unsafe_unretained NSString *userPass;
	__unsafe_unretained NSString *user_height;
	__unsafe_unretained NSString *user_photo_url;
	__unsafe_unretained NSString *user_sex;
	__unsafe_unretained NSString *user_weight;
} UserAttributes;

extern const struct UserRelationships {
	__unsafe_unretained NSString *userSettings;
	__unsafe_unretained NSString *userStatistics;
} UserRelationships;

@class UserSettings;
@class UserStatistics;

@interface UserID : NSManagedObjectID {}
@end

@interface _User : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) UserID* objectID;

@property (nonatomic, strong) NSDate* birthday;

//- (BOOL)validateBirthday:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* first_name;

//- (BOOL)validateFirst_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* last_name;

//- (BOOL)validateLast_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* socialityKey;

//- (BOOL)validateSocialityKey:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSData* userAchievements;

//- (BOOL)validateUserAchievements:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSData* userCard;

//- (BOOL)validateUserCard:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* userLogin;

//- (BOOL)validateUserLogin:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* userPass;

//- (BOOL)validateUserPass:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* user_height;

@property (atomic) float user_heightValue;
- (float)user_heightValue;
- (void)setUser_heightValue:(float)value_;

//- (BOOL)validateUser_height:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* user_photo_url;

//- (BOOL)validateUser_photo_url:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* user_sex;

//- (BOOL)validateUser_sex:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* user_weight;

@property (atomic) float user_weightValue;
- (float)user_weightValue;
- (void)setUser_weightValue:(float)value_;

//- (BOOL)validateUser_weight:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) UserSettings *userSettings;

//- (BOOL)validateUserSettings:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) UserStatistics *userStatistics;

//- (BOOL)validateUserStatistics:(id*)value_ error:(NSError**)error_;

@end

@interface _User (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveBirthday;
- (void)setPrimitiveBirthday:(NSDate*)value;

- (NSString*)primitiveFirst_name;
- (void)setPrimitiveFirst_name:(NSString*)value;

- (NSString*)primitiveLast_name;
- (void)setPrimitiveLast_name:(NSString*)value;

- (NSString*)primitiveSocialityKey;
- (void)setPrimitiveSocialityKey:(NSString*)value;

- (NSData*)primitiveUserAchievements;
- (void)setPrimitiveUserAchievements:(NSData*)value;

- (NSData*)primitiveUserCard;
- (void)setPrimitiveUserCard:(NSData*)value;

- (NSString*)primitiveUserLogin;
- (void)setPrimitiveUserLogin:(NSString*)value;

- (NSString*)primitiveUserPass;
- (void)setPrimitiveUserPass:(NSString*)value;

- (NSNumber*)primitiveUser_height;
- (void)setPrimitiveUser_height:(NSNumber*)value;

- (float)primitiveUser_heightValue;
- (void)setPrimitiveUser_heightValue:(float)value_;

- (NSString*)primitiveUser_photo_url;
- (void)setPrimitiveUser_photo_url:(NSString*)value;

- (NSString*)primitiveUser_sex;
- (void)setPrimitiveUser_sex:(NSString*)value;

- (NSNumber*)primitiveUser_weight;
- (void)setPrimitiveUser_weight:(NSNumber*)value;

- (float)primitiveUser_weightValue;
- (void)setPrimitiveUser_weightValue:(float)value_;

- (UserSettings*)primitiveUserSettings;
- (void)setPrimitiveUserSettings:(UserSettings*)value;

- (UserStatistics*)primitiveUserStatistics;
- (void)setPrimitiveUserStatistics:(UserStatistics*)value;

@end
