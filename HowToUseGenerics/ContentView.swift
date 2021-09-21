//
//  ContentView.swift
//  HowToUseGenerics
//
//  Created by ramil on 21.09.2021.
//

import SwiftUI

class GenericsViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    init() {
        dataArray = ["one", "two", "three"]
    }
    
    func removeDataFromDataArray() {
        dataArray.removeAll()
    }
}



struct ContentView: View {
    
    @StateObject private var vm = GenericsViewModel()
    
    var body: some View {
        VStack {
            ForEach(vm.dataArray, id: \.self) { item in
                Text(item)
                    .onTapGesture {
                        vm.removeDataFromDataArray()
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
