//
//  DashboardViewModel.swift
//  ToDO!
//
//  Created by Sabir Alizade on 31.05.2022.
//

import Foundation

class DashboardViewModel {
    private let password: String = "anykey"
    let userDefault = UserDefaults.standard
    var data: [TaskModel] = []
    
    func saveData() {
        userDefault.saveTask(data: self.data, key: password)
    }
    func readData() -> [TaskModel] {
        return userDefault.read(key: password)
    }
}
