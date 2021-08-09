//
//  ContentView.swift
//  SwiftUI-DataFlow
//
//  Created by Davido Hyer on 8/9/21.
//

import SwiftUI

// This project illustrates two different
// (similar) methods for requesting UIKit
// data from SwiftUI.

struct ContentView: View {
    // Method 1
    @StateObject var events = Events()
    @State private var debugText: String = ""
    
    // Method 2
    @StateObject var model = StateModel()
    
    var body: some View {
        VStack(spacing: 0) {
            // Method 1
            viewStack
            
            // Method 2
            viewStack2
        }
    }
    
    // Method 1
    var customView: CustomView {
        var view = CustomView(events: events)
        
        view.infoRetrieved = { info in
            debugText = info
        }
        
        return view
    }
    
    var method1Button: some View {
        Button("Get Data Method 1") {
            events.getInfo.send()
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(14)
    }
    
    var viewStack: some View {
        ZStack {
            customView
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text(debugText)
                    .foregroundColor(.white)
                method1Button
            }
        }
    }
    
    // Method 2
    var customView2: CustomView2 {
        CustomView2(model: model)
    }
    
    var method2Button: some View {
        Button("Get Data Method 2") {
            model.updateInfo()
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(14)
    }
    
    var viewStack2: some View {
        ZStack {
            customView2
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text(model.info)
                    .foregroundColor(.white)
                method2Button
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
