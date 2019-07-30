
import UIKit
import KFXCardView

open class KFXBaseCardedView: KFXBaseView {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    public lazy var cardView:KFXCardView = {
        let cardView = KFXCardView()
        cardView.setBackgroundColour(theme.colours.cardVisibleBackground, forState: .visible)
        cardView.setBackgroundColour(theme.colours.cardHighlighedBackground, forState: .highlighted)
        cardView.setBorderColour(theme.colours.cardVisibleBorder, forState: .visible)
        cardView.setBorderColour(theme.colours.cardHighlighedBorder, forState: .highlighted)
        cardView.setViewState(.visible, completion: nil)
        return cardView
    }()
    public var cardViewVerticalInset = 5.0
    public var cardViewHorizontalInset = 5.0
    public var cardViewMinimumHeight = 40.0
    /// Set to false if the subclass should be responsible for updating cardView after theme change. Use this when you want to override the theme colours used
    public var baseUpdatesCardViewAfterThemeChange = true
    
    // # Private/Fileprivate
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Configure
    //------------------------------------
    open override func configureUI(){
        super.configureUI()
        backgroundColor = .clear
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
    
    open override func updateUIAfterThemeChange() {
        super.updateUIAfterThemeChange()
        
        if baseUpdatesCardViewAfterThemeChange {
            
            cardView.setBackgroundColour(theme.colours.cardVisibleBackground, forState: .visible)
            cardView.setBackgroundColour(theme.colours.cardHighlighedBackground, forState: .highlighted)
            cardView.setBorderColour(theme.colours.cardVisibleBorder, forState: .visible)
            cardView.setBorderColour(theme.colours.cardHighlighedBorder, forState: .highlighted)

        }
    }
    
}
