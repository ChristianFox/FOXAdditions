/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXUtilities
 *
 ************************************/



#import "KFXMailHelper.h"
// Cocoa Frameworks
@import MessageUI;

@interface KFXMailHelper () <MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate>

@property (weak,nonatomic) UIViewController *presenter;
@property (copy,nonatomic) KFXSMSComposeResult SMSComposeResultBlock;
@property (copy,nonatomic) KFXMailComposeResult MailComposeResultBlock;

@end


@implementation KFXMailHelper


//======================================================
#pragma mark - ** Public Methods **
//======================================================
//--------------------------------------------------------
#pragma mark Initilisers
//--------------------------------------------------------
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+(instancetype)mailHelper{
    
    KFXMailHelper *helper = [[KFXMailHelper alloc]init];
    return helper;
}

//--------------------------------------------------------
#pragma mark Inject Dependencies
//--------------------------------------------------------


//======================================================
#pragma mark - ** Primary Public Functionality **
//======================================================
//--------------------------------------------------------
#pragma mark Present VCs
//--------------------------------------------------------
-(void)presentSMSComposerWithSubject:(NSString*)subject
                             message:(NSString*)message
                         receipients:(NSArray<NSString*>*)recipients
                           presenter:(UIViewController *)presenter
                     completionBlock:(KFXSMSComposeResult)completionBlockOrNil{
    
    self.presenter = presenter;
    self.SMSComposeResultBlock = completionBlockOrNil;
    
    if (![MFMessageComposeViewController canSendText]) {
        
        if (completionBlockOrNil != nil) {
            NSError *error = [NSError errorWithDomain:@"" code:0 userInfo:@{NSLocalizedDescriptionKey:NSLocalizedString(@"It is not possible to send SMS from this device.", @"")}];
            completionBlockOrNil(NO,error);
        }
        
    }else{
        
        MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
        messageController.messageComposeDelegate = self;
        [messageController setBody:message];
        [messageController setSubject:subject];
        [messageController setRecipients:recipients];
        
        [presenter presentViewController:messageController animated:YES completion:NULL];
    }
}

-(void)presentEmailComposerWithSubject:(NSString *)subject
                               message:(NSString *)message
                         messageIsHTML:(BOOL)isHTML
                           receipients:(NSArray<NSString *> *)recipients
                             presenter:(UIViewController *)presenter
                       completionBlock:(KFXMailComposeResult)completionBlockOrNil{
    
    self.presenter = presenter;
    self.MailComposeResultBlock = completionBlockOrNil;
    
    if (![MFMailComposeViewController canSendMail]) {
        
        if (completionBlockOrNil != nil) {
            NSError *error = [NSError errorWithDomain:@"" code:0 userInfo:@{NSLocalizedDescriptionKey:NSLocalizedString(@"It is not possible to send email from this device.", @"")}];
            completionBlockOrNil(NO,error);
        }
        
    }else{
        
        MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc]init];
        [mailVC setMailComposeDelegate:self];
        [mailVC setSubject:subject];
        [mailVC setMessageBody:message isHTML:isHTML];
        [mailVC setToRecipients:recipients];
        [presenter presentViewController:mailVC animated:YES completion:NULL];
    }
}

//======================================================
#pragma mark - ** Inherited Methods **
//======================================================




//======================================================
#pragma mark - ** Protocol Methods **
//======================================================
//--------------------------------------------------------
#pragma mark - MFMailComposeViewControllerDelegate
//--------------------------------------------------------
//--------------------------------------------------------
#pragma mark - MFMessageComposeViewControllerDelegate
//--------------------------------------------------------
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    
//    switch (result)
//    {
//        case MessageComposeResultCancelled:
//            NSLog(@"Mail cancelled");
//            break;
//        case MessageComposeResultSent:
//            NSLog(@"Mail sent");
//            break;
//        case MessageComposeResultFailed:
//            NSLog(@"Mail sent failure");
//            break;
//        default:
//            break;
//    }
    
    [self.presenter dismissViewControllerAnimated:YES completion:nil];
    if (self.SMSComposeResultBlock != nil) {
        self.SMSComposeResultBlock(result, nil);
    }
//    if (result == MFMailComposeResultFailed) {
//        [self kfx_showErrorAlertWithMessage:NSLocalizedString(@"The SMS failed to send.", @"")];
//    }
}


-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
//    switch (result)
//    {
//        case MFMailComposeResultCancelled:
//            NSLog(@"Mail cancelled");
//            break;
//        case MFMailComposeResultSaved:
//            NSLog(@"Mail saved");
//            break;
//        case MFMailComposeResultSent:
//            NSLog(@"Mail sent");
//            break;
//        case MFMailComposeResultFailed:{
//            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
//
//            break;
//        }
//        default:
//            break;
//    }
    [self.presenter dismissViewControllerAnimated:YES completion:nil];
    if (self.MailComposeResultBlock != nil) {
        self.MailComposeResultBlock(result, error);
    }
    
//    if (result == MFMailComposeResultFailed) {
//
//        [self kfx_showErrorAlertWithMessage:[NSString stringWithFormat:NSLocalizedString(@"The email failed to send with the following error: %@", @""),error.localizedDescription]];
//    }
}




//======================================================
#pragma mark - ** Private Methods **
//======================================================
//--------------------------------------------------------
#pragma mark Lazy Load
//--------------------------------------------------------


@end
