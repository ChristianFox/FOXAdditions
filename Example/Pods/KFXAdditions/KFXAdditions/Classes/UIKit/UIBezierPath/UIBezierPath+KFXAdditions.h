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

@interface UIBezierPath (KFXAdditions)


/** Create UIBezierPath for regular polygon inside a CGRect
 * https://stackoverflow.com/a/26088610/4082459
 *
 * @param square        The CGRect of the square in which the path should be created.
 * @param lineWidth     The width of the stroke around the polygon. The polygon will be inset such that the stroke stays within the above square.
 * @param sides         How many sides to the polygon (e.g. 6=hexagon; 8=octagon, etc.).
 *
 * @return              UIBezierPath of the resulting polygon path.
 */
- (UIBezierPath *)polygonPathWithRect:(CGRect)square
                            lineWidth:(CGFloat)lineWidth
                                sides:(NSInteger)sides;

@end
