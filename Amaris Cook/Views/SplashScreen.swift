//
//  SplashScreen .swift
//  Amaris Cook
//
//  Created by Emmanuel Zambrano Quitian on 1/17/23.
//

import SwiftUI

struct SplashScreen: View {
    let col1 = Color(red: 98/255, green: 174/98, blue: 94/255)
    let col2 = Color(red: 74/255, green: 132/98, blue: 68/255)
    //@State var isActive = true
    @State var size = 0.5
    @State var opacity = 0.5
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color("amarisC"),col2,col2], startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack{
                Spacer()
                HStack{
                    Image("emma").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150,height: 150)
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 150,height: 150)
                            .foregroundColor(Color("amarisC"))
                        Image("amaris").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150,height: 150)
                    }
                    
                }.scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeOut(duration: 2.5)) {
                            size = 1
                            opacity = 1
                        }
                    }
                Spacer()
                HStack{
                    Text("Power by: spoonacular")
                        .font(.system(size: 22))
                        .foregroundColor(.black)
                    Image("spoonacular")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35,height: 35)
                }.padding(.bottom, 30)
                
            }
        }.ignoresSafeArea()
        
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
