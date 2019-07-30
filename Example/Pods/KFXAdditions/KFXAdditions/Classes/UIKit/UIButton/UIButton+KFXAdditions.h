/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/


#import <UIKit/UIKit.h>

@interface UIButton (KFXAdditions)


//--------------------------------------------------------
#pragma mark Convienence Initilisers
//--------------------------------------------------------
/// Intiilises a custom type UIButton set to display the given image
+(instancetype)kfx_buttonWithImage:(UIImage*)image;

/// Intiilises a custom type UIButton set to display the named image
+(instancetype)kfx_buttonWithImageNamed:(NSString*)imageNamed;




@end
