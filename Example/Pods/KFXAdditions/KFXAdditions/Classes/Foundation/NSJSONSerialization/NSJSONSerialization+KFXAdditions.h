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

@interface NSJSONSerialization (KFXAdditions)


+ (NSString *)kfx_JSONStringWithJSONObject:(id)JSONObject options:(NSJSONWritingOptions)opt error:(NSError **)error;

+ (id)kfx_JSONObjectWithString:(NSString*)string options:(NSJSONReadingOptions)opt error:(NSError **)error;


@end
