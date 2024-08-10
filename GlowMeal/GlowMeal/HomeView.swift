//
//  SearchView.swift
//  GlowMeal
//
//  Created by 주영정 on 8/10/24.
//
import SwiftUI

struct HomeView: View {
    // 현재 선택된 탭을 추적하는 변수
    @State private var selectedTab: String = "Search"
    
    // 각 탭의 정보를 담은 배열
    let tabs = [
        ("calendar", "Main"),
        ("magnifyingglass", "Search"),
        ("chart.line.uptrend.xyaxis", "Analysis"),
        ("person", "MyPage")
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            // 현재 선택된 탭에 따라 다른 뷰를 표시
            Group {
                switch selectedTab {
                case "Main":
                    MainView()
                case "Search":
                    SearchView()
                case "Analysis":
                    AnalysisView()
                case "MyPage":
                    MyPageView()
                default:
                    SearchView() // 기본적으로 SearchView를 표시
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Spacer()

            // Bottom Tab Bar
            HStack {
                ForEach(tabs, id: \.1) { tab in
                    Button(action: {
                        selectedTab = tab.1
                    }) {
                        VStack {
                            Image(systemName: tab.0)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 21, height: 21)
                            Text(tab.1)
                                .font(.system(size: 9))
                        }
                        .foregroundColor(selectedTab == tab.1 ? Color("turquoise") : Color("subColor"))
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding()
            .background(Color(UIColor.systemGray6))
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
