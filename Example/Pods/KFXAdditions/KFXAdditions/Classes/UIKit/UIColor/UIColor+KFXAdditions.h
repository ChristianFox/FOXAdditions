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

NS_ASSUME_NONNULL_BEGIN
@interface UIColor (KFXAdditions)

//======================================================
#pragma mark - ** Create Colours **
//======================================================
//--------------------------------------------------------
#pragma mark - Hex Colours
//--------------------------------------------------------
/**
 * @brief Create a UIColor from a hex string
 * @param hexStr A NSString representing a hex colour value. Should be in either the #FFF or #FFFFFF format.
 * @param alpha The value to use for the alpha channel. Should be between 0.0 & 1.0
 * @return A UIColor object representing the same colour as defined by the hexStr parameter
 * @ref  http://iosdevelopertips.com/conversion/how-to-create-a-uicolor-object-from-a-hex-value.html
 **/
+ (UIColor *)kfx_colorwithHexString:(NSString *)hexStr alpha:(CGFloat)alpha;


//--------------------------------------------------------
#pragma mark - Random Colours
//--------------------------------------------------------
/**
 * @brief Generate a UIColor with random values for Hue, Saturation, Brightness and Alpha in between 0.0 & 1.0
 * @return A UIColor object with random colour
 * @since 0.12.0
 **/
+(UIColor*)kfx_randomColour;

/**
 * @brief Generate a UIColor with random values for Hue, Saturation and Brightness in between 0.0 & 1.0 with the specified Alpha value
 * @param alpha The value to use for the alpha channel. Should be between 0.0 & 1.0
 * @return A UIColor object with random colour
 * @since 0.12.0
 **/
+(UIColor*)kfx_randomColourWithAlpha:(CGFloat)alpha;

/**
 * @brief Generate a UIColor with random values for Hue in between 0.0 & 1.0 and random values for Saturation and Brightness in between 0.5 and 1.0. The alpha value can be specified or a random value can be used.
 * @param alpha The alpha value for the colour. If less than 0.0 a random alpha value will be used. If greater than 1.0 then 1.0 will be used.
 * @return A UIColor object with random colour where saturation & brightness are both guaranteed to be at least 0.5.
 * @since 0.12.0
 * @ref http://stackoverflow.com/questions/21130433/generate-a-random-uicolor
 * @ref https://gist.github.com/kylefox/1689973
 **/
+(UIColor*)kfx_randomColourAvoidingBlackAndWhiteWithAlpha:(CGFloat)alpha;



//--------------------------------------------------------
#pragma mark - Alter Colours
//--------------------------------------------------------
/**
 * @brief Creates a new UIColor by taking the receivers colour and altering the Hue by the given amount
 * @param amount The amount to alter the Hue by. Prior to iOS 10 should be between -1.0 & 1.0, on iOS 10 and later can be any values.
 * @return A new UIColor object. If the recevier is not in a compatible color space then nil will be returned.
 * @since 0.12.0
 **/
-(UIColor*_Nullable )kfx_colourByAlteringHueByAmount:(CGFloat)amount;

/**
 * @brief Creates a new UIColor by taking the receivers colour and altering the Saturation by the given amount
 * @param amount The amount to alter the Saturation by. Prior to iOS 10 should be between -1.0 & 1.0, on iOS 10 and later can be any values.
 * @return A new UIColor object. If the recevier is not in a compatible color space then nil will be returned.
 * @since 0.12.0
 **/
-(UIColor*_Nullable)kfx_colourByAlteringSaturationByAmount:(CGFloat)amount;


/**
 * @brief Creates a new UIColor by taking the receivers colour and altering the Brightness by the given amount
 * @param amount The amount to alter the Brightness by. Prior to iOS 10 should be between -1.0 & 1.0, on iOS 10 and later can be any values.
 * @return A new UIColor object. If the recevier is not in a compatible color space then nil will be returned.
 * @since 0.12.0
 **/
-(UIColor*_Nullable)kfx_colourByAlteringBrightnessByAmount:(CGFloat)amount;

/**
 * @brief Creates a new UIColor by taking the receivers colour and altering the Alpha by the given amount
 * @param amount The amount to alter the Alpha by. Should be between -1.0 & 1.0.
 * @return A new UIColor object. If the recevier is not in a compatible color space then nil will be returned.
 * @since 0.12.0
 **/
