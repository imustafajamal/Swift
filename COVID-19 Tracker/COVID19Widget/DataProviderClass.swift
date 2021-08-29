//
//  DataProviderClass.swift
//  COVID19WidgetExtension
//
//  Created by Mustafa Jamal on 10/12/20.
//  Copyright © 2020 Mustafa Jamal. All rights reserved.
//

import Foundation

class DataProvider: ModelDelegate {

    
    let model = Model()
    static var infections = 0
    static var daths = 0
    static var recoveried = 0
    
    
    
    func getDataReaded() {
        model.delegate = self
        model.readAPIAll()
        model.readAPICountries()
        model.readAPIMostInfected()

    }
    
    func DataFetched(_ Casesall: CasesAll) {
        getDataReaded()
        DataProvider.infections = Casesall.cases
        DataProvider.daths = Casesall.deaths
        DataProvider.recoveried = Casesall.recovered
    }
    
    func DataFetchedCountries(_ country: [Country]) {
        
        
    }
    
    func DataFetchedMostCases(_ most: [MostCases]) {
        
        
    }
}
