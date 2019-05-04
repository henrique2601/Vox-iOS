//
//  PeopleRecognitionWorker.swift
//  Vox
//
//  Created by Paulo Henrique dos Santos on 04/05/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class PeopleRecognitionWorker: PeopleRecognitionWorkerProtocol {
    func searchPeople(_ image: UIImage, completion: ((String) -> Void)!) {
        // generate boundary string using a unique per-app string
        let boundary = UUID().uuidString
        
        let fileName = "upload"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // Set the URLRequest to POST and to the specified URL
        var urlRequest = URLRequest(url: URL(string: "http://10.22.201.188:5001/detect-face")!)
        urlRequest.httpMethod = "POST"
        
        // Set Content-Type Header to multipart/form-data, this is equivalent to submitting form data with file upload in a web browser
        // And the boundary is also set here
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var data = Data()
        
//        // Add the reqtype field and its value to the raw http request data
//        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
//        data.append("Content-Disposition: form-data; name=\"\(fieldName)\"\r\n\r\n".data(using: .utf8)!)
//        data.append("\(fieldValue)".data(using: .utf8)!)
//
//        // Add the userhash field and its value to the raw http reqyest data
//        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
//        data.append("Content-Disposition: form-data; name=\"\(fieldName2)\"\r\n\r\n".data(using: .utf8)!)
//        data.append("\(fieldValue2)".data(using: .utf8)!)
        
        // Add the image data to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"file\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image.pngData()!)
        
        // End the raw http request data, note that there is 2 extra dash ("-") at the end, this is to indicate the end of the data
        // According to the HTTP 1.1 specification https://tools.ietf.org/html/rfc7230
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        // Send a POST request to the URL, with the data we created earlier
        session.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
            
            if(error != nil){
                completion("\(error!.localizedDescription)")
            }
            
            guard let responseData = responseData else {
                completion("no response data")
                return
            }
            
            if let responseString = String(data: responseData, encoding: .utf8) {
                completion("Response: \(responseString)")
            }
        }).resume()
    }
}
