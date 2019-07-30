/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/


#import <Foundation/Foundation.h>

@interface NSURL (KFXAdditions)

/// Returns the keys and values of the parameters from the url
-(NSDictionary<NSString*,NSString*>*)kfx_queryParameters;

+(NSURL*)kfx_urlFromHTMLString:(NSString*)htmlString withError:(NSError**)error;

@end