-(UIColor*_Nullable)kfx_colourByAlteringAlphaByAmount:(CGFloat)amount;


/**
 * @brief Creates a new UIColor by taking the receivers colour and altering the values by the given amounts
 * @param hue The amount to alter the Hue by. Prior to iOS 10 should be between -1.0 & 1.0, on iOS 10 and later can be any values.
 * @param saturation The amount to alter the Saturation by. Prior to iOS 10 should be between -1.0 & 1.0, on iOS 10 and later can be any values.
 * @param brightness The amount to alter the Brightness by. Prior to iOS 10 should be between -1.0 & 1.0, on iOS 10 and later can be any values.
 * @param alpha The amount to alter the Alpha by. Should be between -1.0 & 1.0.
 * @return A new UIColor object. If the recevier is not in a compatible color space then nil will be returned.
 * @since 0.12.0
 **/
-(UIColor*_Nullable)kfx_colourByAlteringHue:(CGFloat)hue
                                 saturation:(CGFloat)saturation
                                 brightness:(CGFloat)brightness
                                      alpha:(CGFloat)alpha;

    
    /**
     * @brief Creates a new UIColor by combining the receiver with the otherColour
     * @param otherColour The other colour to combine with the receiver
     * @param amount The amount of colour data to take from the receiver. Will be used as the 'alpha' value in the linear interpolation formula.
     * @return A new UIColor object.
     * @since 0.12.0
     **/
-(UIColor*)kfx_combineWithColour:(UIColor*)otherColour amount:(CGFloat)amount;
    


//--------------------------------------------------------
#pragma mark Inverted Colours
//--------------------------------------------------------
/// Return the invert color corresponding to the receiver
-(UIColor*)kfx_invertedColour;



//======================================================
#pragma mark - ** Read  **
//======================================================
//--------------------------------------------------------
#pragma mark Components
//--------------------------------------------------------
/// Return non-normalized red color components (0 - 255)
-(NSUInteger)kfx_redComponent;

/// Return non-normalized blue color components (0 - 255)
-(NSUInteger)kfx_blueComponent;

/// Return non-normalized green color components (0 - 255)
-(NSUInteger)kfx_greenComponent;

/// Return normalized red color components (0.f - 1.f)
-(CGFloat)kfx_normalisedRedComponent;

/// Return normalized blue color components (0.f - 1.f)
-(CGFloat)kfx_normalisedBlueComponent;

/// Return normalized green color components (0.f - 1.f)
-(CGFloat)kfx_normalisedGreenComponent;


//--------------------------------------------------------
#pragma mark Colour Description
//--------------------------------------------------------
-(NSString*)kfx_hexString;


//--------------------------------------------------------
#pragma mark Comparison
//--------------------------------------------------------
-(BOOL)kfx_isEqualToColor:(UIColor*)colour;



//======================================================
#pragma mark - ** Colours **
//======================================================
/* Pink becuase there is no pink by default. */ // - It is magenta!
+(instancetype)kfx_pinkColour;

#pragma mark Highlight Markers
/* Based on the Marker colours in Scrivener */
+(instancetype)kfx_yellowHighlightColour;
+(instancetype)kfx_orangeHighlightColour;
+(instancetype)kfx_pinkHighlightColour;
+(instancetype)kfx_greenHighlightColour;
+(instancetype)kfx_blueHighlightColour;

#pragma mark System Colours
+(instancetype)kfx_iOS7BlueColour;
+(instancetype)kfx_scrollViewTexturedBackgroundColour;
+(instancetype)kfx_viewFlipsideBackgroundColour;

#pragma mark Pastels
/* Pastels. Brightness == 100%, Saturation == 16% & varied Hue */
+(instancetype)kfx_pastelRed;
+(instancetype)kfx_pastelOrange;
+(instancetype)kfx_pastelYellow;
+(instancetype)kfx_pastelGreenLight;
+(instancetype)kfx_pastelGreenDark;
+(instancetype)kfx_pastelBlueLight;
+(instancetype)kfx_pastelBlueDark;
+(instancetype)kfx_pastelPurple;
+(instancetype)kfx_pastelPink;

