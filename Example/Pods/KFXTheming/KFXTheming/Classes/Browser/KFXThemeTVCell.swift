

import UIKit
import SnapKit
import KFXAdditions

public class KFXThemeTVCell: UITableViewCell {
    
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    open lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        label.textColor = UIColor.darkText
        return label
    }()
    public lazy var cardView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    public lazy var titleView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(white: 0.95, alpha: 0.8)
        return view
    }()
    open var useReadableWidth = true
    
    // # Private/Fileprivate
    private lazy var paletteStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        //        stackView.spacing = 3.0
        return stackView
    }()
    private lazy var textStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = 10.0
        return stackView
    }()
    private lazy var iconsStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10.0
        return stackView
    }()
    private lazy var buttonsStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10.0
        return stackView
    }()
    
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    
    //------------------------------------
    // MARK: Actions
    //------------------------------------
    public func addColourPalette(colour:UIColor, borderColour:UIColor, title:String?) {
        
        let view = UIView()
        view.backgroundColor = colour
        paletteStackView.addArrangedSubview(view)
        view.snp.makeConstraints { (make) in
            make.width.equalTo(50.0)
            make.height.equalTo(50.0)
        }
        view.kfx_addBorder(withRadius: 25.0, width: 2.0, colour: borderColour)
        
    }
    
    public func addTextStyle(title:String, font:UIFont, colour:UIColor) {
        
        let label = UILabel()
        label.text = title
        label.font = font
        label.textColor = colour
        textStackView.addArrangedSubview(label)
        textStackView.sizeToFit()
    }
    
    public func addIconImage(_ image:UIImage) {
        
        let imageView = UIImageView(image: image)
        iconsStackView.addArrangedSubview(imageView)
    }
    
    public func addButton(_ button:UIButton) {
        
        buttonsStackView.addArrangedSubview(button)
    }
    
    public func addBarButtonItem(_ item:UIBarButtonItem) {
        
    }
    
    public func updateUIForTheme(isCurrentTheme:Bool, thisCellsTheme:KFXTheme?) {
        
        if isCurrentTheme,
            let thisCellsTheme = thisCellsTheme {
            cardView.kfx_addBorder(withRadius: 5.0, width: 3.0, colour: thisCellsTheme.colours.branding)
        }else{
            cardView.kfx_addBorder(withRadius: 5.0, width: 1.0, colour: UIColor.init(white: 0.4, alpha: 0.4))
        }
        cardView.kfx_setShadow(withOffset: CGSize(width: 2.0, height: 2.0), radius: 2.0, opacity: 0.7)
    }
    
    //=======================================
    // MARK: Inherited Methods
    //=======================================
    override public func prepareForReuse() {
        super.prepareForReuse()
        
        removeArrangedSubviewsInStackView(textStackView)
        removeArrangedSubviewsInStackView(paletteStackView)
        removeArrangedSubviewsInStackView(iconsStackView)
        removeArrangedSubviewsInStackView(buttonsStackView)
        cardView.kfx_addBorder(withRadius: 5.0, width: 1.0, colour: UIColor.init(white: 0.4, alpha: 0.4))
        cardView.kfx_setShadow(withOffset: CGSize(width: 2.0, height: 2.0), radius: 2.0, opacity: 0.7)
        
    }
    
    
    override public func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        configureUI()
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        titleView.kfx_addRoundedCorners([.topLeft,.topRight], radius: 5.0)
    }
    
    //=======================================
    // MARK: Private Methods
    //=======================================
    //------------------------------------
    // MARK: Configure
    //------------------------------------
    private func configureUI(){
//        print("configureUI()")
        configureSubviewsLayout()
        //        titleView.kfx_addBorder(withRadius: 5.0, width: 1.0, colour: .clear)
        
        cardView.kfx_addBorder(withRadius: 5.0, width: 1.0, colour: UIColor.init(white: 0.4, alpha: 0.4))
        cardView.kfx_setShadow(withOffset: CGSize(width: 2.0, height: 2.0), radius: 2.0, opacity: 0.7)
        
    }
    
    private func configureSubviewsLayout() {
        
        contentView.addSubview(cardView)
        cardView.addSubview(titleView)
        cardView.addSubview(textStackView)
        cardView.addSubview(iconsStackView)
        cardView.addSubview(buttonsStackView)
        titleView.addSubview(titleLabel)
        titleView.addSubview(paletteStackView)
        
        cardView.snp.makeConstraints { (make) in
            if useReadableWidth {
                make.leading.equalTo(contentView.readableContentGuide.snp.leading)//.offset(2.0)
                make.trailing.equalTo(contentView.readableContentGuide.snp.trailing)//.offset(-2.0)
            } else {
                make.leading.equalToSuperview().offset(6.0)
                make.trailing.equalToSuperview().offset(-6.0)
            }
            make.top.equalToSuperview().offset(12.0)
            make.bottom.equalToSuperview().offset(-12.0)
            make.height.greaterThanOrEqualTo(100.0)
        }
        titleView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(0)
            make.height.equalTo(100.0)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(15.0)
            make.trailing.equalToSuperview().offset(-15.0)
            make.top.equalToSuperview()
        }
        textStackView.snp.makeConstraints { (make) in
            make.top.equalTo(titleView.snp.bottom).offset(20.0)
            make.leading.equalTo(titleView).offset(20.0)
            make.bottom.lessThanOrEqualToSuperview().offset(-20.0)
            make.width.equalToSuperview().multipliedBy(0.5).priority(.low)
        }
        iconsStackView.snp.makeConstraints { (make) in
            make.leading.greaterThanOrEqualTo(textStackView.snp.trailing).offset(10.0)
            make.top.equalTo(textStackView)
            make.bottom.lessThanOrEqualToSuperview().offset(-20.0)
        }
        buttonsStackView.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-20.0)
            make.bottom.lessThanOrEqualToSuperview().offset(-20.0)
            make.leading.equalTo(iconsStackView.snp.trailing).offset(10.0)
            make.top.equalTo(textStackView)
        }
        paletteStackView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(10.0)
            make.trailing.equalToSuperview().offset(-10.0)
            make.bottom.equalToSuperview().offset(-10.0)
            make.top.equalTo(titleLabel.snp.bottom)
            make.height.equalTo(50.0)
        }
        
    }
    
    //------------------------------------
    // MARK: Helpers
    //------------------------------------
    private func removeArrangedSubviewsInStackView(_ stackView:UIStackView) {
        
        for subview in stackView.arrangedSubviews.reversed() {
            
            stackView.removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
    }
    
}

//=======================================
// MARK: Protocol Methods
//=======================================

