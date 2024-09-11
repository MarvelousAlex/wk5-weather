//
//  ContentView.swift
//  wk5-weather
//
//  Created by Wendy Zhou on 4/9/2024.
//

import SwiftUI
import WeatherKit

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
