//
//  SlideMenuTableCell.h
//  ThinIce
//
//  Created by Dima Shapovalov on 22.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideMenuTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellImage;
@property (weak, nonatomic) IBOutlet UILabel *cellName;
@property (weak, nonatomic) IBOutlet UIView *separator;

- (void)loadCellViewWithCellImage:(UIImage*)image andCellName:(NSString*)name;

@end
