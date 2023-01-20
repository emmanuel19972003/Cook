//
//  recipe.swift
//  Amaris Cook
//
//  Created by Emmanuel Zambrano Quitian on 1/18/23.
//

import SwiftUI

struct recipe: View {
    let id: Int
    @StateObject private var vm = recipemodel()
    var body: some View {
        ScrollView{
            VStack{
                contentfull(data: vm.data)
                favbar(isfav: vm.favorite)
                    .padding(.top)
                    .padding(15)
                    .onTapGesture {
                        withAnimation {
                            vm.setFavorite()
                        }
                        
                    }
                secondMenu(vm: vm)
                if (vm.selected == "Instructions"){
                    VStack{
                        HStack(alignment: .center){
                            Text("Instructions").font(.largeTitle)
                            
                        }
                        Text(vm.cleanString(vm.data.instructions)).padding()
                        
                    }
                }else if (vm.selected == "Summary"){
                    VStack{
                        HStack(alignment: .center){
                            Text("Summary").font(.largeTitle)
                            
                        
                        
                        }
                        Text(vm.cleanString(vm.data.summary)).padding()
                        
                        
                        
                    }
                }
                
                
                
                
                Spacer()
            }
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        
        .onAppear{
            vm.id = id
            vm.fetchRecipe()
            vm.checkFavorite()
        }
        
        
    }
}

struct contentfull: View {
    let data: byRecipe
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: data.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                case .failure:
                    Image(systemName: "person.crop.circle.badge.exclamationmark")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                    
                default:
                    ProgressView().frame(maxWidth: .infinity)
                }
                
            }
            VStack(alignment: .center){
                Spacer()
                Text("\(data.title)")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
                    .background{
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.black.opacity(0.25))
                    }
                    .padding(.bottom)
                
            }
            
        }
        .frame(maxHeight: 250)
    }
    
}

struct contentfulltest: View {
    let url: String
    let name: String
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: "https://spoonacular.com/recipeImages/654959-312x231.jpg")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                case .failure:
                    Image(systemName: "person.crop.circle.badge.exclamationmark")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                    
                default:
                    ProgressView().frame(maxWidth: .infinity)
                }
                
            }
            VStack{
                Spacer()
                Text("\(name)")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
                    .background{
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.black.opacity(0.25))
                    }
                    .padding(.bottom)
                
                
            }
            
        }
        .frame(maxHeight: 250)
    }
    
}
struct favbar: View {
    let isfav: Bool
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(isfav ? .red : .white)
                    .frame(height: 40)
                    .overlay {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(isfav ? .red : .black, lineWidth: 2)
                    }
                HStack{
                    Text("Favories")
                        .foregroundColor(isfav ? .white : .black)
                    Spacer()
                    
                    Image(systemName: "heart"  )
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(isfav ? .white : .black)
                        .frame(width: 27, height: 27)
                    
                    
                    
                    
                    
                }.padding(.horizontal, 10)
            }
        }
        
        
    }
}
struct secondMenu: View {
    @Namespace private var recipearea
    @ObservedObject var vm: recipe.recipemodel
    let response =  0.55
    let dampingFraction = 0.625
    let blendDuration = 0.0
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color("G&W"))
                .frame(height: 54)
            HStack{
                Spacer()
                ZStack{
                    if (vm.selected == "Instructions"){
                        RoundedRectangle(cornerRadius: 8)
                            .matchedGeometryEffect(id: "selected", in: recipearea)
                            .foregroundColor(.white)
                            .shadow(radius: 5,y: 2)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                    }else{
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.clear)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                    }
                    
                    Text("Instructions")
                        .foregroundColor(.black)
                        .onTapGesture {
                            withAnimation(.spring(
                                response:  response,
                                dampingFraction: dampingFraction,
                                blendDuration: blendDuration
                            )){
                                vm.setSelected("Instructions")
                            }
                            
                        }
                    
                }
                
                Spacer()
                ZStack{
                    if (vm.selected == "Summary"){
                        RoundedRectangle(cornerRadius: 8)
                            .matchedGeometryEffect(id: "selected", in: recipearea)
                            .foregroundColor(.white)
                            .shadow(radius: 5,y: 2)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                    }else{
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.clear)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                    }
                    
                    Text("Summary")
                        .foregroundColor(.black)
                        .onTapGesture {
                            withAnimation(.spring(
                                response:  response,
                                dampingFraction: dampingFraction,
                                blendDuration: blendDuration
                            )){
                                vm.setSelected("Summary")
                            }
                            
                        }
                    
                }
                Spacer()
            }
            
        }.padding(.horizontal)
    }
}
struct recipe_Previews: PreviewProvider {
    static var previews: some View {
        recipe(id: 716426)
    }
}
