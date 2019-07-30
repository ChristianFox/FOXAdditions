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


#import "KFXCommonConstants.h"

@implementation KFXCommonConstants


//--------------------------------------------------------
#pragma mark GeoLocation & Distance Constants
//--------------------------------------------------------
double const KFXCOREMetresPerDegreeLatitude = 110574.27608210722;
double const KFXCOREMetresPerDegreeLongitude = 111319.2895857656;
double const KFXCOREDegreesPerMetreLatitude = 0.0000090437;
double const KFXCOREDegreesPerMetreLongitude = 0.0000089832;

double const KFXCOREFeetPerMile = 5280.0;
double const KFXCOREMetresPerMile = 1609.34;
double const KFXCOREFeetPerKilometre = 3280.838879986877;
double const KFXCOREKilometresPerMile = 1.60934;
double const KFXCOREMilesPerKilometre = 0.621371;

double const KFXCOREDegreesPerRadian = 180.0 / M_PI;
double const KFXCORERadiansPerDegree = M_PI / 180.0;

//--------------------------------------------------------
#pragma mark Mass Constants
//--------------------------------------------------------
double const KFXCOREPoundsPerKilogram = 2.2046226218487757;
double const KFXCOREKilogramsPerPound = 0.45359237;


//--------------------------------------------------------
#pragma mark Time
//--------------------------------------------------------
NSInteger const KFXCORESecondsPerMinute = 60;
NSInteger const KFXCORESecondsPerHour = 3600;
NSInteger const KFXCORESecondsPerDay = 86400;
NSInteger const KFXCORESecondsPerWeek = 604800;
NSInteger const KFXCORESecondsPerYearNonLeapGregorian = 31536000;
NSInteger const KFXCORESecondsPerYearLeapGregorian = 31622400;
NSInteger const KFXCOREMinutesPerHour = 60;
NSInteger const KFXCOREMinutesPerDay = 1440;
NSInteger const KFXCOREMinutesPerWeek = 10080;
NSInteger const KFXCOREMinutesPerYearNonLeapGregorian = 525600;
NSInteger const KFXCOREMinutesPerYearLeapGregorian = 527040;
NSInteger const KFXCOREHoursPerDay = 24;
NSInteger const KFXCOREHoursPerWeek = 168;
NSInteger const KFXCOREHoursPerYearNonLeapGregorian = 8760;
NSInteger const KFXCOREHoursPerYearLeapGregorian = 8784;
NSInteger const KFXCOREDaysPerWeekGregorian = 7;
NSInteger const KFXCOREWeeksPerYearGregorian = 52;
NSInteger const KFXCOREMonthsPerYearGregorian = 12;
NSInteger const KFXCOREDaysPerYearNonLeapGregorian = 365;
NSInteger const KFXCOREDaysPerYearLeapGregorian = 366;

//--------------------------------------------------------
#pragma mark - Device Sizes
//--------------------------------------------------------
//---------------
// Apple Watch
//---------------
CGSize const KFXCOREAppleWatch38mmScreenSize = {136.0,170.0}; // 38mm watch
CGSize const KFXCOREAppleWatch40mmScreenSize = {156.0,195.0}; // 40mm watch
CGSize const KFXCOREAppleWatch42mmScreenSize = {162.0,197.0}; // 42mm watch
CGSize const KFXCOREAppleWatch44mmScreenSize = {184.0,224.0}; // 44mm watch
//---------------
// iPads
//---------------
CGSize const KFXCOREiPadRegularScreenSize = {768.0,1024.0}; // Air, iPad 1, 2, 3, 4, Mini, 2, 3, 4, 9.7 inch pro
CGSize const KFXCOREiPadPro9InchScreenSize = {768.0,1024.0}; // 9.7 inch pro
CGSize const KFXCOREiPadPro10InchScreenSize = {834.0,1112.0}; // 10.5 inch pro
CGSize const KFXCOREiPadPro12InchScreenSize = {1024.0,1366.0}; // 12.9 inch pro
//---------------
// iPhones
//---------------
CGSize const KFXCOREiPhoneOriginalScreenSize = {320.0,480.0}; // 4, 4s, 3, 3g
CGSize const KFXCOREiPhoneSmallScreenSize = {320.0,568.0}; // 5, 5s, 5c, SE
CGSize const KFXCOREiPhoneRegularScreenSize = {375.0,667.0,}; // 6, 6s, 7
CGSize const KFXCOREiPhonePlusScreenSize = {414.0,736.0}; // 6+, 7+
CGSize const KFXCOREiPhoneXRegularScreenSize = {375.0,812.0}; // X, Xs
CGSize const KFXCOREiPhoneXLargeScreenSize = {414.0,896.0}; // Xr, Xs Max


