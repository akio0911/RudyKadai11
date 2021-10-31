//
//  ContentView.swift
//  Kadai11
//

import SwiftUI

struct ContentView: View {
    @State private var selectedPrefecture: String = "東京都"
    @State private var isShowInputView: Bool = false

    var body: some View {
        NavigationView {
            HStack(spacing: 50) {
                Text("都道府県")
                Text(selectedPrefecture)
                Button("変更") {
                    isShowInputView = true
                }
                .fullScreenCover(isPresented: $isShowInputView) {
                    InputPrefectureView(inputPrefecture: $selectedPrefecture,
                                        isActive: $isShowInputView)
                }
            }.frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

struct InputPrefectureView: View {
    private let prefecturesList: [String] = [
        "北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県",
        "茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県",
        "新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県",
        "静岡県", "愛知県", "三重県", "滋賀県", "京都府", "大阪府", "兵庫県",
        "奈良県", "和歌山県", "鳥取県", "島根県", "岡山県", "広島県", "山口県",
        "徳島県", "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県",
        "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"
        ]
    @Binding var inputPrefecture: String
    @Binding var isActive: Bool

    var body: some View {
        NavigationView {
            List {
                ForEach(prefecturesList, id: \.self) { prefecture in
                    HStack {
                        Text(prefecture)
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        inputPrefecture = prefecture
                        isActive = false
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") {
                        isActive = false
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
