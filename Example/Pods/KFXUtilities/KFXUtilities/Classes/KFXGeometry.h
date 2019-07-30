/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXUtilities
 *
 ************************************/


@import Foundation;
@import CoreGraphics;

/*
 * Credits:
 * Some code based on code found in HLSGeometry by Samuel Défago
 * Some code based on code found in CGGeometry+FKAdditions from iOSKit http://foundationk.it
 * Which took inspiration from:
 * Sam Soffes' Custom-Licensed SSToolkit: http://github.com/samsoffes/sstoolkit
 * jverkoys' Nimbus-Project: http://github.com/jverkoy/nimbus
 *  https://github.com/github/Archimedes
 *
 */

@interface KFXGeometry : NSObject


//--------------------------------------------------------
#pragma mark CGRect
//--------------------------------------------------------
/// Returns a new CGRect with the same size as the original but with the given origin
CGRect kfx_CGRectWithNewOrigin(CGRect rect, CGPoint origin);

/// Returns a new CGRect with the same origin as the original but with the given size
CGRect kfx_CGRectWithNewSize(CGRect rect, CGSize size);

/// Returns a new CGRect the same as the original but with the new x origin
CGRect kfx_CGRectWithNewOriginX(CGRect rect, CGFloat xOrigin);

/// Returns a new CGRect the same as the original but with the new y origin
CGRect kfx_CGRectWithNewOriginY(CGRect rect, CGFloat yOrigin);

/// Returns a new CGRect the same as the original but with the new width
CGRect kfx_CGRectWithNewWidth(CGRect rect, CGFloat width);

/// Returns a new CGRect the same as the original but with the new height
CGRect kfx_CGRectWithNewHeight(CGRect rect, CGFloat height);

/// Returns a new CGRect with the given size and origin calculated from the centre
CGRect kfx_CGRectMakeWithCentreAndSize(CGPoint centre, CGSize size);

/// Returns a CGRect with all values floored from the original
CGRect kfx_CGRectFloor(CGRect rect);

/// Returns a CGRect with all values ceiling-ed from the original
CGRect kfx_CGRectCeiling(CGRect rect);

/// Returns a CGRect with all values rounded from the original
CGRect kfx_CGRectRounded(CGRect rect);

//------------------------
#pragma mark CGPoints from Rects
//------------------------
//---------------
// Centres
//---------------
/// Returns a CGPoint which is the centre of the rect
CGPoint kfx_CGRectGetCentre(CGRect rect);

/// Return a CGPoint for the left centre
CGPoint kfx_CGRectCentreLeft(CGRect rect);

/// Return a CGPoint for the top centre
CGPoint kfx_CGRectCentreTop(CGRect rect);

/// Return a CGPoint for the right centre
CGPoint kfx_CGRectCentreRight(CGRect rect);

/// Return a CGPoint for the bottom centre
CGPoint kfx_CGRectCentreBottom(CGRect rect);

//---------------
// Corners
//---------------
/// Return a CGPoint for the top left corner (yes origin)
CGPoint kfx_CGRectCornerTopLeft(CGRect rect);

/// Return a CGPoint for the top right corner
CGPoint kfx_CGRectCornerTopRight(CGRect rect);

/// Return a CGPoint for the bottom right corner
CGPoint kfx_CGRectCornerBottomRight(CGRect rect);

/// Return a CGPoint for the bottom left corner
CGPoint kfx_CGRectCornerBottomLeft(CGRect rect);

//--------------------------------------------------------
#pragma mark CGPoint
//--------------------------------------------------------
/// Returns a CGPoint with all values rounded from the original
CGPoint kfx_CGPointRounded(CGPoint point);

/// Return a CGPoint by adding two points
CGPoint kfx_CGPointAdd(CGPoint a, CGPoint b);

/// Return a CGPoint by subtracting one point from the other
CGPoint kfx_CGPointSubtract(CGPoint a, CGPoint b);

/// Return a CGPoint by multiplying a point by the float
CGPoint kfx_CGPointMultiply(CGPoint a, CGFloat f);


//--------------------------------------------------------
#pragma mark CGSize
//--------------------------------------------------------
/// Returns a CGSize with all values rounded from the original
CGSize kfx_CGSizeRounded(CGSize size);


//--------------------------------------------------------
#pragma mark Distance
//--------------------------------------------------------
/// Calculates the distance between two CGPoints
CGFloat kfx_distanceBetweenCGPoints(CGPoint p1, CGPoint p2);


//--------------------------------------------------------
#pragma mark Aspect Ratio
//--------------------------------------------------------
/// Returns a CGSize scaled to another size by keeping the aspect ratio
CGSize kfx_CGSizeAspectScaleToSize(CGSize size, CGSize toSize);

/// Returns a CGSize that is the original size resized to fit in the targetSize but also keeping size with the AspectFit rule
CGSize kfx_CGSizeScaledWithAspectFitFromSize(CGSize size, CGSize targetSize);

/// Returns a CGSize that is the original size resized to fit in the targetSize but also keeping size with the AspectFill rule
CGSize kfx_CGSizeScaledWithAspectFillFromSize(CGSize size, CGSize targetSize);












@end
