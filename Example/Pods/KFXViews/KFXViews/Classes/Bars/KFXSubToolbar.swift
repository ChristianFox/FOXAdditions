
import UIKit

public class KFXSubToolbar: KFXToolbar {

    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    
    // # Private/Fileprivate
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: SubToolbar
    //------------------------------------
    public func addToToolbar(_ mainToolbar:KFXToolbar, fromButton:KFXButton) {
        
        alpha = 0.0
        
        postConfigureUICallback = { (baseView) in
            self.backgroundColor = self.theme.colours.background
        }
        kfx_addBorder(withRadius: 5.0, width: 1.0, colour: theme.colours.branding)
        showBackgroundImage = false
        showBackgroundImageEffects = true
        showBackgroundImageOverlay = false
        mainToolbar.addSubview(self)
        self.snp.makeConstraints { (make) in
//            make.top.greaterThanOrEqualToSuperview().offset(3.0).priority(.low)
            make.top.greaterThanOrEqualTo(self.safeAreaLayoutGuide.snp.top).offset(3.0).priority(.required)
//            make.bottom.lessThanOrEqualToSuperview().offset(-3.0).priority(.low)
            make.bottom.lessThanOrEqualTo(self.safeAreaLayoutGuide.snp.bottom).offset(-3.0).priority(.required)
            make.height.equalToSuperview().offset(-6.0)
            make.leading.greaterThanOrEqualToSuperview().offset(16.0)
            make.trailing.lessThanOrEqualToSuperview().offset(-16.0)
        }
        
        _ = addButtons(titles: [" X "], identifiers: ["closeButton"]) { (button, toolbar) in
            
            self.removeFromToolbar(toolbar, fromButton: button)
        }

        UIView.animate(withDuration: 0.3) {
            self.alpha = 1.0
        }
    }
    
    public func removeFromToolbar(_ mainToolbar:KFXToolbar, fromButton:KFXButton) {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0.0
        }, completion: { (finished) in
            self.removeFromSuperview()
        })
    }

    
    //=======================================
    // MARK: Inherited Methods
    //=======================================
    //------------------------------------
    // MARK: Configure
    //------------------------------------
    public override func configureUI(){
        super.configureUI()
    }
    
    public override func configureSubviewsLayout(){
        super.configureSubviewsLayout()
    }
    
    
    //=======================================
    // MARK: Private Methods
    //=======================================
    

}
