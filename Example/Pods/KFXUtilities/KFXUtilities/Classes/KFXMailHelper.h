/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXUtilities
 *
 ************************************/



@import Foundation;
@import MessageUI;


typedef void(^KFXSMSComposeResult)(MessageComposeResult result, NSError *error);
typedef void(^KFXMailComposeResult)(MFMailComposeResult result, NSError *error);



@interface KFXMailHelper : NSObject


//--------------------------------------------------------
#pragma mark Initilisers
//--------------------------------------------------------
+(instancetype)mailHelper;


//--------------------------------------------------------
#pragma mark Present VCs
//--------------------------------------------------------
-(void)presentSMSComposerWithSubject:(NSString*)subject
                             message:(NSString*)message
                         receipients:(NSArray<NSString*>*)recipients
                           presenter:(UIViewController*)presenter
                     completionBlock:(KFXSMSComposeResult)completionBlockOrNil;

-(void)presentEmailComposerWithSubject:(NSString*)subject
                               message:(NSString*)message
                         messageIsHTML:(BOOL)isHTML
                           receipients:(NSArray<NSString*>*)recipients
                             presenter:(UIViewController*)presenter
                       completionBlock:(KFXMailComposeResult)completionBlockOrNil;



@end
