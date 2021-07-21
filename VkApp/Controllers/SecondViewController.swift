//
//  SecondViewController.swift
//  VkApp
//
//  Created by Константин Каменчуков on 16.07.2021.
//

import UIKit

class SecondViewController: UIViewController {
    let vkService = VkService(session: Session.shared)
    
    let errorMessage = "Ошибка"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vkService.getUserInfo() { json in
            print("Информация обо мне")
            print(self.stringify(json) ?? self.errorMessage)
        }
        
        vkService.getFriendsList() { json in
            print("Список друзей")
            print(self.stringify(json) ?? self.errorMessage)
        }
        
        vkService.getPhotos() { json in
            print("Мои фото")
            print(self.stringify(json) ?? self.errorMessage)
        }
        
        vkService.getGroups() { json in
            print("Мои группы")
            print(self.stringify(json) ?? self.errorMessage)
        }
        
    }
    
    func stringify(_ json: Any?) -> String? {
        guard let json = json else {
            return nil
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
            if let string = String(data: data, encoding: String.Encoding.utf8) {
                return string
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    

    

}
