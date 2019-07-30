/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/


#import "NSURL+KFXAdditions.h"
#import "NSString+KFXAdditions.h"

@implementation NSURL (KFXAdditions)


-(NSDictionary<NSString*,NSString*>*)kfx_queryParameters{
    
    NSString *query = [[self query] lowercaseString];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:6];
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    
    for (NSString *pair in pairs) {
        NSArray *elements = [pair componentsSeparatedByString:@"="];
        NSString *key = [[elements objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *val = [[elements objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        [dict setObject:val forKey:key];
    }
    return dict;
}

+(NSURL*)kfx_urlFromHTMLString:(NSString*)htmlString withError:(NSError *__autoreleasing *)error{
    
    NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:error];
    if (detector == nil) {
        return nil;
    }
    NSArray *matches = [detector matchesInString:htmlString
                                         options:0
                                           range:[htmlString kfx_rangeOfString]];
    for (NSTextCheckingResult *match in matches) {
        if ([match resultType] == NSTextCheckingTypeLink) {
            NSURL *url = [match URL];
            return url;
        }
    }
    return nil;
}


@end
