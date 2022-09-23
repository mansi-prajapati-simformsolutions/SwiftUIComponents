//
//  ApiManager.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 04/10/22.
//

import Foundation

class ApiManager {
    static func request<T: Codable> (url: String,method: String,requestData: Data,responseClass: T.Type, responseCode: Int, onSuccess:@escaping (T) -> (), onFailure: @escaping (ErrorResponse) -> ()) {

        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = requestData
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            DispatchQueue.main.async {
                guard let responseData = data else{
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == responseCode {
                        guard let responseData = try? JSONDecoder().decode(T.self, from: responseData) else {return}
                        onSuccess(responseData)
                    }
                    else {
                        guard let errors = try? JSONDecoder().decode(ErrorResponse.self, from: responseData) else {return}
                        onFailure(errors)
                    }
                }
            }
        }.resume()
    }
}
