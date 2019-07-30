/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAdditions
 *
 ************************************/

#import "UIColor+KFXAdditions.h"

@implementation UIColor (KFXAdditions)


//--------------------------------------------------------
#pragma mark - Hex Colours
//--------------------------------------------------------
+ (UIColor *)kfx_colorwithHexString:(NSString *)hexStr alpha:(CGFloat)alpha;
{
    //-----------------------------------------
    // Convert hex string to an integer
    //-----------------------------------------
    unsigned int hexint = 0;
    
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    
    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet
                                       characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&hexint];
    
    //-----------------------------------------
    // Create color object, specifying alpha
    //-----------------------------------------
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexint & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexint & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexint & 0xFF))/255
                    alpha:alpha];
    
    return color;
}

//--------------------------------------------------------
#pragma mark - Random Colours
//--------------------------------------------------------
+(UIColor*)kfx_randomColour{
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 );
    CGFloat brightness = ( arc4random() % 128 / 256.0 );
    CGFloat alpha = ( arc4random() % 128 / 256.0 );
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
    return color;
}

+(UIColor*)kfx_randomColourWithAlpha:(CGFloat)alpha{
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 );
    CGFloat brightness = ( arc4random() % 128 / 256.0 );
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
    return color;
}

+(UIColor*)kfx_randomColourAvoidingBlackAndWhiteWithAlpha:(CGFloat)alpha{
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    CGFloat finalAlpha;
    if (alpha < 0.0) {
        finalAlpha = ( arc4random() % 128 / 256.0 );
    }else{
        finalAlpha = alpha;
    }
    
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:finalAlpha];
    return color;
}


//--------------------------------------------------------
#pragma mark - Alter Colours
//--------------------------------------------------------
-(UIColor *)kfx_colourByAlteringHueByAmount:(CGFloat)amount{
    
    return [self kfx_colourByAlteringHue:amount
                              saturation:0.0
                              brightness:0.0
                                   alpha:0.0];
}

-(UIColor *)kfx_colourByAlteringSaturationByAmount:(CGFloat)amount{
    
    return [self kfx_colourByAlteringHue:0.0
                              saturation:amount
                              brightness:0.0
                                   alpha:0.0];
    
}

-(UIColor *)kfx_colourByAlteringBrightnessByAmount:(CGFloat)amount{
    
    return [self kfx_colourByAlteringHue:0.0
                              saturation:0.0
                              brightness:amount
                                   alpha:0.0];

}

-(UIColor *)kfx_colourByAlteringAlphaByAmount:(CGFloat)amount{
    
    return [self kfx_colourByAlteringHue:0.0
                              saturation:0.0
                              brightness:0.0
                                   alpha:amount];

}

-(UIColor*_Nullable)kfx_colourByAlteringHue:(CGFloat)hueAlterAmount
                                 saturation:(CGFloat)saturationAlterAmount
                                 brightness:(CGFloat)brightnessAlterAmount
                                      alpha:(CGFloat)alphaAlterAmount{
    
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL isValid = [self getHue:&hue
                     saturation:&saturation
                     brightness:&brightness
                          alpha:&alpha];
    if (!isValid) {
        return nil;
    }else{
        
        /*
         For some reason I was having an issue setting the component values to 0.0 or 1.0 exactly which resulted in a UIColor object with incorrect values... possibly due to a floating point rounding error 
         Whatever the reason using slightly off values gets rid of it and should result in an inperceptable colour difference.
         */
        CGFloat newHue = hue + hueAlterAmount;
        if (newHue > 1.000) {
            newHue = 0.9999999;
        }else if (newHue < 0.000){
            newHue = 0.0000001;
        }
        CGFloat newSaturation = saturation + saturationAlterAmount;
        if (newSaturation < 0.000) {
            newSaturation = 0.0000001;
        }
        CGFloat newBrightness = brightness + brightnessAlterAmount;
        if (newBrightness < 0.0000) {
            newBrightness = 0.0000001;
        }
        CGFloat newAlpha = alpha + alphaAlterAmount;
        UIColor *newColour = [UIColor colorWithHue:newHue
                                        saturation:newSaturation
                                        brightness:newBrightness
                                             alpha:newAlpha];
        return newColour;
    }

    
}

