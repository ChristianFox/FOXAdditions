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
@import UIKit.UIFont;
@import UIKit.UIColor;
@import UIKit.NSText;
@import CoreGraphics;

@interface NSAttributedString (KFXAdditions)

//--------------------------------------------------------
#pragma mark - Convience Initilisers
//--------------------------------------------------------
/// Returns an NSAttributedString with the given string and no attributes
+(instancetype)kfx_instanceWithString:(NSString*)string;

/// Returns an NSAttributedString with the given string and attributes
+(instancetype)kfx_instanceWithString:(NSString*)string attributes:(NSDictionary*)attributes;

/// Returns an NSAttributedString with the given format string and no attributes
+(instancetype)kfx_instanceWithFormat:(NSString*)format,...;

/// Returns an NSAttributedString with the given format string and the attributes
+(instancetype)kfx_instanceWithAttributes:(NSDictionary*)attributes
                                   format:(NSString*)format,...;

/// Returns an NSAttributedString with the given string and the attributes
+(instancetype)kfx_instanceWithString:(NSString*)string
                                 font:(UIFont*)font
                               colour:(UIColor*)colour;

/// Returns an NSAttributedString with the given string and the attributes
+(instancetype)kfx_instanceWithString:(NSString*)string
                                 font:(UIFont*)font
                               colour:(UIColor*)colour
                            alignment:(NSTextAlignment)alignment;

/// Returns an NSAttributedString with the given string and the attributes
+(instancetype)kfx_instanceWithString:(NSString*)string
                                 font:(UIFont*)font
                               colour:(UIColor*)colour
                            alignment:(NSTextAlignment)alignment
                          lineSpacing:(CGFloat)lineSpacing;

/// Returns an NSAttributedString with the given string and the attributes
+(instancetype)kfx_instanceWithString:(NSString*)string
                                 font:(UIFont*)font
                               colour:(UIColor*)colour
                            kerning:(CGFloat)kerning;

/// Returns an NSAttributedString with the given string and the attributes
+(instancetype)kfx_instanceWithString:(NSString*)string
                                 font:(UIFont*)font
                               colour:(UIColor*)colour
                            alignment:(NSTextAlignment)alignment
                              kerning:(CGFloat)kerning;

//--------------------------------------------------------
#pragma mark - Ranges
//--------------------------------------------------------
/// Returns the NSRange for the receiver's string
-(NSRange)kfx_rangeOfString;

//------------------------
#pragma mark HTML
//------------------------
+(instancetype)kfx_attributedStringFromHTMLString:(NSString *)htmlString error:(NSError**)error;
+(instancetype)kfx_attributedStringFromHTMLString:(NSString *)htmlString withFont:(UIFont*)font foregroundColour:(UIColor*)fgColour error:(NSError**)error;


@end
