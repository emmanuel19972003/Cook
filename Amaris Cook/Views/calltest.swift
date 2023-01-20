//
//  calltest.swift
//  Amaris Cook
//
//  Created by Emmanuel Zambrano Quitian on 1/19/23.
//

import SwiftUI

struct calltest: View {
    var data = bytype(results: [], offset: 1, number: 2, totalResults: 5)
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).onTapGesture {
            let calls = calls()
            calls.fetchmealsbyType(name: "pizza"){ data , error in
                if (data == nil){
                    print("error")
                }else{
                    print("data en el archivo \(data)")
                }
                
            }
        }
    }
}

struct calltest_Previews: PreviewProvider {
    static var previews: some View {
        calltest()
    }
}