- (UIColor *)kfx_combineWithColour:(UIColor *)otherColour amount:(CGFloat)amount {
    
    CGFloat thisRed = 0.0;
    CGFloat thisGreen = 0.0;
    CGFloat thisBlue = 0.0;
    CGFloat otherRed = 0.0;
    CGFloat otherGreen = 0.0;
    CGFloat otherBlue = 0.0;
    
    [self getRed:&thisRed green:&thisGreen blue:&thisBlue alpha:nil];
    [otherColour getRed:&otherRed green:&otherGreen blue:&otherBlue alpha:nil];
    
    CGFloat newRed = [self lerpFrom:thisRed to:otherRed alpha:amount];
    CGFloat newGreen = [self lerpFrom:thisGreen to:otherGreen alpha:amount];
    CGFloat newBlue = [self lerpFrom:thisBlue to:otherBlue alpha:amount];
    
    return [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:1.0];
}
    
- (CGFloat)lerpFrom:(CGFloat)a to:(CGFloat)b alpha:(CGFloat)alpha {
    return (1 - alpha) * a + alpha * b;
}

//--------------------------------------------------------
#pragma mark Inverted Colours
//--------------------------------------------------------
/// Return the invert color corresponding to the receiver
-(UIColor*)kfx_invertedColour{

	const CGFloat *components = CGColorGetComponents(self.CGColor);
	
	UIColor *invertedColor = [[UIColor alloc] initWithRed:1.f - components[0]
													green:1.f - components[1]
													 blue:1.f - components[2]
													alpha:components[3]];
	
	return invertedColor;
}




//======================================================
#pragma mark - ** Query  **
//======================================================
//--------------------------------------------------------
#pragma mark Component
//--------------------------------------------------------
/// Return non-normalized red color components (0 - 255)
-(NSUInteger)kfx_redComponent{
	return (NSUInteger)roundf(255.f * self.kfx_normalisedRedComponent);
}

/// Return non-normalized blue color components (0 - 255)
-(NSUInteger)kfx_blueComponent{
	return (NSUInteger)roundf(255.f * self.kfx_normalisedBlueComponent);
}

/// Return non-normalized green color components (0 - 255)
-(NSUInteger)kfx_greenComponent{
	return (NSUInteger)roundf(255.f * self.kfx_normalisedGreenComponent);
}

/// Return normalized red color components (0.f - 1.f)
-(CGFloat)kfx_normalisedRedComponent{
	const CGFloat *components = CGColorGetComponents(self.CGColor);
	return components[0];
}

/// Return normalized blue color components (0.f - 1.f)
-(CGFloat)kfx_normalisedBlueComponent{
	const CGFloat *components = CGColorGetComponents(self.CGColor);
	return components[1];
}

/// Return normalized green color components (0.f - 1.f)
-(CGFloat)kfx_normalisedGreenComponent{
	const CGFloat *components = CGColorGetComponents(self.CGColor);
	return components[2];
}


//--------------------------------------------------------
#pragma mark Colour Description
//--------------------------------------------------------
-(NSString*)kfx_hexString{
	
	const CGFloat *components = CGColorGetComponents(self.CGColor);
	
	CGFloat red = components[0];
	CGFloat greeen = components[1];
	CGFloat blue = components[2];
	
	return [NSString stringWithFormat:@"%02lX%02lX%02lX", lroundf(red * 255), lroundf(greeen * 255), lroundf(blue * 255)];
}


//--------------------------------------------------------
#pragma mark Comparison
//--------------------------------------------------------
-(BOOL)kfx_isEqualToColor:(UIColor*)anotherColor{
	
	if (self == anotherColor)
		return YES;
	
	CGColorSpaceRef colorSpaceRGB = CGColorSpaceCreateDeviceRGB();
	
	UIColor *(^convertColorToRGBSpace)(UIColor*) = ^(UIColor *color)
	{
		if (CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) == kCGColorSpaceModelMonochrome)
		{
			const CGFloat *oldComponents = CGColorGetComponents(color.CGColor);
			CGFloat components[4] = {oldComponents[0], oldComponents[0], oldComponents[0], oldComponents[1]};
			CGColorRef colorRef = CGColorCreate(colorSpaceRGB, components);
			UIColor *color = [UIColor colorWithCGColor:colorRef];
			CGColorRelease(colorRef);
			return color;
		}
		else
			return color;
	};
	
	UIColor *selfColor = convertColorToRGBSpace(self);
	anotherColor = convertColorToRGBSpace(anotherColor);
	CGColorSpaceRelease(colorSpaceRGB);
	
	return [selfColor isEqual:anotherColor];
}


//======================================================
#pragma mark - ** Colours **
//======================================================

+(instancetype)kfx_pinkColour{
    UIColor *aColor = [UIColor colorWithHue:0.889 saturation:0.497 brightness:1.000 alpha:1.000];
    return aColor;
}

