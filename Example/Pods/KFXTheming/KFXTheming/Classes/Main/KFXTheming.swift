
import UIKit
import FOXAdditions
import FontBlaster

public protocol HasTheme {
    var theme:KFXTheme? { get set }
}

public class KFXTheming {
 
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Static
    public static let shared = KFXTheming()
    public static let KFXThemeDidChangeNotification:String = "KFXThemeDidChangeNotification"

    // # Public/Internal/Open
    public var currentTheme:KFXTheme {
        set {
            _currentTheme = newValue
            UserDefaults.standard.set(newValue.name, forKey: KFXTheming.kThemeDefaultsKey)
            UserDefaults.standard.synchronize()
            let note = Notification.init(name: Notification.Name.init(KFXTheming.KFXThemeDidChangeNotification))
            NotificationCenter.default.post(note)
        }
        get {
            guard let _currentTheme = _currentTheme else {

                guard let themeName = UserDefaults.standard.string(forKey: KFXTheming.kThemeDefaultsKey),
                        let storedTheme:KFXTheme = theme(forName: themeName) else {
                        
                        self._currentTheme = KFXStandardThemes.defaultTheme()
                        return self._currentTheme!
                }
                
                self._currentTheme = storedTheme
                return storedTheme
            }
            return _currentTheme
        }
    }

    // ## Background Image
    public var customBackgroundImage:UIImage?
    public var backgroundImageName:String? {
        set {
            _backgroundImageName = newValue
        }
        get {
            if _backgroundImageName == nil {
                return currentTheme.background.defaultImageName
            } else {
                return _backgroundImageName
            }
        }
    }
    public var backgroundImage:UIImage? {
        
        if let customBackgroundImage = customBackgroundImage {
            return customBackgroundImage
        }
        
        guard let backgroundImageName = backgroundImageName else {
            return nil
        }
        
        var imageName:String?
        if UI_USER_INTERFACE_IDIOM() == .pad {
            
            imageName = backgroundImageName + "_iPad"
            
        } else if UIScreen.main.traitCollection.verticalSizeClass == .compact {
            
            imageName = backgroundImageName + "_iPhone_Landscape"

        } else {
            
            imageName = backgroundImageName + "_iPhone_Portrait"

        }

        guard let name = imageName else {
            return nil
        }
        var image = UIImage(named: name)
        if image == nil {
            let bundle = Bundle.fox_podResourceBundle(aClass: KFXTheming.self, resourcesName: "KFXTheming")
            image = UIImage.init(named: name, in: bundle, compatibleWith: nil)
        }
        if image == nil {
            image = UIImage(named: backgroundImageName)
        }
        if image == nil {
            let bundle = Bundle.fox_podResourceBundle(aClass: KFXTheming.self, resourcesName: "KFXTheming")
            image = UIImage.init(named: backgroundImageName, in: bundle, compatibleWith: nil)
        }
        return image
    }
    
    // # Private/Fileprivate
    private static let kThemeDefaultsKey = "currentTheme"
    private var _currentTheme:KFXTheme?
    private var themes = [KFXTheme]()
    // ## Background Image
    private var _backgroundImageName:String?
    
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    public func registerTheme(_ theme:KFXTheme) {
        
        if themes.contains(where: { (storedTheme) -> Bool in
            return theme.name == storedTheme.name
        }){
            return
        }
        themes.append(theme)
    }
    
    public func theme(forName name:String) -> KFXTheme? {
        
        let matching = themes.filter{$0.name == name}
        return matching.first
    }
    
    public func theme(atIndex index:Int) -> KFXTheme? {
        
        guard index < themes.count else {
            return nil
        }
        return themes[index]
    }

    public func isCurrentTheme(_ theme:KFXTheme) -> Bool {
        return theme.name == currentTheme.name
    }

    public func registeredThemes() -> [KFXTheme] {
        
        return Array(themes)
    }

    
    //=======================================
    // MARK: Private Methods
    //=======================================
    

}
