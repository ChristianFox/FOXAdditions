

import UIKit

public struct KFXTheme {
    public let name:String
    public let fonts:KFXThemeFonts
    public let colours:KFXThemeColours
    public let background:KFXThemeBackground
}

public struct KFXThemeFonts {
    // Branding
    public let brandingTitle:UIFont
    public let brandingSubtitle:UIFont
    // Headers
    public let header:UIFont
    public let subheader:UIFont
    public let sectionHeader:UIFont
    public let pagerHeader:UIFont
    public let pagerSubheader:UIFont
    // Buttons
    public let systemButton:UIFont
    public let userButton:UIFont
    public let navigationButton:UIFont
    // Context
    public let title:UIFont
    public let infoTitle:UIFont
    public let infoDetail:UIFont
    public let content:UIFont
    public let contentEmphasised:UIFont
    public let contentLight:UIFont
    public let contentLightItalic:UIFont
    // Alerts
    public let alertTitle:UIFont
    public let alertMessage:UIFont
    public let alertButtonTitle:UIFont
}

public struct KFXThemeColours {
    // Branding
    public let branding:UIColor
    // Palette
    public let palette:[UIColor]
    // Backgrounds
    public let background:UIColor
    public let textInputBackground:UIColor
    public let systemButtonBackground:UIColor
    public let userButtonBackground:UIColor
    public let deleteActionBackground:UIColor
    public let editActionBackground:UIColor
    public let lockActionBackground:UIColor
    public let unlockActionBackground:UIColor
    public let cardVisibleBackground:UIColor
    public let cardHighlighedBackground:UIColor
    public let cardVisibleBorder:UIColor
    public let cardHighlighedBorder:UIColor
    // Text
    public let systemButtonText:UIColor
    public let userButtonText:UIColor
    public let navigationButtonText:UIColor
    public let headerText:UIColor
    public let subheaderText:UIColor
    public let sectionHeaderText:UIColor
    public let titleText:UIColor
    public let infoTitleText:UIColor
    public let infoDetailText:UIColor
    public let contentText:UIColor
    // Alerts
    public let alertBackground:UIColor
    public let alertTitle:UIColor
    public let alertMessage:UIColor
    public let alertDefaultButtonTitle:UIColor
    public let alertDestructiveButtonTitle:UIColor
    public let alertCancelButtonTitle:UIColor
    public let alertDefaultButtonBackground:UIColor
    public let alertDestructiveButtonBackground:UIColor
    public let alertCancelButtonBackground:UIColor
}

public struct KFXThemeBackground {
    public let imageOverlayAlpha:CGFloat
    public let blurEffectStyle:UIBlurEffect.Style
    public let defaultImageName:String?    
}
