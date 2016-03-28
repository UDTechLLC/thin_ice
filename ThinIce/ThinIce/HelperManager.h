//
//  HelperManager.h
//  ThinIce
//
//  Created by Dima Shapovalov on 16.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface HelperManager : NSObject

+ (HelperManager *)sharedServer;


- (void)startPOSTNotification;
- (void)stopPOSTNotification;


- (UIColor *)colorwithHexString:(NSString *)hexStr alpha:(CGFloat)alpha;
- (void)saveContextWithBlock:(void(^)(NSManagedObjectContext *localContext))block;
- (NSString*)saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension;
- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock;
- (NSString*)definitionImageType:(UIImage*)image;
- (UIImage *)getImageFromURL:(NSString *)fileURL;


- (NSString*)setUserPredicatFormat;
- (NSString*)setUserLoginField;
- (BOOL)checkVariable:(NSString*)string;


- (NSString*)currentTimeText:(NSDate*)time;
- (NSString*)currentDateText:(NSDate*)date;

- (NSString*)calculateCelsiusFahrenheitValue:(int)temperature;

- (void)updateElapsedTimeDisplay:(NSTimeInterval)timeInterval ToLabel:(UILabel*)label;

@end
