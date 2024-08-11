//
//  SearchView.swift
//  GlowMeal
//
//  Created by 주영정 on 8/10/24.
//
import SwiftUI

struct HomeView: View {
    // 현재 선택된 탭을 추적하는 변수
    @State private var selectedTab: String = "Main"
    
    // 각 탭의 정보를 담은 배열
    let tabs = [
        ("Main_tabicon", "Main"),
        ("Nutrition_tabicon", "Nutrition"),
        ("Analysis_tabicon", "Analysis"),
        ("MyPage_tabicon", "MyPage")
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            // 현재 선택된 탭에 따라 다른 뷰를 표시
            Group {
                switch selectedTab {
                case "Main":
                    MainView()
                case "Nutrition":
                    NutritionView()
                case "Analysis":
                    AnalysisView()
                case "MyPage":
                    MyPageView()
                default:
                    MainView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Spacer()
            
            // Bottom Tab Bar
            VStack(spacing: 0) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray1)
                HStack {
                    ForEach(tabs, id: \.1) { tab in
                        Button(action: {
                            selectedTab = tab.1
                        }) {
                            VStack {
                                Image(tab.0)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                                Text(tab.1)
                                    .font(.system(size: 9))
                            }
                            .foregroundColor(selectedTab == tab.1 ? Color("turquoise") : Color("subColor"))
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .padding()
                .background(Color.white)
            }
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
