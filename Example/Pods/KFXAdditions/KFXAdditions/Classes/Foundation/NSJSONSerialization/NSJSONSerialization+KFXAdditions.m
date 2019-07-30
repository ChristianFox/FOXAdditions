/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/

#import "NSJSONSerialization+KFXAdditions.h"
#import "NSError+KFXAdditions.h"

@implementation NSJSONSerialization (KFXAdditions)


+ (NSString *)kfx_JSONStringWithJSONObject:(id)JSONObject options:(NSJSONWritingOptions)opt error:(NSError **)error{
    
    if (JSONObject == nil) {
        if (error != nil) {
            *error = [NSError kfx_invalidParameterError:@"JSONObject" withErrorCode:KFXErrorCodeParameterIsNil sender:self];
        }
        return nil;
    }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:JSONObject options:opt error:error];
    if (jsonData == nil) {
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}


+ (id)kfx_JSONObjectWithString:(NSString*)string options:(NSJSONReadingOptions)opt error:(NSError **)error{
    
    if (string == nil) {
        if (error != nil) {
            *error = [NSError kfx_invalidParameterError:@"string" withErrorCode:KFXErrorCodeParameterIsNil sender:self];
        }
        return nil;
    }
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    if (data == nil) {
        return nil;
    }
    id JSONObject = [NSJSONSerialization JSONObjectWithData:data options:opt error:error];
    return JSONObject;
}


@end
