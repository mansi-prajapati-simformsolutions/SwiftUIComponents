//
//  ViewController.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 26/09/22.
//

import UIKit
import SwiftUI
import Combine

class HostViewController: UIViewController {
    private var anyCancellable: AnyCancellable!
    var loginObservable: LoginViewObservable?
    var label: UILabel?
    var text: String? {
        didSet {
            label?.text = text!
        }
    }
    var lableCallBack:(()->Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        let tap = UITapGestureRecognizer(target: self, action: #selector(abc))

        label = UILabel(frame: CGRect(x: view.frame.width/2 - 10, y: 50, width: 100, height: 100))
        label?.isUserInteractionEnabled = true
        label?.addGestureRecognizer(tap)
        view.addSubview(label!)
        self.label?.backgroundColor = .green
        self.label?.text = text
    }
    @objc
    func abc() {
        lableCallBack?()
    }
}

struct MyView: UIViewControllerRepresentable {
    @Binding var text: String
    class Coordinator: NSObject {
        @Binding var text: String
        init(text: Binding<String>) {
           _text = text
        }

        func abc() {

        }
    }
    typealias UIViewControllerType = HostViewController

    func makeUIViewController(context: Context) -> HostViewController {
        let vc = HostViewController()
        vc.text = text
        return vc
    }

    func updateUIViewController(_ uiViewController: HostViewController, context: Context) {

        uiViewController.loginObservable = LoginViewObservable()
        uiViewController.lableCallBack = context.coordinator.abc

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }

}

//struct MyView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyView()
//    }
//}

struct CustomColorButton: View {
    let color: Color
    var body: some View {
        Button("hello") {

        }.background(color).frame(width: 50, height: 50)
    }
}
