
import UIKit
import KFXTheming
import KFXCardView

open class KFXCardedButton: KFXButton {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    open override var buttonStyle:KFXButtonStyle {
        didSet{
            updateColours()
        }
    }
    open lazy var cardView:KFXCardView = {
        let cardView = KFXCardView()
        cardView.setViewState(.visible, completion: nil)
        cardView.isUserInteractionEnabled = false
        return cardView
    }()
    open var cardViewVerticalInset = 0.0
    open var cardViewHorizontalInset = 0.0
    open var cardViewMinimumHeight = 20.0
    override open var intrinsicContentSize: CGSize {
        
        let originalSize = super.intrinsicContentSize
        let widthPadding = titleEdgeInsets.left + titleEdgeInsets.right
        let heightPadding = titleEdgeInsets.top + titleEdgeInsets.bottom
        let size = CGSize(width: originalSize.width + widthPadding, height: originalSize.height + heightPadding)
        return size
    }

    // # Private/Fileprivate
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    
    //=======================================
    // MARK: Inherited Methods
    //=======================================
    //------------------------------------
    // MARK: Configure
    //------------------------------------
    open override func configureUI(){
        super.configureUI()
    }
    
    open override func configureSubviewsLayout(){
        super.configureSubviewsLayout()
        insertSubview(cardView, at: 0)
        cardView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(cardViewHorizontalInset)
            make.top.equalToSuperview().offset(cardViewVerticalInset)
            make.trailing.equalToSuperview().offset(-cardViewHorizontalInset)
            make.bottom.equalToSuperview().offset(-cardViewVerticalInset)
            make.height.greaterThanOrEqualTo(cardViewMinimumHeight)
        }
    }
    
    //------------------------------------
    // MARK: Update
    //------------------------------------
    open override func updateColours() {
        super.updateColours()

        switch buttonStyle {
        case .user:
            
            cardView.setBackgroundColour(theme.colours.userButtonBackground, forState: .visible)
            cardView.setBorderColour(theme.colours.userButtonBackground, forState: .visible)
            let bgColour = theme.colours.userButtonBackground.withAlphaComponent(0.75)
            cardView.setBackgroundColour(bgColour, forState: .highlighted)
            let borderColour = theme.colours.systemButtonBackground.withAlphaComponent(0.9)
            cardView.setBorderColour(borderColour, forState: .highlighted)
            
        case .system:
            
            cardView.setBackgroundColour(theme.colours.systemButtonBackground, forState: .visible)
            cardView.setBorderColour(theme.colours.systemButtonBackground, forState: .visible)
            let bgColour = theme.colours.systemButtonBackground.withAlphaComponent(0.75)
            cardView.setBackgroundColour(bgColour, forState: .highlighted)
            let borderColour = theme.colours.userButtonBackground.withAlphaComponent(0.9)
            cardView.setBorderColour(borderColour, forState: .highlighted)
        }
        
        if isActive {
            cardView.setViewState(.highlighted, completion: nil)
        } else {
            cardView.setViewState(.visible, completion: nil)
        }
    }
}
