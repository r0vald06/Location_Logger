//
//  Item.swift
//  Location_Logger
//
//  Created by raudel Valdes on 12/2/18.
//  Copyright © 2018 Raudel Valdes. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: Date
    
    init(name: String, serialNumber: String?, valueInDollars: Int) {
        self.name = name
        self.valueInDollars = valueInDollars //you have to use self to distinguish
        //the preperty from the argument name
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if random {
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            var idx = arc4random_uniform(UInt32(adjectives.count))//getting random number within the size of the array
            let randomAdjective = adjectives[Int(idx)] //choosing random adjective
            
            idx = arc4random_uniform(UInt32(nouns.count))//getting random number within the size of the array
            let randomNoun = nouns[Int(idx)] //choosing random noun
            
            let randomName = "\(randomAdjective) \(randomNoun)" //combining the adjective and noun to make a name
            let randomValue = Int(arc4random_uniform(100)) // getting a random number from 0 to 100
            let randomSerialNumber =
                UUID().uuidString.components(separatedBy: "-").first! //creating a serial number?
            self.init(name: randomName, //this function calls the function above and sets the value of the variables
                      serialNumber: randomSerialNumber,
                      valueInDollars: randomValue)
        } else {
            self.init(name: "", serialNumber: nil, valueInDollars: 0)
        }
    }
}
