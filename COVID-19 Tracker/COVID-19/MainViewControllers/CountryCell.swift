//
//  CountryCell.swift
//  COVID-19
//
//  Created by Mustafa Jamal on 10/10/20.
//  Copyright © 2020 Mustafa Jamal. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        flagImage.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func getImage(urlString : String){
        
        let url = URL(string: urlString)

        let datatask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "No Data")
                return
            }
            DispatchQueue.main.async {
                self.flagImage.image = UIImage(data: data!)
            }
        }
        datatask.resume()
        
    }

}
