/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/

#import "UIViewController+KFXAdditions.h"
@import SafariServices;
// Other Categories
#import "UIAlertController+KFXAdditions.h"
#import "UIApplication+KFXAdditions.h"

@implementation UIViewController (KFXAdditions)


//--------------------------------------------------------
#pragma mark Init
//--------------------------------------------------------
+(instancetype)kfx_instantiateFromNib{
    return [[self alloc]initWithNibName:NSStringFromClass([self class])
                                 bundle:[NSBundle mainBundle]];
}



//--------------------------------------------------------
#pragma mark - Navigation
//--------------------------------------------------------
-(void)kfx_dismissViewController{
    if ([NSThread isMainThread]) {
        [self dismissViewControllerAnimated:YES completion:nil];

    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self dismissViewControllerAnimated:YES completion:nil];

        });
    }
}

-(void)kfx_dismissViewControllerFromPresenting{
    if ([NSThread isMainThread]) {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];

    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];

        });
    }
}

//--------------------------------------------------------
#pragma mark - Presentation
//--------------------------------------------------------
-(BOOL)kfx_hasBeenPresentedModally{
	
    BOOL isModal;// = ((self.parentViewController && self.parentViewController.presentedViewController == self) ||
                    //or if I have a navigation controller, check if its parent modal view controller is self navigation controller
//                    ( self.navigationController && self.navigationController.parentViewController && self.navigationController.parentViewController.presentedViewController == self.navigationController) ||
//                    //or if the parent of my UITabBarController is also a UITabBarController class, then there is no way to do that, except by using a modal presentation
//                    [[[self tabBarController] parentViewController] isKindOfClass:[UITabBarController class]]);
//
    
//    if ([self respondsToSelector:@selector(presentingViewController)]) {
    
        isModal = ((self.presentingViewController && self.presentingViewController.presentedViewController == self) ||
                   //or if I have a navigation controller, check if its parent modal view controller is self navigation controller
                   (self.navigationController && self.navigationController.presentingViewController && self.navigationController.presentingViewController.presentedViewController == self.navigationController) ||
                   //or if the parent of my UITabBarController is also a UITabBarController class, then there is no way to do that, except by using a modal presentation
                   [[[self tabBarController] presentingViewController] isKindOfClass:[UITabBarController class]]);
        
//    }
    return isModal;
}

-(void)kfx_presentWebPageWithURLString:(NSString *)urlString completion:(void (^)(BOOL))completionBlock{
    
    if (urlString == nil){
        
        NSString *message = [NSString stringWithFormat:@"Unable to open the web page because url is nil"];
        [self kfx_showErrorAlertWithMessage:message];
        completionBlock(NO);
        return;
    }
    NSURL *url = [NSURL URLWithString:urlString];
    [self kfx_presentWebPageWithURL:url completion:completionBlock];
}

-(void)kfx_presentWebPageWithURL:(NSURL *)url completion:(void (^)(BOOL))completionBlock{
    if (url == nil){
        NSString *message = [NSString stringWithFormat:@"Unable to open the web page because url is nil"];
        [self kfx_showErrorAlertWithMessage:message];
        completionBlock(NO);
        return;
    }
    if (@available(iOS 9.0, *)) {
        SFSafariViewController *safariVC = [[SFSafariViewController alloc]initWithURL:url];
        [self presentViewController:safariVC animated:YES completion:^{
            completionBlock(YES);
        }];
    } else {
        // Fallback on earlier versions
        [[UIApplication sharedApplication] kfx_openURL:url options:@{} completionHandler:^(BOOL success) {
            completionBlock(success);
        }];
    }
}


//--------------------------------------------------------
#pragma mark Alerts
//--------------------------------------------------------
-(void)kfx_showSimpleAlertWithTitle:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle{
	
    dispatch_block_t alertBlock = ^{
        NSString *buttonTitle2 = buttonTitle;
        if (buttonTitle2 == nil) {
            buttonTitle2 = NSLocalizedString(@"Okay", @"Okay / agree / accept");
        }
        UIAlertController *alert = [UIAlertController kfx_alertControllerWithTitle:title message:message singleButtonTitle:buttonTitle2];
        [self presentViewController:alert animated:YES completion:nil];
    };
    
    if ([NSThread isMainThread]) {
        alertBlock();
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            alertBlock();
        });
    }
}

