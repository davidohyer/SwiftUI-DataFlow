//
//  ContentView.swift
//  SwiftUI-DataFlow
//
//  Created by Davido Hyer on 8/9/21.
//

import SwiftUI

struct ContentView: View {
    @State private var debugText: String = ""
    
    var body: some View {
        ZStack {
            customView
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text(debugText)
                    .foregroundColor(.white)
                Button("Get Data") {
//                    // retrieve the data from the view here somehow
//                    debugText = customView.retrieveData()
                }
                .padding(10)
                .background(Color.white)
                .cornerRadius(14)
            }
        }
        .onAppear(perform: {
            // ???
        })
    }
    
    var customView: CustomView {
        let view = CustomView()
        return view
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
