//
//  ContentView.swift
//  NewsAPI
//
//  Created by Owen Davis (student LM) on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var json = "Loading..."
    var body: some View {
        VStack {
            Text(json)
        }
        .task {
            let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2024-11-10&sortBy=publishedAt&apiKey=94388a4be929440581310b7d3f2caedb")!

            let (data, _) = try! await URLSession.shared.data(from: url)
           
            json = String(decoding: data, as: UTF8.self)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
