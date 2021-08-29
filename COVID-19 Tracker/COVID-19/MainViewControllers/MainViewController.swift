//
//  MainViewController.swift
//  COVID-19
//
//  Created by Mustafa Jamal on 9/27/20.
//  Copyright © 2020 Mustafa Jamal. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, ModelDelegate, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    

    @IBOutlet weak var MostCasesTableView: UITableView!
    
    @IBOutlet weak var InfectionsLable: UILabel!
    
    @IBOutlet weak var TodatInfections: UILabel!
    
    @IBOutlet weak var DeathsLable: UILabel!
    
    @IBOutlet weak var TodayDeathsLable: UILabel!
    
    @IBOutlet weak var RecoveriesLable: UILabel!
    
    @IBOutlet weak var TodayRecoveriesLable: UILabel!
    
    @IBOutlet weak var CriticalLabel: UILabel!
    
    @IBOutlet weak var SearchBar: UISearchBar!{
        didSet{
            SearchBar.layer.borderWidth = 1
            SearchBar.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    
    
    //Variables for most infected
    
    var model = Model()
    var mostCases = [MostCases]()
    var country = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        model.delegate = self
        model.readAPIMostInfected()
        model.readAPIAll()
        model.readAPICountries()
        MostCasesTableView.delegate = self
        MostCasesTableView.dataSource = self
        SearchBar.delegate = self
        
        
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        performSegue(withIdentifier: "toSearch", sender: nil)
        return true
    }
    
    func DataFetched(_ Casesall: CasesAll) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        InfectionsLable.text = formatter.string(from: NSNumber(value: Casesall.cases))
        DeathsLable.text = formatter.string(from: NSNumber(value: Casesall.deaths))
        RecoveriesLable.text = formatter.string(from: NSNumber(value: Casesall.recovered))
        CriticalLabel.text = formatter.string(from: NSNumber(value: Casesall.critical))
        TodatInfections.text = "+" + formatter.string(from: NSNumber(value: Casesall.todayCases))!
        TodayDeathsLable.text = "+" + formatter.string(from: NSNumber(value: Casesall.todayDeaths))!
        TodayRecoveriesLable.text = "+" + formatter.string(from: NSNumber(value: Casesall.todayRecovered))!
        
    }
    
    func DataFetchedCountries(_ country: [Country]) {
        self.country = country
        
    }
    
    func DataFetchedMostCases(_ most: [MostCases]) {
        for one in 0...6{
            mostCases.append(most[one])
        }
        MostCasesTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mostCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MostCasesTableView.dequeueReusableCell(withIdentifier: "mostcasses", for: indexPath) as! MostCassesCell
        cell.getImage(urlString: mostCases[indexPath.row].flag)
        cell.InfectionsLable.text = cell.checkNumbers(value: mostCases[indexPath.row].cases)
        cell.DeathsLable.text = cell.checkNumbers(value: mostCases[indexPath.row].deaths)
        cell.RecoveriesLable.text = cell.checkNumbers(value: mostCases[indexPath.row].recovered)
        cell.CriticalLable.text = cell.checkNumbers(value: mostCases[indexPath.row].critical)
        return cell
    }
    //function to get image from url
    func getImage(urlString : String , uiimageview : UIImageView){
        
        let url = URL(string: urlString)

        let datatask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "No Data")
                return
            }
            DispatchQueue.main.async {
                uiimageview.image = UIImage(data: data!)
            }
        }
        datatask.resume()
        
    }
//    func putLabelsInfected(casesValue : Int , deathsValue : Int , criticalValue : Int , recoverdValue : Int , casesLable : UILabel , deathsLable : UILabel , cirticalLable : UILabel , recorvedLable : UILabel){
//        
//        casesLable.text = checkNumbers(value: casesValue)
//        deathsLable.text = checkNumbers(value: deathsValue)
//        recorvedLable.text = checkNumbers(value: recoverdValue)
//        cirticalLable.text = checkNumbers(value: criticalValue)
//    }
//
//    func checkNumbers(value : Int) -> String {
//        var stringValue : String = ""
//        if (value >= 1000000){
//            stringValue = String(value/1000000) + "M"
//        }else if (value >= 1000){
//            stringValue = String(value/1000) + "K"
//        }else{
//            stringValue = String(value)
//        }
//        return stringValue
//    }

    
   
    
}

extension UIViewController {

    
}
