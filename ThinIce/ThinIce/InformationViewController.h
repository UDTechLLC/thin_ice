//
//  InformationViewController.h
//  ThinIce
//
//  Created by Dima Shapovalov on 03.03.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountInformationViewController.h"

@interface InformationViewController : UIViewController

@property NSMutableDictionary           *regUserDict;
@property NSMutableDictionary           *regUserBOOLDict;       // User Information Validation State (NSInteger) 1 = YES | 0 = NO

@end
