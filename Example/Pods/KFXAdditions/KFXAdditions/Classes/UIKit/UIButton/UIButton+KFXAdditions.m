/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/


#import "UIButton+KFXAdditions.h"

@implementation UIButton (KFXAdditions)



//--------------------------------------------------------
#pragma mark Convienence Initilisers
//--------------------------------------------------------
+(instancetype)kfx_buttonWithImage:(UIImage*)image{
    
    if (image == nil) {
        return nil;
    }
    
    UIButton *button = [self buttonWithType:UIButtonTypeCustom];
    button.frame = (CGRect){CGPointZero,image.size};
    [button setImage:image forState:UIControlStateNormal];
    return button;
}

+(instancetype)kfx_buttonWithImageNamed:(NSString*)imageNamed{
    
    UIImage *image = [UIImage imageNamed:imageNamed];
    return [self kfx_buttonWithImage:image];
}






















@end
