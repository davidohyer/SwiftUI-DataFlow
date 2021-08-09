//
//  CustomView2.swift
//  SwiftUI-DataFlow
//
//  Created by Davido Hyer on 8/9/21.
//

import Combine
import Foundation
import SwiftUI

class StateModel: ObservableObject {
    let onRetrieveSubject = PassthroughSubject<Void, Never>()
    @Published var info: String = ""
    
    func updateInfo() {
        onRetrieveSubject.send()
    }
}

public struct CustomView2: UIViewControllerRepresentable {
    public typealias UIViewControllerType = CustomViewController2
    
    @ObservedObject var model: StateModel
    
    public class Coordinator2: NSObject {
        var cancellables = Set<AnyCancellable>()
        weak var viewController: UIViewControllerType?
        
        // Method to retrieve data from UIKit
        func retrieveInfo(on model: StateModel) {
            model.onRetrieveSubject
                .print()
                .compactMap { [unowned self] _ -> String? in
                    self.viewController?.retrieveData()
                }
                .sink { info in
                    model.info = info
                }
                .store(in: &cancellables)
        }
    }
    
    public func makeCoordinator() -> Coordinator2 {
        Coordinator2()
    }
    
    public func makeUIViewController(context: Context) -> CustomViewController2 {
        let viewController = CustomViewController2()
        context.coordinator.viewController = viewController
        context.coordinator.retrieveInfo(on: model)        
        return viewController
    }
    
    public func updateUIViewController(_ uiViewController: CustomView2.UIViewControllerType,
                                       context: UIViewControllerRepresentableContext<CustomView2>) {
        
    }
}

public class CustomViewController2: UIViewController, ObservableObject {
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
