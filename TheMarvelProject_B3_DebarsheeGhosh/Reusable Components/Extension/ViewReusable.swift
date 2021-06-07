//
//  ViewReusable.swift
//  TheMarvelProject_B3_DebarsheeGhosh
//
//  Created by Debarshee Ghosh on 6/7/21.
//

import Foundation

protocol ViewReusable {
    static var identifier: String { get }
}

extension ViewReusable {
    static var identifier: String {
        String(describing: self)
    }
}
