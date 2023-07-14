//
//  StoryPhotoView.swift
//  InstagramClone
//
//  Created by Swain Yun on 2023/07/14.
//

import SwiftUI

enum StoryCircleType {
    case mine, other
}

struct StoryCircleView: View {
    @State private var isUpdated: Bool = true
    
    let type: StoryCircleType
    let gradientColors: [Color] = [.yellow, .orange, .red, .pink, .purple, .indigo]
    let lineWidth: CGFloat = 4
    let paddingSize: CGFloat = 8
    
    init(type: StoryCircleType) {
        self.type = type
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                if isUpdated {
                    Circle()
                        .stroke(
                            LinearGradient(
                                colors: gradientColors,
                                startPoint: .bottomLeading,
                                endPoint: .topTrailing
                            ),
                            lineWidth: lineWidth
                        )
                        .frame(width: 88, height: 88)
                }
                
                Image("profilePhoto")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 76, height: 76)
                    .clipShape(Circle())
                    .overlay(
                        Button {
                            // add picture to story
                        } label: {
                            if type == .mine {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .background(
                                        Circle()
                                            .frame(width: 34, height: 34)
                                            .foregroundColor(.white)
                                    )
                                    .offset(x: 30, y: 30)
                            }
                        }
                    )
            }
            
            Text("내 스토리")
                .font(.callout)
        }
        .padding(paddingSize)
    }
}

struct StoryPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        StoryCircleView(type: .mine)
    }
}
