//
//  Casper.swift
//  Eureka Sheet Demo
//
//  Created by Dhiraj Jadhao on 05/12/16.
//  Copyright © 2016 Dhiraj Jadhao. All rights reserved.
//

import UIKit
import Eureka


/// Casper Controller Styles

public enum UICasperControllerStyle : Int {
    
    case actionSheet
    case alert
}


/// Casper Controller Action Styles

public enum UICasperActionStyle : Int {
    
    case switchToggle
    case label
    case segment
    case check
    case slider
    case stepper
    case textView
    case textField
    case urlField
    case intField
    case phoneField
    case passwordField
    case emailField
    case zipcodeField
    case date
    case time
    case dateTime
    case button
    //case ratings // Future Development
    case activity
    case qrCode
    case image
    //case webView // Future Development
    case gifActivity
    
}


enum DeviceType: String{
    
    case iPhone = "iPhone"
    case iPad = "iPad"
}




/// Casper is a lightweight and highly customisable framework which extends the usability of UIAlertController to provide you with much more customisable and frequently required UI elements.

public class UICasperController: NSObject {
    
    
    //MARK: Private Properties
    private var isAlertAddedInWindow:Bool?
    private let app = UIApplication.shared.delegate
    private var window = UIWindow()
    private var preferredStyle:UICasperControllerStyle!
    private var presentingViewController:UIViewController!
    private var casperViewHeightString = String()
    private var isCasperEditing = Bool()
    private var formView = FormViewController()
    private var form = Form()
    private var section = Section()
    private var alertController:UIAlertController!
    
    
    //MARK: Properties
    
    
    /// Casper Controller Title
    public var title:String?
    
    /// Casper Controller Message
    public var message:String?
    
    /// Casper Controller Tint Color
    public var tintColor:UIColor?
    
    /// Dismiss button title of Casper Controller
    public var dismissButtonTitle:String?
    
    /// Whether to hide or unhide dismiss button in Casper Cotroller
    public var dismissButtonHidden:Bool?
    
    
    /// Initializers
    
    public override init(){
        super.init()
        
        form = formView.form
        form +++ section
    }
    
    public convenience init(title: String?, message: String?, preferredStyle: UICasperControllerStyle) {
        self.init()
        self.title = title
        self.message = message
        self.preferredStyle = preferredStyle
        
        if self.preferredStyle == UICasperControllerStyle.actionSheet {
            casperViewHeightString = "\n\n"
        }
    }
    
    
    
    //MARK:  Add Actions
    