-(void)kfx_showSimpleAlertWithTitle:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle buttonCompletion:(void (^)(UIAlertAction *))completionBlock{
	
    dispatch_block_t alertBlock = ^{
        NSString *buttonTitle2 = buttonTitle;
        if (buttonTitle2 == nil) {
            buttonTitle2 = NSLocalizedString(@"Okay", @"Okay / agree / accept");
        }
        UIAlertController *alert = [UIAlertController kfx_alertControllerWithTitle:title message:message singleButtonTitle:buttonTitle2 buttonTappedCompletionBlock:completionBlock];
        [self presentViewController:alert animated:YES completion:nil];
    };
    
    if ([NSThread isMainThread]) {
        alertBlock();
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            alertBlock();
        });
    }
}

-(void)kfx_showErrorAlertWithMessage:(NSString *)message{
    
    [self kfx_showSimpleAlertWithTitle:NSLocalizedString(@"Error", @"An error occurred")
                               message:message
                           buttonTitle:nil];
}

-(void)kfx_showErrorAlertWithMessage:(NSString*)message
                okayButtonCompletion:(void(^)(UIAlertAction *action))completionBlock{
    
    [self kfx_showSimpleAlertWithTitle:NSLocalizedString(@"Error", @"An error occurred")
                               message:message
                           buttonTitle:NSLocalizedString(@"Okay", @"Okay / agree / accept")
                      buttonCompletion:completionBlock];
}

-(void)kfx_showSuccessAlertWithMessage:(NSString *)message{
    
    [self kfx_showSimpleAlertWithTitle:NSLocalizedString(@"Success", @"The operation was a success")
                               message:message
                           buttonTitle:nil];
}

-(void)kfx_showSuccessAlertWithMessage:(NSString*)message
                  okayButtonCompletion:(void(^)(UIAlertAction *action))completionBlock{
    
    [self kfx_showSimpleAlertWithTitle:NSLocalizedString(@"Success", @"The operation was a success")
                               message:message
                           buttonTitle:NSLocalizedString(@"Okay", @"Okay / agree / accept")
                      buttonCompletion:completionBlock];
    
}

-(void)kfx_showOpenSettingsAlertWithTitle:(NSString *)title message:(NSString *)message completion:(void (^)(BOOL))completionBlock{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Not Now" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionBlock(NO);
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Open Settings" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] kfx_openURL:url options:@{} completionHandler:^(BOOL success) {
                completionBlock(success);
        }];
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];

}

//--------------------------------------------------------
#pragma mark - Child View Controllers
//--------------------------------------------------------
-(void)kfx_addChildViewController:(UIViewController *)childVC toView:(UIView *)view{
	[childVC willMoveToParentViewController:self];
	[self addChildViewController:childVC];
	childVC.view.frame = view.bounds;
	[view addSubview:childVC.view];
	[childVC didMoveToParentViewController:self];
}

-(void)kfx_addChildViewController:(UIViewController *)childVC toView:(UIView *)view withFrame:(CGRect)frame{
	[childVC willMoveToParentViewController:self];
	[self addChildViewController:childVC];
	childVC.view.frame = frame;
	[view addSubview:childVC.view];
	[childVC didMoveToParentViewController:self];
}

-(void)kfx_removeChildViewController:(UIViewController *)childVC{
	if ([childVC respondsToSelector:@selector(setDelegate:)]) {
		[childVC performSelector:@selector(setDelegate:) withObject:nil];
	}
	[childVC willMoveToParentViewController:nil];
	[childVC.view removeFromSuperview];
	[childVC removeFromParentViewController];
}


-(NSArray *)kfx_findChildViewControllersOfClass:(Class)childClass{
	NSMutableArray *mutArray = [[NSMutableArray alloc]initWithCapacity:2];
	for (UIViewController *childVC in self.childViewControllers) {
		if ([childVC isKindOfClass:childClass]) {
			[mutArray addObject:childVC];
		}
	}
	return [mutArray copy];
}


@end
