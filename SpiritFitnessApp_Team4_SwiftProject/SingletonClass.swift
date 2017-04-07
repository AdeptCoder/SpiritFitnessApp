//
//  SingletonClass.swift
//  SpiritFitnessApp_Team4_SwiftProject
//
//  Created by Sumirna Philips on 4/4/17.
//  Copyright © 2017 19483. All rights reserved.
//

import Foundation

class SingletonClass{
    
    static let shared = SingletonClass()
     var isAlreadyLaunchedOnce = false
    var isLoggedin = false
    
    private init(){}
}
