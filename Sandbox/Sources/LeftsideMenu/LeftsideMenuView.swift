//
//  LeftsideMenuView.swift
//  Sandbox
//
//  Created by Dima Disavle on 20.07.2023.
//

import SwiftUI

struct LeftsideMenuView: View {
	@State var index = 0
	@State var show = false
	@State var name = "Дима"

	var body: some View {
		ZStack {
			// TODO: Why? HStack
			HStack {
				VStack(alignment: .leading, spacing: 12) {
					Image(systemName: "person.fill")
						.resizable()
						.scaledToFit()
						.frame(width: 120, height: 120)
						.background(Color(UIColor.tertiarySystemBackground))
						.clipShape(Circle())

					Text("Привет, \(name)")
						.font(.title)
						.fontWeight(.bold)
						.foregroundColor(Color.white)
						.padding(.top, 10)

					Button {
						self.index = 0

						withAnimation {
							self.show.toggle()
						}
					} label: {
						HStack(spacing: 25) {
							Image(systemName: "bag.fill")
								.foregroundColor(self.index == 0 ? Color(UIColor.label) : Color(UIColor.secondaryLabel))
							Text("Каталог")
								.foregroundColor(self.index == 0 ? Color(UIColor.label) : Color(UIColor.secondaryLabel))
						} .padding(.vertical, 10)
							.padding(.horizontal)
							.background(self.index == 0 ? Color(UIColor.label).opacity(0.2) : Color.clear)
							.cornerRadius(10)
					} .padding(.top, 25)
					Button {
						self.index = 1

						withAnimation {
							self.show.toggle()
						}
					} label: {
						HStack(spacing: 25) {
							Image(systemName: "cart.fill")
								.foregroundColor(self.index == 1 ? Color(UIColor.label) : Color(UIColor.secondaryLabel))
							Text("Корзина")
								.foregroundColor(self.index == 1 ? Color(UIColor.label) : Color(UIColor.secondaryLabel))
						} .padding(.vertical, 10)
							.padding(.horizontal)
							.background(self.index == 1 ? Color(UIColor.label).opacity(0.2) : Color.clear)
							.cornerRadius(10)
					}
					Button {
						self.index = 2

						withAnimation {
							self.show.toggle()
						}
					} label: {
						HStack(spacing: 25) {
							Image(systemName: "heart.fill")
								.foregroundColor(self.index == 2 ? Color(UIColor.label) : Color(UIColor.secondaryLabel))
							Text("Избранное")
								.foregroundColor(self.index == 2 ? Color(UIColor.label) : Color(UIColor.secondaryLabel))
						} .padding(.vertical, 10)
							.padding(.horizontal)
							.background(self.index == 2 ? Color(UIColor.label).opacity(0.2) : Color.clear)
							.cornerRadius(10)
					}
					Button {
						self.index = 3

						withAnimation {
							self.show.toggle()
						}
					} label: {
						HStack(spacing: 25) {
							Image(systemName: "shippingbox.fill")
								.foregroundColor(self.index == 3 ? Color(UIColor.label) : Color(UIColor.secondaryLabel))
							Text("Мои заказы")
								.foregroundColor(self.index == 3 ? Color(UIColor.label) : Color(UIColor.secondaryLabel))
						} .padding(.vertical, 10)
							.padding(.horizontal)
							.background(self.index == 3 ? Color(UIColor.label).opacity(0.2) : Color.clear)
							.cornerRadius(10)
					}

					Divider()
						.frame(width: 150, height: 1)
						.background(Color.white)
						.padding(.vertical, 30)

					Button { } label: {
						HStack {
							Image(systemName: "escape")
								.foregroundColor(.white)
							Text("Выход")
								.foregroundColor(.white)
						} .padding(.vertical, 10)
							.padding(.horizontal)
					}

					Spacer(minLength: 0)
				} .padding(.top, 25)
					.padding(.horizontal, 20)
				Spacer(minLength: 0)
			} .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
				.padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.bottom)

			// MARK: - Other scene.
			VStack(spacing: 0) {
				HStack(spacing: 15) {
					Button {
						withAnimation {
							self.show.toggle()
						}
					} label: {
						Image(systemName: self.show ? "xmark" : "line.horizontal.3")
							.resizable()
							.frame(width: self.show ? 18 : 22, height: 18)
							.foregroundColor(Color(UIColor.label).opacity(0.4))
					}
					Text(self.index == 0 ? "Каталог" : "Другой экран")
						.font(.title)
						.foregroundColor(Color(UIColor.label).opacity(0.6))

					Spacer(minLength: 0)
				} .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
					.padding()

				GeometryReader { reader in
					VStack {
						if self.index == 0 {
							CatalogueScene()
						} else {
							ThemeSettings()
						}
					} .frame(width: reader.size.width, height: reader.size.height)
				}
			}
			.background(Color(UIColor.systemBackground))
			.cornerRadius(self.show ? 30 : 0)
			.scaleEffect(self.show ? 0.9 : 1)
			.offset(
				x: self.show ? UIScreen.main.bounds.width / 2 : 0,
				y: self.show ? 15 : 0
			)
			.rotationEffect(.init(degrees: self.show ? -5 : 0))
			.animation(.easeInOut(duration: 0.25), value: show)
		} .background(Color(UIColor.systemPink).edgesIgnoringSafeArea(.all))
			.edgesIgnoringSafeArea(.all)
	}
}

struct CatalogueScene: View {
	var body: some View {
		VStack(alignment: .center) {
			Text("Каталог")
		}
	}
}

struct LeftsideMenuView_Previews: PreviewProvider {
	static var previews: some View {
		LeftsideMenuView()
	}
}
