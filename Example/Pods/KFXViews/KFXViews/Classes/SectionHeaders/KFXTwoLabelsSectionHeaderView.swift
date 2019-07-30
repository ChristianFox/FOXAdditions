

import KFXBaseViews

open class KFXTwoLabelsSectionHeaderView : KFXBaseView {

    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    public var labelsLeading:CGFloat = 0.0
    public var labelsTrailing:CGFloat = 0.0
    public lazy var labels:KFXTwoLabelsView = {
        let labels = KFXTwoLabelsView(withLayout: .leftTitleRightDetail, textType: .sectionHeader)
        addSubview(labels)
        return labels
    }()
    public lazy var topSeparatorView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    public lazy var bottomSeparatorView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    open var useReadableWidth = true

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
    
    //=======================================
    // MARK: Inherited Methods
    //=======================================
    //------------------------------------
    // MARK: Configure
    //------------------------------------
//    open override func configureUI(){
//        super.configureUI()
//    }
    
    open override func configureSubviewsLayout(){
        super.configureSubviewsLayout()
        addSubview(labels)
        addSubview(topSeparatorView)
        addSubview(bottomSeparatorView)
        labels.snp.makeConstraints({ (make) in
            if useReadableWidth {
                make.leading.equalTo(self.readableContentGuide.snp.leading).offset(labelsLeading)
                make.trailing.equalTo(self.readableContentGuide.snp.trailing).offset(labelsTrailing)
            } else {
                make.leading.equalToSuperview().offset(labelsLeading)
                make.trailing.equalToSuperview().offset(labelsTrailing)
            }
            make.top.equalToSuperview().offset(1)
            make.bottom.equalToSuperview().offset(-1)
        })
        topSeparatorView.snp.makeConstraints { (make) in
            if useReadableWidth {
                make.leading.equalTo(self.readableContentGuide.snp.leading).offset(labelsLeading)
                make.trailing.equalTo(self.readableContentGuide.snp.trailing).offset(labelsTrailing)
            } else {
                make.leading.equalToSuperview().offset(labelsLeading)
                make.trailing.equalToSuperview().offset(labelsTrailing)
            }
            make.top.equalTo(self).offset(0.5)
            make.height.equalTo(0.5)
        }
        bottomSeparatorView.snp.makeConstraints { (make) in
            if useReadableWidth {
                make.leading.equalTo(self.readableContentGuide.snp.leading).offset(labelsLeading)
                make.trailing.equalTo(self.readableContentGuide.snp.trailing).offset(labelsTrailing)
            } else {
                make.leading.equalToSuperview().offset(labelsLeading)
                make.trailing.equalToSuperview().offset(labelsTrailing)
            }
            make.bottom.equalTo(self).offset(-0.5)
            make.height.equalTo(0.5)
        }
    }
    
    open override func updateUIAfterThemeChange() {
        super.updateUIAfterThemeChange()
    }
}
