//
//  DetailsPresenter.swift
//  Course2FinalTask
//
//  Created by Олеся on 13.10.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import Foundation
import DataProvider

typealias PiCtuRe = UIImage

class DetailsPresenter: NSObject {
    
   private let model: DetailsModel
    weak var cell: DetailsCell?
    
    init(model: DetailsModel) {
        self.model = model
    }
    
    
    
}
extension DetailsPresenter: DetailsOutputProtocol {
    
    
    var title: String {
//        тут возможно надо сделать свич для перехода и заголовка с энамом типа тайплист заголовков
        return "Details"
    }
   
    
    func viewIsReady() {
        
    }
    
}
