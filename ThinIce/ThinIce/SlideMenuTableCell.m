//
//  SlideMenuTableCell.m
//  ThinIce
//
//  Created by Dima Shapovalov on 22.02.16.
//  Copyright © 2016 udtech.co. All rights reserved.
//

#import "SlideMenuTableCell.h"

@implementation SlideMenuTableCell {
    UIImageView *backgroundView;
}

- (void)awakeFromNib {
    self.backgroundColor = [UIColor clearColor];
    self.cellImage.contentMode = UIViewContentModeScaleAspectFit;
    self.cellImage.clipsToBounds = YES;
    self.cellName.textColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:kSlideMenuSelectedImage]];
    self.separator.backgroundColor = [[HelperManager sharedServer] colorwithHexString:@"#18ffff" alpha:1.0];
}

- (void)loadCellViewWithCellImage:(UIImage*)image andCellName:(NSString*)name {
    self.cellImage.image = image;
    self.cellName.text = name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if(selected) {
        self.selectedBackgroundView = backgroundView;
        self.cellName.textColor = [[HelperManager sharedServer] colorwithHexString:@"#18ffff" alpha:1.0];
    } else {
        self.selectedBackgroundView = backgroundView;
        self.cellName.textColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    }
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    if(highlighted) {
        self.selectedBackgroundView = backgroundView;
        self.cellName.textColor = [[HelperManager sharedServer] colorwithHexString:@"#18ffff" alpha:1.0];
    } else {
        self.selectedBackgroundView = backgroundView;
        self.cellName.textColor = [[HelperManager sharedServer] colorwithHexString:@"#cccccc" alpha:1.0];
    }
}
@end
