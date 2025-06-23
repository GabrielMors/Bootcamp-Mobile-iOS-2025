//
//  NetworkLogger.swift
//  CamadaNetwork
//
//  Created by Gabriel Mors Pulga on 23/06/25.
//

import Foundation

class NetworkLogger {
  static func log(request: URLRequest, response: URLResponse?, data: Data?, error: Error?, verbose: Bool = true, startTime: Date = Date()) {

    print("------------ 🚀 START OF REQUEST 🚀  ------------")

    print("Timestamp: \(formatterDate())")
    let elapsedTime = Date().timeIntervalSince(startTime)
    print("Request Duration: \(String(format: "%.2f", elapsedTime)) seconds")

    if let url = request.url {
      print("Request URL: \(url.absoluteString)")
    }

    if let httpMethod = request.httpMethod {
      print("HTTP Method: \(httpMethod)")
    }

    if verbose, let headers = request.allHTTPHeaderFields {
      print("Request Headers: \(headers)")
    }

    if verbose, let body = request.httpBody, let bodyString = String(data: body, encoding: .utf8) {
      print("Body Request: \(bodyString)")
    }

    if let httpResponse = response as? HTTPURLResponse {
      let statusIcon: String = (200...299).contains(httpResponse.statusCode) ? "✅" : "❌"
      print("Status code: \(httpResponse.statusCode) \(statusIcon)")
    } else if let error {
      print("🔴 Error: \(error.localizedDescription)")
    } else {
      print("🔴 Error: Not Response and no Error")
    }

    if verbose, let responseHeaders = (response as? HTTPURLResponse)?.allHeaderFields as? [String: Any] {
      print("Response Headers: \(responseHeaders)")
    }

    if let data {
      if let jsonString = parseJSON(data: data) {
        print("JSON Response: ⬇️\n\(jsonString)")
      } else if let rawResponse = String(data: data, encoding: .utf8) {
        print("Raw Response: ⬇️\n\(rawResponse)")
      } else {
        print("🔴 Error: Parse")
      }
    } else {
      print("🔴 Error: Not Data")
    }

    print("------------ 🏁 END OF REQUEST 🏁  ------------")
  }

  private static func parseJSON(data: Data) -> String? {
    do {
      let jsonObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
      let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
      return String(data: jsonData, encoding: .utf8)
    } catch {
      print("Failed to serialize JSON: \(error.localizedDescription) ")
      return nil
    }
  }

  private static func formatterDate() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    formatter.locale = Locale(identifier: "pt_BR") // Definindo local como brasil
    return formatter.string(from: Date())
  }

  static func logError(error: NetworkError, url: String) {
    print("------------ ❌ START OF ERROR ❌  ------------")
    print("Timestamp: \(formatterDate())")
    print("Failed URL: \(url)")
    print("Error: \(error.errorDescription ?? "")")
    print("------------ ❌ END OF ERROR ❌  ------------")
  }
}
