//
//  CommunicationViewController.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 07/10/22.
//

import UIKit
import Combine
import SwiftUI

class CommunicationViewController: UIViewController {

    @IBOutlet weak var lblMessage: UILabel!

    private var anyCancellable: AnyCancellable!
    let loginObservable = LoginViewObservable()
    override func viewDidLoad() {
        super.viewDidLoad()

        let host = UIHostingController(rootView: CommunicationView(observable: loginObservable))
        self.addChild(host)
        self.view.addSubview(host.view)
        self.anyCancellable = loginObservable.$code.sink { name in
            print(name)
        }
    }
}
