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
- (UIColor *)colorwithHexString:(NSString *)hexStr alpha:(CGFloat)alpha;
- (void)createAchivementsDataBaseForUser:(User*)user;
- (void)saveContextWithBlock:(void(^)(NSManagedObjectContext *localContext))block;
- (NSString*)saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension;
- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock;
- (NSString*)definitionImageType:(UIImage*)image;
- (UIImage *)getImageFromURL:(NSString *)fileURL;

@end
