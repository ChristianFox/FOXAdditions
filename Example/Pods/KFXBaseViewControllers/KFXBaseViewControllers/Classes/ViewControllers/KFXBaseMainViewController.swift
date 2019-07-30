
import UIKit

open class KFXBaseMainViewController: KFXBaseViewController {

    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    public lazy var mainContentContainerView:UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .clear
        return containerView
    }()

    // # Private/Fileprivate
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    
    //------------------------------------
    // MARK: Actions
    //------------------------------------
    
    //------------------------------------
    // MARK: View Lifecycle
    //------------------------------------
    
    //------------------------------------
    // MARK: Configure
    //------------------------------------
    override open func configureUI() {
        super.configureUI()
        configureChildVCs()
        
    }
    
    override open func configureSubviewsLayout(){
        super.configureSubviewsLayout()
        
        view.addSubview(mainContentContainerView)
        mainContentContainerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    open func configureChildVCs(){
        kfx_addChildViewController(contentViewController(), to: mainContentContainerView)
    }
    
    open func contentViewController() -> UIViewController? {
        fatalError("Subclases must override and provide a content VC")
    }

    
    //=======================================
    // MARK: Private Methods
    //=======================================
    
}

//=======================================
// MARK: Protocol Methods
//=======================================

