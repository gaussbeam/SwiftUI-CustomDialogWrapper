//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by HANYU, Koji on 2023/08/15.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "globe")
                    .resizable()
                    .frame(width: 150, height: 150)
                Button("Show custom dialog") {
                    viewModel.setNeedsToShowDialog()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            if viewModel.isCustomDialogShowing {
                customDialog
            }
        }
    }
    
    var customDialog: some View {
        CustomDialogView(delegate: viewModel) {
            VStack(spacing: 12.0) {
                Text("hello")
                Button("close") {
                    viewModel.setNeedsToHideDialog()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class ContentViewModel: ObservableObject {
    @Published var isCustomDialogShowing: Bool = false
    
    func setNeedsToShowDialog() {
        isCustomDialogShowing = true
    }
    
    func setNeedsToHideDialog() {
        isCustomDialogShowing = false
    }
}

extension ContentViewModel: CustomDialogViewDelegate {
    func backgroundViewDidTap() {
        setNeedsToHideDialog()
    }
}
