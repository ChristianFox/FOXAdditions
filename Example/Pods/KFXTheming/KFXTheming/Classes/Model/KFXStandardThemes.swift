
import UIKit
import FOXAdditions
import FontBlaster

public enum KFXStandardThemeName : String {
    case mrManager = "Mr Manager"
    case forgetMeNow = "Forget Me Now"
    case neverNude = "Never Nude"
    case hotCops = "Hot Cops"
    case blueMyself = "Blue Myself"
}


public class KFXStandardThemes {
    
    //------------------------------------
    // MARK: Themes
    //------------------------------------
    public class func defaultTheme() -> KFXTheme {
        return hotCops()
    }
    
    public class func mrManager() -> KFXTheme {
        
        let palette = [UIColor(red: 44.0/255.0, green: 43.0/255.0, blue: 44.0/255.0, alpha: 1.0),
                       UIColor(red: 0.0/255.0, green: 173.0/255.0, blue: 181.0/255.0, alpha: 1.0),
                       UIColor(red: 135.0/255.0, green: 170.0/255.0, blue: 173.0/255.0, alpha: 1.0),
                       UIColor(red: 248.0/255.0, green: 181.0/255.0, blue: 0.0/255.0, alpha: 1.0),
                       UIColor(red: 213.0/255.0, green: 213.0/255.0, blue: 197.0/255.0, alpha: 1.0)
        ]
        let colours =
            KFXThemeColours(branding: palette[1],
                            palette:palette,
                            background: palette[0],
                            textInputBackground: palette[1].withAlphaComponent(0.2),
                            systemButtonBackground: palette[2].withAlphaComponent(0.1),
                            userButtonBackground: palette[3].withAlphaComponent(0.1),
                            deleteActionBackground: UIColor.kfxtheming_fadedRed,
                            editActionBackground: UIColor.kfxtheming_denim,
                            lockActionBackground: UIColor.kfxtheming_butterscotch,
                            unlockActionBackground: UIColor.kfxtheming_booger,
                            cardVisibleBackground: palette[2].withAlphaComponent(0.1),
                            cardHighlighedBackground: palette[2],
                            cardVisibleBorder: UIColor.clear,
                            cardHighlighedBorder: UIColor.clear,
                            systemButtonText: palette[2],
                            userButtonText: palette[3],
                            navigationButtonText: palette[2],
                            headerText: palette[1],
                            subheaderText: palette[2],
                            sectionHeaderText: palette[1],
                            titleText: palette[3],
                            infoTitleText: palette[2],
                            infoDetailText: palette[3],
                            contentText: palette[4],
                            alertBackground: palette[0],
                            alertTitle: palette[3],
                            alertMessage: palette[4],
                            alertDefaultButtonTitle: UIColor.white,
                            alertDestructiveButtonTitle: UIColor.white,
                            alertCancelButtonTitle: UIColor.white,
                            alertDefaultButtonBackground: UIColor.kfxtheming_boringGreen,
                            alertDestructiveButtonBackground: UIColor.kfxtheming_pinkish,
                            alertCancelButtonBackground: UIColor.kfxtheming_apricot)
        
        let fonts = avenirFonts()
        
        let background = KFXThemeBackground(imageOverlayAlpha: 0.75, blurEffectStyle: .dark, defaultImageName: "Twirly")
        
        return KFXTheme(name:KFXStandardThemeName.mrManager.rawValue, fonts: fonts, colours: colours, background: background)
    }
    
    
    
    public class func forgetMeNow() -> KFXTheme {
        
