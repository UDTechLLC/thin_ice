//
//  HelperManager.m
//  ThinIce
//
//  Created by Dima Shapovalov on 16.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "HelperManager.h"

@implementation HelperManager

+ (HelperManager *)sharedServer {
    
    static HelperManager *instanceHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instanceHelper = [[self alloc] init];
    });
    return instanceHelper;
}

- (id)init {
    
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (UIColor *)colorwithHexString:(NSString *)hexStr alpha:(CGFloat)alpha {
    //-----------------------------------------
    // Convert hex string to an integer
    //-----------------------------------------
    unsigned int hexint = 0;
    
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    
    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&hexint];
    
    //-----------------------------------------
    // Create color object, specifying alpha
    //-----------------------------------------
    UIColor *color      = [UIColor colorWithRed:((CGFloat) ((hexint & 0xFF0000) >> 16))/255 green:((CGFloat) ((hexint & 0xFF00) >> 8))/255 blue:((CGFloat) (hexint & 0xFF))/255 alpha:alpha];
    
    return color;
}

- (void)createAchivementsDataBaseForUser:(User*)user {
    
    NSMutableArray *arrayOfAchivements = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < AchievementsCount; i ++) {
        
        UserAchievements *uAchievement  = [[UserAchievements alloc] init];
        [uAchievement setAchivment_addStatusValue:NO];
        uAchievement.achivment_id       = [NSNumber numberWithInt:i];
        uAchievement.achivment_progress = 0;
        [arrayOfAchivements addObject:uAchievement];
    }
    user.userAchievements               = arrayOfAchivements;
    
}

- (void)saveContextWithBlock:(void(^)(NSManagedObjectContext*))block {
    
    UIApplication *application = [UIApplication sharedApplication];
    __block UIBackgroundTaskIdentifier bgTask = [application beginBackgroundTaskWithExpirationHandler:^{
        [application endBackgroundTask:bgTask];
        bgTask = UIBackgroundTaskInvalid;
    }];
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        
        block(localContext);
        
    } completion:^(BOOL success, NSError *error) {
        [application endBackgroundTask:bgTask];
        bgTask = UIBackgroundTaskInvalid;
    }];
}

// Save image
- (NSString*)saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension {
    
    NSLog(@"%@", image);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    if ([[extension lowercaseString] isEqualToString:@"png"]) {
        
        [UIImagePNGRepresentation(image) writeToFile:[documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"png"]] options:NSAtomicWrite error:nil];
        return [NSString stringWithFormat:@"%@.%@", imageName, @"png"];
    } else if ([[extension lowercaseString] isEqualToString:@"jpg"] || [[extension lowercaseString] isEqualToString:@"jpeg"]) {
        
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:[documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"jpg"]] options:NSAtomicWrite error:nil];
        return [NSString stringWithFormat:@"%@.%@", imageName, @"png"];
    } else {
        
        NSLog(@"Image Save Failed\nExtension: (%@) is not recognized, use (PNG/JPG)", extension);
        return nil;
    }
}

// Download image
- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock {
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if ( !error ) {
            
            UIImage *image = [[UIImage alloc] initWithData:data];
            completionBlock(YES,image);
        } else {
            
            completionBlock(NO,nil);
        }
    }];
}

// Definition image Type
- (NSString*)definitionImageType:(UIImage*)image {
    
    NSData      *imageData   = UIImagePNGRepresentation(image);
    NSString    *imageType = [self contentTypeForImageData:imageData];
    
    return imageType;
}

- (NSString *)contentTypeForImageData:(NSData *)data {
    
    uint8_t c;
    [data getBytes:&c length:1];
    
    switch (c) {
        case 0xFF:
            return @"jpeg";
        case 0x89:
            return @"png";
        case 0x47:
            return @"gif";
        case 0x49:
            break;
        case 0x42:
            return @"bmp";
        case 0x4D:
            return @"tiff";
    }
    
    return nil;
}

- (UIImage *)getImageFromURL:(NSString *)fileURL {
    
    NSArray     *paths              = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString    *documentsDirectory = [paths objectAtIndex:0];
    NSString    *path               = [documentsDirectory stringByAppendingPathComponent: fileURL ];
    UIImage     *image              = [UIImage imageWithContentsOfFile:path];
    
    return image;
}

- (void)startPOSTNotification {
    
    // Schedule the notification
    UILocalNotification* localNotification  = [[UILocalNotification alloc] init];
    localNotification.fireDate              = [NSDate dateWithTimeIntervalSinceNow: 2];
    localNotification.alertBody             = @"Your alert message";
    localNotification.repeatInterval        = NSCalendarUnitMinute;
    localNotification.timeZone              = [NSTimeZone defaultTimeZone];
    localNotification.soundName             = UILocalNotificationDefaultSoundName;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

- (void)stopPOSTNotification {
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

@end
