
import UIKit
import KFXAbstracts
import KFXTheming

public typealias KFXBaseTableCellConfigCallback = (KFXBaseTableViewCell) -> Void

open class KFXBaseTableViewCell: KFXTableViewCell {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    open var theme:KFXTheme {
        return KFXTheming.shared.currentTheme
    }
    public var useReadableWidth = true
    public var postConfigureUICallback:KFXBaseTableCellConfigCallback?
    public var postConfigureSubviewsLayoutCallback:KFXBaseTableCellConfigCallback?
    public var postConfigureSubviewsFramesCallback:KFXBaseTableCellConfigCallback?

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
