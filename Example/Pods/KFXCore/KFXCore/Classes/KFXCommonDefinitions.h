/********************************
 *
 * KFXCore https://github.com/ChristianFox/KFXCore
 *
 * Copyright (c) 2016-2018 ChristianFox <christianfox@kfxtech.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * This file is included with KFXCore
 *
 ************************************/

@import Foundation;
@import CoreGraphics;
@class UIImage;

//-----------------------------------
// Directions
//-----------------------------------
typedef NS_ENUM (NSInteger, KFXCardinalDirection){
    KFXCardinalDirectionUndefined = 0,
    KFXCardinalDirectionNorth,
    KFXCardinalDirectionEast,
    KFXCardinalDirectionSouth,
    KFXCardinalDirectionWest
};

typedef NS_ENUM (NSInteger, KFXDirection) {
    KFXDirectionUndefined = 0,
    KFXDirectionTopToBottom,
    KFXDirectionRightToLeft,
    KFXDirectionBottomToTop,
    KFXDirectionLeftToRight,
    KFXDirectionTopLeftToBottomRight,
    KFXDirectionTopRightToBottomLeft,
    KFXDirectionBottomLeftToTopRight,
    KFXDirectionBottomRightToTopLeft
};

//-----------------------------------
// Edge
//-----------------------------------
typedef NS_ENUM (NSInteger, KFXEdge) {
    KFXEdgeUndefined = 0,
    KFXEdgeUp,
    KFXEdgeRight,
    KFXEdgeDown,
    KFXEdgeLeft
};

//-----------------------------------
// Device
//-----------------------------------
typedef NS_ENUM (NSInteger, KFXDeviceScreenSize){
    KFXDeviceScreenSizeUndefined = 0,
    KFXDeviceScreenSizeiPhoneOriginal,
    KFXDeviceScreenSizeiPhoneSmall,
    KFXDeviceScreenSizeiPhoneRegular,
    KFXDeviceScreenSizeiPhonePlus,
    KFXDeviceScreenSizeiPhoneXRegular,
    KFXDeviceScreenSizeiPhoneXLarge,
    KFXDeviceScreenSizeiPadRegular,
    KFXDeviceScreenSizeiPadPro9Inch,
    KFXDeviceScreenSizeiPadPro10Inch,
    KFXDeviceScreenSizeiPadPro12Inch,
    KFXDeviceScreenSizeAppleWatch38mm,
    KFXDeviceScreenSizeAppleWatch40mm,
    KFXDeviceScreenSizeAppleWatch42mm,
    KFXDeviceScreenSizeAppleWatch44mm
};

typedef NS_ENUM (NSInteger, KFXDeviceResolution){
    KFXDeviceResolutionUndefined = 0,
    KFXDeviceResolutioniPhoneOriginalNonRetina,
    KFXDeviceResolutioniPhoneOriginalRetina,
    KFXDeviceResolutioniPhoneSmall,
    KFXDeviceResolutioniPhoneRegular,
    KFXDeviceResolutioniPhonePlus,
    KFXDeviceResolutioniPhoneX,
    KFXDeviceResolutioniPhoneXr,
    KFXDeviceResolutioniPhoneXMax,
    KFXDeviceResolutioniPadOriginal,
    KFXDeviceResolutioniPadRegular,
    KFXDeviceResolutioniPadPro9Inch,
    KFXDeviceResolutioniPadPro10Inch,
    KFXDeviceResolutioniPadPro12Inch,
    KFXDeviceResolutionAppleWatch38mm,
    KFXDeviceResolutionAppleWatch40mm,
    KFXDeviceResolutionAppleWatch42mm,
    KFXDeviceResolutionAppleWatch44mm
};


typedef NS_ENUM(NSUInteger, KFXDeviceFamily) {
    KFXDeviceFamilyUndefined = 0,
    KFXDeviceFamilyiPhone,
    KFXDeviceFamilyiPod,
    KFXDeviceFamilyiPad,
    KFXDeviceFamilyAppleTV,
    KFXDeviceFamilyAppleWatch,
};


