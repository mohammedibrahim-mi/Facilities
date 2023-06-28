//
//  MainView.swift
//  Facilities
//
//  Created by Pixel on 28/06/23.
//

import SwiftUI
import Alamofire


struct MainView: View {
    
    @State private var facilities: [Facility] = []
    @State private var disabledOptions: Set<String> = []
   
     
    func fetchFacilities() {
        let url = "https://my-json-server.typicode.com/iranjith4/ad-assignment/db" // Replace with your API endpoint URL
        
        AF.request(url).responseDecodable(of: APIResponse.self) { response in
            switch response.result {
            case .success(let apiResponse):
                self.facilities = apiResponse.facilities
            case .failure(let error):
                print("API error: \(error)")
            }
        }}
    
    var body: some View {
        
        VStack {
            Text("Demo App")
                .font(.title)
                .padding(.top,20.0)
            VStack(alignment: .leading){
                Button(
                    action: {
                    disabledOptions.removeAll()
                        },
                
                    label: {Text("Reset All")}
                
                )   .frame(width: 100,height: 30)
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding([.all],5.0)
                    .background(Color.blue)
                    .cornerRadius(15)
                List(facilities, id: \.facilityID) { facility in
                    Text(facility.name)
                        .font(.headline)
                    VStack(alignment: .leading) {
                        
            
                        List(facility.options, id: \.id) { option in
                            HStack {
                                Image(option.icon)
                                Text(option.name).foregroundColor(disabledOptions.contains(option.id) ? .red : .blue)
                                    .tag(option.id)
                                    .onTapGesture {
                                                    print("----> " + option.id)
                                                                    if  option.id == "4" {
                                                                        print("hi")
                                                                        // Disable the button when the facility ID is 4 and option ID is 6
                                                                        disabledOptions.insert("6")
                                                                    }
                                        if  option.id == "4" {
                                            print("hi")
                                            // Disable the button when the facility ID is 4 and option ID is 6
                                            disabledOptions.insert("6")
                                            disabledOptions.insert("1")
                                            disabledOptions.insert("2")
                                            disabledOptions.insert("3")
                                        }
                                        if  option.id == "3" {
                                            print("hi")
                                            // Disable the button when the facility ID is 4 and option ID is 6
                                            disabledOptions.insert("12")
                                            disabledOptions.insert("1")
                                            disabledOptions.insert("2")
                                            disabledOptions.insert("4")
                                  
                                        }
                                        if  option.id == "7" {
                                            print("hi")
                                            // Disable the button when the facility ID is 4 and option ID is 6
                                            disabledOptions.insert("12")
                                            disabledOptions.insert("6")
                                        }
                                                }
                                
                            }
                            .frame(height: 40)
                            .opacity(disabledOptions.contains(option.id) ? 0.5 : 1.0) // Reduce opacity for disabled options
                            .disabled(disabledOptions.contains(option.id))
                        }
                        .listStyle(PlainListStyle())
                        .frame(height: 230)
                        
                       
                    }.frame(height: 200)
                    
                    
                    
                    
                }
                .listStyle(PlainListStyle())
                .onAppear {
                    fetchFacilities()
                }
                
            }
            .padding([.leading], 10.0)
           
        }
        
        
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
