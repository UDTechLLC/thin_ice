//
//  HelperManager.h
//  ThinIce
//
//  Created by Dima Shapovalov on 16.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelperManager : NSObject

+ (HelperManager *)sharedServer;
- (UIColor *)colorwithHexString:(NSString *)hexStr alpha:(CGFloat)alpha;

@end
