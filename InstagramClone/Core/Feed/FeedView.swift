//
//  FeedView.swift
//  InstagramClone
//
//  Created by Swain Yun on 2023/07/14.
//

import SwiftUI

struct FeedView: View {
    @State private var scrollViewOffset: CGFloat = 0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    header
                    
                    ScrollView(.horizontal) {
                        LazyHStack {
                            StoryCircleView(type: .mine)
                        }
                    }
                    
                    LazyVStack {
                        ForEach(0..<10) { post in
                            FeedCell()
                        }
                    }
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

extension FeedView {
    private var header: some View {
        HStack {
            HStack {
                Text("Instagram Clone")
                    .font(.title)
                    .fontWeight(.bold)
                
                Image(systemName: "chevron.down")
            }
            
            Spacer()
            
            HStack(spacing: 30) {
                Button {
                    // notifications
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                }
                
                Button {
                    // direct messages
                } label: {
                    Image(systemName: "paperplane")
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
}
