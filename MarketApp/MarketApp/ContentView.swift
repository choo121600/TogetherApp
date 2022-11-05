//
//  ContentView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

enum CateGoryType: String {
case top, bottom, outer, shoes, acc, etc

var CateGoryName: String {
    switch self {
    case .top:
        return "상의"
    case .bottom:
        return "하의"
    case .outer:
        return "아우터"
    case .shoes:
        return "슈즈"
    case .acc:
        return "악세서리"
    case .etc:
        return "기타"
    
    }
}

}


struct ContentView: View {
@State private var showingAlert = false
private let categoryData : [CateGoryType] = [.top, .bottom, .outer, .shoes, .acc, .etc]
var body: some View {
    NavigationView {
        TabView {
            ScrollView(.vertical, showsIndicators: true) {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        
                        ForEach(categoryData,id:\.self) {
                            item in
                            Button {
                                
                            } label: {
                                Text(item.CateGoryName)
                                    .font(.system(size: 15, weight: .bold))
                                    .frame(width: 72, height: 45, alignment: .center)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(14)
                            }
                            
                        }
                        
                    }
                }
                ForEach(0..<5) { _ in
                    LazyHStack {
                        ForEach(0..<2) { _ in
                            NavigationLink(destination: ProductView()){
                                LazyVStack {
                                    VStack {
                                        Image(systemName: "gift")
                                            .resizable()
                                            .frame(width: 140, height: 160, alignment: .center)
                                            .foregroundColor(Color.black)
                                        Button {
                                            
                                        } label: {
                                            Image(systemName:"heart.fill")
                                                .frame(width: 18, height: 18,alignment: .top)
                                                .foregroundColor(.white)
                                        }
                                        
                                    }.background(.gray)
                                   
                                    Text("Maison Kitsune")
                                        .font(.system(size: 12, weight: .bold))
                                        .frame(width: 140, height: 10, alignment: .leading)
                                        .foregroundColor(.black)
                                    Text("더블 폭스 패치 스니커즈")
                                        .font(.system(size: 13, weight: .medium))
                                        .frame(width: 140, height: 10, alignment: .leading)
                                        .foregroundColor(.black)
                                    Text("281,000원")
                                        .font(.system(size: 12, weight: .bold))
                                        .frame(width: 140, height: 10, alignment: .leading)
                                        .foregroundColor(.black)
                                }
                                .padding(20)
                            }
                        }
                    }
                }
            }.tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Home")
                }
            // 리스트 관련 탭 설정
            Text("List Tab")
              .tabItem {
                Image(systemName: "2.square.fill")
                Text("List")
              }
            // 즐겨찾기 관련 탭 설정
            Text("Favorite Tab")
              .tabItem {
                Image(systemName: "3.square.fill")
                Text("Favorite")
              }
              .badge(10)
            // 프로필 관련 탭 설정
            Text("Profile Tab")
              .tabItem {
                Image(systemName: "4.square.fill")
                Text("Profile")
              }
        }.navigationTitle("APP NAME").navigationBarTitleDisplayMode(.inline)
        }
        
    } // var body: some View 끝
}


struct ContentView_Previews: PreviewProvider {
static var previews: some View {
    ContentView()
    }
}

