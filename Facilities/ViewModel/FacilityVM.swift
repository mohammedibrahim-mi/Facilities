//
//  FacilityVM.swift
//  Facilities
//
//  Created by Pixel on 28/06/23.
//

import Foundation
import Alamofire


class FacilityVM : ObservableObject {
    
    @Published var data: [Facility] = []
    
    func fetchFacilities() {
        let url = "https://my-json-server.typicode.com/iranjith4/ad-assignment/db" // Replace with your API endpoint URL
        
        AF.request(url).responseDecodable(of: APIResponse.self) { response in
            switch response.result {
            case .success(let apiResponse):
                self.data = apiResponse.facilities
            case .failure(let error):
                print("API error: \(error)")
            }
        }}
    
    
}
