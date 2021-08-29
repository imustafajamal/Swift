//
//  CountriesViewController.swift
//  COVID-19
//
//  Created by Mustafa Jamal on 10/10/20.
//  Copyright © 2020 Mustafa Jamal. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, ModelDelegate {

    


    @IBOutlet weak var SearchBar: UISearchBar!{
        didSet{
            SearchBar.layer.borderWidth = 1
            SearchBar.layer.borderColor = UIColor.white.cgColor
        }
    }
    @IBOutlet weak var CountriesTableView: UITableView!
    let model = Model()
    var country = [Country]()
    var filteredCountries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.readAPICountries()
        SearchBar.delegate = self
        SearchBar.becomeFirstResponder()
        CountriesTableView.delegate = self
        CountriesTableView.dataSource = self
        model.delegate = self
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dismiss(animated: true, completion: nil)
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CountriesTableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! CountryCell
        cell.getImage(urlString: filteredCountries[indexPath.row].flag)
        cell.countryLable.text = filteredCountries[indexPath.row].country
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard CountriesTableView.indexPathForSelectedRow != nil else {
            return
        }
        
        let selectedCountry = filteredCountries[CountriesTableView.indexPathForSelectedRow!.row]
        
        let countryVC = segue.destination as! OneCountryViewController
        
        countryVC.country = selectedCountry

        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toCountry", sender: nil)
        
    }
    
    
    func DataFetched(_ Casesall: CasesAll) {
        
    }
    
    func DataFetchedCountries(_ country: [Country]) {
        self.country = country
        self.filteredCountries = country
        CountriesTableView.reloadData()
    }
    
    func DataFetchedMostCases(_ most: [MostCases]) {
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
       if searchBar.text == nil || searchBar.text == "" { //

           view.endEditing(true)
           filteredCountries = country
           CountriesTableView.reloadData()
           
       }else{
       filteredCountries = country.filter({ value -> Bool in
           guard let text =  searchBar.text else { return false}
          return value.country.contains(text)})
       CountriesTableView.reloadData()
       }
   }
    
}
    


