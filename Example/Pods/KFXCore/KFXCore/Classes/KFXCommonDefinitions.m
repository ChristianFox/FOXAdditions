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

#import "KFXCommonDefinitions.h"

@implementation KFXCommonDefinitions


NSString* KFXCardinalDirectionString(KFXCardinalDirection direction){
    
    NSString *string;
    switch (direction) {
        case KFXCardinalDirectionNorth:{
            string = @"North";
            break;
        }
        case KFXCardinalDirectionEast:{
            string = @"East";
            break;
        }
        case KFXCardinalDirectionSouth:{
            string = @"South";
            break;
        }
        case KFXCardinalDirectionWest:{
            string = @"West";
            break;
        }
        default:
            string = @"Undefined";
            break;
    }
    return string;
}

NSString*_Nullable KFXDirectionString(KFXDirection direction){
    
    NSString *string;
    switch (direction) {
        case KFXDirectionTopToBottom:{
            string = @"Top to Bottom";
            break;
        }
        case KFXDirectionRightToLeft:{
            string = @"Right to Left";
            break;
        }
        case KFXDirectionBottomToTop:{
            string = @"Bottom to Top";
            break;
        }
        case KFXDirectionLeftToRight:{
            string = @"Left to Right";
            break;
        }
        case KFXDirectionTopLeftToBottomRight:{
            string = @"Top-Left to Bottom-Right";
            break;
        }
        case KFXDirectionTopRightToBottomLeft:{
            string = @"Top-Right to Bottom-Left";
            break;
        }
        case KFXDirectionBottomLeftToTopRight:{
            string = @"Bottom-Left to Top-Right";
            break;
        }
        case KFXDirectionBottomRightToTopLeft:{
            string = @"Bottom-Right to Top-Left";
            break;
        }
        default:
            string = @"Undefined";
            break;
    }
    return string;
}


NSString*_Nullable KFXEdgeString(KFXEdge edge){
    
    NSString *string;
    switch (edge) {
        case KFXEdgeUp:{
            string = @"Up";
            break;
        }
        case KFXEdgeRight:{
            string = @"Right";
            break;
        }
        case KFXEdgeDown:{
            string = @"Down";
            break;
        }
        case KFXEdgeLeft:{
            string = @"Left";
            break;
        }
        default:
            string = @"Undefined";
            break;
    }
    return string;
}

NSString*_Nullable KFXDeviceScreenSizeString(KFXDeviceScreenSize screenSize){
    
    NSString *string;
    switch (screenSize) {
        case KFXDeviceScreenSizeiPhoneOriginal:{
            string = @"iPhone Original";
            break;
        }
        case KFXDeviceScreenSizeiPhoneSmall:{
            string = @"iPhone Small";
            break;
        }
        case KFXDeviceScreenSizeiPhoneRegular:{
            string = @"iPhone Regular";
            break;
        }
        case KFXDeviceScreenSizeiPhonePlus:{
            string = @"iPhone Plus";
            break;
        }
        case KFXDeviceScreenSizeiPhoneXRegular:{
            string = @"iPhone X Regular";
            break;
        }
        case KFXDeviceScreenSizeiPhoneXLarge:{
            string = @"iPhone X Large";
            break;
        }
        case KFXDeviceScreenSizeiPadRegular:{
            string = @"iPad Regular";
            break;
        }
        case KFXDeviceScreenSizeiPadPro9Inch:{
            string = @"iPad Pro 9 Inch";
            break;
        }
        case KFXDeviceScreenSizeiPadPro10Inch:{
            string = @"iPad Pro 10 Inch";
            break;
        }
        case KFXDeviceScreenSizeiPadPro12Inch:{
            string = @"iPad Pro 12 Inch";
            break;
        }
        case KFXDeviceScreenSizeAppleWatch38mm:{
            string = @"Apple Watch 38mm";
            break;
        }
        case KFXDeviceScreenSizeAppleWatch40mm:{
            string = @"Apple Watch 40mm";
            break;
        }
        case KFXDeviceScreenSizeAppleWatch42mm:{
            string = @"Apple Watch 42mm";
            break;
        }
        case KFXDeviceScreenSizeAppleWatch44mm:{
            string = @"Apple Watch 44mm";
            break;
        }
        default:
            string = @"Undefined";
            break;
    }
    return string;
}


NSString*_Nullable KFXDeviceResolutionString(KFXDeviceResolution resolution){
    
    NSString *string;
    switch (resolution) {
        case KFXDeviceResolutioniPhoneOriginalNonRetina:{
            string = @"iPhone Original Non-Retina";
            break;
        }
        case KFXDeviceResolutioniPhoneOriginalRetina:{
            string = @"iPhone Original Retina";
            break;
        }
        case KFXDeviceResolutioniPhoneSmall:{
            string = @"iPhone Small";
            break;
        }
        case KFXDeviceResolutioniPhoneRegular:{
            string = @"iPhone Regular";
            break;
        }
        case KFXDeviceResolutioniPhonePlus:{
            string = @"iPhone Plus";
            break;
        }
        case KFXDeviceResolutioniPhoneX:{
            string = @"iPhone X";
            break;
        }
        case KFXDeviceResolutioniPhoneXr:{
            string = @"iPhone Xr";
            break;
        }
        case KFXDeviceResolutioniPhoneXMax:{
            string = @"iPhone X Max";
            break;
        }
        case KFXDeviceResolutioniPadOriginal:{
            string = @"iPad Original";
            break;
        }
        case KFXDeviceResolutioniPadRegular:{
            string = @"iPad Regular";
            break;
        }
        case KFXDeviceResolutioniPadPro9Inch:{
            string = @"iPad Pro 9 Inch";
            break;
        }
        case KFXDeviceResolutioniPadPro10Inch:{
            string = @"iPad Pro 10 Inch";
            break;
        }
        case KFXDeviceResolutioniPadPro12Inch:{
            string = @"iPad Pro 12 Inch";
            break;
        }
        case KFXDeviceResolutionAppleWatch38mm:{
            string = @"Apple Watch 38mm";
            break;
        }
        case KFXDeviceResolutionAppleWatch40mm:{
            string = @"Apple Watch 40mm";
            break;
        }
        case KFXDeviceResolutionAppleWatch42mm:{
            string = @"Apple Watch 42mm";
            break;
        }
        case KFXDeviceResolutionAppleWatch44mm:{
            string = @"Apple Watch 44mm";
            break;
        }
        default:
            string = @"Undefined";
            break;
    }
    return string;
}

NSString*_Nullable KFXDeviceFamilyString(KFXDeviceFamily family){
    
    NSString *string;
    switch (family) {
        case KFXDeviceFamilyiPhone:{
            string = @"iPhone";
            break;
        }
        case KFXDeviceFamilyiPod:{
            string = @"iPod";
            break;
        }
        case KFXDeviceFamilyiPad:{
            string = @"iPad";
            break;
        }
        case KFXDeviceFamilyAppleTV:{
            string = @"Apple TV";
            break;
        }
        case KFXDeviceFamilyAppleWatch:{
            string = @"Apple Watch";
            break;
        }
        default:
            string = @"Undefined";
            break;
    }
    return string;
}















@end
