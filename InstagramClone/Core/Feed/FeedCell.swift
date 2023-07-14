//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Swain Yun on 2023/07/14.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack {
            header
            
            post
            
            actionButtons
            
            commentSection
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}

extension FeedCell {
    private var header: some View {
        HStack {
            Image("profilePhoto")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text("gol_d.dragon")
            
            Spacer()
            
            Text("팔로우")
                .frame(width: 90, height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.gray.opacity(0.2))
                )
                .padding(.horizontal)
            
            Button {
                // post menu
            } label: {
                Image(systemName: "ellipsis")
                    .foregroundColor(.black)
            }
        }
        .font(.headline)
        .padding(.horizontal)
    }
    
    private var post: some View {
        Image("profilePhoto")
            .resizable()
            .scaledToFill()
            .frame(height: 400)
            .clipShape(Rectangle())
    }
    
    private var actionButtons: some View {
        HStack {
            HStack(spacing: 16) {
                Button {
                    // likes post
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                
                Button {
                    // comment on post
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                
                Button {
                    // share post, direct message
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }
            .tint(.black)
            
            Spacer()
            
            // post indicators
            
            Image(systemName: "bookmark")
                .imageScale(.large)
        }
        .font(.headline)
        .padding(.vertical, 4)
        .padding(.horizontal, 8)
    }
    
    private var commentSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("좋아요 \(1998)개")
                .font(.headline)
            
            HStack {
                Text("gol_d.dragon ").font(.headline) +
                Text("다자이후, 후쿠오카")
            }
            
            Text("1시간 전")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 8)
    }
}
