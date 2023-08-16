//
//  DialogView.swift
//  UIKitExample
//
//  Created by HANYU, Koji on 2023/08/16.
//

import SwiftUI

protocol DialogViewDelegate: CustomDialogViewDelegate {
    func closeButtonDidTap()
}

struct DialogView: View {
    var delegate: DialogViewDelegate
    
    var body: some View {
        CustomDialogView(delegate: delegate) {
            VStack(spacing: 12.0) {
                Text("hello")
                Button("close") {
                    delegate.closeButtonDidTap()
                }
            }
        }
    }
}

struct DialogView_Previews: PreviewProvider {
    static var previews: some View {
        DialogView(delegate: DelegateMock())
    }
    
    private final class DelegateMock: DialogViewDelegate {
        func closeButtonDidTap() {}
        func backgroundViewDidTap() {}
    }

}
