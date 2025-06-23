//
//  DetailPage.swift
//  YXSwiftUIXM
//
//  Created by 姚肖 on 2025/6/19.
//

import SwiftUI

struct DetailPage: View {
    
    var navTitle : String
    @State private var text = ""
    @State private var datas = ["a", "b", "c"] as [String]
    var body: some View {
        NavigationView {
            VStack {
                ScrollViewReader { proxy in
                    List {
                        ForEach(datas, id: \.self) { item in
                            Text(item)
                        }
                    }.onChange(of: text) { oldValue, newValue in
                        if text.count == 0, let lastItem = datas.last {
                            withAnimation {
                                proxy.scrollTo(lastItem, anchor: .bottom)
                            }
                        }
                    }
                }
                TextField("请输入文本", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onSubmit {
                        datas.append(text)
                        text = ""
                    }
            }
        }.navigationTitle(navTitle)
         .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailPage(navTitle: "ttt")
}
