
//
//  ImageCell.swift
//  Eureka Sheet Demo
//
//  Created by Dhiraj Jadhao on 29/12/16.
//  Copyright © 2016 Dhiraj Jadhao. All rights reserved.
//

import Foundation
import Eureka


public class ImageCell: Cell<UIImage>, CellType{
    
    @IBOutlet var imageCellView: UIImageView!
    
    
    public override func setup() {
        super.setup()
        
        if row.value != nil {
            
            imageCellView.image = row.value
        }
        
        imageCellView.sizeToFit()
        
    }
    
    
    public override func update() {
        super.update()
        
    }
    
}


public final class ImageRow: Row<ImageCell>, RowType {
    required public init(tag: String?) {
        super.init(tag: tag)
        // We set the cellProvider to load the .xib corresponding to our cell
        cellProvider = CellProvider<ImageCell>(nibName: "ImageCell")
    }
}
