
import UIKit
import KFXAbstracts
import KFXTheming

public typealias KFXBaseCollectionViewConfigCallback = (KFXBaseCollectionViewCell) -> Void

open class KFXBaseCollectionViewCell: KFXCollectionViewCell {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    open var theme:KFXTheme {
        return KFXTheming.shared.currentTheme
    }
    public var postConfigureUICallback:KFXBaseCollectionViewConfigCallback?
    public var postConfigureSubviewsLayoutCallback:KFXBaseCollectionViewConfigCallback?
    public var postConfigureSubviewsFramesCallback:KFXBaseCollectionViewConfigCallback?
    
    // # Private/Fileprivate
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Configure
    //------------------------------------
    open func configureUI(){
        // Base version of method, subclasses should all call super
    }
    
    open func configureSubviewsLayout(){
        // Base version of method, subclasses should all call super
    }
    
    open func configureSubviewsFrames() {
        // Base version of method, subclasses should all call super
    }

    //=======================================
    // MARK: Inherited Methods
    //=======================================
    override open func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        configureUI()
        postConfigureUICallback?(self)
        configureSubviewsLayout()
        postConfigureSubviewsLayoutCallback?(self)
        configureSubviewsFrames()
        postConfigureSubviewsFramesCallback?(self)
    }
}
