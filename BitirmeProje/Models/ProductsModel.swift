//
//  ProductsModel.swift
//  BitirmeProje
//
//  Created by Batuhan Kucukaydın on 31.05.2024.
//

import SwiftUI

struct ProductsModel : Identifiable, Hashable,Codable{
    
    var id: String
    var title: String
    var brand: String
    var description: String
    var images:[String]
    var sizes: [Int]
  //  var reviews: [ReviewModel]
    var price: Int
}

/*struct ReviewModel: Identifiable,Hashable{
    var id: String
    var userName: String // bak buraya
    //var image: String
    var review: String
    var rating: Int
}

var sampleReview: ReviewModel = ReviewModel(id: "abc", userName: "J.Hetfield", review: "Gerçekten mükemmel bir ürün herkese tavsiye ediyorum.", rating: 4)

*/

 //Örnek ürünler
var sampleProducts: [ProductsModel] = [
    // Elektronik
    .init(id: "abc", title: "Apple Macbook Air", brand:"Elektronik", description: "Apple Macbook Air MGN63TU-A 13.3 inç ekran genişliği ve IPS özelliği sunuyor. • 2560x1600 Piksel ekran çözünürlüğü, renk ve detayları ön plana çıkarıyor. • 256 GB SDD depolama sağlayan Apple Macbook Air MGN63TU-A sahip olduğu 8 GB RAM sayesinde birden fazla işlemi aynı anda yapmaya olanak sağlıyor.", images:["https://cdn.cimri.io/image/1000x1000/apple-macbook-air-mgn63tua-m1-8gb-ram-256gb-macos-13-3-inc-uzay-grisi-laptop-notebook_852146555.jpg",
                "https://cdn.cimri.io/image/1000x1000/apple-macbook-air-mgn63tua-m1-8gb-ram-256gb-macos-13-3-inc-uzay-grisi-laptop-notebook_852146556.jpg",
                "https://cdn.cimri.io/image/1000x1000/apple-macbook-air-mgn63tua-m1-8gb-ram-256gb-macos-13-3-inc-uzay-grisi-laptop-notebook_852146552.jpg",
                "https://cdn.cimri.io/image/1000x1000/apple-macbook-air-mgn63tua-m1-8gb-ram-256gb-macos-13-3-inc-uzay-grisi-laptop-notebook_852146553.jpg"],
          sizes:[128,256,512],price : 23499),
    
    .init(id: "abcd", title: "Apple iPhone 15 Pro Max", brand:"Elektronik", description: "Apple iPhone 15 Pro Max 5G 256GB, titanyum kaplamasıyla estetik bir görünüme sahiptir. • Bu malzeme sayesinde kullandığınız akıllı telefon, daha hafif bir kullanım imkanı sunar. • Modelin en çarpıcı özelliği ise en yüksek optik zoom'a sahip olmasıdır.", images:["https://cdn.cimri.io/image/560x560/apple-iphone-15-pro-max-5g-256gb_825819004.jpg",
                    "https://cdn.cimri.io/image/560x560/apple-iphone-15-pro-max-5g-256gb_825819005.jpg",
                    "https://cdn.cimri.io/image/560x560/apple-iphone-15-pro-max-5g-256gb_825819002.jpg",
                    "https://cdn.cimri.io/image/560x560/apple-iphone-15-pro-max-5g-256gb_825819578.jpg"],
              sizes:[128,256,512],price : 72399),
        
    // Giyim
        .init(id: "abcde", title: "Vans Ayakkabı", brand:"Giyim", description: "Kaykaycılar düşünülerek tamamen yeniden tasarlanan yeni Skate Classics koleksiyonu maksimum ilerleme sağlamak için kaykaycıların ihtiyacı olanları sunuyor. Dayanıklı süet ve kanvas üst parçadan üretilir. ", images:["https://st-vans.mncdn.com/mnresize/1500/1500/Content/media/ProductImg/original/637475259553736655.jpg",
                        "https://st-vans.mncdn.com/mnresize/1500/1500/Content/media/ProductImg/original/637475259555856594.jpg",
                        "https://st-vans.mncdn.com/mnresize/1500/1500/Content/media/ProductImg/original/637475259558136572.jpg",
                        "https://st-vans.mncdn.com/mnresize/1500/1500/Content/media/ProductImg/original/637475259562616752.jpg"],
                  sizes:[41,42,43,44],price : 3049),
    
        .init(id: "abcdef", title: "Basic Tişört", brand:"Giyim", description: "Bisiklet Yaka,Kısa Kol.Yumuşak kumaşı ve rahat kalıbıyla bisiklet yakalı basic modelimiz farklı renkleriyle dolapların vazgeçilmezi olmaya aday.", images:["https://www.tchibo.com.tr/newmedia/art_img/MAIN/1eec330c6b09de91/.jpg",
                        "https://www.tchibo.com.tr/newmedia/art_img/MAIN_ALT_1/1825a30c6b09de91/.jpg",
                        "https://cdn.beymen.com/mnresize/596/830/productimages/c1cnjta3.ato_IMG_01_8683791015419.jpg",
                        "https://cdn.beymen.com/mnresize/596/830/productimages/g51lgwvj.d54_IMG_02_8683791015419.jpg"],
                  sizes:[50,55,60,65],price : 500),
    
    //Eşya
        .init(id: "acdefg", title: "Masa", brand:"Eşya", description: "Akın Lüx modern masa kullanışlı yapısıyla vs çarpı ayak yapılı formu sayesinde dar alanlarda da kullanım için uygundur.Dikdörtgen masalar daha az yer kaplaması ve her yere kolaylıkla yerleştirilebiliyor olması nedeniyle uzun süre tercih edebileceğiniz ürünler olacaktır.", images:["https://cf6ad7.a-cdn.akinoncloud.com/products/2021/01/25/54109/98822fbc-e467-4e0c-bc07-eb6045aa05bc_size2000x2000_cropTop.jpg",
                        "https://cf6ad7.a-cdn.akinoncloud.com/products/2021/01/25/54109/d477388d-ff16-42a0-a0f2-81126810635e_size2000x2000_cropTop.jpg",
                        "https://cf6ad7.a-cdn.akinoncloud.com/products/2021/01/25/54109/d477388d-ff16-42a0-a0f2-81126810635e_size2000x2000_cropTop.jpg",
                        "https://cf6ad7.a-cdn.akinoncloud.com/products/2021/01/25/54109/e388ac7e-d948-48a4-a5ea-9f5cf86fd91d_size2000x2000_cropTop.jpg"],
                  sizes:[0,],price : 56000),
    
        .init(id: "abcdefgh", title: "Koltuk Tekli", brand:"Eşya", description: "Ürün iskeletinde kayın, gürgen, ham ahşap, sunta kullanılmıştır.Ayaklarda ahşap kasa üzerine monte edilmiş plastik ayak kullanılmıştır.Oturum süngeri 12 cm, 32 dns üzerine 3 cm kuş tüyü süngere ilave olarak kumaşa dikili 300 gr lamineli elyaf kullanılmıştır.Yumuşak dokulu ithal nubuk kumaş kullanılmıştır.", images:["https://cdn.evkur.com.tr/c/Product/thumbs/m16_ga78nz_1920.jpg",
                        "https://cdn.evkur.com.tr/c/Product/thumbs/m17_jt1z4x_1920.jpg",
                        "https://cdn.evkur.com.tr/c/Product/thumbs/m6_rt92pn_1920.jpg",
                        "https://cdn.evkur.com.tr/c/Product/thumbs/mg_jn19bc_1920.jpg"],
                  sizes:[0],price : 10000),
]



