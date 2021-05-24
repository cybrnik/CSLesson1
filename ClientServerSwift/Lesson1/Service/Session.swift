//
//  Session.swift
//  ClientServerSwift
//
//  Created by Nikita on 24.05.2021.
//

import Foundation

class Session {
    private init() {}
    static let shared = Session()
    var token: String = ""
    var userId: Int = 0
}
