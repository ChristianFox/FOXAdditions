/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAbstracts
 *
 ************************************/

#import "KFXCollectionViewCell.h"
// Pods
#import <KFXAdditions/UIView+KFXAdditions.h>

@implementation KFXCollectionViewCell

//======================================================
#pragma mark - ** Public Methods **
//======================================================
+(UINib *)nib{
    
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class])
                                bundle:[self bundle]];
    return nib;
}

+(NSString *)reuseIdentifier{
    return NSStringFromClass([self class]);
}

+(NSBundle *)bundle{
    return [NSBundle bundleForClass:[self class]];
}

-(void)addBorder{
    [self.contentView kfx_addBorderWithRadius:3.0 width:self.borderWidth colour:self.borderColour];
    
}

-(void)addBorderIfNeeded{
    
    if (self.borderColour != nil
        && self.borderWidth >= 1) {
        
        [self addBorder];
    }
}

//======================================================
#pragma mark - ** Inherited Methods **
//======================================================
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
//    self.borderWidth = 1.0;
//    self.borderColour = [UIColor lightGrayColor];
    [self addBorderIfNeeded];
    
}




@end
