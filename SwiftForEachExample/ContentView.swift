//
//  ContentView.swift
//  SwiftForEachExample
//
//  Created by Fatih Gümüş on 15.04.2024.
//

import SwiftUI

struct Book  : Identifiable{
    var id = UUID()
    var title : String
    var author : String
    var publishDate : String
}

struct ContentView: View {
     var books = [
        Book(title: "Kitap 1", author: "Yazar 1", publishDate: "27.02.2024"),
        Book(title: "Kitap 2", author: "Yazar 2", publishDate: "08.03.2022"),
        Book(title: "Kitap 3", author: "Yazar 3", publishDate: "19.04.2020")
     
     ]
    
    var body: some View{
        
        Text("Kitaplar")
            .font(.headline)
            .fontWeight(.bold)
        List{
          
            ForEach(books){ book in
                HStack{
                    Image(systemName: "book.fill")
                        .font(.largeTitle)
                        .background(
                            Color(hex: "#dddddd")
                                .frame(width: 75,height: 75)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                        )
                        .padding(.leading,10)
                        .padding(.trailing,20)

                        
                    VStack(alignment: .leading){
                        Text(book.title)
                            .font(.title)
                            .fontWeight(.bold)
                        Text(book.author)
                            .foregroundStyle(.gray)
                        Text(book.publishDate)
                            .foregroundStyle(.gray)
                    }
                }
               
            }
            
        
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

#Preview {
    ContentView()
}
