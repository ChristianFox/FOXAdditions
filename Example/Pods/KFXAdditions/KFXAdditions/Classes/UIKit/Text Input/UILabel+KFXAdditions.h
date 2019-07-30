/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/

/*
 Credits:
 -kfx_boundingRectForText; & -kfx_heightForText from https://github.com/alexito4/AMPAdditions
 */


#import <UIKit/UIKit.h>

@interface UILabel (KFXAdditions)

//--------------------------------------------------------
#pragma mark Set Text with defaults
//--------------------------------------------------------
/**
 * @brief Sets the text property of the label only if the text is non nil, not equal to  NSNull and has a length > 0. Otherwise sets the text property to the defaultText without checking its validity.
 * @param text the string to set the text property to
 * @param defaultText the string to use if the text string fails any of the checks
 * @return YES if the text was used, NO if the defaultText was used
 **/
-(BOOL)kfx_setText:(NSString*)text withDefault:(NSString*)defaultText;

/**
 * @brief Sets the text property of the label by getting the NSNumber's -stringValue but only if the number is non nil, not equal to  NSNull. Otherwise sets the text property to the defaultText without checking its validity.
 * @param number the number to set the text property to
 * @param defaultText the string to use if the number fails any of the checks
 * @return YES if the number was used, NO if the defaultText was used
 **/
-(BOOL)kfx_setTextToNumber:(NSNumber*)number withDefault:(NSString*)defaultText;


/**
 * @brief Sets the text property of the label only if the text is non nil, not equal to  NSNull and has a string.length > 0. Otherwise sets the text property to the defaultText without checking its validity.
 * @param text the NSAttributedString to set the text property to
 * @param defaultText the NSAttributedString to use if the text string fails any of the checks
 * @return YES if the text was used, NO if the defaultText was used
 **/
-(BOOL)kfx_setAttributedText:(NSAttributedString*)text withDefault:(NSAttributedString*)defaultText;



//--------------------------------------------------------
#pragma mark Frame
//--------------------------------------------------------
/// Calculate the height of the current text content within the label's bounds
-(CGFloat)kfx_heightForText;

/// Calculate the rect of the current text content within the label's bounds
-(CGRect)kfx_boundingRectForText;










@end















