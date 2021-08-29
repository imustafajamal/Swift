//
//  CassesAll.swift
//  COVID-19
//
//  Created by Mustafa Jamal on 7/5/20.
//  Copyright © 2020 Mustafa Jamal. All rights reserved.
//

import Foundation

struct CasesAll : Decodable {
    
    var cases : Int = 0
    var deaths : Int = 0
    var recovered : Int = 0
    var critical : Int = 0
    var todayCases : Int = 0
    var todayDeaths : Int = 0
    var todayRecovered : Int = 0
    
    enum CodingKeys : CodingKey {
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
        self.cases = try container.decode(Int.self, forKey: .cases)
        self.deaths = try container.decode(Int.self, forKey: .deaths)
        self.recovered = try container.decode(Int.self, forKey: .recovered)
        self.critical = try container.decode(Int.self, forKey: .critical)
        self.todayCases = try container.decode(Int.self, forKey: .todayCases)
        self.todayDeaths = try container.decode(Int.self, forKey: .todayDeaths)
        self.todayRecovered = try container.decode(Int.self, forKey: .todayRecovered)
    }
    
    

}
