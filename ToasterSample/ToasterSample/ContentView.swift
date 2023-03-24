//
//  ContentView.swift
//  ToasterSample
//
//  Created by Ryohei Kameyama on 2023/03/24.
//

import SwiftUI
import Toaster

struct ContentView: View {
    @StateObject var toast = ToastMessages()

    var body: some View {
        VStack {
            Button("Show Toast") {
                toast.present(.defaultSuccess(text: "Success!"))
            }
        }
        .padding()
        .toast(
            toast,
            layout: .init(padding: .init(
                top: 0,
                leading: 16,
                bottom: 16,
                trailing: 16
            ))
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
