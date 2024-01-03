// Copyright (c) 2019 Razeware LLC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
// distribute, sublicense, create a derivative work, and/or sell copies of the
// Software in any work that is designed, intended, or marketed for pedagogical or
// instructional purposes related to programming, coding, application development,
// or information technology.  Permission for such use, copying, modification,
// merger, publication, distribution, sublicensing, creation of derivative works,
// or sale is expressly withheld.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import SwiftUI

struct CustomToggle: UIViewRepresentable {
    var isOn: Bool
    var callback: (() -> Void)?

    func makeUIView(context: Context) -> UISwitch {
        let uiView = UISwitch()
        uiView.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didChange(sender:)),
            for: .valueChanged
        )

        return uiView
    }

    func updateUIView(_ uiView: UISwitch, context _: Context) {
        // This is appGreen
        uiView.onTintColor = UIColor(red: 21.0 / 255.0, green: 132.0 / 255.0, blue: 67.0 / 255.0, alpha: 1)
        uiView.isOn = isOn
    }

    func makeCoordinator() -> CustomToggle.Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var control: CustomToggle

        init(_ control: CustomToggle) {
            self.control = control
        }

        @objc func didChange(sender: UISwitch) {
            control.isOn = sender.isOn
            control.callback?()
        }
    }
}

struct CustomToggleView: View {
    var isOn: Bool
    var callback: (() -> Void)?
    var body: some View {
        CustomToggle(isOn: isOn, callback: callback)
    }
}
