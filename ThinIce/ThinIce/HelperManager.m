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
    localNotification.fireDate              = [NSDate dateWithTimeIntervalSinceNow: 0.3];
    localNotification.alertBody             = @"Are you wearing the Thin Ice vest? If not, please don’t forget to tap the Power button";
    localNotification.repeatInterval        = NSCalendarUnitMinute;
    localNotification.timeZone              = [NSTimeZone defaultTimeZone];
    localNotification.soundName             = UILocalNotificationDefaultSoundName;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

- (void)stopPOSTNotification {
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

- (NSString*)setUserPredicatFormat {
    
    if([self checkVariable:[AccountInfoManager sharedManager].userToken.userLogin]) {
        
        return kLoginEmailKey;
    } else if([self checkVariable:[AccountInfoManager sharedManager].userToken.socialityKey]) {
        
        return kSocialityKey;
    } else {
        
        return @"";
    }
}

- (NSString*)setUserLoginField {
    
    if([self checkVariable:[AccountInfoManager sharedManager].userToken.userLogin]) {
        
        return [AccountInfoManager sharedManager].userToken.userLogin;
    } else if([self checkVariable:[AccountInfoManager sharedManager].userToken.socialityKey]) {
        
        return [AccountInfoManager sharedManager].userToken.socialityKey;
    } else {
        
        return @"";
    }
}

- (BOOL)checkVariable:(NSString*)string {
    
    BOOL state  = YES;
    
    if(string.length == 0) {
        state   = NO;
    }
    if([string isEqualToString:@"(null)"]) {
        state   = NO;
    }
    if(string == nil) {
        state   = NO;
    }
    
    return state;
}

- (NSString*)currentDateText:(NSDate*)date {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMM dd, yyyy"];
    
    return [dateFormat stringFromDate: date];
}

- (NSString*)currentTimeText:(NSDate*)time {
    
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"HH:mm:ss"];
    
    return [timeFormat stringFromDate: time];
}

- (NSString*)calculateCelsiusFahrenheitValue:(int)temperature {
    
    if([[AccountInfoManager sharedManager].userToken.userSettings.user_temperature isEqualToString:@"℃"]) {
        
        return [NSString stringWithFormat:@"%d %@", (int)temperature, [AccountInfoManager sharedManager].userToken.userSettings.user_temperature];
    } else {
        
        int temperatureTMPValue                         = 0;
        temperatureTMPValue                             = (temperature * 1.8) + 32;
        return [NSString stringWithFormat:@"%d %@", (int)temperatureTMPValue, [AccountInfoManager sharedManager].userToken.userSettings.user_temperature];
    }
}

- (void)updateElapsedTimeDisplay:(NSTimeInterval)timeInterval ToLabel:(UILabel*)label {
    
    NSTimeInterval interval = timeInterval;
    NSDateComponentsFormatter *formatter = [[NSDateComponentsFormatter alloc] init];
    formatter.allowedUnits = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    formatter.zeroFormattingBehavior = NSDateComponentsFormatterZeroFormattingBehaviorPad;
    NSString *string = [formatter stringFromTimeInterval:interval];
    
    // If you want to get the individual digits of the units, use div again
    // with a divisor of 10.
    if(label) {
        label.text = string;
    }
    NSLog(@"%@", string);
}

@end