        let palette = [UIColor(red: 68.0/255.0, green: 91.0/255.0, blue: 124.0/255.0, alpha: 1.0),
                       UIColor(red: 220.0/255.0, green: 113.0/255.0, blue: 125.0/255.0, alpha: 1.0),
                       UIColor(red: 140.0/255.0, green: 198.0/255.0, blue: 126.0/255.0, alpha: 1.0),
                       UIColor(red: 255.0/255.0, green: 189.0/255.0, blue: 95.0/255.0, alpha: 1.0),
                       UIColor(red: 243.0/255.0, green: 243.0/255.0, blue: 243.0/255.0, alpha: 1.0)
        ]
        let colours =
            KFXThemeColours(branding: palette[1],
                            palette:palette,
                            background: palette[0],
                            textInputBackground: palette[1].withAlphaComponent(0.2),
                            systemButtonBackground: palette[3].withAlphaComponent(0.3),
                            userButtonBackground: palette[2].withAlphaComponent(0.5),
                            deleteActionBackground: UIColor.kfxtheming_fadedRed,
                            editActionBackground: UIColor.kfxtheming_denim,
                            lockActionBackground: UIColor.kfxtheming_butterscotch,
                            unlockActionBackground: UIColor.kfxtheming_booger,
                            cardVisibleBackground: palette[1].withAlphaComponent(0.2),
                            cardHighlighedBackground: palette[3],
                            cardVisibleBorder: UIColor.clear,
                            cardHighlighedBorder: UIColor.clear,
                            systemButtonText: palette[3],
                            userButtonText: palette[2],
                            navigationButtonText: palette[2],
                            headerText: palette[1],
                            subheaderText: palette[2],
                            sectionHeaderText: palette[1],
                            titleText: palette[3],
                            infoTitleText: palette[2],
                            infoDetailText: palette[3],
                            contentText: palette[4],
                            alertBackground: palette[0],
                            alertTitle: palette[3],
                            alertMessage: palette[4],
                            alertDefaultButtonTitle: UIColor.white,
                            alertDestructiveButtonTitle: UIColor.white,
                            alertCancelButtonTitle: UIColor.white,
                            alertDefaultButtonBackground: UIColor.kfxtheming_fadedGreen,
                            alertDestructiveButtonBackground: UIColor.kfxtheming_dirtyPink,
                            alertCancelButtonBackground: UIColor.kfxtheming_paleOrange)

        let fonts = avenirFonts()
        
        let background = KFXThemeBackground(imageOverlayAlpha: 0.75, blurEffectStyle: .dark, defaultImageName: "Spikey")

        return KFXTheme(name:KFXStandardThemeName.forgetMeNow.rawValue, fonts: fonts, colours: colours, background: background)
    }
    
    public class func neverNude() -> KFXTheme {
        
        let palette = [UIColor(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0),
                       UIColor(red: 9.0/255.0, green: 158.0/255.0, blue: 144.0/255.0, alpha: 1.0),
                       UIColor(red: 15.0/255.0, green: 85.0/255.0, blue: 95.0/255.0, alpha: 1.0),
                       UIColor(red: 124.0/255.0, green: 78.0/255.0, blue: 243.0/255.0, alpha: 1.0),
                       UIColor(red: 68.0/255.0, green: 72.0/255.0, blue: 74.0/255.0, alpha: 1.0)
        ]
        let colours =
            KFXThemeColours(branding: palette[1],
                            palette:palette,
                            background: palette[0],
                            textInputBackground: palette[1].withAlphaComponent(0.2),
                            systemButtonBackground: palette[2].withAlphaComponent(0.1),
                            userButtonBackground: palette[3].withAlphaComponent(0.1),
                            deleteActionBackground: UIColor.kfxtheming_fadedRed,
                            editActionBackground: UIColor.kfxtheming_denim,
                            lockActionBackground: UIColor.kfxtheming_butterscotch,
                            unlockActionBackground: UIColor.kfxtheming_booger,
                            cardVisibleBackground: palette[2].withAlphaComponent(0.1),
                            cardHighlighedBackground: palette[2],
                            cardVisibleBorder: UIColor.clear,
                            cardHighlighedBorder: UIColor.clear,
                            systemButtonText: palette[2],
                            userButtonText: palette[3],
                            navigationButtonText: palette[2],
                            headerText: palette[1],
                            subheaderText: palette[2],
                            sectionHeaderText: palette[1],
                            titleText: palette[3],
                            infoTitleText: palette[2],
                            infoDetailText: palette[3],
                            contentText: palette[4],
                            alertBackground: palette[0],
                            alertTitle: palette[3],
                            alertMessage: palette[4],
                            alertDefaultButtonTitle: UIColor.white,
                            alertDestructiveButtonTitle: UIColor.white,
                            alertCancelButtonTitle: UIColor.white,
                            alertDefaultButtonBackground: UIColor.kfxtheming_fadedGreen,
                            alertDestructiveButtonBackground: UIColor.kfxtheming_coralTwo,
                            alertCancelButtonBackground: UIColor.kfxtheming_peachTwo)
        
