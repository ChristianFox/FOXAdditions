/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/



#import "UIBezierPath+KFXAdditions.h"

@implementation UIBezierPath (KFXAdditions)


- (UIBezierPath *)polygonPathWithRect:(CGRect)square
                            lineWidth:(CGFloat)lineWidth
                                sides:(NSInteger)sides
{
    UIBezierPath *path  = [UIBezierPath bezierPath];
    
    CGFloat theta       = 2.0 * M_PI / sides;                           // how much to turn at every corner
    CGFloat squareWidth = MIN(square.size.width, square.size.height);   // width of the square
    
    // calculate the length of the sides of the polygon
    
    CGFloat length      = squareWidth - lineWidth;
    if (sides % 4 != 0) {                                               // if not dealing with polygon which will be square with all sides ...
        length = length * cosf(theta / 2.0);                            // ... offset it inside a circle inside the square
    }
    CGFloat sideLength = length * tanf(theta / 2.0);
    
    // start drawing at `point` in lower right corner
    CGPoint point = CGPointMake(squareWidth / 2.0 + sideLength / 2.0, squareWidth - (squareWidth - length) / 2.0);
    CGFloat angle = M_PI;
    [path moveToPoint:point];
    
    // draw the sides and rounded corners of the polygon
    for (NSInteger side = 0; side < sides; side++) {
        point = CGPointMake(point.x + sideLength * cosf(angle), point.y + sideLength * sinf(angle));
        [path addLineToPoint:point];
        angle += theta;
    }
    
    [path closePath];
    
    return path;
}


@end
