//
//  ServerManager.h
//  ThinIce
//
//  Created by Dima Shapovalov on 16.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "SavedUser.h"

@interface AccountInfoManager : NSObject

@property (readonly, nonatomic) SavedUser *userSavedInHomeDirectory;
@property (readonly, nonatomic) User *userToken;

+ (AccountInfoManager *)sharedManager;

- (void)autorizationWithLoginAndPass:(NSString*)login pass:(NSString*)pass Block:(void(^)(BOOL isUserEnable))block;
- (void)autorizationWithFaceBookAndTwitter:(NSString*)key firstName:(NSString*)userFirstName lastName:(NSString*)userLastName image:(UIImage*)profileImage Block:(void(^)(BOOL isUserEnable))block;
- (void)loadUserObjectWithBlock:(void(^)())block;
- (void)logout;
- (User*)findUserInDataBase;
- (void)registrationNewUserWithParams:(NSDictionary*)userParams Block:(void(^)())block;

@end
