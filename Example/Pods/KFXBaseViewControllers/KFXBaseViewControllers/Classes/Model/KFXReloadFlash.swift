
import Foundation

public struct KFXReloadFlash {
    public var disabled:Bool = false
    public var enabledForViewDidLoad:Bool = true
    public var enabledForViewDidAppear:Bool = false
    public var enabledForReloadData:Bool = true
    public var enabledForThemeChange:Bool = false
    public var betweenDurationInitial:Int = 100 // milliseconds
    public var betweenDurationIncrease:Int = 50 // milliseconds
    public var waitDurationIfNeeded:Int = 150 // milliseconds
    public var animationDuration:TimeInterval = 0.2
    
    public init() {
        
    }
    
    public mutating func copyValuesFrom(_ otherReloadFlash:KFXReloadFlash) {
        disabled = otherReloadFlash.disabled
        enabledForViewDidLoad = otherReloadFlash.enabledForViewDidLoad
        enabledForViewDidAppear = otherReloadFlash.enabledForViewDidAppear
        enabledForReloadData = otherReloadFlash.enabledForReloadData
        enabledForThemeChange = otherReloadFlash.enabledForThemeChange
        betweenDurationInitial = otherReloadFlash.betweenDurationInitial
        betweenDurationIncrease = otherReloadFlash.betweenDurationIncrease
        waitDurationIfNeeded = otherReloadFlash.waitDurationIfNeeded
        animationDuration = otherReloadFlash.animationDuration
    }
}
