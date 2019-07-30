

import UIKit
import KFXTheming
import KFXViews
import SnapKit

public protocol KFXTextEditorVCDelegate : class {
    
    func textEditor(_ textEditor:KFXTextEditorVC, didSaveText text:String)
    func textEditorDidCancel(_ textEditor:KFXTextEditorVC)
}

final public class KFXTextEditorVC: UIViewController {
    
    // # Public/Internal/Open
    public var theme:KFXTheme {
        return KFXTheming.shared.currentTheme
    }
    
    public weak var delegate:KFXTextEditorVCDelegate?
    public var text:String? {
        didSet {
            if let text = text,
                text.count >= 1 {
                textView.text = text
            }
        }
    }
    public var placeholderText = "Write here..."
    public var allowSavingEmptyText = false
    public lazy var saveButton:KFXCardedButton = {
        let button = KFXCardedButton(buttonStyle: .system)
        button.setTitle("Save", for: .normal)
        button.cardView.setViewState(.visible, completion: nil)
        button.addTarget(self, action: #selector(saveButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    public lazy var cancelButton:KFXCardedButton = {
        let button = KFXCardedButton(buttonStyle: .system)
        button.setTitle("Cancel", for: .normal)
        button.cardView.setViewState(.visible, completion: nil)
        button.addTarget(self, action: #selector(cancelButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    public var editingDidFinishCallback:((_ editedText:String?, _ didAccept:Bool) -> Void)?

    // # Private/Fileprivate
    private lazy var textView:UITextView = {
        let textView = UITextView()
        textView.backgroundColor = theme.colours.textInputBackground
        textView.textColor = theme.colours.contentText
        textView.font = theme.fonts.content
        textView.text = placeholderText
        textView.delegate = self
        return textView;
    }()
    
    private lazy var backgroundView:UIView = {
        let bgView = UIView()
        bgView.backgroundColor = theme.colours.background
//        bgView.backgroundColor = .red
        return bgView
    }()
    
    //------------------------------------
    // MARK: Initiliser
    //------------------------------------
    public init(placeholder:String? = nil, text:String? = nil) {
        if let placeholder = placeholder {
            self.placeholderText = placeholder
        }
        if let text = text {
            self.text = text
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //------------------------------------
    // MARK: View Lifecycles
    //------------------------------------
    override public func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureSubviewsLayout()
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        textView.becomeFirstResponder()
    }
    
    //------------------------------------
    // MARK: Actions
    //------------------------------------
    @IBAction func saveButtonTapped(_ sender:Any){
        
        if !allowSavingEmptyText &&
            (textView.text == placeholderText || textView.text.count == 0) {
            
            kfx_showSimpleAlert(withTitle: "Huh?", message: "You haven't added any text, it would be kray-kray to save it", buttonTitle: "Doh!")
            return
        }
        
        if let callback = editingDidFinishCallback {
            callback(textView.text, true)
        } else {
            delegate?.textEditor(self, didSaveText: textView.text)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender:Any){
        
        if let callback = editingDidFinishCallback {
            callback(nil, false)
        } else {
            delegate?.textEditorDidCancel(self)
        }
    }
    
    
    //------------------------------------
    // MARK: Configure UI
    //------------------------------------
    private func configureUI(){
        
        view.backgroundColor = .clear
        backgroundView.kfx_addBorder(withRadius: 5.0, width: 1.0, colour: .clear)
        backgroundView.kfx_setShadow(withOffset: CGSize.init(width: 2.0, height: 2.0), radius: 2.0, opacity: 0.75)
        textView.kfx_addBorder(withRadius: 3.0, width: 1.0, colour: .clear)
        textView.contentInset = UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
        
    }
    
    private func configureSubviewsLayout() {
        
        view.addSubview(backgroundView)
        backgroundView.addSubview(textView)
        backgroundView.addSubview(saveButton)
        backgroundView.addSubview(cancelButton)

        backgroundView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view).inset(4.0)
//            make.top.leading.trailing.equalToSuperview()
//            make.bottom.equalTo(textView.snp.top)
        }
        textView.snp.makeConstraints { (make) in
//            make.top.equalToSuperview().offset(42.0)
            make.leading.equalToSuperview().offset(8.0)
            make.bottom.trailing.equalToSuperview().offset(-8.0)
        }
        cancelButton.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview().offset(8.0)
            make.bottom.equalTo(textView.snp.top).offset(-8.0)
            make.width.equalTo(80.0)
            make.height.equalTo(36.0)
        }
        saveButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8.0)
            make.trailing.equalToSuperview().offset(-8.0)
            make.bottom.equalTo(cancelButton)
            make.width.height.equalTo(cancelButton)
        }

    }
    
}

extension KFXTextEditorVC : UITextViewDelegate {
    
    public func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView.text == placeholderText {
            textView.text = nil
        }
    }
    
    public func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        
        if textView.text == placeholderText {
            textView.text = nil
        }
        return true
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.count == 0 {
            textView.text = placeholderText
        }
    }
}
