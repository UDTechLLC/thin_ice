//
//  NSObject+Runtime.h
//  iGreekNation
//
//  Created by Denisov Ilya on 9/27/13.
//  Copyright (c) 2013 Denisov Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (Runtime)

+ (NSDictionary *)getAllPropertiesWithAttributes;

@end
