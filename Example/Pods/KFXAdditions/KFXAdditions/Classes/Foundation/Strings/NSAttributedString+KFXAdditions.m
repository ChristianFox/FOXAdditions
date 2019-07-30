/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/

#import "NSAttributedString+KFXAdditions.h"

@implementation NSAttributedString (KFXAdditions)

//--------------------------------------------------------
#pragma mark - Convience Initilisers
//--------------------------------------------------------
+(instancetype)kfx_instanceWithString:(NSString*)string{
    
    NSAttributedString *attString = [[NSAttributedString alloc]initWithString:string];
    return attString;
}

+(instancetype)kfx_instanceWithString:(NSString*)string attributes:(NSDictionary*)attributes{

    NSAttributedString *attString = [[NSAttributedString alloc]initWithString:string attributes:attributes];
    return attString;
}

+(instancetype)kfx_instanceWithFormat:(NSString*)format,...{
    
    NSString *string;
    if (format != nil) {
        va_list args;
        va_start(args, format);
        string = [[NSString alloc]initWithFormat:format arguments:args];
        va_end(args);
    }
    return [self kfx_instanceWithString:string];
}

+(instancetype)kfx_instanceWithAttributes:(NSDictionary*)attributes format:(NSString*)format,...{
    
    NSString *string;
    if (format != nil) {
        va_list args;
        va_start(args, format);
        string = [[NSString alloc]initWithFormat:format arguments:args];
        va_end(args);
    }
    return [self kfx_instanceWithString:string attributes:attributes];
}

/// Returns an NSAttributedString with the given string and the attributes
+(instancetype)kfx_instanceWithString:(NSString*)string
                                 font:(UIFont*)font
                               colour:(UIColor*)colour{
 
    if (string == nil || font == nil || colour == nil) {
        return nil;
    }
    NSDictionary *attributes = @{
                                 NSFontAttributeName:font,
                                 NSForegroundColorAttributeName:colour                                 };
    NSAttributedString *attString = [self kfx_instanceWithString:string attributes:attributes];
    return attString;
}

/// Returns an NSAttributedString with the given string and the attributes
+(instancetype)kfx_instanceWithString:(NSString*)string
                                 font:(UIFont*)font
                               colour:(UIColor*)colour
                            alignment:(NSTextAlignment)alignment{
    
    if (string == nil || font == nil || colour == nil) {
        return nil;
    }
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc]init];
    paraStyle.alignment = alignment;
    NSDictionary *attributes = @{
                                 NSFontAttributeName:font,
                                 NSForegroundColorAttributeName:colour,
                                 NSParagraphStyleAttributeName:paraStyle
                                 };
    NSAttributedString *attString = [self kfx_instanceWithString:string attributes:attributes];
    return attString;
}

/// Returns an NSAttributedString with the given string and the attributes
+(instancetype)kfx_instanceWithString:(NSString*)string
                                 font:(UIFont*)font
                               colour:(UIColor*)colour
                            alignment:(NSTextAlignment)alignment
                          lineSpacing:(CGFloat)lineSpacing{
    
    if (string == nil || font == nil || colour == nil) {
        return nil;
    }
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc]init];
    paraStyle.lineSpacing = lineSpacing;
    paraStyle.alignment = alignment;
    NSDictionary *attributes = @{
                                 NSFontAttributeName:font,
                                 NSForegroundColorAttributeName:colour,
                                 NSParagraphStyleAttributeName:paraStyle
                                 };
    NSAttributedString *attString = [self kfx_instanceWithString:string attributes:attributes];
    return attString;
}

/// Returns an NSAttributedString with the given string and the attributes
+(instancetype)kfx_instanceWithString:(NSString*)string
                                 font:(UIFont*)font
                               colour:(UIColor*)colour
                          kerning:(CGFloat)kerning{
    
    if (string == nil || font == nil || colour == nil) {
        return nil;
    }
    NSDictionary *attributes = @{
                                 NSFontAttributeName:font,
                                 NSForegroundColorAttributeName:colour,
                                 NSKernAttributeName:@(kerning)
                                 };
    NSAttributedString *attString = [self kfx_instanceWithString:string attributes:attributes];
    return attString;
}

/// Returns an NSAttributedString with the given string and the attributes
+(instancetype)kfx_instanceWithString:(NSString*)string
                                 font:(UIFont*)font
                               colour:(UIColor*)colour
                            alignment:(NSTextAlignment)alignment
                              kerning:(CGFloat)kerning{
    
    if (string == nil || font == nil || colour == nil) {
        return nil;
    }
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc]init];
    paraStyle.alignment = alignment;
    NSDictionary *attributes = @{
                                 NSFontAttributeName:font,
                                 NSForegroundColorAttributeName:colour,
                                 NSParagraphStyleAttributeName:paraStyle,
                                 NSKernAttributeName:@(kerning)
                                 };
    NSAttributedString *attString = [self kfx_instanceWithString:string attributes:attributes];
    return attString;
}

//--------------------------------------------------------
#pragma mark - Ranges
//--------------------------------------------------------
-(NSRange)kfx_rangeOfString{
	return NSMakeRange(0, self.string.length);
}

//------------------------
#pragma mark HTML
//------------------------
+(instancetype)kfx_attributedStringFromHTMLString:(NSString *)htmlString error:(NSError**)error{
    
    NSData *data = [htmlString dataUsingEncoding:NSUnicodeStringEncoding];
    NSDictionary *options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    return [[NSAttributedString alloc]initWithData:data
                                           options:options
                                documentAttributes:nil
                                             error:error];
}

+(instancetype)kfx_attributedStringFromHTMLString:(NSString *)htmlString withFont:(UIFont*)font foregroundColour:(UIColor*)fgColour error:(NSError**)error{
    
    NSMutableAttributedString *mutAttString = [[self kfx_attributedStringFromHTMLString:htmlString error:error] mutableCopy];
    if (mutAttString == nil) {
        return nil;
    }
    
    [mutAttString addAttribute:NSFontAttributeName value:font range:[mutAttString kfx_rangeOfString]];
    [mutAttString addAttribute:NSForegroundColorAttributeName value:fgColour range:[mutAttString kfx_rangeOfString]];
    return mutAttString.copy;

}





@end
