//
//  Calculation.swift
//  Tipsy
//
//  Created by Ghayoor ul Haq on 03/05/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Calculation {
    var totalBill: Float?
    var tip: Float?
    var persons: Float?
    var perPerson: Float?
    
    mutating func setTotalBill(value: String) {
        totalBill = Float(value)!
    }
    
    mutating func setTip(value: String){
        tip = Float(value)!
    }
    
    mutating func setPersons(value: String) {
        persons = Float(value)!
    }
    
    func getResult() -> String {
        let tipValue = tip!
        let totalBillValue = totalBill!
        let tipCalculation = ( tipValue/totalBillValue )*100
        
        let totalPersons = persons!
        return String(format: "%.2f",(totalBillValue+tipCalculation)/totalPersons)
        
    }
    
    func getMessage() -> String {
        let tipvlaue = String(format: "%.0f", tip!)
        let billValue = String(totalBill!)
        let personsValue = String(format: "%.0f", persons!)

        return "\(billValue) with tip of \(tipvlaue)% is divided to \(personsValue) persons"
    }
    
}
