//
//  NetworkManager.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Foundation

protocol NetworkManager {
    func request<R: Decodable>(
        url: String,
        onCompletion: @escaping (R) -> Void
    )
}
