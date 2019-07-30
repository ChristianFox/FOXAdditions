
import Foundation

public extension KFXToolbar {
    
    
    //------------------------------------
    // MARK: Add Buttons
    //------------------------------------
    func addButtons(images:[UIImage], identifiers:[String], callback:@escaping KFXToolbarButtonTapCallback) -> [KFXButton] {
        
        buttonTapCallback = callback
        
        var buttons = [KFXButton]()
        var index = 0
        for image in images {
            
            let identifier = identifiers[index]
            let aButton = addButton(title: nil, image: image, tag: nil, identifier: identifier, target: self, selector: #selector(buttonTapped(_:)))
            buttons.append(aButton)
            
            index += 1
        }
        return buttons
    }
    
    func addButtons(titles:[String], identifiers:[String], callback:@escaping KFXToolbarButtonTapCallback) -> [KFXButton] {
        
        buttonTapCallback = callback
        
        var buttons = [KFXButton]()
        var index = 0
        for title in titles {
            
            let identifier = identifiers[index]
            let aButton = addButton(title: title, image: nil, tag: nil, identifier: identifier, target: self, selector: #selector(buttonTapped(_:)))
            buttons.append(aButton)
            
            index += 1
        }
        return buttons
    }
    
    
    func addButtons(images:[UIImage], identifiers:[String], target:Any, action:Selector) -> [KFXButton] {
        
        var buttons = [KFXButton]()
        var index = 0
        for image in images {
            
            let identifier = identifiers[index]
            let aButton = addButton(target: target, selector: action, buttonStyle: .system, title: nil, image: image, tag: nil, identifier: identifier)
            buttons.append(aButton)
            
            index += 1
        }
        return buttons
    }
    
    func addButtons(titles:[String], identifiers:[String], target:Any, action:Selector) -> [KFXButton] {
        
        var buttons = [KFXButton]()
        var index = 0
        for title in titles {
            
            let identifier = identifiers[index]
            let aButton = addButton(target: target, selector: action, buttonStyle: .system, title: title, image: nil, tag: nil, identifier: identifier)
            buttons.append(aButton)
            
            index += 1
        }
        return buttons
    }
    
    //------------------------------------
    // MARK: Add Button
    //------------------------------------
    func addButton(target:Any, selector:Selector, buttonStyle:KFXButtonStyle = .system, title:String? = nil, image:UIImage? = nil,  tag:Int? = nil, identifier:String? = nil) -> KFXButton {
        
        let button = KFXButton(buttonStyle: buttonStyle, title: title, image: image)
        button.identifier = identifier
        button.contentMode = .scaleAspectFit
        button.imageView?.contentMode = .scaleAspectFit
        button.tag = tag ?? 0
        button.addTarget(target, action: selector, for: .touchUpInside)
        addView(button)
        return button
    }
    
    func addButton(title:String? = nil, image:UIImage? = nil,  tag:Int? = nil, identifier:String? = nil, buttonStyle:KFXButtonStyle = .system, target:Any? = nil, selector:Selector? = nil) -> KFXButton {
        
        let button = KFXButton(buttonStyle: buttonStyle, title: title, image: image)
        button.identifier = identifier
        button.contentMode = .scaleAspectFit
        button.imageView?.contentMode = .scaleAspectFit
        button.tag = tag ?? 0
        if let selector = selector, let target = target {
            button.addTarget(target, action: selector, for: .touchUpInside)
        }
        addView(button)
        return button
    }

    //------------------------------------
    // MARK: Get Buttons
    //------------------------------------
    func buttons(withIdentifier identifier:String) -> [KFXButton]? {
        
        let buttons = stackView.arrangedSubviews.filter { (subview) -> Bool in
            
            guard let button = subview as? KFXButton else {
                return false
            }
            return button.identifier == identifier
        }
        return buttons as? [KFXButton]
    }
    
    func buttons(withTag tag:Int) -> [KFXButton]? {
        
        let buttons = stackView.arrangedSubviews.filter { (subview) -> Bool in
            
            guard let button = subview as? KFXButton else {
                return false
            }
            return button.tag == tag
        }
        return buttons as? [KFXButton]
    }
    

    
    //=======================================
    // MARK: Private Methods
    //=======================================
    //------------------------------------
    // MARK: Private Actions
    //------------------------------------
    @objc func buttonTapped(_ sender:KFXButton) {
        
        buttonTapCallback?(sender, self)
    }

}
