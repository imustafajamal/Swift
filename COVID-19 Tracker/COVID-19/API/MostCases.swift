//
//  MostCases.swift
//  COVID-19
//
//  Created by Mustafa Jamal on 7/8/20.
//  Copyright © 2020 Mustafa Jamal. All rights reserved.
//

import Foundation

struct MostCases : Decodable {
    
    let country : String
    let cases : Int
    let deaths : Int
    let recovered : Int
    let critical : Int
    let flag : String
    
    
    enum CodingKeys : CodingKey {
        case countryInfo
        case flag
        case country
        case cases
        case deaths
        case recovered
        case critical
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
    }
}
