//
//  COVID19Widget.swift
//  COVID19Widget
//
//  Created by Mustafa Jamal on 10/12/20.
//  Copyright © 2020 Mustafa Jamal. All rights reserved.
//

import WidgetKit
import SwiftUI

var infections = 0
var deaths = 0
var recoverd = 0
var critical = 0
struct Provider: TimelineProvider, ModelDelegate {

    let model = Model()
    func DataFetched(_ Casesall: CasesAll) {
        infections = Casesall.cases
        deaths = Casesall.deaths
        recoverd = Casesall.recovered
        critical = Casesall.critical
    }
    
    func DataFetchedCountries(_ country: [Country]) {
        
    }
    
    func DataFetchedMostCases(_ most: [MostCases]) {
        
    }
    
    func placeholder(in context: Context) -> SimpleEntry {

        return SimpleEntry(cases: "2", deaths: "2", recoveried: "2", critical: "2")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(cases: "2", deaths: "2", recoveried: "2", critical: "2")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        model.delegate = self
        model.readAPIAll()
        model.readAPICountries()
        model.readAPIMostInfected()
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        var entries: [SimpleEntry] = []
        let cases = formatter.string(from: NSNumber(value: infections))!
        let reco = formatter.string(from: NSNumber(value: recoverd))!
        let die = formatter.string(from: NSNumber(value: deaths))!
        let crit = formatter.string(from: NSNumber(value: critical))!

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            _ = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(cases: cases, deaths: die, recoveried: reco, critical: crit)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date = Date()
    let cases : String
    let deaths: String
    let recoveried : String
    let critical :String
}

struct COVID19WidgetEntryView : View {
    @Environment(\.widgetFamily) var family
    var entry: Provider.Entry
    @ViewBuilder
    var body: some View {

        switch family {
        case .systemSmall:
            SmallWidget(color: .purple, Lable: entry.cases)
        case .systemMedium:
            MeduimWidget(cases: entry.cases, deaths: entry.deaths, recoveried: entry.recoveried)
        case .systemLarge:
            ZStack{
            HStack{
                VStack{
                    InfectionsView(color: .purple, Lable: entry.cases, LableType: "Infections", lableColor: .purple)
                    InfectionsView(color: .green, Lable: entry.recoveried, LableType: "Recorveried", lableColor: .green)
    
                }.padding(.trailing, -8)
                VStack{
                    InfectionsView(color: .red, Lable: entry.deaths, LableType: "Deaths", lableColor: .red)
                    InfectionsView(color: .yellow, Lable: entry.critical, LableType: "Critical", lableColor: .yellow)
                }
    
            }
                Image("Logo").frame(width: 20, height: 20, alignment: .center)
            }
        default:
            Text("Some other WidgetFamily in the future.")
        }

    }
}

@main
struct COVID19Widget: Widget {
    let kind: String = "COVID19Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            COVID19WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("COVID-19 World Update")
        .description("Select your Widget to Display")
    }
}

struct COVID19Widget_Previews:PreviewProvider {
    static var previews: some View {
        COVID19WidgetEntryView(entry: SimpleEntry(cases: "2", deaths: "2", recoveried: "2", critical: "2"))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
