//
//  OnBoardingView.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 10/10/22.
//

import SwiftUI

struct OnBoardingView: View {
    var data = OnboradingModel.onboardingData

    @State var selection = 0
    var body: some View {
        VStack {
            Image("OnboardingHeader").resizable().frame(width: 100, height: 50)
            TabView(selection: $selection , content: {
                ForEach(0..<data.count, id: \.self){
                    index in CardView(item : data[index]).tag(index)
                }
            }).tabViewStyle(.page).background(.clear)
                .indexViewStyle(.page(backgroundDisplayMode: .never)).onAppear {
                    setupAppearance()
                }
            ExtractedView(title: "GET STARTED", destination: ContentView()).padding(.horizontal, 30)
            HStack {
                Text("Don't have an account? ")
                    .foregroundColor(Color.background)
                //                    NavigationLink("go", value: ViewValue.taskView)
                //                    Navi gationLink("go", value: ViewValue.listView)
                Text("Sign In")
                    .underline()
                    .foregroundColor(.orange)
                    .onTapGesture {
                        // showNextScreen = true
                        //$coordinator.path.wrappedValue.append(ViewValue.taskView)
                    }
            }.padding(.vertical, 10)
        }
    }

    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .orange
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color.darkTextColor)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}

struct CardView: View {
    var item: OnboradingModel
    var body: some View {
        VStack(spacing: 20) {
            Text(item.titles).foregroundColor(.darkTextColor).font(.custom("Montserrat-Bold", size: 21)).lineLimit(2).multilineTextAlignment(.center)
            Text(item.descriptions).foregroundColor(.darkTextColor).font(.custom("Montserrat-Medium", size: 13)).multilineTextAlignment(.center)
            Image(item.onBoardingImages).resizable().frame(width: 150, height: 200)
        }
        //.scaleEffect(x:1.5, y:1.5, anchor: .center)

    }
}

