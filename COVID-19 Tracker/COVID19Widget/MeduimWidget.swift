//
//  MeduimWidget.swift
//  COVID-19
//
//  Created by Mustafa Jamal on 10/12/20.
//  Copyright © 2020 Mustafa Jamal. All rights reserved.
//

import SwiftUI
import WidgetKit

struct MeduimWidget: View {
    let color1 : Color = .purple
    let color2 : Color = .red
    let color3 : Color = .green
    var cases : String = ""
    var deaths : String = ""
    var recoveried : String = ""
    var body: some View {
        
        HStack{
            ZStack{
                LinearGradient(
                 gradient: Gradient(colors: [color1.opacity(0.5), .white]),
                    startPoint: .top,
                    endPoint: .bottom)
                VStack{
                    Text(cases).fontWeight(.bold).padding(.bottom, 5).foregroundColor(.purple)
                    Text("Infections").font(.system(size: 15))
                }
            }.padding(.trailing, -8)
            ZStack{
                LinearGradient(
                 gradient: Gradient(colors: [color2.opacity(0.5), .white]),
                    startPoint: .top,
                    endPoint: .bottom)
                VStack{
                    Text(deaths).fontWeight(.bold).padding(.bottom, 5).foregroundColor(.red)
                    Text("Deaths").font(.system(size: 15))
                }
            }.padding(.trailing, -8)
            ZStack{
                LinearGradient(
                 gradient: Gradient(colors: [color3.opacity(0.5), .white]),
                    startPoint: .top,
                    endPoint: .bottom)
                VStack{
                    Text(recoveried).fontWeight(.bold).padding(.bottom, 5).foregroundColor(.green)
                    Text("Recoveried").font(.system(size: 15))
                }
            }.padding(.trailing, -8)
            
        }
    }
}

struct MeduimWidget_Previews: PreviewProvider {
    static var previews: some View {
        MeduimWidget().previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
