//
//  CloudKitManager.swift
//  FoodPin
//
//  Created by Ufuk Canlı on 1.12.2021.
//

import CloudKit

final class CloudKitManager: ObservableObject {
    
    @Published private(set) var restaurants = [CKRecord]()
    
    func fetchRestaurants() {
        let query = CKQuery(recordType: "Restaurant", predicate: NSPredicate(value: true))
        let database = CKContainer.default().publicCloudDatabase
        database.perform(query, inZoneWith: nil) { [self] records, error in
            DispatchQueue.main.async {
                guard let records = records, error == nil else {
                    print(error?.localizedDescription as Any)
                    return
                }
                records.forEach { record in
                    restaurants.append(record)
                }
            }
        }
    }
    
}
