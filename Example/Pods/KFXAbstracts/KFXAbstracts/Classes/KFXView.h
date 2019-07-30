/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAbstracts
 *
 ************************************/
/********************************
//  Credits
// Some code found in iOSKit http://foundationk.it
//
// Derived from @davidhemricks Blog-Post, seen on deallocated objects:
// http://deallocatedobjects.com/posts/using-blocks-for-drawing?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+deallocatedobjects+%28Deallocated+Objects%29
************************************/


@import UIKit;

/** Block typedef used for drawing the contents of the UIView */
typedef void (^KFXViewDrawingBlock)(UIView *view, CGContextRef context);


@interface KFXView : UIView

@property (copy,nonatomic) KFXViewDrawingBlock drawingBlock;

/** Convenience method for creating a block-based drawing view.
 
 @param frame the frame of the view
 @param block the block used for drawing
 @return a view with the given frame and drawing block
 */
+(instancetype)kfx_viewWithFrame:(CGRect)frame
                    drawingBlock:(KFXViewDrawingBlock)block;


@end
