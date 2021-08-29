//
//  Response.swift
//  COVID-19
//
//  Created by Mustafa Jamal on 7/6/20.
//  Copyright © 2020 Mustafa Jamal. All rights reserved.
//

import Foundation

struct  Country : Decodable {
    
    let country : String
    let cases : Int
    let deaths : Int
    let recovered : Int
    let critical : Int
    let flag : String
    var todayCases : Int
    var todayDeaths : Int
    var todayRecovered : Int
    
    
    enum CodingKeys : CodingKey {
        case countryInfo
        case flag
        case country
        case cases
        case deaths
        case recovered
        case critical
        case todayCases
        case todayDeaths
        case todayRecovered
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let countryInfoContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .countryInfo)
        self.flag = try countryInfoContainer.decode(String.self, forKey: .flag)
        self.country = try container.decode(String.self, forKey: .country)
        self.cases = try container.decode(Int.self, forKey: .cases)
        self.deaths = try container.decode(Int.self, forKey: .deaths)
        self.critical = try container.decode(Int.self, forKey: .critical)
        self.recovered = try container.decode(Int.self, forKey: .recovered)
        self.todayCases = try container.decode(Int.self, forKey: .todayCases)
        self.todayDeaths = try container.decode(Int.self, forKey: .todayDeaths)
        self.todayRecovered = try container.decode(Int.self, forKey: .todayRecovered)
    }
    
    
}

