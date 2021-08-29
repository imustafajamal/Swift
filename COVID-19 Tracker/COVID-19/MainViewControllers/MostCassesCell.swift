//
//  MostCassesCell.swift
//  COVID-19
//
//  Created by Mustafa Jamal on 9/27/20.
//  Copyright © 2020 Mustafa Jamal. All rights reserved.
//

import UIKit

class MostCassesCell: UITableViewCell {

    
    @IBOutlet weak var flagImage: UIImageView!

    @IBOutlet weak var InfectionsLable: UILabel!
    
    @IBOutlet weak var DeathsLable: UILabel!
    
    @IBOutlet weak var RecoveriesLable: UILabel!
    
    @IBOutlet weak var CriticalLable: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.flagImage.layer.cornerRadius = 5

//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func getImage(urlString : String){
        
        let url = URL(string: urlString)

        let datatask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("image not found")
                return
            }
            DispatchQueue.main.async {
                self.flagImage.image = UIImage(data: data!)
            }
        }
        datatask.resume()
        
    }
    func checkNumbers(value : Int) -> String {
        var stringValue : String = ""
        if (value >= 1000000){
            stringValue = String(value/1000000) + "M"
        }else if (value >= 1000){
            stringValue = String(value/1000) + "K"
        }else{
            stringValue = String(value)
        }
        return stringValue
    }

}
