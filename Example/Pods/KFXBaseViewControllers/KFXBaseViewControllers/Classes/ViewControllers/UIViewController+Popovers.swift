

import UIKit
import KFXTextEditorVC
import MZFormSheetPresentationController

public extension UIViewController {
    
    //------------------------------------
    // MARK: Presenting Popovers
    //------------------------------------
    func presentTextEditor(withText initialText:String? = nil, placeholderText:String? = nil, contentViewSize:CGSize? = nil, callback:@escaping (_ editedText:String?, _ didAccept:Bool) -> Void) {
        
        let textEditorVC = KFXTextEditorVC()
        textEditorVC.editingDidFinishCallback = { (editedText, didAccept) in
            
            self.dismiss(animated: true, completion: nil)
            callback(editedText, didAccept)
        }
        textEditorVC.text = initialText
        if let placeholderText = placeholderText {
            textEditorVC.placeholderText = placeholderText
        }
        let deviceSize = UIScreen.main.bounds.size
        let contentViewSize = CGSize.init(width: deviceSize.width - 60.0, height: deviceSize.height * 0.4)
        presentViewControllerInPopover(textEditorVC, contentViewSize: contentViewSize)
    }
    
    func presentViewInPopover(_ view:UIView, contentViewSize:CGSize? = nil, transitionStyle:MZFormSheetPresentationTransitionStyle = .slideAndBounceFromBottom, shouldCenterVertically:Bool = false, shouldCenterHorizontally:Bool = true, shouldUseMotionEffect:Bool = true) {
        
        let viewController = UIViewController()
        viewController.view.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        presentViewControllerInPopover(viewController, contentViewSize: contentViewSize, transitionStyle: transitionStyle, shouldCenterVertically: shouldCenterVertically, shouldCenterHorizontally: shouldCenterHorizontally, shouldUseMotionEffect: shouldUseMotionEffect)
    }
    
    func presentViewControllerInPopover(_ viewController:UIViewController, contentViewSize:CGSize? = nil, transitionStyle:MZFormSheetPresentationTransitionStyle = .slideAndBounceFromBottom, shouldCenterVertically:Bool = false, shouldCenterHorizontally:Bool = true, shouldUseMotionEffect:Bool = true) {
        
        let formVC = MZFormSheetPresentationViewController(contentViewController: viewController)
        formVC.contentViewControllerTransitionStyle = transitionStyle
        if let contentViewSize = contentViewSize {
            formVC.presentationController?.contentViewSize = contentViewSize
        } else {
            let deviceSize = UIScreen.main.bounds.size
            formVC.presentationController?.contentViewSize = CGSize.init(width: deviceSize.width - 60.0, height: deviceSize.height * 0.7)
        }
        formVC.allowDismissByPanningPresentedView = true;
        formVC.presentationController?.shouldUseMotionEffect = shouldUseMotionEffect;
        formVC.presentationController?.shouldCenterVertically = shouldCenterVertically;
        formVC.presentationController?.shouldCenterHorizontally = shouldCenterHorizontally;
        present(formVC, animated: true, completion: nil)
    }

}
