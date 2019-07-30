
import UIKit
import KFXAdditions
import FOXAdditions

public class KFXThemesTVC: UITableViewController {
    
    
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
    // MARK: Actions
    //------------------------------------
    
    //------------------------------------
    // MARK: View Lifecycle
    //------------------------------------
    override public func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    //=======================================
    // MARK: Private Methods
    //=======================================
    //------------------------------------
    // MARK: Configure
    //------------------------------------
    private func configureUI(){
        configureSubviewsLayout()
        configureTableView()
        updateAfterThemeChange()
    }
    
    private func configureSubviewsLayout() {
        
    }
    
    private func configureTableView() {
        
        tableView.estimatedRowHeight = 130.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(KFXThemeTVCell.self, forCellReuseIdentifier: "KFXThemeTVCell")
        tableView.separatorStyle = .none
    }
    
    private func updateAfterThemeChange() {
        view.backgroundColor = KFXTheming.shared.currentTheme.colours.background
        tableView.backgroundColor = KFXTheming.shared.currentTheme.colours.background
//        view.backgroundColor = UIColor.white
//        tableView.backgroundColor = UIColor.white
    }
    
    //=======================================
    // MARK: Protocol Methods
    //=======================================
    
    override public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return KFXTheming.shared.registeredThemes().count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "KFXThemeTVCell", for: indexPath) as? KFXThemeTVCell else {
            return UITableViewCell()
        }
        guard let thisTheme = KFXTheming.shared.theme(atIndex:indexPath.row) else{
            return UITableViewCell()
        }
        
        cell.titleLabel.text = thisTheme.name
        cell.titleLabel.textColor = thisTheme.colours.branding
        cell.updateUIForTheme(isCurrentTheme: KFXTheming.shared.isCurrentTheme(thisTheme), thisCellsTheme: thisTheme)
        
        // # BG
        cell.cardView.backgroundColor = thisTheme.colours.background.kfx_combine(withColour: thisTheme.colours.cardVisibleBackground, amount: 0.2)
//        cell.cardView.backgroundColor = thisTheme.colours.cardVisibleBackground
        //        let bg = KFXTheming.shared.currentTheme.colours.background
        cell.contentView.backgroundColor = .clear
        cell.backgroundColor = .clear
        cell.titleView.backgroundColor = thisTheme.colours.contentText
        
        // ## Palette
        for colour in thisTheme.colours.palette {
            cell.addColourPalette(colour: colour, borderColour:thisTheme.colours.branding , title: "")
        }
        
        // ## Text
        cell.addTextStyle(title: "Title", font: thisTheme.fonts.brandingTitle, colour: thisTheme.colours.branding)
        cell.addTextStyle(title: "Header Text", font: thisTheme.fonts.header, colour: thisTheme.colours.headerText)
        cell.addTextStyle(title: "SubHeader Text", font: thisTheme.fonts.subheader, colour: thisTheme.colours.subheaderText)
        cell.addTextStyle(title: "Title Text", font: thisTheme.fonts.title, colour: thisTheme.colours.titleText)
        cell.addTextStyle(title: "Content Text", font: thisTheme.fonts.content, colour: thisTheme.colours.contentText)
        cell.addTextStyle(title: "Info Text", font: thisTheme.fonts.infoTitle, colour: thisTheme.colours.infoTitleText)
        
        // ## Icons
        let resourceBundle = Bundle.fox_podResourceBundle(aClass: KFXThemesTVC.classForCoder(), resourcesName: "KFXTheming")
        if let icon1 = UIImage(named: appendScaleToImageName("Icon_More"), in: resourceBundle, compatibleWith: nil){
            let icon1Normal = icon1.kfx_tintedImageWthColor(thisTheme.colours.palette[2])
            cell.addIconImage(icon1Normal)
            let icon1Highlighted = icon1.kfx_tintedImageWthColor(thisTheme.colours.palette[3])
            cell.addIconImage(icon1Highlighted)
        }
        if let icon2 = UIImage(named: appendScaleToImageName("Icon-Store"), in: resourceBundle, compatibleWith: nil){
            let icon2Normal = icon2.kfx_tintedImageWthColor(thisTheme.colours.palette[2])
            cell.addIconImage(icon2Normal)
            let icon2Highlighted = icon2.kfx_tintedImageWthColor(thisTheme.colours.palette[3])
            cell.addIconImage(icon2Highlighted)
        }
        
        // ## Buttons
        let systemButton = UIButton()
        systemButton.setTitle("System Button", for: .normal)
        systemButton.setTitleColor(thisTheme.colours.systemButtonText, for: .normal)
        systemButton.titleLabel?.font = thisTheme.fonts.systemButton
        systemButton.backgroundColor = thisTheme.colours.systemButtonBackground
        systemButton.titleLabel?.adjustsFontSizeToFitWidth = true
        systemButton.titleLabel?.minimumScaleFactor = 0.6
        systemButton.kfx_addBorder(withRadius: 6.0, width: 1.0, colour: UIColor.clear)
        cell.addButton(systemButton)
        let userButton = UIButton()
        userButton.setTitle("User Button", for: .normal)
        userButton.setTitleColor(thisTheme.colours.userButtonText, for: .normal)
        userButton.titleLabel?.font = thisTheme.fonts.userButton
        userButton.backgroundColor = thisTheme.colours.userButtonBackground
        userButton.titleLabel?.adjustsFontSizeToFitWidth = true
        userButton.titleLabel?.minimumScaleFactor = 0.6
        userButton.kfx_addBorder(withRadius: 6.0, width: 1.0, colour: UIColor.clear)
        cell.addButton(userButton)
        
        cell.selectionStyle = .none
        return cell
    }
    
    func appendScaleToImageName(_ imageName:String) -> String {
        if UIScreen.main.scale == 3.0 {
            return imageName + "@3x"
        }else if UIScreen.main.scale == 2.0 {
            return imageName + "@2x"
        }else{
            return imageName
        }
    }
}

//------------------------------------
// MARK: UITableViewDelegate
//------------------------------------
extension KFXThemesTVC {
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let thisTheme = KFXTheming.shared.theme(atIndex:indexPath.row) else {
            return
        }
        
        for otherCell in tableView.visibleCells {
            if let otherCell = otherCell as? KFXThemeTVCell {
                otherCell.updateUIForTheme(isCurrentTheme:false, thisCellsTheme: thisTheme)
            }
        }
        
        if let selectedCell = tableView.cellForRow(at: indexPath) as? KFXThemeTVCell {
            
            if let theme = KFXTheming.shared.theme(atIndex:indexPath.row){
                KFXTheming.shared.currentTheme = theme
                UIView.animate(withDuration: 0.3) {
                    selectedCell.updateUIForTheme(isCurrentTheme:true, thisCellsTheme: thisTheme)
                    self.updateAfterThemeChange()

                }
                
            }
        }
    }
    
}
