//
//  search.swift
//  Amaris Cook
//
//  Created by Emmanuel Zambrano Quitian on 1/18/23.
//

import SwiftUI

struct search: View {
    @StateObject private var vm = searchmodel()
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 230))]
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 50)
                        .padding(.horizontal)
                        .foregroundColor(.gray.opacity(0.2))
                    TextField("What you want to eat ?!", text: $vm.search)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .padding(.horizontal)
                        .onSubmit {
                            vm.fetchmeals(name: vm.search)
                            vm.isSubmited = true
                        }
                }
                if (vm.isSubmited){
                    //NavigationView{
                    if (vm.data.results.count == 0){
                        Image(systemName: "multiply.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .padding()
                        Text("Not found").font(.largeTitle)
                    }else{
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
                                    Divider()
                                }
                                
                            }
                        }
                    }
                    
                    //} //navegation
                    
                }else{
                    Spacer()
                    Image("lunch")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                
                
                Spacer()
            }
        }//navegation
        
    }
}

struct search_Previews: PreviewProvider {
    static var previews: some View {
        search()
    }
}
