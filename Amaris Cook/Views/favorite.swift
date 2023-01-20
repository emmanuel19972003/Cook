//
//  favorite.swift
//  Amaris Cook
//
//  Created by Emmanuel Zambrano Quitian on 1/18/23.
//

import SwiftUI

struct favorite: View {
    @StateObject private var vm = favoritemodel()
    var body: some View {
        NavigationView {
            VStack{
                topFav()
                if (vm.data.count == 0){
                    VStack{
                        Spacer()
                        Image(systemName: "books.vertical")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                        //.accentColor
                            .foregroundColor(Color("M&G"))
                            .padding()
                        Text("Not favorites").font(.largeTitle)
                        Spacer()
                    }
                }else{
                    ScrollView{
                        ForEach(vm.data, id: \.self) { itme in
                            
                            NavigationLink(destination:
                                            recipe(id: itme.id)
                                .padding(), label: {
                                    VStack{
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 15)
                                                .shadow(color: .black, radius: 5,y: 2)
                                                //.foregroundColor(Color("W&G"))
                                                .foregroundColor(Color("W&Gligt"))
                                                .frame(height: 200)
                                            favcontent(data: itme)
                                        }
                                        
                                        .padding()
                                    }
                                }).navigationBarTitleDisplayMode(.inline)
                            
                            
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(.gray.opacity(0.5))
                                .padding(.horizontal)
                        }
                    }
                    .onAppear{
                        vm.getData()
                    }
                }
                
                
                
            }
        }
        .onAppear{
            vm.getData()
        }
    }
}

struct favcontent: View {
    let data: favorititem
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: data.img)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 180)
                case .failure:
                    Image(systemName: "person.crop.circle.badge.exclamationmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 180)
                    
                default:
                    ProgressView().frame(maxWidth: 180)
                }
                
            }.padding(5)
            VStack(alignment: .leading){
                Text("\(data.title)")
                    .font(.title3)
                    .foregroundColor(Color("B&W"))
                    .multilineTextAlignment(.leading)
                    .padding()
                
                
            }
            
            Image(systemName: "arrow.right.circle").padding(.trailing)
            
        }
    }
    
}

struct topFav: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .padding(.horizontal)
                .foregroundColor(.gray.opacity(0.2))
            HStack(alignment: .center){
                Image(systemName: "fork.knife.circle").resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.gray)
                    .frame(height: 30)
                    .padding(.leading)
                Spacer()
                Text("Favortes").font(.title)
                Spacer()
                Image(systemName: "heart.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.red)
                    .frame(height: 30)
                    .padding(.trailing)
                
            }.padding(.horizontal)
        }.frame(height: 50)
    }
}

struct favorite_Previews: PreviewProvider {
    static var previews: some View {
        favorite()
    }
}
