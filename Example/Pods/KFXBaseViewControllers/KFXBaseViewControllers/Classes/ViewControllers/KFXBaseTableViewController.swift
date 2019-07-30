
import UIKit
import SnapKit
import KFXBaseCells
import NVActivityIndicatorView

public protocol KFXConfiguresBaseTVC : KFXConfiguresBaseVC {
    
    var tableViewStyle:UITableView.Style { get }
    var reloadFlash:KFXReloadFlash { get }
}

public class KFXBaseTVCConfiguration: KFXConfiguresBaseTVC, KFXConfiguresBaseVC {
    
    public var tableViewStyle:UITableView.Style = .plain
    public var reloadFlash:KFXReloadFlash = KFXReloadFlash()
    public var baseVCConfiguration = KFXBaseVCConfiguration()
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


open class KFXBaseTableViewController: KFXBaseViewController {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    open var reloadFlash:KFXReloadFlash = KFXReloadFlash() // config: make private let
    open var tableViewStyle:UITableView.Style = .plain // config: make private let
    public var tableView:UITableView {
        return _tableView
    }
    
    // # Private/Fileprivate
    private var firstAppearance:Bool = false
    private lazy var _tableView:UITableView = {
        let tv = UITableView(frame: .zero, style: tableViewStyle)
        tv.dataSource = self
        tv.delegate = self
        return tv
    }()

    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    public init(configuration:KFXConfiguresBaseTVC? = nil) {
        super.init(configuration: configuration)
        self.configureWithConfiguration(configuration: configuration)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.configureWithConfiguration(configuration: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureWithConfiguration(configuration: nil)
    }
    
    private func configureWithConfiguration(configuration:KFXConfiguresBaseTVC? = nil) {
        
        func configure(_ configuration:KFXConfiguresBaseTVC) {
            self.tableViewStyle = configuration.tableViewStyle
            self.reloadFlash = configuration.reloadFlash
        }
        
        if let configuration = configuration {
            configure(configuration)
        } else {
            configure(KFXBaseTVCConfiguration())
        }

    }

    //------------------------------------
    // MARK: View Lifecycle
    //------------------------------------
    open override func viewDidLoad() {
        super.viewDidLoad()
        firstAppearance = true
        configureTableView()
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
        view.addSubview(tableView)
        tableView.snp.makeConstraints({ (make) in
            make.edges.equalTo(view)
        })
    }
    
    open func configureTableView(){
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 70.0
        
    }
    
    //------------------------------------
    // MARK: Update
    //------------------------------------
    open override func updateUIAfterThemeChange() {
        super.updateUIAfterThemeChange()
//        tableView.backgroundColor = theme.colours.background
        tableView.reloadData()
        if reloadFlash.enabledForReloadData {
            flashVisibleCells()
        }
    }

    //------------------------------------
    // MARK: Reloading
    //------------------------------------
    open func reloadData(){
        
        self.tableView.reloadData()
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
        
        if tableView.visibleCells.count >= 1 {
            
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
        for visCell in tableView.visibleCells {
            
            if let cell = visCell as? KFXBaseCardedTableViewCell {
                
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
// MARK: UITableViewDataSource
//------------------------------------
extension KFXBaseTableViewController : UITableViewDataSource {
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

//------------------------------------
// MARK: UITableViewDelegate
//------------------------------------
extension KFXBaseTableViewController : UITableViewDelegate {
    
}