//-----------------------------------
// Completion Block with no params
//-----------------------------------
typedef void(^KFXCompletionBlock)(void);

//-----------------------------------
// Happenings
//-----------------------------------
typedef void(^KFXUpdateOccurredBlock)(BOOL updateOccurred);
typedef void(^KFXUpdateOccurredResultBlock)(BOOL updateOccured, NSError *_Nullable error);
typedef void(^KFXSuccessResultBlock)(BOOL success, NSError *_Nullable error);
typedef void(^KFXProgressBlock)(CGFloat progress);
typedef void(^KFXProgressAndMessageBlock)(CGFloat progress, NSString *_Nullable message);
typedef void(^KFXSyncResultArraysBlock)(NSArray *_Nullable created, NSArray *_Nullable updated, NSArray *_Nullable deleted);
typedef void(^KFXSyncResultDictionarysBlock)(NSDictionary *_Nullable created, NSDictionary *_Nullable updated, NSDictionary *_Nullable deleted);
typedef void(^KFXSyncResultAnonObjectsBlock)(id _Nullable created, id _Nullable updated, id  _Nullable deleted);


//-----------------------------------
// Generic Primitives
//-----------------------------------
typedef void(^KFXBooleanResultBlock)(BOOL boolValue);
typedef void(^KFXBooleanAndErrorResultBlock)(BOOL boolValue, NSError *_Nullable error);
typedef void(^KFXNSIntegerResultBlock)(NSInteger integer, NSError *_Nullable error);
typedef void(^KFXNSUnsignedIntegerResultBlock)(NSUInteger uInteger, NSError *_Nullable error);
typedef void(^KFXFloatResultBlock)(float aFloat, NSError *_Nullable error);
typedef void(^KFXDoubleResultBlock)(double aDouble, NSError *_Nullable error);
typedef void(^KFXCGFloatResultBlock)(CGFloat aCGFloat, NSError *_Nullable error);
typedef void(^KFXIntResultBlock)(int anInt, NSError *_Nullable error);


//-----------------------------------
// Objects
//-----------------------------------
typedef void(^KFXAnonymousObjectResultBlock)(id _Nullable object, NSError *_Nullable error);
typedef void(^KFXNSArrayResultBlock)(NSArray *_Nullable array, NSError *_Nullable error);
typedef void(^KFXNSDictionaryResultBlock)(NSDictionary *_Nullable dictionary, NSError *_Nullable error);
typedef void(^KFXNSSetResultBlock)(NSSet *_Nullable set, NSError *_Nullable error);
typedef void(^KFXNSDataResultBlock)(NSData *_Nullable data, NSError *_Nullable error);
typedef void(^KFXNSDateResultBlock)(NSDate *_Nullable date, NSError *_Nullable error);
typedef void(^KFXNSStringResultBlock)(NSString *_Nullable string, NSError *_Nullable error);
typedef void(^KFXNSNumberResultBlock)(NSNumber *_Nullable number, NSError *_Nullable error);
typedef void(^KFXNSURLResultBlock)(NSURL *_Nullable url, NSError *_Nullable error);
typedef void(^KFXUIImageResultBlock)(UIImage *_Nullable image, NSError*_Nullable error);




@interface KFXCommonDefinitions : NSObject


//-----------------------------------
// Strings from Enums
//-----------------------------------
NSString*_Nullable KFXCardinalDirectionString(KFXCardinalDirection direction);
NSString*_Nullable KFXDirectionString(KFXDirection direction);
NSString*_Nullable KFXEdgeString(KFXEdge edge);
NSString*_Nullable KFXDeviceScreenSizeString(KFXDeviceScreenSize screenSize);
NSString*_Nullable KFXDeviceResolutionString(KFXDeviceResolution resolution);
NSString*_Nullable KFXDeviceFamilyString(KFXDeviceFamily family);






@end












