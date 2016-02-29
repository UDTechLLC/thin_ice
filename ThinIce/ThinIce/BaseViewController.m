//
//  BaseViewController.m
//  ThinIce
//
//  Created by Dima Shapovalov on 16.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()


@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    statusBarView.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#222e3b" alpha:1.0];
    [self.view addSubview:statusBarView];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    [super viewWillAppear:animated];
}

- (void)backButtonWasPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)backButtonActions:(id)sender {
    [self backButtonWasPressed];
}

- (void)addLoginBackgroundImage {
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:[NSString stringWithFormat:@"Thin_ice_background_%d", (int)kScreenWidth]]];
}

- (void)addDashboardBackgroundImage {
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:[NSString stringWithFormat:@"thin_ice_dashboard_background_%d", (int)kScreenWidth]]];
}

- (void)translucentNavigationBar:(BOOL)select {
    if(select) {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.shadowImage = [UIImage new];
        self.navigationController.navigationBar.translucent = YES;
    } else {
        [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.shadowImage = nil;
        self.navigationController.navigationBar.translucent = YES;
    }
}

- (void)roundMyView:(UIView*)view
       borderRadius:(CGFloat)radius
        borderWidth:(CGFloat)border
              color:(UIColor*)color
{
    CALayer *layer = [view layer];
    layer.masksToBounds = YES;
    layer.cornerRadius = radius;
    layer.borderWidth = border;
    layer.borderColor = (__bridge CGColorRef _Nullable)(color);
}

- (UIBezierPath *)roundedPolygonPathWithRect:(CGRect)rect
                                   lineWidth:(CGFloat)lineWidth
                                       sides:(NSInteger)sides
                                cornerRadius:(CGFloat)cornerRadius
{
    UIBezierPath *path  = [UIBezierPath bezierPath];
    
    CGFloat theta       = 2.0 * M_PI / sides;                           // how much to turn at every corner
    //    CGFloat offset      = cornerRadius * tan(theta / 2.0);              // offset from which to start rounding corners
    CGFloat width = MIN(rect.size.width, rect.size.height);             // width of the square
    
    // Calculate Center
    CGPoint center = CGPointMake(rect.origin.x + width / 2.0, rect.origin.y + width / 2.0);
    // Radius of the circle that encircles the polygon
    // Notice that the radius is adjusted for the corners, that way the largest outer
    // dimension of the resulting shape is always exactly the width - linewidth
    CGFloat radius = (width - lineWidth + cornerRadius - (cos(theta) * cornerRadius)) / 2.0;
    
    // Start drawing at a point, which by default is at the right hand edge
    // but can be offset
    CGFloat angle = M_PI / 2;
    
    CGPoint corner = CGPointMake(center.x + (radius - cornerRadius) * cos(angle), center.y + (radius - cornerRadius) * sin(angle));
    [path moveToPoint:(CGPointMake(corner.x + cornerRadius * cos(angle + theta), corner.y + cornerRadius * sin(angle + theta)))];
    
    for (NSInteger side = 0; side < sides; side++)
    {
        
        angle += theta;
        
        CGPoint corner = CGPointMake(center.x + (radius - cornerRadius) * cos(angle), center.y + (radius - cornerRadius) * sin(angle));
        CGPoint tip = CGPointMake(center.x + radius * cos(angle), center.y + radius * sin(angle));
        CGPoint start = CGPointMake(corner.x + cornerRadius * cos(angle - theta), corner.y + cornerRadius * sin(angle - theta));
        CGPoint end = CGPointMake(corner.x + cornerRadius * cos(angle + theta), corner.y + cornerRadius * sin(angle + theta));
        
        [path addLineToPoint:start];
        [path addQuadCurveToPoint:end controlPoint:tip];
    }
    
    [path closePath];
    
    // Move the path to the correct origins
    CGRect bounds = path.bounds;
    CGAffineTransform transform =  CGAffineTransformMakeTranslation(-bounds.origin.x + rect.origin.x + lineWidth / 2.0, -bounds.origin.y + rect.origin.y + lineWidth / 2.0);
    [path applyTransform:transform];
    
    return path;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)addBorderLineFor:(UIView*)view withColor:(UIColor*)color borderWidth:(float)width radius:(float)radius {
    view.layer.cornerRadius = radius;
    view.layer.borderColor = color.CGColor;
    view.layer.borderWidth = width;
}

@end
