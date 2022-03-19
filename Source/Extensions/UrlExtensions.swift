//
//  UrlExtensions.swift
//  SwiftKORE
//
//  Created by Leif Ashley on 3/18/22.
//

import Foundation
import Combine
import UIKit

extension URL {
    func assignWebImage<Root>(session: URLSession = .shared, to keypath: ReferenceWritableKeyPath<Root, UIImage?>, on object: Root) -> AnyCancellable {
        return session.dataTaskPublisher(for: self)
            .tryMap { $0.data }
            .replaceError(with: Data())
            .compactMap { UIImage(data: $0) }
            .receive(on: DispatchQueue.main)
            .assign(to: keypath, on: object)
    }
}

extension URLComponents {
    /// Assists in adding name/value pairs to a URLComponent, for cleaner code
    mutating func addQueryString(name: String, value: String) {
        if queryItems == nil {
            queryItems = [URLQueryItem]()
        }
        
        queryItems?.append(URLQueryItem(name: name, value: value))
    }
}