//------------------------
#pragma mark Device Resolutions
//-----------------------
//---------------
// Apple Watch
//---------------
CGSize const KFXCOREAppleWatch38mmResolution = {272.0,340.0}; // 38mm watch
CGSize const KFXCOREAppleWatch40mmResolution = {312.0,390.0}; // 40mm watch
CGSize const KFXCOREAppleWatch42mmResolution = {324.0,394.0}; // 42mm watch
CGSize const KFXCOREAppleWatch44mmResolution = {368.0,448.0}; // 44mm watch
//---------------
// iPads
//---------------
CGSize const KFXCOREiPadOriginalResolution = {1536.0,2048.0}; // Mini 1, iPad 1, 2
CGSize const KFXCOREiPadRegularResolution = {1536.0,2048.0}; // Mini 2, 3, 4, Air, iPad 3, 4
CGSize const KFXCOREiPadPro9InchResolution = {1536.0,2048.0}; // 9.7 inch pro
CGSize const KFXCOREiPadPro10InchResolution = {1668.0,2224.0}; // 10.5 inch pro
CGSize const KFXCOREiPadPro12InchResolution = {2048.0,2732.0}; // 12.9 inch pro
//---------------
// iPhones
//---------------
CGSize const KFXCOREiPhoneOriginalNonRetinaResolution = {320.0,480.0}; // 3, 3g
CGSize const KFXCOREiPhoneOriginalRetinaResolution = {640.0,960.0}; // 4, 4s
CGSize const KFXCOREiPhoneSmallResolution = {640.0,1136.0}; // 5, 5s, 5c, SE
CGSize const KFXCOREiPhoneRegularResolution = {750.0,1334.0}; // 6, 6s, 7, 8
CGSize const KFXCOREiPhonePlusPhysicalResolution = {1080.0,1920.0}; // 6+, 7+, 8+
CGSize const KFXCOREiPhonePlusRenderedResolution = {1242.0,2208.0}; // 6+, 7+, 8+
CGSize const KFXCOREiPhoneXResolution = {1125.0,2436.0}; // X, Xs
CGSize const KFXCOREiPhoneXrResolution = {828.0,1792.0}; // Xr
CGSize const KFXCOREiPhoneXMaxResolution = {1242.0,2688.0}; // Xs Max


//--------------------------------------------------------
#pragma mark UI Kit dimensions
//--------------------------------------------------------
CGFloat const KFXCOREUIKitStatusBarHeight = 20.0;
CGFloat const KFXCOREUIKitNavigationBarStandardHeight = 44.0;
CGFloat const KFXCOREUIKitNavigationBarLandscapeReducedHeight = 32.0;
CGFloat const KFXCOREUIKitTabBarHeight = 49.0;

//--------------------------------------------------------
#pragma mark - Generic Keys
//--------------------------------------------------------
NSString *const KFXCOREImagePlaceholderNameKEY = @"kfxcore_placeholderName";
NSString *const KFXCOREImageNameKEY = @"kfxcore_imageName";
NSString *const KFXCOREImageKEY = @"kfxcore_image";
NSString *const KFXCORETextPlaceholderKEY = @"kfxcore_placeholder";
NSString *const KFXCORETextKEY = @"kfxcore_text";
NSString *const KFXCOREURLKEY = @"kfxcore_url";
NSString *const KFXCOREPathKEY = @"kfxcore_path";
NSString *const KFXCORETitleKEY = @"kfxcore_title";
NSString *const KFXCORESubtitleKEY = @"kfxcore_subtitle";
NSString *const KFXCOREBodyKEY = @"kfxcore_body";
NSString *const KFXCOREDetailKEY = @"kfxcore_detail";
NSString *const KFXCOREDataKEY = @"kfxcore_data";
NSString *const KFXCOREIdentifierKEY = @"kfxcore_id";






@end






