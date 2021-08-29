//
//  SmaillWedgit.swift
//  COVID-19
//
//  Created by Mustafa Jamal on 10/12/20.
//  Copyright © 2020 Mustafa Jamal. All rights reserved.
//

import SwiftUI
import WidgetKit

struct SmallWidget: View {
    var color : Color = .purple
    var Lable : String = ""
    var body: some View {
        ZStack{
       LinearGradient(
        gradient: Gradient(colors: [color.opacity(0.5), .white]),
           startPoint: .top,
           endPoint: .bottom)
           VStack{
           Text(Lable).font(.system(size: 25))
            .fontWeight(.bold).foregroundColor(.purple).padding(.all, 10).lineLimit(0)
               Text("Infections").font(.system(size: 20))

           }
       }
    }
}

struct SmaillWedgit_Previews: PreviewProvider {
    static var previews: some View {
            SmallWidget().previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
