//
//  ContentView.swift
//  Example
//
//  Created by Kristóf Kálai on 21/10/2023.
//

import LazyView
import SwiftUI

struct ContentView: View {
    private struct DetailsView: View {
        init() {
            print("Init is called")
        }

        var body: some View {
            Text("Details")
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Tap me! Init is called beforehand ❌") {
                    DetailsView()
                }
                NavigationLink("Tap me! Init is called only after navigation ✅") {
                    LazyView(DetailsView())
                }
                NavigationLink("Tap me! Init is called only after navigation ✅") {
                    LazyView {
                        DetailsView()
                    }
                }
                LazyNavigationLink("Tap me! Init is called only after navigation ✅") {
                    DetailsView()
                }
                LazyNavigationLink("Tap me! Init is called only after navigation ✅") {
                    LazyView(DetailsView())
                }
                LazyNavigationLink("Tap me! Init is called only after navigation ✅") {
                    LazyView {
                        DetailsView()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
