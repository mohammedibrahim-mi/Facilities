////
////  facilityModel.swift
////  Facilities
////
////  Created by Pixel on 28/06/23.
////
//
import Foundation
//
//
//// MARK: - Facilities
//struct Facilities: Codable {
//    let facilities: [Facility]
//    let exclusions: [[Exclusion]]
//}
//
//// MARK: - Exclusion
//struct Exclusion: Codable {
//    let facilityID, optionsID: String
//
//    enum CodingKeys: String, CodingKey {
//        case facilityID
//        case optionsID
//    }
//}
//
//// MARK: - Facility
//struct Facility: Codable, Identifiable {
//    let facilityID, name: String
//    let options: [Option]
//    let id = UUID().uuidString
//
//
//    enum CodingKeys: String, CodingKey {
//        case facilityID
//        case name, options
//    }
//}
//
//// MARK: - Option
//struct Option: Codable {
//    let name, icon, id: String
//}

struct FacilityOption: Codable {
    let name: String
    let icon: String
    let id: String
}

struct Facility: Codable {
    let facilityID: String
    let name: String
    let options: [FacilityOption]
    
    enum CodingKeys: String, CodingKey {
        case facilityID = "facility_id"
        case name
        case options
    }
}

struct APIResponse: Codable {
    let facilities: [Facility]
}





