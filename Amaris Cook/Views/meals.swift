//
//  meals.swift
//  Amaris Cook
//
//  Created by Emmanuel Zambrano Quitian on 1/17/23.
//

import SwiftUI

struct meals: View {
 
    
    @StateObject private var vm = mealsmodel()
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 230))]
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color("amarisC"), lineWidth: 3)
                        .frame(height: 60)
                        .padding()
                    HStack{
                        topItems(tag: "maincourse", icon: "fork.knife", name: "Main", vm: vm)
                        topItems(tag:"salad", icon: "carrot.fill", name: "Salad", vm: vm)
                        topItems(tag: "Dessert", icon: "birthday.cake.fill", name: "Dessert", vm: vm)
                    }.padding()
                    
                    
                }
                Divider()
                ScrollView{
                    LazyVGrid(columns: adaptiveColumns, spacing: 20){
                        //control de emty
                        ForEach(vm.data.results, id: \.self) { item in
                            ZStack {
                                
                                NavigationLink(destination:
                                                
                                    recipe(id: item.id)
                                               
                                    .padding(), label: {
                                        contentm(data: item)
                                    }).navigationBarTitleDisplayMode(.inline)
                                
                                //.buttonStyle(PlainButtonStyle())
                                
                                
                                
                                
                                
                            }
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(.gray.opacity(0.5))
                                .padding(.horizontal)
                        }
                        
                    }
                }
                
                
                Spacer()
                
                
            }
        }.onAppear{
            vm.selected = "Main"
            vm.fetchdata(name: "maincourse")
        }
        
    }
}
struct topItems: View {
    let tag:String
    let icon:String
    let name:String
    @ObservedObject var vm: meals.mealsmodel
    //@Binding var selected:String
    var body: some View {
        
        
        HStack{
            
            Image(systemName: icon).resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25,height: 25)
            Text(name).font(.system(size: 16))
            
            
        }
        .foregroundColor(vm.selected == name ? .white : .black)
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(vm.selected == name ? .blue : .white)
                .padding(5)
        }.onTapGesture {
            //invocar el dato que cambia el nombre y los doatos
            vm.fetchdata(name: name)
        }
        
        
        
    }
}
struct contentm: View {
    let data: Result
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: data.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 150, maxHeight: 150)
                case .failure:
                    Image(systemName: "person.crop.circle.badge.exclamationmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 150, maxHeight: 150)
                    
                default:
                    ProgressView().frame(maxWidth: 150, maxHeight: 150)
                }
                
            }.padding(5)
            VStack(alignment: .leading){
                Text("\(data.title)")
                    .font(.title3)
                    .foregroundColor(Color("B&W"))
                    .multilineTextAlignment(.leading)
                    .frame(width: 200)
                    .padding()
                
                
            }
            
            Image(systemName: "arrow.right.circle").padding(.trailing)
            
        }
    }
    
}
struct meals_Previews: PreviewProvider {
    static var previews: some View {
        meals()
    }
}