#pragma mark Crayons
/* Based on Crayons in OSX color picker */

// Foods
/// A deep red (full red with 50% brightness)
+(instancetype)kfx_cayenneColour;
/// Greeny-Yellow (50% brightness)
+(instancetype)kfx_asparagusColour;
/// Bright Purple (50% brightness)
+(instancetype)kfx_plumColour;
/// A browny-orange (50% brightness)
+(instancetype)kfx_mochaColour;
/// Vivid Purple (50% brightness)
+(instancetype)kfx_eggplantColour;
/// Bright Yellow
+(instancetype)kfx_lemonColour;
/// Strong deep Blue
+(instancetype)kfx_blueberryColour;
/// Bright Orange
+(instancetype)kfx_tangerineColour;
/// Bright Lime Green
+(instancetype)kfx_limeColour;
/// Bright Purple
+(instancetype)kfx_grapeColour;
/// Bright Red-Pink
+(instancetype)kfx_strawberryColour;
/// Pale Red
+(instancetype)kfx_salmonColour;
/// Pale Bright Yellow (60% saturation)
+(instancetype)kfx_bananaColour;
/// Pale Purple-Pink (60% saturation)
+(instancetype)kfx_bubblegumColour;
/// Pale Orange (60% saturation)
+(instancetype)kfx_cantaloupeColour;
/// Pale Greeny-Yellow (60% saturation)
+(instancetype)kfx_honeydewColour;
/// Black (100% black)
+(instancetype)kfx_licoriceColour;

// Plants
/// Medium Green (50% brightness)
+(instancetype)kfx_cloverColour;
/// Medium Green (50% brightness)
+(instancetype)kfx_fernColour;
/// Medium Green (50% brightness)
+(instancetype)kfx_mossColour;
/// Pale Bright Green (60% saturation)
+(instancetype)kfx_floraColour;
/// Pale Purple (60% saturation)
+(instancetype)kfx_orchidColour;
/// Pale Bright Purple (60% saturation)
+(instancetype)kfx_lavenderColour;
/// Pale Pink (60% saturation)
+(instancetype)kfx_carnationColour;

// Metals
/// Medium gray (50% black)
+(instancetype)kfx_tinColour;
/// Medium gray (50% black)
+(instancetype)kfx_nickelColour;
/// A medium-dark gray (60% black)
+(instancetype)kfx_steelColour;
/// A medium-light gray (40% black)
+(instancetype)kfx_aluminumColour;
/// A medium-dark gray (70% black)
+(instancetype)kfx_ironColour;
/// A medium-light gray (30% black)
+(instancetype)kfx_magnesiumColour;
/// A dark gray (80% black)
+(instancetype)kfx_tungstenColour;
/// A light gray (20% black)
+(instancetype)kfx_silverColour;
/// a very dark gray (90% black)
+(instancetype)kfx_leadColour;
/// A very light gray (10% black)
+(instancetype)kfx_mercuryColour;

// Watery
/// Deep Blue (50% brightness)
+(instancetype)kfx_oceanColour;
/// Bright Light Green
+(instancetype)kfx_seaFoamColour;
/// Bright Pale Blue
+(instancetype)kfx_aquaColour;
/// Pale Bright Blue (60% saturation)
+(instancetype)kfx_iceColour;
/// White
+(instancetype)kfx_snowColour;

// misc
/// Green-Blue (50% brightness)
+(instancetype)kfx_tealColour;
/// Red with Purple hint (50% brightness)
+(instancetype)kfx_maroonColour;
/// Bright Light Blue
+(instancetype)kfx_turquoiseColour;
/// Bright Purpley-Pink
+(instancetype)kfx_magentaColour;
/// Rich Blue (50% brightness)
+(instancetype)kfx_midnightColour;
/// Bright Red
+(instancetype)kfx_maraschinoColour;
/// Bright Green
+(instancetype)kfx_springColour;
/// Pale Bright Blue (60% saturation)
+(instancetype)kfx_spindriftColour;
/// Pale Bright Blue (60% saturation)
+(instancetype)kfx_skyColour;




@end

NS_ASSUME_NONNULL_END



