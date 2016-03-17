//
//  savedUser.h
//  ThinIce
//
//  Created by Dima Shapovalov on 15.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SavedUser : NSObject

@property (strong, nonatomic, readonly) NSString                *savedSocialityKey;
@property (strong, nonatomic, readonly) NSString                *savedUserLogin;
@property (strong, nonatomic, readonly) NSString                *savedUserPass;

+ (instancetype)initWithSocialityKey:(NSString*)key;
+ (instancetype)initWithLogin:(NSString*)login Pass:(NSString*)pass;

@end
