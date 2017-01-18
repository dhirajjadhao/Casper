//
//  ViewController.swift
//  Casper Example
//
//  Created by Dhiraj Jadhao on 18/01/17.
//  Copyright © 2017 Dhiraj Jadhao. All rights reserved.
//

import UIKit
import Casper
import Eureka

class ViewController: FormViewController {
    
    let casporColor = UIColor(colorLiteralRed: 59/255.0, green: 0, blue: 164/255.0, alpha: 1.0)
    
    var alert:UICasperController?
    var style = UICasperControllerStyle.alert
    
    @IBOutlet var showButton: UIButton!
    @IBOutlet var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        showButton.layer.cornerRadius = 35
        
        
        
        initializeMenu()
        
        tableView?.frame.size.height = 180
        tableView?.center.y = self.view.frame.height - (tableView?.frame.size.height)!*0.5
        tableView?.backgroundColor = UIColor.clear
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initializeMenu() -> Void {
        
        form +++ Section()
            
            <<< PickerRow<String>(){ row in
                row.title = "Select"
                row.tag = "picker"
                row.options = ["Switch","Check", "Segment Control","Slider","Stepper","Date","Buttons","Activity Indicator","Activity Indicator Large","Activity w/o Cancel Button","QR Code","Image","GIF InApp","GIF Web"]
                row.value = row.options.first
                row.cell.height = {180}
                
        }
        
        
    }
    
    
    
