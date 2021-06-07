//
//  AppError.swift
//  TheMarvelProject_B3_DebarsheeGhosh
//
//  Created by Debarshee Ghosh on 6/7/21.
//

import Foundation

enum AppError: Error {
    case invalidUrl
    case serverError
    case noResponse
    case noData
    case parsingError
    case badResponse
    case parseError
    case badRequest
    case genericError(String)
}