        let fonts = avenirFonts()
        
        let background = KFXThemeBackground(imageOverlayAlpha: 0.75, blurEffectStyle: .light, defaultImageName: "Pointy")

        return KFXTheme(name:KFXStandardThemeName.neverNude.rawValue, fonts: fonts, colours: colours, background: background)
    }
    
    
    public class func hotCops() -> KFXTheme {
        
        let palette = [UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0),
                       UIColor(red: 19.0/255.0, green: 30.0/255.0, blue: 119.0/255.0, alpha: 1.0),
                       UIColor(red: 113.0/255.0, green: 120.0/255.0, blue: 173.0/255.0, alpha: 1.0),
                       UIColor(red: 247.0/255.0, green: 82.0/255.0, blue: 167.0/255.0, alpha: 1.0),
                       UIColor(red: 118.0/255.0, green: 121.0/255.0, blue: 143.0/255.0, alpha: 1.0)
        ]
        let colours =
            KFXThemeColours(branding: palette[1],
                            palette:palette,
                            background: palette[0],
                            textInputBackground: palette[1].withAlphaComponent(0.2),
                            systemButtonBackground: palette[2].withAlphaComponent(0.1),
                            userButtonBackground: palette[3].withAlphaComponent(0.1),
                            deleteActionBackground: UIColor.kfxtheming_fadedRed,
                            editActionBackground: UIColor.kfxtheming_denim,
                            lockActionBackground: UIColor.kfxtheming_butterscotch,
                            unlockActionBackground: UIColor.kfxtheming_booger,
                            cardVisibleBackground: palette[2].withAlphaComponent(0.1),
                            cardHighlighedBackground: palette[2],
                            cardVisibleBorder: UIColor.clear,
                            cardHighlighedBorder: UIColor.clear,
                            systemButtonText: palette[2],
                            userButtonText: palette[3],
                            navigationButtonText: palette[2],
                            headerText: palette[1],
                            subheaderText: palette[2],
                            sectionHeaderText: palette[1],
                            titleText: palette[3],
                            infoTitleText: palette[2],
                            infoDetailText: palette[3],
                            contentText: palette[4],
                            alertBackground: palette[0],
                            alertTitle: palette[3],
                            alertMessage: palette[4],
                            alertDefaultButtonTitle: UIColor.darkGray,
                            alertDestructiveButtonTitle: UIColor.darkGray,
                            alertCancelButtonTitle: UIColor.darkGray,
                            alertDefaultButtonBackground: UIColor.kfxtheming_paleTeal,
                            alertDestructiveButtonBackground: UIColor.kfxtheming_coralPink,
                            alertCancelButtonBackground: UIColor.kfxtheming_peach)
        
        let fonts = sanFranciscoFonts()
        
        let background = KFXThemeBackground(imageOverlayAlpha: 0.75, blurEffectStyle: .light, defaultImageName: "Rainbowy")

