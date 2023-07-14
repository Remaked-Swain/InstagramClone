//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Swain Yun on 2023/07/13.
//

import SwiftUI

struct ProfileView: View {
    @Namespace private var matchedGeometryEffect
    @State private var selectedContent: String = "squareshape.split.3x3"
    
    private let columns: [GridItem] = [.init(.flexible(), spacing: 1), .init(.flexible(), spacing: 1), .init(.flexible(), spacing: 1)]
    private let gridContentTypes: [String] = ["squareshape.split.3x3", "video", "person.crop.square"]
    
    var body: some View {
        NavigationStack {
            VStack {
                header
                
                ScrollView {
                    VStack(spacing: 15) {
                        userStatSummarySection
                        
                        userIntroSection
                        
                        HStack {
                            Image(systemName: "link")
                            
                            Text("github.com/Remaked-Swain")
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        .foregroundColor(.accentColor)
                        
                        profileControls
                        
                        highlights
                    }
                    
                    lazyPhotoGrid
                }
                
                Spacer()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    private var header: some View {
        HStack {
            HStack {
                Text("gol_d.dragon")
                    .font(.title.weight(.bold))
                Image(systemName: "chevron.down")
            }
            Spacer()
            HStack(spacing: 30) {
                Button {
                    // add menu
                } label: {
                    Image(systemName: "plus.square")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                }
                
                Button {
                    // setting menu
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .frame(width: 30)
                }
            }
            .frame(height: 25)
        }
        .padding(.horizontal)
    }
    
    private var userStatSummarySection: some View {
        HStack {
            Image("profilePhoto")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .background(Color.gray)
                .clipShape(Circle())
                .overlay(
                    Button {
                        // add picture to story
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 26, height: 26)
                            .background(
                                Circle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                            )
                            .offset(x: 38, y: 38)
                    }
                )
            
            Spacer()
            Spacer()
            
            HStack(spacing: 40) {
                UserStatView(value: 51, title: "게시물")
                UserStatView(value: 101, title: "팔로워")
                UserStatView(value: 78, title: "팔로잉")
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
    
    private var userIntroSection: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("윤금용")
                    .font(.headline)
                Text("To be good iOS developer.")
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
    
    private var profileControls: some View {
        HStack {
            Text("프로필 편집")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background(Color.gray.opacity(0.3).cornerRadius(10))
            
            Text("프로필 공유")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background(Color.gray.opacity(0.3).cornerRadius(10))
            
            Image(systemName: "person.badge.plus")
                .font(.headline)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.3).cornerRadius(10))
        }
        .padding(.horizontal)
    }
    
    private var highlights: some View {
        ScrollView(.horizontal) {
            HighlightButton()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .padding()
    }
    
    private var lazyPhotoGrid: some View {
        LazyVGrid(columns: columns, pinnedViews: .sectionHeaders) {
            Section {
                ForEach(0..<10) { index in
                    Image("profilePhoto")
                        .resizable()
                        .scaledToFill()
                }
            } header: {
                // pinned header
                HStack(spacing: 1) {
                    ForEach(gridContentTypes, id: \.self) { type in
                        VStack {
                            Image(systemName: type)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 24)
                            
                            if selectedContent == type {
                                Rectangle()
                                    .frame(height: selectedContent == type ? 2 : 1)
                                    .foregroundColor(selectedContent == type ? .black : .gray.opacity(0.3))
                                    .matchedGeometryEffect(id: "gridContentType", in: matchedGeometryEffect)
                            } else {
                                Rectangle()
                                    .frame(height: selectedContent == type ? 2 : 1)
                                    .foregroundColor(selectedContent == type ? .black : .gray.opacity(0.3))
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                selectedContent = type
                            }
                        }
                    }
                }
                .padding(.top)
                .background(Color.white)
            }
        }
    }
}
