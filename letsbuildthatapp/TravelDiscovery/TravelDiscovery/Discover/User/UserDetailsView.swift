//
//  UserDetailsView.swift
//  TravelDiscovery
//
//  Created by Serhii Onyshchenko on 09.02.2024.
//

// api
// https://travel.letsbuildthatapp.com/travel_discovery/user?id=0

import SwiftUI
import Kingfisher

struct UserDetailsView: View {

    @ObservedObject var vm: UserDetailsViewModel
    let user: User

    init(user: User) {
        self.vm = .init(userId: user.id)
        self.user = user
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                Image(user.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding(.horizontal)
                    .padding(.top)

//                Text(user.name)
                Text("\(vm.userDetails?.firstName ?? "") \(vm.userDetails?.lastName ?? "")")
                    .font(.system(size: 14, weight: .semibold))

                HStack {
                    // option + 8
                    Text("@\(vm.userDetails?.username ?? "") •")
                    Image(systemName: "hand.thumbsup.fill")
                        .font(.system(size: 10, weight: .semibold))
                    Text("2541")
                }
                .font(.system(size: 12, weight: .regular))

                Text("YouTuber, Vlogger, Travel Creator")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(.lightGray))

                HStack(spacing: 12) {
                    VStack {
                        Text("\(vm.userDetails?.followers ?? 0)")
                            .font(.system(size: 13, weight: .semibold))
                        Text("Followers")
                            .font(.system(size: 9, weight: .regular))
                    }

                    Spacer()
                        .frame(width: 1, height: 12)
                        .background(Color(.lightGray))

                    VStack {
                        Text("\(vm.userDetails?.following ?? 0)")
                            .font(.system(size: 13, weight: .semibold))
                        Text("Following")
                            .font(.system(size: 9, weight: .regular))
                    }
                }

                HStack(spacing: 12) {
                    Button(action: {}, label: {
                        Spacer()
                        Text("Follow")
                            .foregroundColor(.white)
                        Spacer()
                    })
                    .padding(.vertical, 8)
                    .background(Color.orange)
                    .cornerRadius(.infinity)

                    Button(action: {}, label: {
                        Spacer()
                        Text("Contact")
                            .foregroundColor(.black)
                        Spacer()
                    })
                    .padding(.vertical, 8)
                    .background(Color(white: 0.9))
                    .cornerRadius(.infinity)
                }
                .font(.system(size: 12, weight: .semibold))

                ForEach(vm.userDetails?.posts ?? [], id: \.self) { post in
                    VStack(alignment: .leading) {
//                        Image("japan")
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()

                        HStack {
                            Image(user.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 44)
                                .clipShape(Circle())

                            VStack(alignment: .leading) {
                                Text(post.title)
                                    .font(.system(size: 14, weight: .semibold))
                                Text("\(post.views) views")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundColor(.gray)
                            }
                        }
//                        .padding(.top, -30)
                        .padding(.horizontal, 8)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(post.hashtags, id: \.self) { hashtag in
                                    Text("#\(hashtag)")
                                        .font(.system(size: 13, weight: .regular))
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 4)
                                        .foregroundColor(Color(#colorLiteral(
                                            red: 0.07797152549,
                                            green: 0.513774395,
                                            blue: 0.9998757243,
                                            alpha: 1
                                        )))
                                        .background(Color(#colorLiteral(
                                            red: 0.9057956338,
                                            green: 0.9333867431,
                                            blue: 0.9763537049,
                                            alpha: 1
                                        )))
                                        .cornerRadius(20)
                                }
                            }
                            .padding(.horizontal, 8)
                            .padding(.bottom)
                        }
                    }
//                    .frame(height: 200)
                    .background(Color(white: 1))
                    .cornerRadius(12)
                    .shadow(color: .init(white: 0.8), radius: 5, x: 0, y: 4)
                }
            }
            .padding(.horizontal)
        }
//        .navigationTitle(user.name)
        .navigationTitle("\(vm.userDetails?.firstName ?? "") \(vm.userDetails?.lastName ?? "")")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        UserDetailsView(user: .init(id: 0, name: "Amy Adams", imageName: "amy"))
    }
}

#Preview {
    DiscoverView()
}
