//
//  savedUser.h
//  ThinIce
//
//  Created by Dima Shapovalov on 15.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SavedUser : NSObject

@property (strong, nonatomic) NSString *savedSocialityKey;
@property (strong, nonatomic) NSString *savedUserLogin;
@property (strong, nonatomic) NSString *savedUserPass;

@end
