//
//  Test.swift
//  GlowMeal
//
//  Created by 이준후 on 8/11/24.
//

import SwiftUI

struct TestView: View {
    @State private var foodName: String = ""
    @State private var imageUrl: String? = nil
    
    var body: some View {
        VStack {
            if imageUrl == nil {
                TextField("Enter food name", text: $foodName, onCommit: fetchImage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: fetchImage) {
                    Text("Search")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            } else {
                if let imageUrl = imageUrl, let url = URL(string: imageUrl) {
                    AsyncImage(url: url)
                        .frame(width: 300, height: 300)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                } else {
                    Text("Image not available")
                        .foregroundColor(.gray)
                }
                
                Button(action: {
                    self.imageUrl = nil
                    self.foodName = ""
                }) {
                    Text("Search Again")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            }
        }
        .padding()
    }
    
    func fetchImage() {
        let apiKey = "AIzaSyAcYEGEH3TL6cv3242aATQ40vTO3Opixfo"
        let cx = "145917ea63bc7408d"
        let searchQuery = foodName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        let urlString = "https://www.googleapis.com/customsearch/v1?q=\(searchQuery)&cx=\(cx)&searchType=image&imgType=photo&fileType=jpg&imgSize=large&exactTerms=\(searchQuery)&key=\(apiKey)&num=1"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data found")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let items = json["items"] as? [[String: Any]],
                   let firstItem = items.first,
                   let imageLink = firstItem["link"] as? String {
                    DispatchQueue.main.async {
                        self.imageUrl = imageLink
                    }
                }
            } catch {
                print("JSON decoding error: \(error)")
            }
        }.resume()
    }
}

//@main
//struct YourAppNameApp: App {
//    var body: some Scene {
//        WindowGroup {
//            TestView()
//        }
//    }
//}
