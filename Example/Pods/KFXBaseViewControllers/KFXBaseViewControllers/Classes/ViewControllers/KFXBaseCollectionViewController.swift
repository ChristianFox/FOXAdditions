
import UIKit
import SnapKit
import KFXBaseCells
import NVActivityIndicatorView

public protocol KFXConfiguresBaseCVC : KFXConfiguresBaseVC {
    
    var scrollDirection:UICollectionView.ScrollDirection { get }
    var reloadFlash:KFXReloadFlash { get }
}

public class KFXBaseCVCConfiguration: KFXConfiguresBaseCVC, KFXConfiguresBaseVC {
    
    public var scrollDirection:UICollectionView.ScrollDirection = .vertical
    public var reloadFlash:KFXReloadFlash = KFXReloadFlash()
    public var activityIndicatorType:NVActivityIndicatorType = .orbit
    public var backgroundImage:UIImage?
    public var backgroundColourAlpha:CGFloat = 1.0
    public var showBackgroundImage = false
    public var showBackgroundImageOverlay = false
    public var showBackgroundImageEffects = false
    public var hideBackgroundImageIfReduceTransparencyEnabled = true
    public var backgroundImageOverlayAlpha:CGFloat = 0.5
    
    public init() { }
}

open class KFXBaseCollectionViewController: KFXBaseViewController {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    open lazy var reloadFlash:KFXReloadFlash = {  // config: make private let
        return KFXReloadFlash()
    }()
    open var scrollDirection:UICollectionView.ScrollDirection = .vertical {  // config: make private let?
        didSet {
            if let layout = layout as? UICollectionViewFlowLayout {
                layout.scrollDirection = scrollDirection
                collectionView.reloadData()
            }
        }
    }
    
    open lazy var collectionView:UICollectionView = {
        
        if let layout = layout as? UICollectionViewFlowLayout {
            layout.scrollDirection = scrollDirection
        }
        let cv = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    open var layout:UICollectionViewLayout = UICollectionViewFlowLayout()  // config: make private let

    // # Private/Fileprivate
    private var firstAppearance:Bool = false
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    public init(configuration:KFXConfiguresBaseCVC? = nil) {
        super.init(configuration: configuration)
        self.configureWithConfiguration(configuration: configuration)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureWithConfiguration(configuration: nil)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.configureWithConfiguration(configuration: nil)
    }

    private func configureWithConfiguration(configuration:KFXConfiguresBaseCVC? = nil) {
        
        func configure(_ configuration:KFXConfiguresBaseCVC) {

            self.reloadFlash = configuration.reloadFlash
        }
        
        if let configuration = configuration {
            configure(configuration)
        } else {
            configure(KFXBaseCVCConfiguration())
        }
    }


    //------------------------------------
    // MARK: View Lifecycle
    //------------------------------------
    open override func viewDidLoad() {
        super.viewDidLoad()
        firstAppearance = true
        configureCollectionView()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if reloadFlash.enabledForViewDidAppear {
            flashCellsWhenVisible()
        }else if reloadFlash.enabledForViewDidLoad
            && firstAppearance {
            flashCellsWhenVisible()
            firstAppearance = false
        }
    }
    
    //------------------------------------
    // MARK: Configure
    //------------------------------------
    open override func configureUI(){
        super.configureUI()
    }
    
    open override func configureSubviewsLayout(){
        super.configureSubviewsLayout()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints({ (make) in
            make.edges.equalTo(view)
        })
    }
    
    open func configureCollectionView(){
        collectionView.backgroundColor = .clear
    }
    
    //------------------------------------
    // MARK: Update
    //------------------------------------
    open override func updateUIAfterThemeChange() {
        super.updateUIAfterThemeChange()
//        collectionView.backgroundColor = theme.colours.background
        collectionView.reloadData()
        if self.reloadFlash.enabledForReloadData {
            self.flashVisibleCells()
        }
    }

    //------------------------------------
    // MARK: Reloading
    //------------------------------------
    open func reloadData(){
        
        self.collectionView.reloadData()
        if self.reloadFlash.enabledForReloadData {
            self.flashVisibleCells()
        }
    }

    
    //------------------------------------
    // MARK: Flashing
    //------------------------------------
    private func flashCellsWhenVisible() {
        
        if reloadFlash.disabled {
            return
        }

        if collectionView.visibleCells.count >= 1 {
            
            flashVisibleCells()
            
        }else{
            
            let deadline = DispatchTime.now() + .milliseconds(reloadFlash.waitDurationIfNeeded)
            DispatchQueue.main.asyncAfter(deadline: deadline) {
                self.flashVisibleCells()
            }
        }
    }
    
    private func flashVisibleCells() {
        
        if reloadFlash.disabled {
            return
        }

        var milliseconds = reloadFlash.betweenDurationInitial
        for visCell in collectionView.visibleCells {
            
            if let cell = visCell as? KFXBaseCardedCollectionViewCell {
                
                var deadline = DispatchTime.now() + .milliseconds(milliseconds)
                DispatchQueue.main.asyncAfter(deadline: deadline) {
                    cell.cardView.flashWithViewState(.highlighted, duration: self.reloadFlash.animationDuration, completion: nil)
                }
                milliseconds += reloadFlash.betweenDurationIncrease
                deadline = DispatchTime.now() + .milliseconds(milliseconds)
            }
        }
    }
}

//=======================================
// MARK: Protocol Methods
//=======================================
//------------------------------------
// MARK: UICollectionViewDataSource
//------------------------------------
extension KFXBaseCollectionViewController : UICollectionViewDataSource {
    
    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

//------------------------------------
// MARK: UICollectionViewDelegateFlowLayout
//------------------------------------
extension KFXBaseCollectionViewController : UICollectionViewDelegateFlowLayout {
    
}


//------------------------------------
// MARK: UICollectionViewDelegate
//------------------------------------
extension KFXBaseCollectionViewController : UICollectionViewDelegate {
    
}

