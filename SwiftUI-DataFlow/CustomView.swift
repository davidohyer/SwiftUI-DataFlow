//
//  CustomView.swift
//  SwiftUI-DataFlow
//
//  Created by Davido Hyer on 8/9/21.
//

import Combine
import Foundation
import SwiftUI

public struct CustomView: UIViewControllerRepresentable {
    public typealias UIViewControllerType = CustomViewController
    
    public class Coordinator: NSObject {
        weak var viewController: UIViewControllerType?
        
        // Method to retrieve data from UIKit
        func retrieveInfo() -> String? {
            viewController?.retrieveData()
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    public func makeUIViewController(context: Context) -> CustomViewController {
        let viewController = CustomViewController()
        context.coordinator.viewController = viewController
        return viewController
    }
    
    public func updateUIViewController(_ uiViewController: CustomView.UIViewControllerType,
                                       context: UIViewControllerRepresentableContext<CustomView>) {
        
    }
}

public class CustomViewController: UIViewController, ObservableObject {
    private var blueView: BlueView {
        self.view as! BlueView
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        self.view = BlueView(frame: .zero)
    }

    // Method to be called from SwiftUI
    public func retrieveData() -> String {
        blueView.generateData()
    }
}
