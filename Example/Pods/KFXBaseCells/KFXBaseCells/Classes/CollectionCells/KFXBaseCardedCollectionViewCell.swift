
import UIKit
import KFXCardView
import SnapKit

open class KFXBaseCardedCollectionViewCell: KFXBaseCollectionViewCell {
    
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
    public var cardViewVerticalInset = 5.0 {
        didSet {
            cardViewTopConstraint?.update(inset: self.cardViewVerticalInset)
            cardViewBottomConstraint?.update(inset: self.cardViewVerticalInset)
        }
    }
    public var cardViewHorizontalInset = 5.0 {
        didSet {
            cardViewLeadingConstraint?.update(inset: self.cardViewHorizontalInset)
            cardViewTrailingConstraint?.update(inset: self.cardViewHorizontalInset)
        }
    }
    public var cardViewMinimumHeight = 40.0
    
    // # Private/Fileprivate
    private var cardViewLeadingConstraint:Constraint?
    private var cardViewTrailingConstraint:Constraint?
    private var cardViewTopConstraint:Constraint?
    private var cardViewBottomConstraint:Constraint?
    
    open override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                cardView.setViewState(.highlighted, animated: true, completion: nil)
            }else{
                cardView.setViewState(.visible, animated: true, completion: nil)
            }
        }
    }
    // # Private/Fileprivate
    
    
    //=======================================
    // MARK: Inherited Methods
    //=======================================
    //------------------------------------
    // MARK: UICollectionViewCell
    //------------------------------------
    open override func prepareForReuse() {
        super.prepareForReuse()
        cardView.setBackgroundColour(theme.colours.cardVisibleBackground, forState: .visible)
        cardView.setBackgroundColour(theme.colours.cardHighlighedBackground, forState: .highlighted)
        cardView.setBorderColour(theme.colours.cardVisibleBorder, forState: .visible)
        cardView.setBorderColour(theme.colours.cardHighlighedBorder, forState: .highlighted)
    }
    
    //------------------------------------
    // MARK: KFXBaseCollectionViewCell
    //------------------------------------
    open override func configureUI(){
        super.configureUI()
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
    open override func configureSubviewsLayout(){
        super.configureSubviewsLayout()
        contentView.insertSubview(cardView, at: 0)
        cardView.snp.makeConstraints { (make) in
            self.cardViewTopConstraint = make.top.equalToSuperview().inset(cardViewVerticalInset).constraint
            self.cardViewBottomConstraint = make.bottom.equalToSuperview().inset(cardViewVerticalInset).constraint
            self.cardViewLeadingConstraint = make.leading.equalToSuperview().inset(cardViewHorizontalInset).constraint
            self.cardViewTrailingConstraint = make.trailing.equalToSuperview().inset(cardViewHorizontalInset).constraint

            make.height.greaterThanOrEqualTo(cardViewMinimumHeight)
        }
    }
}
