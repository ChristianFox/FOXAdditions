/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/


#import "NSString+KFXAdditions.h"
#import "NSAttributedString+KFXAdditions.h"

@implementation NSString (KFXAdditions)



//======================================================
#pragma mark - ** Class Methods **
//======================================================
+(NSString*)kfx_randomStringOfLength:(int)length withStringComponents:(KFXStringComponent)components{
    
    return [self kfx_randomStringOfLength:length withStringComponents:components andCharacterPool:nil];
}

+(NSString *)kfx_randomStringOfLength:(int)length withStringComponents:(KFXStringComponent)components andCharacterPool:(NSString *)additionalCharacters{
    
    NSMutableString *characterPool = [[NSMutableString alloc]init];
    if (components == KFXStringComponentNone) {
        
        return nil;
        
    }
    if (components & KFXStringComponentAlpha){
        
        [characterPool appendString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];
        
    }
    
    if (components & KFXStringComponentNumerical){
        
        [characterPool appendString:@"0123456789"];
        
    }
    
    if (components & KFXStringComponentSymbolsCommon){
        
        [characterPool appendString:@"<>!@£$%%&*€#?+-=_"];
        
    }
    
    if (components & KFXStringComponentSymbolsExtensive){
        
        [characterPool appendString:@"§±!@£$%%^&*()_+=-€#¡¢∞§¶•ªº–≠œ∑®®†¥¨^øπ“‘«æ…¬˚∆˙©ƒ∂ßåΩ≈ç√∫~µ≤≥÷?><,./;'\\[]}{|\":`~"];
    }
    
    if (additionalCharacters != nil) {
        [characterPool appendString:additionalCharacters];
    }
    return [self kfx_randomStringOfLength:length fromCharacterPool:[characterPool copy]];
}

+(NSString *)kfx_randomStringOfLength:(int)length fromCharacterPool:(NSString *)characterPool{
    
    int randMax = (int)characterPool.length;
    
    NSMutableString *mutString = [[NSMutableString alloc]initWithString:@""];
    for (int idx = 0; idx < length; idx++) {
        
        int randInt = arc4random_uniform(randMax);
        [mutString appendFormat: @"%C", [characterPool characterAtIndex: randInt]];
        
    }
    return [mutString copy];

}

+(NSString*)kfx_randomStringOfLength:(int)length DEPRECATED_ATTRIBUTE{
    
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    int randMax = (int)letters.length;
    
    NSMutableString *mutString = [[NSMutableString alloc]initWithString:@""];
    for (int idx = 0; idx < length; idx++) {
        
        int randInt = arc4random_uniform(randMax);
        [mutString appendFormat: @"%C", [letters characterAtIndex: randInt]];
        
    }
    return [mutString copy];
}


+(NSString *)kfx_stringByCombiningComponents:(NSArray<NSString *> *)components separatedByString:(NSString *)separator{
    
    if (components.count == 0) {
        return nil;
    }
    return [components componentsJoinedByString:separator];
}

+(NSString*)kfx_yesOrNo:(BOOL)boolValue{
    return (boolValue) ? @"Yes" : @"No";
}

+(NSString*)kfx_trueOrFalse:(BOOL)boolValue{
    return (boolValue) ? @"True" : @"False";
}


//======================================================
#pragma mark - ** Instance Methods **
//======================================================
//--------------------------------------------------------
#pragma mark - Queries
//--------------------------------------------------------
-(BOOL)kfx_containsOnlySignedDecimalDigits{
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSNumber *number = [formatter numberFromString:self];
    return (number != nil) ? YES : NO;
    
}

-(BOOL)kfx_containsAlphaNumericCharacters{
    
    NSCharacterSet *s = [NSCharacterSet alphanumericCharacterSet];
    NSRange r = [self rangeOfCharacterFromSet:s];
    if (r.location == NSNotFound) {
        return NO;
    }else{
        return YES;
    }
}

-(NSUInteger)kfx_occurancesOfString:(NSString *)subString options:(NSStringCompareOptions)options{
    
    NSUInteger count = 0;
    NSMutableString *mutString = [self mutableCopy];
    while ([mutString containsString:subString]) {
        NSRange matchRange = [mutString rangeOfString:subString options:options];
        if (matchRange.location == NSNotFound) {
            break;
        }else{
            /* If a match was found we want to increase the count and delete the beginning of the string up to and including the matching substring. However the end of the substring may provide a match for the start of another substring.
                Eg. "aba" in "abababa"
                So we should only delete the characters before the match and the first letter of the match.
            */
            [mutString deleteCharactersInRange:NSMakeRange(0, matchRange.location + 1)];
            count++;
        }
    }
    return count;
}

-(NSUInteger)kfx_indexOfSubstring:(NSString *)substring{
    NSRange range = [self rangeOfString:substring];
    return range.location;
}

-(NSUInteger)kfx_indexOfSubstring:(NSString *)substring
                        fromIndex:(NSInteger)index{
    NSString *test = [self substringFromIndex:index];
    return [test kfx_indexOfSubstring:substring] + index;
}

