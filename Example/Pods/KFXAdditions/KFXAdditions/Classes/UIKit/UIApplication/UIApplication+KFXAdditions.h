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

@interface UIApplication (KFXAdditions)

/**
 *  Finds the current top view controller by starting at the keyWindow's rootViewController and recursively walking through the presentedViewControllers until it finds a viewController that doesn't have a .presentedViewController
 *
 *  @return The ViewController that is top
 */
-(UIViewController*)kfx_topViewController;


/**
 * @brief Reads the local info-plist file and looks for any background mode keys that are set. Will return YES if any of the available keys are set
 * @return YES if the background mode is enabled, NO if it is not
 **/
+(BOOL)kfx_hasBackgroundModeEnabled;


-(void)kfx_openURL:(NSURL*)url
           options:(NSDictionary*)options
 completionHandler:(void (^)(BOOL success))completion;



-(BOOL)kfx_pushNotificationsEnabled;


+(BOOL)kfx_isActive;
+(BOOL)kfx_isInactive;
+(BOOL)kfx_isBackground;


@end