        return KFXTheme(name:KFXStandardThemeName.hotCops.rawValue, fonts: fonts, colours: colours, background: background)
    }
    
    
    public class func blueMyself() -> KFXTheme {
        
        let palette = [UIColor(red: 19.0/255.0, green: 50.0/255.0, blue: 109.0/255.0, alpha: 1.0),
                       UIColor(red: 96.0/255.0, green: 224.0/255.0, blue: 235.0/255.0, alpha: 1.0),
                       UIColor(red: 184.0/255.0, green: 193.0/255.0, blue: 211.0/255.0, alpha: 1.0),
                       UIColor(red: 253.0/255.0, green: 137.0/255.0, blue: 45.0/255.0, alpha: 1.0),
                       UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        ]
        let colours =
            KFXThemeColours(branding: palette[1],
                            palette:palette,
                            background: palette[0],
                            textInputBackground: palette[1].withAlphaComponent(0.2),
                            systemButtonBackground: palette[2].withAlphaComponent(0.1),
                            userButtonBackground: palette[3].withAlphaComponent(0.1),
                            deleteActionBackground: UIColor.kfxtheming_fadedRed,
                            editActionBackground: UIColor.kfxtheming_denim,
                            lockActionBackground: UIColor.kfxtheming_butterscotch,
                            unlockActionBackground: UIColor.kfxtheming_booger,
                            cardVisibleBackground: palette[2].withAlphaComponent(0.1),
                            cardHighlighedBackground: palette[2],
                            cardVisibleBorder: UIColor.clear,
                            cardHighlighedBorder: UIColor.clear,
                            systemButtonText: palette[2],
                            userButtonText: palette[3],
                            navigationButtonText: palette[2],
                            headerText: palette[1],
                            subheaderText: palette[2],
                            sectionHeaderText: palette[1],
                            titleText: palette[3],
                            infoTitleText: palette[2],
                            infoDetailText: palette[3],
                            contentText: palette[4],
                            alertBackground: palette[0],
                            alertTitle: palette[3],
                            alertMessage: palette[4],
                            alertDefaultButtonTitle: UIColor.white,
                            alertDestructiveButtonTitle: UIColor.white,
                            alertCancelButtonTitle: UIColor.white,
                            alertDefaultButtonBackground: UIColor.kfxtheming_aquaMarine,
                            alertDestructiveButtonBackground: UIColor.kfxtheming_coral,
                            alertCancelButtonBackground: UIColor.kfxtheming_darkCream)
        let fonts = sanFranciscoFonts()
        
        let background = KFXThemeBackground(imageOverlayAlpha: 0.75, blurEffectStyle: .dark, defaultImageName: "Flowery")

        return KFXTheme(name:KFXStandardThemeName.blueMyself.rawValue, fonts: fonts, colours: colours, background: background)
    }
    //------------------------------------
    // MARK: KFXThemeColours Components
    //------------------------------------
    public class func standardColours(withPalette palette:[UIColor]) -> KFXThemeColours {
        
        let colours =
            KFXThemeColours(branding: palette[1],
                            palette:palette,
                            background: palette[0],
                            textInputBackground: palette[0],
                            systemButtonBackground: palette[2].withAlphaComponent(0.1),
                            userButtonBackground: palette[3].withAlphaComponent(0.1),
                            deleteActionBackground: UIColor.kfxtheming_fadedRed,
                            editActionBackground: UIColor.kfxtheming_denim,
                            lockActionBackground: UIColor.kfxtheming_butterscotch,
                            unlockActionBackground: UIColor.kfxtheming_booger,
                            cardVisibleBackground: palette[2].withAlphaComponent(0.1),
                            cardHighlighedBackground: palette[2],
                            cardVisibleBorder: UIColor.clear,
                            cardHighlighedBorder: UIColor.clear,
                            systemButtonText: palette[2],
                            userButtonText: palette[3],
                            navigationButtonText: palette[2],
                            headerText: palette[1],
                            subheaderText: palette[2],
                            sectionHeaderText: palette[1],
                            titleText: palette[3],
                            infoTitleText: palette[2],
                            infoDetailText: palette[3],
                            contentText: palette[4],
                            alertBackground: palette[0],
                            alertTitle: palette[3],
                            alertMessage: palette[4],
                            alertDefaultButtonTitle: UIColor.white,
                            alertDestructiveButtonTitle: UIColor.white,
                            alertCancelButtonTitle: UIColor.white,
                            alertDefaultButtonBackground: UIColor.kfxtheming_boringGreen,
                            alertDestructiveButtonBackground: UIColor.kfxtheming_pinkish,
                            alertCancelButtonBackground: UIColor.kfxtheming_apricot)
        
        return colours
    }
    
    //------------------------------------
    // MARK: KFXThemeFonts Components
    //------------------------------------
    public class func sanFranciscoFonts() -> KFXThemeFonts {
        
        guard let bundle = Bundle.fox_podResourceBundle(aClass: KFXStandardThemes.self, resourcesName: "KFXTheming") else {
            return avenirFonts()
        }
        
        FontBlaster.debugEnabled = false
        FontBlaster.blast(bundle: bundle) { (fonts) in
            //            print(fonts)
        }
        
        let fonts =
            KFXThemeFonts(brandingTitle: UIFont(name: "SFUIDisplay-Regular", size: 25)!,
                          brandingSubtitle: UIFont(name: "SFUIDisplay-Light", size: 20)!,
                          header: UIFont(name: "SFUIDisplay-Semibold", size: 21.0)!,
                          subheader: UIFont(name: "SFUIDisplay-Medium", size: 20.0)!,
                          sectionHeader: UIFont(name: "AvenirNext-DemiBold", size: 19.0)!,
                          pagerHeader: UIFont(name: "SFUIDisplay-Light", size: 24)!,
                          pagerSubheader: UIFont(name: "SFUIDisplay-Light", size: 17)!,
                          systemButton: UIFont(name: "SFUIText-Medium", size: 20.0)!,
                          userButton: UIFont(name: "SFUIText-Medium", size: 20.0)!,
                          navigationButton: UIFont(name: "SFUIText-Regular", size: 17.0)!,
                          title: UIFont(name: "SFUIText-Medium", size: 16.0)!,
                          infoTitle: UIFont(name: "SFUIText-Regular", size: 14.0)!,
                          infoDetail: UIFont(name: "SFUIText-Regular", size: 14.0)!,
                          content: UIFont(name: "SFUIText-Regular", size: 10.0)!,
                          contentEmphasised: UIFont(name: "SFUIText-Medium", size: 14.0)!,
                          contentLight: UIFont(name: "SFUIText-Light", size: 14.0)!,
                          contentLightItalic: UIFont(name: "SFUIText-LightItalic", size: 14.0)!,
                          alertTitle: UIFont(name: "SFUIDisplay-Semibold", size: 14.0)!,
                          alertMessage: UIFont(name: "SFUIDisplay-Regular", size: 14.0)!,
                          alertButtonTitle: UIFont(name: "SFUIDisplay-Semibold", size: 14.0)!)
        return fonts
    }
    
    public class func avenirFonts() -> KFXThemeFonts {
        
        let fonts =
            KFXThemeFonts(brandingTitle: UIFont(name: "Avenir-Light", size: 27)!,
                          brandingSubtitle: UIFont(name: "Avenir-Light", size: 20)!,
                          header: UIFont(name: "AvenirNext-DemiBold", size: 21.0)!,
                          subheader: UIFont(name: "AvenirNext-Medium", size: 20.0)!,
                          sectionHeader: UIFont(name: "AvenirNext-DemiBold", size: 19.0)!,
                          pagerHeader: UIFont(name: "Avenir-Light", size: 24)!,
                          pagerSubheader: UIFont(name: "Avenir-Light", size: 17)!,
                          systemButton: UIFont(name: "AvenirNext-DemiBold", size: 20.0)!,
                          userButton: UIFont(name: "AvenirNext-DemiBold", size: 20.0)!,
                          navigationButton: UIFont(name: "AvenirNext-Medium", size: 17.0)!,
                          title: UIFont(name: "Avenir-Roman", size: 16.0)!,
                          infoTitle: UIFont(name: "Avenir-Light", size: 14.0)!,
                          infoDetail: UIFont(name: "Avenir-Roman", size: 14.0)!,
                          content: UIFont(name: "Avenir-Roman", size: 12.0)!,
                          contentEmphasised: UIFont(name: "AvenirNext-DemiBold", size: 12.0)!,
                          contentLight: UIFont(name: "Avenir-Light", size: 12.0)!,
                          contentLightItalic: UIFont(name: "Avenir-Light", size: 12.0)!,
                          alertTitle: UIFont.systemFont(ofSize: 18.0, weight: .semibold),
                          alertMessage: UIFont.systemFont(ofSize: 15.0, weight: .regular),
                          alertButtonTitle: UIFont.systemFont(ofSize: 15.0, weight: .semibold))
        return fonts
    }
    
}
