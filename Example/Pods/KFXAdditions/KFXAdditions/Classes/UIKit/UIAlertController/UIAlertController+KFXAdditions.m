/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/

#import "UIAlertController+KFXAdditions.h"
#import "UIApplication+KFXAdditions.h"

@implementation UIAlertController (KFXAdditions)

//======================================================
#pragma mark - ** Public Method **
//======================================================
//--------------------------------------------------------
#pragma mark - Query Alerts
//--------------------------------------------------------
+(BOOL)kfx_isAlertControllerShowing{
    
    UIViewController *topVC = [[UIApplication sharedApplication]kfx_topViewController];
    if ([topVC isKindOfClass:[UIAlertController class]]) {
        return YES;
    }
    return NO;
}
//--------------------------------------------------------
#pragma mark - Build Alerts
//--------------------------------------------------------
/// Convinience method to build an UIAlertController
+(UIAlertController*)kfx_alertControllerWithTitle:(NSString*_Nullable)title
                                      message:(NSString*_Nullable)message
                            singleButtonTitle:(NSString*_Nonnull)buttonTitle{
    
    return [UIAlertController kfx_alertControllerWithTitle:title
                                  message:message
                        singleButtonTitle:buttonTitle
              buttonTappedCompletionBlock:nil];
}

/// Convinience method to build an UIAlertController
+(UIAlertController*)kfx_alertControllerWithTitle:(NSString*_Nullable)title
                                      message:(NSString*_Nullable)message
                            singleButtonTitle:(NSString*_Nonnull)buttonTitle
                  buttonTappedCompletionBlock:(void(^_Nullable)(UIAlertAction *action))completionBlockOrNil{
 
    UIAlertController *alertVC = [UIAlertController kfx_alertControllerWithTitle:title message:message];
    [alertVC addAction:[UIAlertAction actionWithTitle:buttonTitle
                                                style:UIAlertActionStyleDefault
                                              handler:completionBlockOrNil]];
    return alertVC;    
}


/// Convinience method to build an UIAlertController
+(UIAlertController*)kfx_okayCancelAlertControllerWithTitle:(NSString*_Nullable)title
                                                message:(NSString*_Nullable)message
                                  cancelCompletionBlock:(void(^_Nullable)(UIAlertAction *action))cancelBlockOrNil
                                    okayCompletionBlock:(void(^_Nullable)(UIAlertAction *action))okayBlockOrNil{
 
    UIAlertController *alertVC = [UIAlertController kfx_alertControllerWithTitle:title message:message];
    [alertVC addAction:[UIAlertController kfx_cancelActionWithCompletionBlock:cancelBlockOrNil]];
    [alertVC addAction:[UIAlertController kfx_okayActionWithCompletionBlock:okayBlockOrNil]];
    return alertVC;
}



//======================================================
#pragma mark - ** Private Methods **
//======================================================
+(UIAlertController*)kfx_alertControllerWithTitle:(NSString*)title message:(NSString*)message{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    return alert;
}

+(UIAlertAction*)kfx_okayActionWithCompletionBlock:(void(^_Nullable)(UIAlertAction *action))completionBlockOrNil{
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:NSLocalizedString(@"Okay", @"Okay : Confirm that you are satisifed")
                                                     style:UIAlertActionStyleDefault
                                                   handler:completionBlockOrNil];
    return action;
}

+(UIAlertAction*)kfx_cancelActionWithCompletionBlock:(void(^_Nullable)(UIAlertAction *action))completionBlockOrNil{
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel / Ignore")
                                                     style:UIAlertActionStyleCancel
                                                   handler:completionBlockOrNil];
    return action;
}









@end




