    @IBAction func styleToggled(_ sender: AnyObject) {
        
        if segmentControl.selectedSegmentIndex == 0 {
            style = UICasperControllerStyle.alert
        }else{
            style = UICasperControllerStyle.actionSheet
        }
        
    }
    
    
    @available(iOS 10.0, *)
    @IBAction func showButtonPressed(_ sender: AnyObject) {
        
        
        alert = UICasperController(title: "Casper", message: "Here goes the message...", preferredStyle: style)
        alert?.tintColor = casporColor
        
        
        let pickerRow = form.rowBy(tag: "picker") as! PickerRow<String>
        
        switch pickerRow.value! {
        case "Switch":
            
            alert?.addAction(title: "Notification", style: UICasperActionStyle.switchToggle, options: nil, value: true, handler: { (value) in
                print("Selected Value: \(value as! Bool)")
            })
            
            alert?.addAction(title: "Vibration", style: UICasperActionStyle.switchToggle, options: nil, value: true, handler: { (value) in
                print("Selected Value: \(value as! Bool)")
            })
            
            alert?.addAction(title: "Auto Lock", style: UICasperActionStyle.switchToggle, options: nil, value: nil, handler: { (value) in
                print("Selected Value: \(value as! Bool)")
            })
            
            alert?.addAction(title: "Device Rotation", style: UICasperActionStyle.switchToggle, options: nil, value: true, handler: { (value) in
                print("Selected Value: \(value as! Bool)")
            })
            
        case "Check":
            
            alert?.addAction(title: "Yes Like Casper", style: UICasperActionStyle.check, options: nil, value: nil, handler: { (value) in
                print("Selected Value: \(value as! Bool)")
            })
            
            alert?.addAction(title: "Label", style: UICasperActionStyle.label, options: [NSTextAlignment.center], value: nil, handler: { (value) in
                
            })
            
        case "Segment Control":
            
            alert?.addAction(title: "Title", style: UICasperActionStyle.segment, options: ["Ms.","Mr.","Mrs."], value: nil, handler: { (value) in
                print("Selected Value: \(value as! String)")
            })
            
            alert?.addAction(title: "City", style: UICasperActionStyle.segment, options: ["Mumbai","Pune"], value: "Pune", handler: { (value) in
                print("Selected Value: \(value as! String)")
            })
            
            alert?.addAction(title: "Fruit", style: UICasperActionStyle.segment, options: ["Apple","Banana"], value: "Apple", handler: { (value) in
                print("Selected Value: \(value as! String)")
            })
            
        case "Slider":
            
            alert?.addAction(title: "Volume", style: UICasperActionStyle.slider, options: [0,10], value: 3, handler: { (value) in
                print("Selected Value: \(value as! Float)")
            })
            
            alert?.addAction(title: "Brightness", style: UICasperActionStyle.slider, options: [0,100], value: 70, handler: { (value) in
                print("Selected Value: \(value as! Float)")
            })
            
        case "Stepper":
            
            alert?.addAction(title: "Volume", style: UICasperActionStyle.stepper, options: [0,10,1], value: 3, handler: { (value) in
                print("Selected Value: \(value as! Double)")
            })
            
            alert?.addAction(title: "Brightness", style: UICasperActionStyle.stepper, options: [0,100,10], value: 70, handler: { (value) in
                print("Selected Value: \(value as! Double)")
            })
            
        case "Date":
            
            alert?.addAction(title: "Date", style: UICasperActionStyle.date, options: nil, value: Date(timeInterval: 86400, since: Date()), handler: { (value) in
                print("Selected Value: \(value as! Date)")
            })
            
            alert?.addAction(title: "Time", style: UICasperActionStyle.time, options: nil, value: nil, handler: { (value) in
                print("Selected Value: \(value as! Date)")
            })
            
            alert?.addAction(title: "DateTime", style: UICasperActionStyle.dateTime, options: nil, value: nil, handler: { (value) in
                print("Selected Value: \(value as! Date)")
            })
            
        case "Buttons":
            
            alert?.addAction(title: "Sign In", style: UICasperActionStyle.button, options: nil, value: nil, handler: { (value) in
                print("Sign In Button Clicked")
            })
            
            alert?.addAction(title: "Sign Up", style: UICasperActionStyle.button, options: nil, value: nil, handler: { (value) in
                print("Sign Up Button Clicked")
            })
            
            
        case "Activity Indicator":
            
            alert?.addAction(title: nil, style: UICasperActionStyle.activity, options: nil, value: nil, handler: nil)
            
        case "Activity Indicator Large":
            
            alert?.addAction(title: nil, style: UICasperActionStyle.activity, options: [UIActivityIndicatorViewStyle.whiteLarge], value: nil, handler: nil)
            
        case "Activity w/o Cancel Button":
            
            alert?.addAction(title: nil, style: UICasperActionStyle.activity, options: [UIActivityIndicatorViewStyle.whiteLarge], value: nil, handler: nil)
            
            alert?.dismissButtonHidden = true
            
            Timer.scheduledTimer(withTimeInterval: 4, repeats: false, block: { (timer) in
                self.alert?.dismiss(animated: true, completion: nil)
            })
            
        case "QR Code":
            
            alert?.addAction(title: nil, style: UICasperActionStyle.qrCode, options: nil, value: "https://github.com/dhirajjadhao/Casper", handler: nil)
            
            
        case "Image":
            
            alert?.addAction(title: nil, style: UICasperActionStyle.image, options: [UIViewContentMode.scaleAspectFill,CGSize(width: 300, height: 100)], value: UIImage(named: "Casper"), handler: nil)
            
        case "GIF InApp":
            
            let path = Bundle.main.path(forResource: "test", ofType: "gif")
            alert?.addAction(title: nil, style: UICasperActionStyle.gifActivity, options: [UIViewContentMode.scaleAspectFit, CGSize(width: 80, height: 180),UIColor.white], value: path, handler: nil)
            
        case "GIF Web":
            
            alert?.addAction(title: nil, style: UICasperActionStyle.gifActivity, options: [UIViewContentMode.scaleAspectFit, CGSize(width: 80, height: 180),UIColor.white], value: "https://d13yacurqjgara.cloudfront.net/users/955627/screenshots/3043475/gs_animation_white.gif", handler: nil)
            
        default:
            break
        }
        
        
        alert?.present(inViewController: self, sourceView: segmentControl, animated: true)
        
        
    }
    
    
    
}


