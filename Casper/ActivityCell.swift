//
//  ActivityCell.swift
//  Eureka Sheet Demo
//
//  Created by Dhiraj Jadhao on 28/12/16.
//  Copyright © 2016 Dhiraj Jadhao. All rights reserved.
//

import Foundation
import Eureka


public class ActivityCell: Cell<Bool>, CellType{
    
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    
    public override func setup() {
        super.setup()
        
        activityView.startAnimating()

    }

    
    public override func update() {
        super.update()
        
    }
    
}


public final class ActivityRow: Row<ActivityCell>, RowType {
    required public init(tag: String?) {
        super.init(tag: tag)
        // We set the cellProvider to load the .xib corresponding to our cell
        cellProvider = CellProvider<ActivityCell>(nibName: "ActivityCell")
    }
}
