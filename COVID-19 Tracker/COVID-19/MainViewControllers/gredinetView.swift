//
//  gredinetView.swift
//  COVID-19
//
//  Created by Mustafa Jamal on 9/11/20.
//  Copyright © 2020 Mustafa Jamal. All rights reserved.
//

import UIKit

class gredinetView: UIView {

    @IBInspectable var FirstColor:UIColor = UIColor.clear{
        didSet{
            UpdateView()
        }
    }
    
    @IBInspectable var SecondColor:UIColor = UIColor.clear{
        didSet{
            UpdateView()
        }
    }
    
    @IBInspectable var Raduis:CGFloat = 0{
           didSet{
               UpdateView()
           }
       }
    
    override class var layerClass: AnyClass{
        get{
            return CAGradientLayer.self
        }
    }
    
    
    func UpdateView(){
        let Layer = self.layer as! CAGradientLayer
        Layer.colors = [FirstColor.cgColor , SecondColor.cgColor ]
        layer.cornerRadius = Raduis
    }

}
