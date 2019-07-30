/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/


#import "UICollectionViewCell+KFXAdditions.h"
#import "UIView+KFXAdditions.h"

@implementation UICollectionViewCell (KFXAdditions)

-(UICollectionView *)kfx_collectionView{
    return (UICollectionView*)[self kfx_superviewOfClass:[UICollectionView class]];
}

-(NSIndexPath *)kfx_indexPath{
    return [[self kfx_collectionView] indexPathForCell:self];
}

+(UINib *)kfx_nib{
    
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class])
                                bundle:[self kfx_bundle]];
    return nib;
}

+(NSString *)kfx_reuseIdentifier{
    return NSStringFromClass([self class]);
}

+(NSBundle *)kfx_bundle{
    return [NSBundle bundleForClass:[self class]];
}

@end
