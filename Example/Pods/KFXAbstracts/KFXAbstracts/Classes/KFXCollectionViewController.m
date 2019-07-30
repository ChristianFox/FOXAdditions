/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAbstracts
 *
 ************************************/


#import "KFXCollectionViewController.h"

@interface KFXCollectionViewController ()

@end

@implementation KFXCollectionViewController




//======================================================
#pragma mark - ** Public Methods **
//======================================================
//--------------------------------------------------------
#pragma mark Initilisation
//--------------------------------------------------------
+(instancetype)initiliseWithFlowLayout{
	
	UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
	id cvc = [[self alloc]initWithCollectionViewLayout:layout];
	return cvc;
}

//--------------------------------------------------------
#pragma mark Item deselection
//-------------------------------------------------------
-(void)deselectAllItemsAnimated:(BOOL)animated{
    for (NSIndexPath *indexPath in [self.collectionView indexPathsForSelectedItems]) {
        [self.collectionView deselectItemAtIndexPath:indexPath animated:animated];
    }
}


//--------------------------------------------------------
#pragma mark Back Button
//--------------------------------------------------------
-(void)addCustomBackButtonWithImage:(UIImage*)image{
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]initWithImage:image
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(backButtonTapped:)];
    self.navigationItem.leftBarButtonItem = backButton;
}


//--------------------------------------------------------
#pragma mark Actions
//--------------------------------------------------------
-(void)backButtonTapped:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}



//--------------------------------------------------------
#pragma mark SMS & Email
//--------------------------------------------------------
-(void)presentEmailComposerWithSubject:(NSString*)subject message:(NSString*)message messageIsHTML:(BOOL)isHTML receipients:(NSArray<NSString*>*)recipients{
    
    if (![MFMailComposeViewController canSendMail]) {
        
        [self kfx_showErrorAlertWithMessage:NSLocalizedString(@"It is not possible to send email from this device.", @"")];
        
    }else{
        
        MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc]init];
        [mailVC setMailComposeDelegate:self];
        [mailVC setSubject:subject];
        [mailVC setMessageBody:message isHTML:isHTML];
        [mailVC setToRecipients:recipients];
        [self presentViewController:mailVC animated:YES completion:NULL];
    }
}

-(void)presentSMSComposerWithSubject:(NSString*)subject message:(NSString*)message receipients:(NSArray<NSString*>*)recipients{
    
    if (![MFMessageComposeViewController canSendText]) {
        
        [self kfx_showErrorAlertWithMessage:NSLocalizedString(@"It is not possible to send SMS from this device.", @"")];
        
    }else{
        
        MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
        messageController.messageComposeDelegate = self;
        [messageController setBody:message];
        [messageController setSubject:subject];
        [messageController setRecipients:recipients];
        
        [self presentViewController:messageController animated:YES completion:NULL];
    }
}

//======================================================
#pragma mark - ** Inherited Methods **
//======================================================
//--------------------------------------------------------
#pragma mark - UIViewController
////--------------------------------------------------------
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//}
//
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//}

-(void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	self.visible = YES;
}
-(void)viewDidDisappear:(BOOL)animated{
	[super viewDidDisappear:animated];
	self.visible = NO;
}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//}



//======================================================
#pragma mark - ** Protocol Methods **
//======================================================
//--------------------------------------------------------
#pragma mark - UICollectionViewDataSource
//--------------------------------------------------------



//--------------------------------------------------------
#pragma mark - UICollectionViewDelegate
//--------------------------------------------------------


//--------------------------------------------------------
#pragma mark - UICollectionViewDelegateFlowLayout
//--------------------------------------------------------

//--------------------------------------------------------
#pragma mark - MFMailComposeViewControllerDelegate
//--------------------------------------------------------
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:{
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            
            break;
        }
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (result == MFMailComposeResultFailed) {
        
        [self kfx_showErrorAlertWithMessage:[NSString stringWithFormat:NSLocalizedString(@"The email failed to send with the following error: %@", @""),error.localizedDescription]];
    }
}

//--------------------------------------------------------
#pragma mark - MFMessageComposeViewControllerDelegate
//--------------------------------------------------------
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    
    switch (result)
    {
        case MessageComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MessageComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MessageComposeResultFailed:
            NSLog(@"Mail sent failure");
            break;
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (result == MFMailComposeResultFailed) {
        [self kfx_showErrorAlertWithMessage:NSLocalizedString(@"The SMS failed to send.", @"")];
    }
    
}


//======================================================
#pragma mark - ** Private Methods **
//======================================================

//--------------------------------------------------------
#pragma mark - Lazy Load
//--------------------------------------------------------



//======================================================
#pragma mark - ** Navigation **
//======================================================



@end






















