//
//  CustomDialogView.swift
//  SwiftUIExample
//
//  Created by HANYU, Koji on 2023/08/15.
//

import SwiftUI

protocol CustomDialogViewDelegate: AnyObject {
    func backgroundViewDidTap()
}

struct CustomDialogView<Content: View>: View {
    private var width: CGFloat
    private var padding: CGSize
    private weak var delegate: CustomDialogViewDelegate?
    private var content: () -> Content

    private let cornerRadius: CGFloat = 8.0

    init(width: CGFloat = 280.0,
         hPadding: CGFloat = 16.0,
         vPadding: CGFloat = 24.0,
         delegate: CustomDialogViewDelegate,
         @ViewBuilder content: @escaping () -> Content) {
        self.width = width
        self.padding = CGSize(width: hPadding, height: vPadding)
        self.delegate = delegate
        self.content = content
    }

    var body: some View {
        ZStack {
            // ダイアログの背景として、半透明のビューを後方に敷いておく
            Color(.gray.withAlphaComponent(0.5))
                // 背景のタップ時処理。基本的にはdelegate側でUIViewController.dismiss()を呼ぶ
                .onTapGesture {
                    delegate?.backgroundViewDidTap()
                }
            // 背景のビューの前面に、`content`として渡されたビューを重ねる
            content().frame(width: width)
                .padding(.horizontal, padding.width)
                .padding(.vertical, padding.height)
                .background(.white)
                .cornerRadius(cornerRadius)
        }
            // 半透明のビューを画面全体に表示するため、SafeAreaは無視する
        .ignoresSafeArea()
            // デフォルトだとビュー全体の背景は白色になっており、背景のビューが見えなくなるので、.clearにしておく
            .background(Color.clear)
    }
}
struct CustomDialogView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDialogView(delegate: DelegateMock()) {
            Text("hello")
        }
    }
    
    private final class DelegateMock: CustomDialogViewDelegate {
        func backgroundViewDidTap() {}
    }
}