#pragma mark - Highlight Markers
/* Based on the Marker colours in Scrivener */
+(instancetype)kfx_yellowHighlightColour{
    UIColor *aColor = [UIColor colorWithHue:0.191 saturation:0.690 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_orangeHighlightColour{
    UIColor *aColor = [UIColor colorWithHue:0.111 saturation:0.600 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_pinkHighlightColour{
    UIColor *aColor = [UIColor colorWithHue:0.918 saturation:0.500 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_greenHighlightColour{
    UIColor *aColor = [UIColor colorWithHue:0.308 saturation:0.590 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_blueHighlightColour{
    UIColor *aColor = [UIColor colorWithHue:0.500 saturation:0.440 brightness:1.000 alpha:1.000];
    return aColor;
}

#pragma mark - System Colours
+(instancetype)kfx_iOS7BlueColour{
    UIColor *aColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
    return aColor;
}

+(instancetype)kfx_scrollViewTexturedBackgroundColour{
    UIColor *aColor = [UIColor colorWithHue:0.629 saturation:0.069 brightness:0.548 alpha:1.000];
    return aColor;
}
+(instancetype)kfx_viewFlipsideBackgroundColour{
    UIColor *aColor = [UIColor colorWithHue:0.596 saturation:0.139 brightness:0.188 alpha:1.000];
    return aColor;
}


#pragma mark - Crayons
/* Based on Crayons in OSX color picker */
+(instancetype)kfx_cayenneColour{
    UIColor *aColor = [UIColor colorWithHue:1.000 saturation:1.000 brightness:0.502 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_asparagusColour{
    UIColor *aColor = [UIColor colorWithHue:0.167 saturation:1.000 brightness:0.502 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_cloverColour{
    UIColor *aColor = [UIColor colorWithHue:0.333 saturation:1.000 brightness:0.502 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_tealColour{
    UIColor *aColor = [UIColor colorWithHue:0.500 saturation:1.000 brightness:0.502 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_midnightColour{
    UIColor *aColor = [UIColor colorWithHue:0.667 saturation:1.000 brightness:0.502 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_plumColour{
    UIColor *aColor = [UIColor colorWithHue:0.833 saturation:1.000 brightness:0.502 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_tinColour{
    UIColor *aColor = [UIColor colorWithHue:0.000 saturation:0.000 brightness:0.498 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_nickelColour{
    UIColor *aColor = [UIColor colorWithHue:0.000 saturation:0.000 brightness:0.502 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_mochaColour{
    UIColor *aColor = [UIColor colorWithHue:0.083 saturation:1.000 brightness:0.502 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_fernColour{
    UIColor *aColor = [UIColor colorWithHue:0.250 saturation:1.000 brightness:0.502 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_mossColour{
    UIColor *aColor = [UIColor colorWithHue:0.417 saturation:1.000 brightness:0.502 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_oceanColour{
    UIColor *aColor = [UIColor colorWithHue:0.583 saturation:1.000 brightness:0.502 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_eggplantColour{
    UIColor *aColor = [UIColor colorWithHue:0.750 saturation:1.000 brightness:0.502 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_maroonColour{
    UIColor *aColor = [UIColor colorWithHue:0.917 saturation:1.000 brightness:0.502 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_steelColour{
    UIColor *aColor = [UIColor colorWithHue:0.000 saturation:0.000 brightness:0.400 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_aluminumColour{
    UIColor *aColor = [UIColor colorWithHue:0.000 saturation:0.000 brightness:0.600 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_maraschinoColour{
    UIColor *aColor = [UIColor colorWithHue:1.000 saturation:1.000 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_lemonColour{
    UIColor *aColor = [UIColor colorWithHue:0.167 saturation:1.000 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_springColour{
    UIColor *aColor = [UIColor colorWithHue:0.333 saturation:1.000 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_turquoiseColour{
    UIColor *aColor = [UIColor colorWithHue:0.500 saturation:1.000 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_blueberryColour{
    UIColor *aColor = [UIColor colorWithHue:0.667 saturation:1.000 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_magentaColour{
    UIColor *aColor = [UIColor colorWithHue:0.833 saturation:1.000 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_ironColour{
    UIColor *aColor = [UIColor colorWithHue:0.000 saturation:0.000 brightness:0.298 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_magnesiumColour{
    UIColor *aColor = [UIColor colorWithHue:0.000 saturation:0.000 brightness:0.702 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_tangerineColour{
    UIColor *aColor = [UIColor colorWithHue:0.084 saturation:1.000 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_limeColour{
    UIColor *aColor = [UIColor colorWithHue:0.250 saturation:1.000 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_seaFoamColour{
    UIColor *aColor = [UIColor colorWithHue:0.417 saturation:1.000 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_aquaColour{
    UIColor *aColor = [UIColor colorWithHue:0.583 saturation:1.000 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_grapeColour{
    UIColor *aColor = [UIColor colorWithHue:0.750 saturation:1.000 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_strawberryColour{
    UIColor *aColor = [UIColor colorWithHue:0.916 saturation:1.000 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_tungstenColour{
    UIColor *aColor = [UIColor colorWithHue:0.000 saturation:0.000 brightness:0.200 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_silverColour{
    UIColor *aColor = [UIColor colorWithHue:0.000 saturation:0.000 brightness:0.800 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_salmonColour{
    UIColor *aColor = [UIColor colorWithHue:1.000 saturation:0.600 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_bananaColour{
    UIColor *aColor = [UIColor colorWithHue:0.167 saturation:0.600 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_floraColour{
    UIColor *aColor = [UIColor colorWithHue:0.333 saturation:0.600 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_iceColour{
    UIColor *aColor = [UIColor colorWithHue:0.500 saturation:0.600 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_orchidColour{
    UIColor *aColor = [UIColor colorWithHue:0.667 saturation:0.600 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_bubblegumColour{
    UIColor *aColor = [UIColor colorWithHue:0.833 saturation:0.600 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_leadColour{
    UIColor *aColor = [UIColor colorWithHue:0.000 saturation:0.000 brightness:0.098 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_mercuryColour{
    UIColor *aColor = [UIColor colorWithHue:0.000 saturation:0.000 brightness:0.902 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_cantaloupeColour{
    UIColor *aColor = [UIColor colorWithHue:0.111 saturation:0.600 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_honeydewColour{
    UIColor *aColor = [UIColor colorWithHue:0.222 saturation:0.600 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_spindriftColour{
    UIColor *aColor = [UIColor colorWithHue:0.444 saturation:0.600 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_skyColour{
    UIColor *aColor = [UIColor colorWithHue:0.556 saturation:0.600 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_lavenderColour{
    UIColor *aColor = [UIColor colorWithHue:0.778 saturation:0.600 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_carnationColour{
    UIColor *aColor = [UIColor colorWithHue:0.889 saturation:0.565 brightness:1.000 alpha:1.000];
    return aColor;
}

+(instancetype)kfx_licoriceColour{
    UIColor *aColor = [UIColor colorWithWhite:0.000 alpha:1.000];
    return aColor;
}
+(instancetype)kfx_snowColour{
    UIColor *aColor = [UIColor colorWithWhite:1.000 alpha:1.000];
    return aColor;
}


#pragma mark - Pastels
/* Pastels. Brightness == 100%, Saturation == 16% & varied Hue */
+(instancetype)kfx_pastelRed{
    UIColor *aColor = [UIColor colorWithHue:0.000 saturation:0.162 brightness:1.000 alpha:1.000];
    return aColor;
}
+(instancetype)kfx_pastelOrange{
    UIColor *aColor = [UIColor colorWithHue:0.061 saturation:0.162 brightness:1.000 alpha:1.000];
    return aColor;
}
+(instancetype)kfx_pastelYellow{
    UIColor *aColor = [UIColor colorWithHue:0.125 saturation:0.160 brightness:1.000 alpha:1.000];
    return aColor;
}
+(instancetype)kfx_pastelGreenLight{
    UIColor *aColor = [UIColor colorWithHue:0.250 saturation:0.162 brightness:1.000 alpha:1.000];
    return aColor;
}
+(instancetype)kfx_pastelGreenDark{
    UIColor *aColor = [UIColor colorWithHue:0.311 saturation:0.162 brightness:1.000 alpha:1.000];
    return aColor;
}
+(instancetype)kfx_pastelBlueLight{
    UIColor *aColor = [UIColor colorWithHue:0.500 saturation:0.162 brightness:1.000 alpha:1.000];
    return aColor;
}
+(instancetype)kfx_pastelBlueDark{
    UIColor *aColor = [UIColor colorWithHue:0.561 saturation:0.162 brightness:1.000 alpha:1.000];
    return aColor;
}
+(instancetype)kfx_pastelPurple{
    UIColor *aColor = [UIColor colorWithHue:0.686 saturation:0.162 brightness:1.000 alpha:1.000];
    return aColor;
}
+(instancetype)kfx_pastelPink{
    UIColor *aColor = [UIColor colorWithHue:0.936 saturation:0.162 brightness:1.000 alpha:1.000];
    return aColor;
}






@end













