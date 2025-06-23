//
//  ContentView.swift
//  YXSwiftUIXM
//
//  Created by 姚肖 on 2025/6/19.
//

import SwiftUI

struct Conversation: Identifiable {
    let id = UUID()  // 自动生成唯一ID
    let name: String
    let imageName: String
}

struct ContentView: View {
    
    let items = [Conversation(name: "ceshi8", imageName: "https://oss.guangxijunxuan.cn/l300612693/avatar/2024-12/82630d881c95f1e11fbcc8a20625c005.jpg"),
        Conversation(name: "ceshi6", imageName: "https://oss.guangxijunxuan.cn/l300379620/avatar/2024-12/04652219e0fae13e7494310fa83c1880.jpg"),
        Conversation(name: "yxyx8", imageName: "https://oss.guangxijunxuan.cn/a900042782/avatar/2025-04/ea0d28bd053bedd4b1c68ebb1f795dee.jpg"),
        Conversation(name: "yxyx6", imageName: "https://oss.guangxijunxuan.cn/y1100012158/greet/2025-06/r7oii61749797490.png"),
        Conversation(name: "yxyx7", imageName: "https://oss.guangxijunxuan.cn/l300709549/avatar/2025-03/ce234247e9a878746db88a562cdae242.jpg")] as [Conversation]
    
    @State private var selectedTab = 0
    @State private var title = "云信IM"
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                List {
                    ForEach(items) { item in
                        NavigationLink(destination: DetailPage(navTitle: item.name)) {
                            HStack {
                                AsyncImage(url: URL(string: item.imageName)) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFit()
                                    } else {
                                        ProgressView()
                                    }
                                }
                                .frame(width: 60, height: 60)
                                .cornerRadius(30)
                                Text(item.name)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                }
                .tabItem {
                    Label("首页", systemImage: "house")
                }
                .tag(0)
                
                Text("发现")
                    .tabItem {
                        Label("发现", systemImage: "magnifyingglass")
                    }
                    .tag(1)
                    .onTapGesture {
                        print("=== \(selectedTab)")
                    }
                
                Text("我的")
                    .tabItem {
                        Label("我的", systemImage: "person")
                    }
                    .tag(2)
            }
            .tabViewStyle(.automatic)  // 自动适配系统样式
            .navigationTitle(title)
            .onChange(of: selectedTab) { oldValue, newValue in
                if (newValue == 1) {
                    title = "通讯录"
                } else if (newValue == 2) {
                    title = "个人中心"
                } else {
                    title = "云信IM"
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
