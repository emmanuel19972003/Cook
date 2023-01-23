//
//  NoWifi.swift
//  Amaris Cook
//
//  Created by Emmanuel Zambrano Quitian on 1/23/23.
//

import SwiftUI

struct NoWifi: View {
    var body: some View {
        ZStack{
            Circle().frame(width: 700).foregroundColor(Color("GreenC"))
                .offset(y:420)
            
            VStack{
                Text("No conexion").font(.largeTitle)
                Image(systemName: "wifi.exclamationmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .padding()
                ZStack{
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 300 ,height: 50)
                    
                    
                    
                    Text("Try again").foregroundColor(Color("W&B"))
                        .font(.largeTitle)
                    
                }.padding()
                
            }.padding()
            
            
            
        }    }
}

struct NoWifi_Previews: PreviewProvider {
    static var previews: some View {
        NoWifi()
    }
}
