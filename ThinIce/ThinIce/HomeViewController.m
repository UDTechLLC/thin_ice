//
//  ViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 16.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "HomeViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface HomeViewController () <FHSTwitterEngineAccessTokenDelegate>

@property (weak, nonatomic) IBOutlet UIImageView                *pic;
@property (strong, nonatomic) FBSDKLoginButton                  *loginFaceBook;
@property (weak, nonatomic) IBOutlet UIButton                   *loginTwitterButton;
@property (weak, nonatomic) IBOutlet UIButton                   *loginFaceBookButton;
@property (weak, nonatomic) IBOutlet UIButton                   *signInButton;
@property (weak, nonatomic) IBOutlet UIButton                   *signUpButton;
@property (weak, nonatomic) IBOutlet UIImageView                *signUpBackground;
@property (weak, nonatomic) IBOutlet UILabel                    *or;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addLoginBackgroundImage];
    [self createFaceBookTwitter];
    [self createViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
    NSLog(@"%@", [SlideNavigationController sharedInstance].viewControllers);
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
}

- (void)viewDidLayoutSubviews {
    if (kScreenWidth == 320) {
        self.signInButton.center = CGPointMake(kScreenWidth / 2, 257);
    } else if(kScreenWidth == 375) {
        self.signInButton.center = CGPointMake(kScreenWidth / 2, 301.5);
    } else if (kScreenWidth == 414) {
        self.signInButton.frame = CGRectMake(0, 0, 172, 184);
        self.signInButton.center = CGPointMake(kScreenWidth / 2, 333.5);
        NSLog(@"%@", NSStringFromCGRect(self.signInButton.frame));
    }
    [super viewDidLayoutSubviews];
}


- (void)createViewController {
    
    self.pic.image = [UIImage imageNamed: @"thinice_logotype"];
    
    [self.loginFaceBookButton setImage:[UIImage imageNamed:@"btn_facebook_normal"] forState:UIControlStateNormal];
    [self.loginFaceBookButton setImage:[UIImage imageNamed:@"btn_facebook_active"] forState:UIControlStateSelected];
    [self.loginFaceBookButton setImage:[UIImage imageNamed:@"btn_facebook_active"] forState:UIControlStateHighlighted];
    
    [self.loginTwitterButton setImage:[UIImage imageNamed: @"btn_twitter_normal"] forState:UIControlStateNormal];
    [self.loginTwitterButton setImage:[UIImage imageNamed: @"btn_twitter_active"] forState:UIControlStateSelected];
    [self.loginTwitterButton setImage:[UIImage imageNamed: @"btn_twitter_active"] forState:UIControlStateHighlighted];
    
    [self.signInButton setImage:[UIImage imageNamed: @"btn_sign_in_normal"] forState:UIControlStateNormal];
    [self.signInButton setImage:[UIImage imageNamed: @"btn_sign_in_active"] forState:UIControlStateSelected];
    [self.signInButton setImage:[UIImage imageNamed: @"btn_sign_in_active"] forState:UIControlStateHighlighted];

    self.signUpBackground.image = [UIImage imageNamed:@"background_over"];
    
    [self.signUpButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"btn_sign_up_normal_%d", (int)kScreenWidth]] forState:UIControlStateNormal];
    [self.signUpButton setTitle:@"  Sign Up" forState:UIControlStateNormal];
    [self.signUpButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"btn_sign_up_active_%d", (int)kScreenWidth]] forState:UIControlStateSelected];
    [self.signUpButton setTitleColor: [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha: 1.0] forState:UIControlStateSelected];
    [self.signUpButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"btn_sign_up_active_%d", (int)kScreenWidth]] forState:UIControlStateHighlighted];
    [self.signUpButton setTitleColor: [[HelperManager sharedServer] colorwithHexString:ColorFromSeparators alpha: 1.0] forState:UIControlStateHighlighted];
}

- (void)createFaceBookTwitter {
    
    [[FHSTwitterEngine sharedEngine] permanentlySetConsumerKey:TwitterCostumerKey andSecret:TwitterCostumerSecretKey];
    [[FHSTwitterEngine sharedEngine] setDelegate:self];
    [[FHSTwitterEngine sharedEngine] loadAccessToken];
}

#pragma mark - FaceBook API

- (IBAction)loginButtonClicked:(id)sender {
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions:@[@"public_profile", @"email"]fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            // Process error
            NSLog(@"error %@",error);
        } else if (result.isCancelled) {
            // Handle cancellations
            NSLog(@"Cancelled");
        } else {
            if ([result.grantedPermissions containsObject:@"email"]) {
                // Do work
                NSLog(@"%@",result);
                NSLog(@"Correct");
                if ([FBSDKAccessToken currentAccessToken]) {
                    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
                     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                         if (!error) {
                             NSDictionary * responce = result;
                             NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=normal",[responce objectForKey:@"id"]]];
                             NSData  *data = [NSData dataWithContentsOfURL:url];
                             _pic.image = [UIImage imageWithData:data];
                         }
                     }];
                }
            }
        }
    }];
}

#pragma mark - FaceBook API -end

#pragma mark - twitter API

- (IBAction)twitterBtAction:(id)sender {

    UIViewController *loginController = [[FHSTwitterEngine sharedEngine]loginControllerWithCompletionHandler:^(BOOL success) {
        if (success) {
            NSString *username = [FHSTwitterEngine sharedEngine].authenticatedUsername;
            if (username.length > 0) {
                UIImage *profileImg = [[FHSTwitterEngine sharedEngine] getProfileImageForUsername:[[FHSTwitterEngine sharedEngine] authenticatedUsername] andSize:FHSTwitterEngineImageSizeOriginal];
            }
        }
    }];
    [self presentViewController:loginController animated:YES completion:nil];
}

- (NSString *)loadAccessToken {
    
    return [[NSUserDefaults standardUserDefaults]objectForKey:@"SavedAccessHTTPBody"];
}

- (void)storeAccessToken:(NSString *)accessToken {
    
    [[NSUserDefaults standardUserDefaults]setObject:accessToken forKey:@"SavedAccessHTTPBody"];
}

#pragma mark - twitter API -end

@end
