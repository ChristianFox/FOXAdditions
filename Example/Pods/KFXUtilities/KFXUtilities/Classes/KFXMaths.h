/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXUtilities
 *
 ************************************/

//-----------------------------------------------------------
#pragma mark - Float & Double equality
//-----------------------------------------------------------
#define fequal(a,b) (fabsf((a) - (b)) < FLT_EPSILON)
#define fequalzero(a) (fabsf(a) < FLT_EPSILON)
#define dequal(a,b) (fabs((a) - (b)) < DBL_EPSILON)
#define dequalzero(a) (fabs(a) < DBL_EPSILON)

//------------------------
#pragma mark Clamping
//------------------------
/*
 * https://stackoverflow.com/a/14770282/4082459
 */
#define CLAMP(x, low, high) ({\
__typeof__(x) __x = (x); \
__typeof__(low) __low = (low);\
__typeof__(high) __high = (high);\
__x > __high ? __high : (__x < __low ? __low : __x);\
})

//------------------------
#pragma mark Conversion
//------------------------
#define KFXMATHSRadiansToDegrees(radians) ((radians) * (180.0 / M_PI))
#define KFXMATHSDegreesToRadians(degrees) ((degrees) * (M_PI / 180.0))


@import Foundation;
@import CoreGraphics;

@interface KFXMaths : NSObject

//-----------------------------------------------------------
#pragma mark Random Numbers
//-----------------------------------------------------------
/**
 *  Generates a random 32bit unsigned integer between the values specified.
 *  *If max is less then min then it is assumed to be a mistake and they are switched around.
 **/
u_int32_t randomUnsignedIntegerWithMinAndMax(u_int32_t min, u_int32_t max);

/**
 *  Generates a random integer between the values specified.
 *  *If max is less then min then it is assumed to be a mistake and they are switched around.
 **/
int randomIntWithMinAndMax(int min,int max);

/**
 *  Generates a random float between the values specified.
 *  *If max is less then min then it is assumed to be a mistake and they are switched around.
 **/
float randomFloatWithMinAndMax(float min, float max);

/**
 *  Generates a random double between the values specified.
 *  *If max is less then min then it is assumed to be a mistake and they are switched around.
 **/
double randomDoubleWithMinAndMax(double min, double max);




@end
