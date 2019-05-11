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
        
        HttpService.request(
            path: "detect-face",
            method: .post,
            token: nil,
            headers: nil,
            parameters: nil,
            imageNames: ["file"],
            images: [image.jpegData(compressionQuality: 1)!]) { (response, error, seiLa) in
                if(error != nil){
                    completion("\(error!.localizedDescription)")
                }
    
                completion("Response: \(response.debugDescription)")
        }
        

//
//        // generate boundary string using a unique per-app string
//        let boundary = UUID().uuidString
//
//        //let base64 = image.pngData()?.base64EncodedData()
//        //let stringBase64  = String(data: base64!, encoding: .utf8)
//
//        let fileName = "upload"
//
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)
//
//        // Set the URLRequest to POST and to the specified URL
//        var urlRequest = URLRequest(url: URL(string: "http://172.20.10.5:5001/detect-face")!)
//        urlRequest.httpMethod = "POST"
//
//        // Set Content-Type Header to multipart/form-data, this is equivalent to submitting form data with file upload in a web browser
//        // And the boundary is also set here
//        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//
//        var data = Data()
//
//        // Add the image data to the raw http request data
//        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
//        data.append("Content-Disposition: form-data; name=\"file\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
//        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
//        data.append(image.pngData()!)
//
//        // End the raw http request data, note that there is 2 extra dash ("-") at the end, this is to indicate the end of the data
//        // According to the HTTP 1.1 specification https://tools.ietf.org/html/rfc7230
//        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
//
//        // Send a POST request to the URL, with the data we created earlier
//        session.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
//
//            if(error != nil){
//                completion("\(error!.localizedDescription)")
//            }
//
//            guard let responseData = responseData else {
//                completion("no response data")
//                return
//            }
//
//            if let responseString = String(data: responseData, encoding: .utf8) {
//                completion("Response: \(responseString)")
//            }
//        }).resume()
        
        
        
    }
}
