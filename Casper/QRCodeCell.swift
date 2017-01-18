
//
//  QRCodeCell.swift
//  Eureka Sheet Demo
//
//  Created by Dhiraj Jadhao on 28/12/16.
//  Copyright © 2016 Dhiraj Jadhao. All rights reserved.
//

import Foundation
import Eureka
import QRCode

public class QRCodeCell: Cell<String>, CellType{
    
    @IBOutlet weak var qrCodeView: UIImageView!
    
    
    public override func setup() {
        super.setup()

        if row.value != nil{
            
            var qrCode = QRCode(row.value!)
            
            qrCode?.backgroundColor = CIColor(red: 1, green: 1, blue: 1, alpha: 1)
            qrCode?.size = qrCodeView.bounds.size
            
            qrCodeView.image = qrCode?.image//UIImage.mdQRCode(for: row.value, size: qrCodeView.bounds.width, fill: UIColor.darkGray)
        }
        
        qrCodeView.sizeToFit()
  
    }
    
    
    public override func update() {
        super.update()
        
    }
    
}


public final class QRCodeRow: Row<QRCodeCell>, RowType {
    required public init(tag: String?) {
        super.init(tag: tag)
        // We set the cellProvider to load the .xib corresponding to our cell
        cellProvider = CellProvider<QRCodeCell>(nibName: "QRCodeCell")
    }
}
