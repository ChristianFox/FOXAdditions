/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/

#import "UIApplication+KFXAdditions.h"

@implementation UIApplication (KFXAdditions)


-(UIViewController *)kfx_topViewController{
    return [self kfx_topViewController:self.keyWindow.rootViewController];
}

- (UIViewController *)kfx_topViewController:(UIViewController *)rootViewController
{
    if (rootViewController.presentedViewController == nil) {
        return rootViewController;
    }
    
    if ([rootViewController.presentedViewController isMemberOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController.presentedViewController;
        UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
        return [self kfx_topViewController:lastViewController];
    }
    
    UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
    return [self kfx_topViewController:presentedViewController];
}


+(BOOL)kfx_hasBackgroundModeEnabled{
	
	static BOOL isEnabled;
	static dispatch_once_t dispatchOnceToken;
	dispatch_once(&dispatchOnceToken, ^{
		
		// Retrieve application information Property List
		NSDictionary *applicationInformation = [[NSBundle mainBundle] infoDictionary];
		
		if ([applicationInformation objectForKey:@"UIBackgroundModes"]) {
			
			NSArray *backgroundModes = [applicationInformation valueForKey:@"UIBackgroundModes"];
			NSArray *suitableModes = @[@"audio",
									   @"bluetooth-central",
									   @"bluetooth-peripheral",
									   @"external-accessory",
									   @"fetch",
									   @"location",
									   @"newsstand-content",
									   @"remote-notification",
									   @"voip",
									   ];
			[backgroundModes enumerateObjectsUsingBlock:^(id mode, NSUInteger modeIdx, BOOL *modeEnumeratorStop) {
				
				isEnabled = [suitableModes containsObject:mode];
				*modeEnumeratorStop = isEnabled;
			}];
		}
	});
	
	
	return isEnabled;

}

-(void)kfx_openURL:(NSURL *)url options:(NSDictionary *)options completionHandler:(void (^)(BOOL))completion{
    
    if (@available(iOS 10.0, *)) {
        if ([self canOpenURL:url]) {
            [self openURL:url
                  options:options
        completionHandler:completion];
        }else{
            completion(NO);
        }
    } else {
        BOOL success = [self openURL:url];
        completion(success);
        
    }

}


- (BOOL)kfx_pushNotificationsEnabled {
    
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(currentUserNotificationSettings)]) {
        UIUserNotificationType types = [[[UIApplication sharedApplication] currentUserNotificationSettings] types];
        return (types & UIUserNotificationTypeAlert);
    }
    else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
		
		UIRemoteNotificationType types = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
		return (types & UIRemoteNotificationTypeAlert);
		
#pragma clang diagnostic pop

    }
}

+(BOOL)kfx_isActive{
	return ([self sharedApplication].applicationState == UIApplicationStateActive);
}

+(BOOL)kfx_isInactive{
	return ([self sharedApplication].applicationState == UIApplicationStateInactive);
}

+(BOOL)kfx_isBackground{
	return ([self sharedApplication].applicationState == UIApplicationStateBackground);
}


@end















