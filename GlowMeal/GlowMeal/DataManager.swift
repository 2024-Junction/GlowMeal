//
//  DataManager.swift
//  GlowMeal
//
//  Created by 이준후 on 8/11/24.
//

import Foundation

class DataManager: ObservableObject {
    
    let supabaseClient = SupabaseManager.shared.supabaseClient
    
    // @Published로 UserInfo 추가
    @Published var userInfo: UserInfo?
    
    func saveUserInfo(userId: String, birthDate: Date, conceptionDate: Date) async throws {
        let createdAt = Date() // 데이터가 생성된 시간
        
        // ISO8601 형식으로 변환
        let dateFormatter = ISO8601DateFormatter()
        let birthDateString = dateFormatter.string(from: birthDate)
        let conceptionDateString = dateFormatter.string(from: conceptionDate)
        let createdAtString = dateFormatter.string(from: createdAt)
        
        // Codable 구조체를 사용하여 데이터 생성
        let userInfo = UserInfo(
            uid: userId,
            created_at: createdAtString,
            birth_date: birthDateString,
            conception_date: conceptionDateString
        )
        
        // 데이터 삽입
        do {
            let response = try await supabaseClient
                .from("User_info")
                .insert(userInfo)
                .execute()
            print("All information saved successfully: \(response)")
            
            // 데이터 삽입이 성공하면 @Published 속성을 업데이트
            DispatchQueue.main.async {
                self.userInfo = userInfo
            }
            
        } catch {
            print("Failed to save information: \(error)")
        }
    }
    
    func fetchUserInfo(userId: String) async -> UserInfo? {
        do {
            let response = try await supabaseClient
                .from("User_info")
                .select("*")
                .eq("uid", value: userId)
                .single()  // 단일 결과를 기대하는 경우
                .execute()
            
            print("Response data: \(String(data: response.data, encoding: .utf8) ?? "Invalid data")")
            
            let userInfo = try JSONDecoder().decode(UserInfo.self, from: response.data)
            
            // 가져온 데이터를 @Published 속성에 저장
            DispatchQueue.main.async {
                self.userInfo = userInfo
            }
            
            return userInfo
        } catch {
            print("Failed to fetch user info: \(error.localizedDescription)")
            return nil
        }
    }
    
    func calculatePregnancyWeeks(from conceptionDate: Date) -> Int {
        let calendar = Calendar.current
        let currentDate = Date()
        let components = calendar.dateComponents([.weekOfYear], from: conceptionDate, to: currentDate)
        let days = calendar.dateComponents([.day], from: conceptionDate, to: currentDate).day ?? 0
        return days / 7
    }
}

struct UserInfo: Codable {
    let uid: String
    let created_at: String
    let birth_date: String
    let conception_date: String
}


