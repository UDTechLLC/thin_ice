//
//  savedUser.m
//  ThinIce
//
//  Created by Dima Shapovalov on 15.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "SavedUser.h"

@interface SavedUser ()

@property (strong, nonatomic) NSString              *savedSocialityKey;
@property (strong, nonatomic) NSString              *savedUserLogin;
@property (strong, nonatomic) NSString              *savedUserPass;

@end

@implementation SavedUser

- (instancetype)initWithUsersSocialityKey:(NSString *)socialityKey {
    
    if ( !socialityKey ) {
        
        return nil;
    }
    self = [super init];
    if (self) {
        
        self.savedSocialityKey = [socialityKey copy];
        NSLog(@"savedSocialityKey - %@", self.savedSocialityKey);
    }
    return self;
}

- (instancetype)initWithUsersLogin:(NSString *)login Pass:(NSString*)pass {
    
    if ( !login && !pass ) {
        
        return nil;
    }
    self = [super init];
    if (self) {
        
        self.savedUserLogin         = [login copy];
        self.savedUserPass          = [pass copy];
        NSLog(@"savedUserLogin - %@ savedUserPass - %@", self.savedUserLogin, self.savedUserPass);
    }
    return self;
}

+ (instancetype)initWithSocialityKey:(NSString*)key {
    
    return [[self alloc] initWithUsersSocialityKey: key];
}

+ (instancetype)initWithLogin:(NSString*)login Pass:(NSString*)pass {
    
    return [[self alloc] initWithUsersLogin: login Pass:pass];
}

@end
