//
//  Test.swift
//  GlowMeal
//
//  Created by 이준후 on 8/11/24.
//

import SwiftUI

struct Test: View {
    @State private var query: String = ""
    @State private var response: String = ""
    @State private var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("쿼리를 입력하세요", text: $query)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                sendQuery()
            }) {
                Text("쿼리 전송")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            if isLoading {
                ProgressView("로딩 중...")
            } else {
                Text("응답: \(response)")
                    .padding()
            }
            
            Spacer()
        }
        .padding()
    }
    
    func sendQuery() {
        guard !query.isEmpty else { return }
        
        isLoading = true
        
        let urlString = "http://13.211.66.3:3000/food/search/\(query)"
        guard let url = URL(string: urlString) else {
            self.response = "유효하지 않은 URL"
            self.isLoading = false
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("*/*", forHTTPHeaderField: "accept")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                
                if let error = error {
                    self.response = "오류: \(error.localizedDescription)"
                    print(self.response)
                    return
                }
                
                guard let data = data, let responseString = String(data: data, encoding: .utf8) else {
                    self.response = "유효하지 않은 응답"
                    return
                }
                print(responseString)
                self.response = responseString
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}


//@main
//struct YourAppNameApp: App {
//    var body: some Scene {
//        WindowGroup {
//            Test()
//        }
//    }
//}
