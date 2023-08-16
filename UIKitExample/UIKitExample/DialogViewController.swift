//
//  DialogViewController.swift
//  UIKitExample
//
//  Created by HANYU, Koji on 2023/08/16.
//

import UIKit
import SwiftUI

class DialogViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // SwiftUI.viewをhostingViewControllerを使って取り込む
        let dialogView = DialogView(delegate: self)
        let hostingViewController = UIHostingController(rootView: dialogView)
        hostingViewController.view.backgroundColor = .clear // 背景ビューを見えるようにするために必要

        // VC, viewの追加
        addChild(hostingViewController)
        view.addSubview(hostingViewController.view)

        // hostingViewControllerをVC.view全体にフィットさせる
        configureAutoLayoutToFill(view: hostingViewController.view, parent: self.view)

        hostingViewController.didMove(toParent: self)

        view.backgroundColor = .clear // 背景ビューを見えるようにするために必要
    }
    
    private func configureAutoLayoutToFill(view: UIView, parent: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            parent.topAnchor.constraint(equalTo: view.topAnchor),
            parent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            parent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            parent.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

    }
}

extension DialogViewController: DialogViewDelegate {
    func closeButtonDidTap() {
        dismiss(animated: true)
    }
    
    func backgroundViewDidTap() {
        dismiss(animated: true)
    }
}
