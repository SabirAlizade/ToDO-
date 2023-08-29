//
//  UpdateViewModel.swift
//  ToDO!
//
//  Created by Sabir Alizade on 03.06.2022.
//

import Foundation

protocol UpdateProtocol {
    func update(note: String, index: Int)
}

class UpdateViewModel {
    var delegate: UpdateProtocol?
    
    var selectedIndex: Int = 0
    func updateData(note: String) {
        self.delegate?.update(note: note, index: selectedIndex)
    }
}
