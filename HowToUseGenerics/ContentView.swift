//
//  ContentView.swift
//  HowToUseGenerics
//
//  Created by ramil on 21.09.2021.
//

import SwiftUI

struct GenericModel<T> {
    let info: T?
    func removeInfo() -> GenericModel {
        GenericModel(info: nil)
    }
}

struct StringModel {
    let info: String?
    func removeInfo() -> StringModel {
        StringModel(info: nil)
    }
}

class GenericsViewModel: ObservableObject {
    @Published var stringModel = StringModel(info: "Hello, world!")
    @Published var genericStringModel = GenericModel(info: "Hello,  Generics!")
    
    func removeData() {
        stringModel = stringModel.removeInfo()
        genericStringModel = genericStringModel.removeInfo()
    }
}

struct ContentView: View {
    @StateObject private var vm = GenericsViewModel()
    
    var body: some View {
        VStack {
            Text(vm.genericStringModel .info ?? "no data")
                .onTapGesture {
                    vm.removeData()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
