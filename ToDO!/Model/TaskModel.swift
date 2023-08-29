//
//  TaskModel.swift
//  ToDO!
//
//  Created by Sabir Alizade on 29.05.2022.
//

import Foundation

struct TaskModel: Codable {
    let name: String
    let createdAt: String
    var note: String? = nil
}
