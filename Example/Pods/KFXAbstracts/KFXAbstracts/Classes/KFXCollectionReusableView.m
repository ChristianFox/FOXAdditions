/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAbstracts
 *
 ************************************/


#import "KFXCollectionReusableView.h"

@implementation KFXCollectionReusableView


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


@end
