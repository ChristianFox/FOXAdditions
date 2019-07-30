/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/


#import <UIKit/UIKit.h>

@interface UITextView (KFXAdditions)

/**
 * @brief Sets the text property of the textView only if the text is non nil, not equal to  NSNull and has a length > 0. Otherwise sets the text property to the defaultText without checking its validity.
 * @param text the string to set the text property to
 * @param defaultText the string to use if the text string fails any of the checks
 * @return YES if the text was used, NO if the defaultText was used
 **/
-(BOOL)kfx_setText:(NSString*)text withDefault:(NSString*)defaultText;

/**
 * @brief Sets the text property of the textView only if the text is non nil, not equal to  NSNull and has a string.length > 0. Otherwise sets the text property to the defaultText without checking its validity.
 * @param text the NSAttributedString to set the text property to
 * @param defaultText the NSAttributedString to use if the text string fails any of the checks
 * @return YES if the text was used, NO if the defaultText was used
 **/
-(BOOL)kfx_setAttributedText:(NSAttributedString*)text withDefault:(NSAttributedString*)defaultText;



@end
