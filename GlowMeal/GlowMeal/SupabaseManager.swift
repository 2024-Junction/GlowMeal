//
//  SupabaseManager.swift
//  GlowMeal
//
//  Created by 이준후 on 8/11/24.
//

import Foundation
import Supabase

class SupabaseManager {
    static let shared = SupabaseManager()
    
    public let supabaseClient: SupabaseClient

    init() {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_URL") as? String,
              let key = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_KEY") as? String,
              let supabaseURL = URL(string: url) else {
            fatalError("Supabase URL or Key not configured properly in environment variables.")
        }
        
        supabaseClient = SupabaseClient(supabaseURL: supabaseURL, supabaseKey: key)
    }
}
