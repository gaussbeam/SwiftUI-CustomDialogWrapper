//
//  ViewController.swift
//  UIKitExample
//
//  Created by HANYU, Koji on 2023/08/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showCustomDialogButtonDidTap(_ sender: UIButton) {
        let vc = DialogViewController()
        vc.modalPresentationStyle = .custom
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
}

