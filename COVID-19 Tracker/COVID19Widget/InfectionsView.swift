//
//  InfectionsView.swift
//  COVID19WidgetExtension
//
//  Created by Mustafa Jamal on 10/12/20.
//  Copyright © 2020 Mustafa Jamal. All rights reserved.
//

import SwiftUI
import WidgetKit

struct InfectionsView: View {
    var color : Color = .purple
    var Lable : String = "Desc"
    var LableType : String = "Infections"
    var lableColor : Color = .purple
    var body: some View {
            ZStack{
           LinearGradient(
               gradient: Gradient(colors: [color.opacity(0.5), .white]),
               startPoint: .top,
               endPoint: .bottom)
               VStack{
               Text(Lable).font(.system(size: 25))
                   .fontWeight(.bold).foregroundColor(lableColor).padding(.all, 10).lineLimit(0)
                   Text(LableType).font(.system(size: 20))

               }
           }

    }
}

struct InfectionsView_Previews: PreviewProvider {
    static var previews: some View {
        InfectionsView().previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
