//
//  Extensions.swift
//  RickandMorty
//
//  Created by Kuldeep Singh on 12/04/23.
//

import Foundation
import UIKit


extension UIView{
    func addSubViews(_ views:UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}
