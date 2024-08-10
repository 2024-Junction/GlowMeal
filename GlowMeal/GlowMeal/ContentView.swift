//
//  ContentView.swift
//  GlowMeal
//
//  Created by 이준후 on 8/10/24.
//

import SwiftUI
import GoogleSignIn

struct ContentView: View {
    @State private var user: GIDGoogleUser?
    @State private var token: String?

    var body: some View {
        VStack {
            if user == nil {
                Button(action: signIn) {
                    Text("Sign in with Google")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            } else {
                Text("Logged in as \(user?.profile?.name ?? "Unknown")")
            }
        }
    }

    func signIn() {
        // Create the Google sign-in configuration
        let config = GIDConfiguration(clientID: "<YOUR_CLIENT_ID>")

        // Get the root view controller
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
            print("No root view controller found.")
            return
        }

        // Start the sign-in process
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
            if let error = error {
                print("Error during sign-in: \(error.localizedDescription)")
                return
            }

            // Access the signed-in user
            guard let user = result?.user else { return }
            self.user = user

            let idToken = user.idToken?.tokenString
            sendTokenToServer(token: idToken)
        }
    }

    func sendTokenToServer(token: String?) {
        guard let token = token else { return }
        let url = URL(string: "http://your-django-server.com/auth/social/google/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = ["access_token": token]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return }

            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                if let authToken = json["token"] as? String {
                    self.token = authToken
                }
            }
        }.resume()
    }
}
