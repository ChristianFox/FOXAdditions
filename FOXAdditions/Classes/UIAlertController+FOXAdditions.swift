
import UIKit

public extension UIAlertController {
    
    /*!
     * Create an UIAlertController with the given title and message and a single button "OK"
     */
    convenience init(simpleAlert title:String?, message:String?) {
        
        self.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        self.addAction(UIAlertAction.init(title: NSLocalizedString("OK", comment: "Okay"), style: UIAlertAction.Style.default, handler: nil))
    }
    
    /*!
     * Create an UIAlertController with the given message, the title 'Error' and a single button "OK"
     */
    convenience init(errorAlert message:String?) {
        
        self.init(simpleAlert: NSLocalizedString("Error", comment: "Error"), message: message)
    }
    
    /*!
     * Create an UIAlertController with the given title and message and a single button "OK"
     */
    convenience init(yesNoAlert title:String?, message:String?, yesBlock:@escaping() -> Void, noBlock:@escaping() -> Void) {
        
        self.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        self.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            yesBlock()
        }))
        self.addAction(UIAlertAction(title: "No", style: .default, handler: { (action) in
            noBlock()
        }))
//        self.addAction(UIAlertAction(title:"Cancel" , style: .cancel, handler: nil))
    }

    convenience init(textFieldAlertWithTitle title:String?,message:String?,placeholder:String?,text:String?,completion:@escaping (Bool,String?) -> Void){
        
        self.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        self.addTextField { (textField) in
            textField.placeholder = placeholder
            textField.text = text
        }
        self.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { (action) in
            completion(false,nil)
        }))
        self.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            completion(true,self.textFields?.first?.text)
        }))
    }
    
}
