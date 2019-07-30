
import UIKit

open class KFXBarflyNavigationBar: UINavigationBar {

    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    
    // # Private/Fileprivate
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    
    //------------------------------------
    // MARK: Get Frames
    //------------------------------------
    public func frameForItem(withIdentifier identifier:String, inView:UIView, viewUnderlapsBar:Bool) -> CGRect? {
        
        if let items = items?.last?.leftBarButtonItems as? [KFXBarflyItem] {
            
            let matching = items.filter{$0.button.identifier == identifier}
            if matching.count >= 1 {
                if let button = matching.first?.button {
                    return frameForButton(button, inView: inView, viewUnderlapsBar: viewUnderlapsBar)
                }
            }
        }
        if let items = items?.last?.rightBarButtonItems as? [KFXBarflyItem] {
            
            let matching = items.filter{$0.button.identifier == identifier}
            if matching.count >= 1 {
                if let button = matching.first?.button {
                    return frameForButton(button, inView: inView, viewUnderlapsBar: viewUnderlapsBar)
                }
            }
        }
        return nil
    }
    
    public func frameForButton(_ button:KFXButton, inView:UIView, viewUnderlapsBar:Bool) -> CGRect? {
        
        let frameInBar = self.convert(button.frame, from: button)
        var frameInView = inView.convert(frameInBar, from: self)
        if !viewUnderlapsBar {
            frameInView.origin.y += self.bounds.size.height
        }
        return frameInView
    }
    
    //=======================================
    // MARK: Inherited Methods
    //=======================================
//    open override func willMove(toWindow newWindow: UIWindow?) {
//        super.willMove(toWindow: newWindow)
//    }


    //=======================================
    // MARK: Private Methods
    //=======================================
    //------------------------------------
    // MARK: Print Debugging
    //------------------------------------
//    public func printViewInfo() {
//        
//        print("test")
//        
//        if let items = items {
//            
//            for navigationItem in items {
//                
//                print("item: \(navigationItem.description)")
//                
//                printInfo(items: navigationItem.leftBarButtonItems!)
//                printInfo(items: navigationItem.rightBarButtonItems!)
//                
//            }
//        }
//    }
//    
//    public func printInfo(items:[UIBarButtonItem]) {
//        
//        for rightItem in items {
//            
//            if let buttonItem = rightItem as? KFXButtonBarButtonItem {
//                
//                print("identifier: \(buttonItem.button.identifier!); button.frame: \(buttonItem.button.frame)")
//                
//                let frameInBar = self.convert(buttonItem.button.frame, from: buttonItem.button)
//                print("frame in bar : \(frameInBar)")
//                
//                var aSuperview:UIView? = self.superview
//                while aSuperview?.superview != nil {
//                    
//                    aSuperview = aSuperview?.superview
//                }
//                
//                let frameInSuperview = aSuperview?.convert(frameInBar, from: self)
//                print("frameInSuperview: \(frameInSuperview)")
//                
////                flashViewForFrame(frameInBar)
//                
////                var adjustedSuperviewFrame = frameInSuperview
////                adjustedSuperviewFrame?.origin.y += 100
////                flashViewForFrame(adjustedSuperviewFrame!)
//            }
//        }
//    }
//    
//    func flashViewForFrame(_ frame:CGRect) {
//        
//        let view = UIView(frame: frame)
//        view.backgroundColor = UIColor.init(red: 0.4, green: 0.7, blue: 0.2, alpha: 0.4)
//        view.alpha = 0.0
//        addSubview(view)
//        
//        UIView.animate(withDuration: 0.7, animations: {
//            view.alpha = 0.7
//        }) { (finished) in
//            
//            UIView.animate(withDuration: 0.6, animations: {
//                view.alpha = 0.0
//            }, completion: { (finished) in
//                view.removeFromSuperview()
//            })
//        }
//
//    }

}