-(NSUInteger)kfx_indexOfLastSubstring:(NSString *)substring{
    
    NSUInteger finalIndex = NSNotFound;
    NSUInteger matchIndex = 0;
    NSString* test = self;
    while ([test containsString:substring]) {

        matchIndex = [test kfx_indexOfSubstring:substring];
        if (finalIndex == NSNotFound) {
            finalIndex = matchIndex;
        }else{
            finalIndex = matchIndex+1 + finalIndex;
        }
        test = [test substringFromIndex:matchIndex + 1];
    }
    return finalIndex;
}

-(CGFloat)kfx_matchPercentageWithOtherString:(NSString *)visitorString{
    
    if ([self isEqualToString:visitorString]) {
        return 1.0;
    }
    
    NSInteger matchCount = 0;
    NSInteger receiverLength = self.length;
    NSInteger visitorLength = visitorString.length;
    NSInteger longestLength;

    if (receiverLength >= visitorLength) {
        longestLength = receiverLength;
        for (NSInteger idx = 0; idx < receiverLength; idx++) {
            
            if (idx < visitorLength) {
                unichar rC = [self characterAtIndex:idx];
                unichar vC = [visitorString characterAtIndex:idx];
                matchCount += (rC == vC);
            }
        }
    }else{
        longestLength = visitorLength;
        for (NSInteger idx = 0; idx < visitorLength; idx++) {
            
            if (idx < receiverLength) {
                unichar rC = [self characterAtIndex:idx];
                unichar vC = [visitorString characterAtIndex:idx];
                matchCount += (rC == vC);
            }
        }
    }
    
    return (CGFloat)matchCount / (CGFloat)longestLength;
}


//--------------------------------------------------------
#pragma mark - New String with edits
//--------------------------------------------------------
-(NSString *)kfx_stringByCapitalisingFirstLetter{
    
    NSString *uppercaseFirstLetter = [[self substringToIndex:1]uppercaseString];
    NSString *capitalised = [self stringByReplacingCharactersInRange:NSMakeRange(0, 1)
                                                                               withString:uppercaseFirstLetter];
    return capitalised;    
}

-(NSString *)kfx_stringByAddingPercentEscapesUsingEncoding:(CFStringEncoding)encoding{
    
    NSString *escaped = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (__bridge CFStringRef)self, NULL, CFSTR("!#$&'()*+,/:;=?@[]"), encoding));
    return escaped;
}

-(NSString *)kfx_stringByRemovingExcessiveWhiteSpace{
    
    if (   ![self containsString:@"  "]
        && ![self containsString:@"\n"]
        && ![self containsString:@"\r"]) {
        return self;
    }else{
        
        NSString *whiteSpaceSquashed = [self stringByReplacingOccurrencesOfString:@"[ ]+"
                                                             withString:@" "
                                                                options:NSRegularExpressionSearch
                                                                  range:NSMakeRange(0, self.length)];
        
        return whiteSpaceSquashed;
    }

}

-(NSString *)kfx_trim{
    return [self kfx_stringByTrimmingWhiteSpaceAndNewLines];
}

-(NSString *)kfx_stringByTrimmingWhiteSpaceAndNewLines{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

-(NSString *)kfx_normalisedString{
	
	NSString *normalised;
	normalised = [self lowercaseString];
	normalised = [normalised kfx_stringByRemovingExcessiveWhiteSpace];
	normalised = [normalised stringByReplacingOccurrencesOfString:@"'" withString:@""];
	normalised = [[normalised componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]] componentsJoinedByString:@" "];
	NSMutableString *mutString = [normalised mutableCopy];
	CFStringTransform((__bridge CFMutableStringRef)mutString, NULL, kCFStringTransformStripCombiningMarks, NO);
	normalised = [mutString copy];
	return normalised;
	
}

-(NSString *)kfx_cleanTelephoneNumber{
	NSString *cleanedPhoneNumber = [[self componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789-+()"] invertedSet]] componentsJoinedByString:@""];
	return cleanedPhoneNumber;
}


//--------------------------------------------------------
#pragma mark - Attributed String
//--------------------------------------------------------
-(NSAttributedString *)kfx_attributedString{
	
	return [NSAttributedString kfx_instanceWithString:self];
}

-(NSAttributedString *)kfx_attributedStringWithAttributes:(NSDictionary *)attributes{
	
	return [NSAttributedString kfx_instanceWithString:self
										   attributes:attributes];
}


//--------------------------------------------------------
#pragma mark - Get/Create from String
//--------------------------------------------------------
-(NSRange)kfx_rangeOfString{
	return NSMakeRange(0, self.length);
}

-(NSArray *)kfx_initials{
    NSArray *words = [self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSMutableArray *mutArray = [NSMutableArray arrayWithCapacity:words.count];
    for (NSString *word in words) {
        if ([word length] >= 1) {
            NSString *firstLetter = [word substringToIndex:1];
            [mutArray addObject:firstLetter];
        }
    }
    return mutArray.copy;
}

-(NSString *)kfx_firstInitial{
    NSString *firstInitial = [self substringToIndex:1];
    return firstInitial;
}


@end
