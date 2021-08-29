//
//  Model.swift
//  COVID-19
//
//  Created by Mustafa Jamal on 7/5/20.
//  Copyright © 2020 Mustafa Jamal. All rights reserved.
//

import Foundation
protocol ModelDelegate {
    func DataFetched(_ Casesall : CasesAll)
    func DataFetchedCountries(_ country : [Country])
    func DataFetchedMostCases(_ most : [MostCases])
}

class Model {
    
    var delegate : ModelDelegate?
    func readAPIAll() {
        //Declare API Url
        let url = URL(string: Constants.API_URL_ALL)

        //Create API URL Session
        let session = URLSession.shared

        //Create DATA Task
        let task = session.dataTask(with: url!) { (data, response, error) in

            if error != nil {
                print("error founded")
                return
            }

            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode(CasesAll.self, from: data!)
                DispatchQueue.main.async {
                    self.delegate?.DataFetched(response)
                    }
            }
            catch let error{
                print("error " , error.localizedDescription)
            }
        }
        task.resume()

    }
    
    func readAPICountries(){
        let url = URL(string: Constants.API_URL_CONTRIUES)
        let session = URLSession.shared
        let datatask = session.dataTask(with: url!) { (data, response, error)  in
            
            if error != nil{
                print(error!.localizedDescription)
                return
            }
            do{
                let decoder = JSONDecoder()
                let data = try decoder.decode([Country].self, from: data!)
                DispatchQueue.main.async {
                    self.delegate?.DataFetchedCountries(data)
                }
            }
            catch let jsonError {
                print("Error" , jsonError.localizedDescription)
                
            }
        }
        datatask.resume()
    }
    func readAPIMostInfected(){
        let url = URL(string: Constants.API_URL_MostInfected)
        let session = URLSession.shared
        let datatask = session.dataTask(with: url!) { (data, response, error)  in
            
            if error != nil{
                print("error most casses")
                return
            }
            do{
                let decoder = JSONDecoder()
                let data = try decoder.decode([MostCases].self, from: data!)
                DispatchQueue.main.async {
                    self.delegate?.DataFetchedMostCases(data)
                }
            }
            catch let jsonError {
                print("Error fonded most casses" , jsonError.localizedDescription)
                
            }
        }
        datatask.resume()
    }

}

