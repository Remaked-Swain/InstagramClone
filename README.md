#  Instagram Clone with Firebase
인스타그램 앱을 만들어보자

* 참고자료: [YouTube: AppStuff](https://youtu.be/7UKUCZuaVlA)

---------------------------------------------

### Profile Tab
<img src="https://github.com/Remaked-Swain/ScreenShotRepository/blob/main/InstagramClone_ProfileView.png?raw=true" alt="ProfileView" width="200" height="400">
SF심볼에서 인스타그램에서 사용되는 아이콘과 최대한 비슷한 것으로 골라서 인스타그램 탭 중 하나인 ProfileView 를 클론해보았다.
특히 실제 앱과 최대한 비슷하게 레이아웃을 그리도록 신경쓰면서 진행하였다.

* MatchedGeometryEffect
    * 서로 다른 뷰 간에 matchedGeometryEffect 수정자를 사용하여 애니메이션되는 변경점에 대해 같이 적용받는 것으로 보이도록 할 수 있다.
    인스타그램에서는 게시글 탭, 릴스 탭, 개인사진 탭을 누르면 좌, 우로 트랜지션되면서 각 탭에 맞는 영상자료들이 보여지는데,
    이 탭을 전환하는 것을 보면 약간의 opacity 변경, 그리고 하단의 얇은 막대가 따라서 움직이는 것을 알 수 있다.
    matchedGeometryEffect 라는 이름공간에서 "gridContentType" 이라는 값으로 식별한다는 의미로 다음과 같이 작성하였다.
    ```Swift
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
    ```

* 추가사항
    * 만약 게시글이나 릴스, 유저에 대한 모델링이 설정되면 분명 엄청난 로직을 관리할 ViewModel 이 필요하게 될 것이다.
    각 뷰에 어떤 프로퍼티를 뷰모델로 빼서 관리하여야 할지, 또 추후 어떤 서비스클래스나 api 들이 연결될지 생각해가면서 코드를 작성해야할 것이다.

-----------------------------------------------

### Feed Tab
<img src="https://github.com/Remaked-Swain/ScreenShotRepository/blob/main/InstagramClone_FeedView.png?raw=true" alt="FeedView" width="200" height="400">

* Instagram Highlight
    * 스토리가 업데이트 되었을 때 사진 둘레로 나타나는 인스타그램 특유의 그라데이션 색상을 직접 만들어보니 영롱한 느낌이 들며 뿌듯했다.
    ```Swift
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
    ```
    > 내 계정의 스토리에서는 플러스 버튼이 나타나는 것과 닉네임이 아닌 "내 스토리" 라고 나타나는 점 등, 그리고 모델이 만들어질 경우 적용시키는 통로와 이미지가 없을 경우 대신 보여줄 기본이미지 등이 필요하다는 것을 염두에 두고 메모를 하며 진행하였다.
    > 또 인스타그램에서는 동그란 모양의 사진이 들어가는 곳이 정말 다양한 크기로 존재하는데, 이것을 따로 빼두고 재사용하는 방법을 고려해봐야겠다.
