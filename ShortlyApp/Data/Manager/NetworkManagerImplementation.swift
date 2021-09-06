//
//  NetworkManagerImplementation.swift
//  ShortlyApp
//
//  Created by Claudio Villanueva on 05-09-21.
//

import Alamofire

// swiftlint:disable force_cast
final class NetworkManagerImplementation: NetworkManager {

    private enum Constants {
        static let successStatusCodes: Range<Int> = 200..<300
    }

    private let alamofire: Session
    private let jsonDecoder = JSONDecoder()

    init(alamofire: Session) {
        self.alamofire = alamofire
    }

    func request<R>(
        url: String, onCompletion: @escaping (R) -> Void
    ) where R: Decodable {
        alamofire.request(
            url,
            method: .get,
            encoding: URLEncoding.default
        ).validate(statusCode: Constants.successStatusCodes)
        .responseJSON { [weak self] response in
            guard let self = self else { return }

            switch response.result {
            case .success:
                debugPrint("[NetworkManagerImplementation] request() SUCCESS response:\(response)")
                self.parseData(response.data, onCompletion)
            case .failure:
                debugPrint("[NetworkManagerImplementation] request() FAILURE")
                self.parseData(response.data, onCompletion)
            }
        }
    }

    private func parseData<R: Decodable>(
        _ data: Data?,
        _ onCompletion: @escaping (R) -> Void
    ) {
        if let dataAsJson = data {
            do {
                let dataAsObject: R = try decodeJson(dataAsJson: dataAsJson)
                onCompletion(dataAsObject)
            } catch {
                onCompletion(
                    ApiShortenResponse(
                        validResponse: false,
                        result: nil,
                        errorCode: 0,
                        error: ""
                    ) as! R
                )
            }
        } else {
            onCompletion(
                ApiShortenResponse(
                    validResponse: false,
                    result: nil,
                    errorCode: 0,
                    error: ""
                ) as! R
            )
        }
    }

    private func decodeJson<T: Decodable>(dataAsJson: Data) throws -> T {
        return try jsonDecoder.decode(T.self, from: dataAsJson)
    }
}
