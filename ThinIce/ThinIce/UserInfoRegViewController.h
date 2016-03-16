//
//  UserInfoRegViewController.h
//  ThinIce
//
//  Created by Dima Shapovalov on 18.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoRegViewController : BaseSignUpViewController

@property NSUInteger                    pageIndex;
@property NSMutableDictionary           *regUserDict;
@property NSMutableDictionary           *regUserBOOLDict;       // User Information Validation State (NSInteger) 1 = YES | 0 = NO

- (void)errorForTextFieldSex:(BOOL)loginState;
- (void)errorForTextFieldDateOfBirth:(BOOL)passState;
- (void)errorForTextFieldHeight:(BOOL)passState;
- (void)errorForTextFieldWeight:(BOOL)passState;

@end