    /// Add actions to UICasperController
    ///
    /// - parameter title: Title of UICasperController
    /// - parameter style: Style of UICasperController action
    /// - parameter options: Which takes [Any]? of supported attributes for certain action style if supported.
    /// - parameter value: Which take Any? as value for specific action style if supported.
    
    
    public func addAction(title: String?, style: UICasperActionStyle, options: [Any]?, value: Any?, handler:
        ((Any) -> Swift.Void)?) {
        
        
        switch style {
        case .switchToggle:
            section <<< SwitchRow(){ row in
                row.title = title
                row.cell.switchControl?.onTintColor = tintColor
                casperViewHeightString = casperViewHeightString + "\n\n"
                if value is Bool{
                    row.value = value as? Bool
                }
                }.onChange({ (row) in
                    if handler != nil{
                        handler!(row.value!)
                    }
                })
            
        case .label:
            section <<< LabelRow(){ row in
                row.title = title
                casperViewHeightString = casperViewHeightString + "\n\n"
                
                
                }.onChange({ (row) in
                    if handler != nil{
                        handler!(row.value!)
                    }
                })
            
        case .segment:
            section <<< SegmentedRow<String>(){ row in
                row.title = title
                row.cell.tintColor = tintColor
                casperViewHeightString = casperViewHeightString + "\n\n"
                if (options != nil){
                    row.options = options as! [String]
                }
                if (value != nil){
                    row.value = value as! String?
                }
                }.onChange({ (row) in
                    if handler != nil{
                        handler!(row.value!)
                    }
                })
            
        case .check:
            section <<< CheckRow(){ row in
                row.title = title
                row.cell.tintColor = tintColor
                casperViewHeightString = casperViewHeightString + "\n\n"
                if value is Bool{
                    row.value = value as? Bool
                }
                
                }.onChange({ (row) in
                    if handler != nil{
                        handler!(row.value!)
                    }
                })
            
        case .slider:
            section <<< SliderRow(){ row in
                row.title = title
                row.cell.height = {78}
                row.cell.slider.minimumTrackTintColor = tintColor
                casperViewHeightString = casperViewHeightString + "\n\n\n\n"
                
                if options != nil{
                    if (options?.count)! >= 2{
                        row.cell.slider.minimumValue = Float(options?[0] as! Int)
                        row.cell.slider.maximumValue = Float(options?[1] as! Int)
                    }
                }
                
                
                if value is Float {
                    row.value = value as? Float
                }else if value is Int{
                    row.value = Float(value as! Int)
                }
                
                }.onChange({ (row) in
                    if handler != nil{
                        handler!(row.value!)
                    }
                })
            
        case .stepper:
            section <<< StepperRow(){ row in
                row.title = title
                row.cell.stepper.tintColor = tintColor
                row.cell.valueLabel.textColor = tintColor
                if options != nil{
                    if (options?.count)! >= 3{
                        row.cell.stepper.minimumValue = Double(options?[0] as! Int)
                        row.cell.stepper.maximumValue = Double(options?[1] as! Int)
                        
                        if options?[2] is Int{
                            row.cell.stepper.stepValue = Double(options?[2] as! Int)
                        }else if options?[2] is Double{
                            row.cell.stepper.stepValue = options?[2] as! Double
                        }
                        
                    }
                }
                
                casperViewHeightString = casperViewHeightString + "\n\n"
                
                if value is Double{
                    row.value = value as? Double
                }else if value is Int{
                    row.value = Double(value as! Int)
                }
                
                }.onChange({ (row) in
                    if handler != nil{
                        handler!(row.value!)
                    }
                })
            
        case .textView:
            section <<< TextAreaRow("textView"){ row in
                row.placeholder = title
                row.cell.textView.tintColor = tintColor
                if preferredStyle == .alert{
                    casperViewHeightString = casperViewHeightString + "\n\n\n\n\n"
                }else{
                    casperViewHeightString = casperViewHeightString + "\n\n\n\n\n\n\n"
                }
                
                if value is String{
                    row.value = value as? String
                }
                
                }.onChange({ (row) in
                    if handler != nil{
                        handler!(row.value!)
                    }
                })
            
        case .textField:
            section <<< TextRow(){ row in
                row.title = title
                row.cell.textField.tintColor = tintColor
                row.cell.tintColor = tintColor
                casperViewHeightString = casperViewHeightString + "\n\n"
                if value is String{
                    row.value = value as? String
                }
                
                }.onChange({ (row) in
                    if handler != nil{
                        handler!(row.value!)
                    }
                })
            
        case .urlField:
            section <<< URLRow(){ row in
                row.title = title
                row.cell.textField.tintColor = tintColor
                row.cell.tintColor = tintColor
                casperViewHeightString = casperViewHeightString + "\n\n"
                if value is URL{
                    row.value = value as? URL
                }
                
                }.onChange({ (row) in
                    if handler != nil{
                        handler!(row.value!)
                    }
                })
            
        case .intField:
            section <<< IntRow(){ row in
                row.title = title
                row.cell.textField.tintColor = tintColor
                row.cell.tintColor = tintColor
                casperViewHeightString = casperViewHeightString + "\n\n"
                if value is Int{
                    row.value = value as? Int
                }
                
                }.onChange({ (row) in
                    if handler != nil{
                        handler!(row.value!)
                    }
                })
            
        case .phoneField:
            section <<< PhoneRow(){ row in
                row.title = title
                row.cell.textField.tintColor = tintColor
                row.cell.tintColor = tintColor
                casperViewHeightString = casperViewHeightString + "\n\n"
                if value is String{
                    row.value = value as? String
                }
                
                }.onChange({ (row) in
                    if handler != nil{
                        handler!(row.value!)
                    }
                })
            
        case .passwordField:
            section <<< PasswordRow(){ row in
                row.title = title
                row.cell.textField.tintColor = tintColor
                row.cell.tintColor = tintColor
                casperViewHeightString = casperViewHeightString + "\n\n"
                if value is String{
                    row.value = value as? String
                }
                
                }.onChange({ (row) in
                    if handler != nil{
                        handler!(row.value!)
                    }
                })
            
            
        case .emailField:
            section <<< EmailRow(){ row in
                row.title = title
                row.cell.textField.tintColor = tintColor
                row.cell.tintColor = tintColor
                casperViewHeightString = casperViewHeightString + "\n\n"
                if value is String{
                    row.value = value as? String
                }
                
                }.onChange({ (row) in
                    if handler != nil{
                        handler!(row.value!)
                    }
                })
            
        case .zipcodeField:
            section <<< ZipCodeRow(){ row in
                row.title = title
                row.cell.textField.tintColor = tintColor
                row.cell.tintColor = tintColor
                casperViewHeightString = casperViewHeightString + "\n\n"
                if value is String{
                    row.value = value as? String
                }
                
                }.onChange({ (row) in
                    if handler != nil{
                        handler!(row.value!)
                    }
                })
            
        case .date:
            section <<< DateRow(){ row in
                row.title = title
                row.cell.tintColor = tintColor
                casperViewHeightString = casperViewHeightString + "\n\n"
                if value is Date{
                    row.value = value as? Date
                }
                
                }.onChange({ (row) in
                    if handler != nil{
                        handler!(row.value!)
                    }
                })
            
        case .time:
            section <<< TimeRow(){ row in
                row.title = title
                
                row.cell.tintColor = tintColor
                casperViewHeightString = casperViewHeightString + "\n\n"
                if value is Date{
                    row.value = value as? Date
                }
                
                }.onChange({ (row) in
                    if handler != nil{
                        handler!(row.value!)
                    }
                })
            
        case .dateTime:
            section <<< DateTimeRow(){ row in
                row.title = title
                
                row.cell.tintColor = tintColor
                casperViewHeightString = casperViewHeightString + "\n\n"
                if value is Date{
                    row.value = value as? Date
                }
                
                }.onChange({ (row) in
                    if handler != nil{
                        handler!(row.value!)
                    }
                })
            
        case .button:
            section <<< ButtonRow(){ row in
                row.title = title
                row.cell.backgroundColor = UIColor.clear
                row.cell.tintColor = tintColor
                casperViewHeightString = casperViewHeightString + "\n\n"
                
                }.onCellSelection({ (cell, row) in
                    handler!(true)
                })
            
            
            
        case .activity:
            section <<< ActivityRow(){ row in
                row.cell.tintColor = tintColor
                row.cell.backgroundColor = UIColor.clear
                row.cell.selectionStyle = UITableViewCellSelectionStyle.none
                formView.tableView?.separatorStyle = UITableViewCellSeparatorStyle.none
                casperViewHeightString = casperViewHeightString + "\n\n"
                
                if options != nil{
                    
                    for object in options!{
                        
                        if object is UIActivityIndicatorViewStyle{
                            row.cell.activityView.activityIndicatorViewStyle = object as! UIActivityIndicatorViewStyle
                        }
                    }
                    
                }
                
                row.cell.activityView.color = tintColor
                
                
            }
            
            
        case .gifActivity:
            section <<< GIFActivityRow(){ row in
                if value is String{
                    row.value =  value as! String?
                }
                
                row.cell.backgroundColor = UIColor.clear
                
                if options != nil{
                    
                    for object in options!{
                        
                        if object is UIViewContentMode{
                            row.cell.activityView.imageView.contentMode = object as! UIViewContentMode
                            row.cell.localActivityView.contentMode = object as! UIViewContentMode
                        }else if object is CGSize{
                            row.cell.activityView.bounds.size = object as! CGSize
                            row.cell.height = {(object as! CGSize).height}
                            row.cell.layoutIfNeeded()
                        }else if object is UIColor{
                            row.cell.backgroundColor = object as? UIColor
                        }
                    }
                    
                }
                
                row.cell.tintColor = tintColor
                row.cell.selectionStyle = UITableViewCellSelectionStyle.none
                
                
                let height = row.cell.height!()
                let numbeOflines = round(height/23)
                
                if numbeOflines > 0 {
                    
                    for _ in 0..<Int(numbeOflines){
                        
                        casperViewHeightString = casperViewHeightString + "\n"
                    }
                }
                
                
            }
            
            
            
        case .qrCode:
            section <<< QRCodeRow(){ row in
                if value is String{
                    row.value =  value as! String?
                }
                row.cell.backgroundColor = UIColor.clear
                row.cell.tintColor = tintColor
                row.cell.selectionStyle = UITableViewCellSelectionStyle.none
                if preferredStyle == UICasperControllerStyle.actionSheet{
                    casperViewHeightString = casperViewHeightString + "\n\n\n\n\n\n\n\n\n"
                }else{
                    casperViewHeightString = casperViewHeightString + "\n\n\n\n\n\n\n\n"
                }
                
                row.cell.height = {180}
                
            }
            
        case .image:
            section <<< ImageRow(){ row in
                
                if value is UIImage{
                    row.value =  value as! UIImage?
                }
                
                row.cell.tintColor = tintColor
                row.cell.backgroundColor = UIColor.clear
                row.cell.selectionStyle = UITableViewCellSelectionStyle.none
                row.cell.height = {150}
                
                if options != nil{
                    
                    for object in options!{
                        
                        if object is UIViewContentMode{
                            row.cell.imageCellView.contentMode = object as! UIViewContentMode
                        }
                        
                        if object is CGSize{
                            row.cell.imageCellView.bounds.size = object as! CGSize
                            row.cell.height = {(object as! CGSize).height}
                        }
                    }
                    
                }
                
                
                if row.cell.height != nil {
                    
                    let height = row.cell.height!()
                    let numbeOflines = round(height/23)
                    
                    if numbeOflines > 0 {
                        
                        for _ in 0..<Int(numbeOflines){
                            
                            casperViewHeightString = casperViewHeightString + "\n"
                        }
                    }
                    
                }
                
                
            }
            
            
            
            //        case .webView:
            //            section <<< WebViewRow(){ row in
            //
            //                if value is String{
            //                    row.value =  (value as? String)!
            //                }
            //
            //                row.cell.tintColor = tintColor
            //                row.cell.backgroundColor = UIColor.clear
            //                row.cell.selectionStyle = UITableViewCellSelectionStyle.none
            //                if preferredStyle == UICasperControllerStyle.actionSheet{
            //                    casperViewHeightString = casperViewHeightString + "\n\n\n\n\n"
            //                }else{
            //                    casperViewHeightString = casperViewHeightString + "\n\n\n\n\n\n"
            //                }
            //
            //                row.cell.height = {130}
            //
            //            }
            
            
            
            
            
            
            
        }
        
    }
    
    
    
    
    //MARK: Present UICasperController
    /// It presents the UICasperController in given view
    ///
    /// - parameter inViewController: ViewController in which UICasperController is to be presented.
    /// - parameter animated: Whether UICasperController should be presented with animation.
    
    
    public func present(inViewController:UIViewController, sourceView:UIView?, animated: Bool, completion: (() -> Swift.Void)? = nil) -> Void{
        
        presentingViewController = inViewController
        
        
        
        let alertControllerText = NSMutableAttributedString()
        
        
        if self.title != nil {
            
            let attributes = [NSFontAttributeName:UIFont.boldSystemFont(ofSize: 15)]
            let attributedTitle = NSMutableAttributedString(string: self.title!, attributes: attributes)
            alertControllerText.append(NSAttributedString(string: "\n"))
            alertControllerText.append(attributedTitle)
        }
        
        
        if self.message != nil {
            let attributes = [NSFontAttributeName:UIFont.systemFont(ofSize: 13)]
            let attributedMessage = NSMutableAttributedString(string: "\n"+self.message!, attributes: attributes)
            alertControllerText.append(attributedMessage)
            
            alertControllerText.append(NSAttributedString(string: "\n"))
            
        }
        
        
        if preferredStyle == UICasperControllerStyle.alert {
            alertController = UIAlertController(title: nil, message:casperViewHeightString, preferredStyle: UIAlertControllerStyle.alert)
            
            var heightToBeReduced = CGFloat()
            
            if dismissButtonHidden != true {
                heightToBeReduced = 40
            }else{
                heightToBeReduced = 0
            }
            
            var yPos = Int()
            if alertControllerText.length == 0 {
                yPos = -17
            }else{
                yPos = 0
            }
            
            formView.view.frame = CGRect(x: 0, y: yPos, width: Int(alertController.view.bounds.width), height: (Int(alertController.view.bounds.height - heightToBeReduced)))
            formView.view.center.x = alertController.view.bounds.width/2.0
            formView.tableView?.backgroundColor = UIColor.clear
            formView.tableView?.isScrollEnabled = false
            
            
            let header = UILabel(frame: CGRect(x: 0, y: 0, width: Int(alertController.view.bounds.width)-30, height: 40))
            header.font = UIFont.boldSystemFont(ofSize: 14)
            header.numberOfLines = 0
            header.textAlignment = NSTextAlignment.center
            header.attributedText = alertControllerText
            header.textColor = UIColor.darkGray
            
            header.sizeToFit()
            
            formView.tableView?.tableHeaderView = header
            
            let numbeOflines = round(header.frame.height/17)
            
            if numbeOflines > 0 {
                for _ in 0..<Int(numbeOflines)-2{
                    
                    casperViewHeightString = casperViewHeightString + "\n"
                }
            }
            alertController.message = casperViewHeightString
            
            
            alertController.view.addSubview(formView.view)
            alertController.present(formView, animated: true, completion: nil)
            
        }else{
            
            alertController = UIAlertController(title: nil, message:casperViewHeightString, preferredStyle: UIAlertControllerStyle.actionSheet)
            
            
            var heightToBeReduced = CGFloat()
            
            if dismissButtonHidden != true {
                heightToBeReduced = 70
            }else{
                heightToBeReduced = 0
            }
            
            
            var yPos = Int()
            if alertControllerText.length == 0 {
                yPos = -15
            }else{
                yPos = 0
            }
            
            
            if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad && sourceView != nil {
                alertController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.any
                alertController.popoverPresentationController?.sourceView = sourceView!
                alertController.popoverPresentationController?.sourceRect = CGRect(x: 0, y: 0, width: (sourceView?.frame.width)!, height: (sourceView?.frame.height)!)
                
                heightToBeReduced = 0
                
            }else if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad && sourceView == nil{
                print("You should pass source view to present actionsheet on iPad device.")
            }
            
            
            formView.view.frame = CGRect(x: 0, y: yPos, width: Int(alertController.view.bounds.width), height: (Int(alertController.view.bounds.height - heightToBeReduced)))
            formView.view.center.x = alertController.view.bounds.width/2.0
            formView.tableView?.backgroundColor = UIColor.clear
            formView.tableView?.isScrollEnabled = false
            
            
            
            let header = UILabel(frame: CGRect(x: 0, y: 0, width: Int(alertController.view.bounds.width)-40, height: 38))
            header.font = UIFont.boldSystemFont(ofSize: 14)
            header.numberOfLines = 0
            header.textAlignment = NSTextAlignment.center
            header.attributedText = alertControllerText
            header.textColor = UIColor.darkGray
            
            header.sizeToFit()
            
            formView.tableView?.tableHeaderView = header
            
            
            let numbeOflines = round(header.frame.height/17)
            
            if numbeOflines > 0 {
                for _ in 0..<Int(numbeOflines)-1{
                    
                    casperViewHeightString = casperViewHeightString + "\n"
                }
            }
            alertController.message = casperViewHeightString
            
            
            alertController.view.addSubview(formView.view)
            alertController.present(formView, animated: true, completion: nil)
            
        }
        
        
        if dismissButtonTitle == nil {
            dismissButtonTitle = "Cancel"
        }
        
        
        if dismissButtonHidden != true {
            let cancelAction = UIAlertAction(title: dismissButtonTitle, style: .cancel, handler: {(alert: UIAlertAction!) in print("cancel")})
            alertController.addAction(cancelAction)
        }
        
        
        if self.tintColor != nil {
            alertController.view.tintColor = self.tintColor!
        }
        
        presentingViewController.present(alertController, animated: animated) {
            
        }
        
        
    }
    
    
    
    //MARK: Dismiss UICasperController
    /// - parameter animated: Whether UICasperController should be dismissed with animation.
    
    public func dismiss(animated: Bool, completion: (() -> Void)?){
        alertController.dismiss(animated: animated, completion: completion)
    }
    
    
    
}




