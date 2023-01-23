//
//  home.swift
//  Amaris Cook
//
//  Created by Emmanuel Zambrano Quitian on 1/17/23.
//

import SwiftUI

struct home: View {
    @StateObject private var vm = modelodeHome()
    @StateObject var networkMonitor = NetworkMonitor()
    //NoWifi
    var body: some View {
        if (vm.active){
            VStack{
                if (networkMonitor.isActive){
                    if (vm.tap == 0){
                        meals()
                    }else if (vm.tap == 1){
                        search()
                    }else if (vm.tap == 2){
                        favorite()
                    }
                }else{
                    NoWifi()
                }
                
                Spacer()
                tapbarcustom(SelectedTap:$vm.tap,itemsss:
                                [taps(ids: 0, Icon: "clock.fill", NotSelectIcon: "clock", SelectedColor: .blue),
                                 taps(ids: 1, Icon: "magnifyingglass.circle.fill", NotSelectIcon: "magnifyingglass", SelectedColor: .green),
                                 taps(ids: 2, Icon: "heart.fill", NotSelectIcon: "heart", SelectedColor: .red)
                                 
                                ]).background(Color("W&B"))
            }
        }else{
            SplashScreen().onAppear{
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                    vm.active = true
                }
            }
        }
        
    }
}

struct home_Previews: PreviewProvider {
    static var previews: some View {
        home()
    }
}
