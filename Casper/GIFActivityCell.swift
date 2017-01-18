
//
//  GIFActivityCell.swift
//  Eureka Sheet Demo
//
//  Created by Dhiraj Jadhao on 29/12/16.
//  Copyright © 2016 Dhiraj Jadhao. All rights reserved.
//

import Foundation
import Eureka
import Nuke
import NukeFLAnimatedImagePlugin
import FLAnimatedImage

public class GIFActivityCell: Cell<String>, CellType{
    
    @IBOutlet var activityView: AnimatedImageView!
    @IBOutlet var localActivityView: FLAnimatedImageView!
    
    
    public override func setup() {
        super.setup()
        
        if row.value != nil {
            
            if (row.value?.contains("http"))! || (row.value?.contains("https"))! || (row.value?.contains("www"))!{
                
                
                localActivityView.isHidden = true
                AnimatedImage.manager.loadImage(with: URL(string: row.value!)!, into: activityView!)
                
            }else{
                
                if let data = NSData(contentsOfFile: row.value!){
                    activityView.isHidden = true
                    let image = FLAnimatedImage(animatedGIFData: data as Data!)
                    localActivityView.animatedImage = image
                    
                 
                }
                
            }
             
            self.height = {self.activityView.bounds.height}
         
        }
        
    }
    
    
    public override func update() {
        super.update()
        
    }
    
}


public final class GIFActivityRow: Row<GIFActivityCell>, RowType {
    required public init(tag: String?) {
        super.init(tag: tag)
        // We set the cellProvider to load the .xib corresponding to our cell
        cellProvider = CellProvider<GIFActivityCell>(nibName: "GIFActivityCell")
    }
}
