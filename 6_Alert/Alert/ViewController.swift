//
//  ViewController.swift
//  Alert
//
//  Created by 성준모 on 2022/05/02.
//

import UIKit

class ViewController: UIViewController {
    
    //켜진 전구이미지,꺼진 전구 이미지, 제거된 전구 이미지의 상수
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named:  "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    
    // 전구 상태를 나타내는 변수(켜진 상태는 true, 꺼진 상태는 false)
    var isLampOn = true
    
    
    @IBOutlet var lampImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lampImg.image = imgOn
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampOn==true){
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        } else {
            lampImg.image = imgOn
            isLampOn = true
            
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn {
            let lampOffAlert = UIAlertController(title: "램프 끄기",
                    message:  "램프를 끄시겠습니까?",
                    preferredStyle: UIAlertController.Style.alert)
            
            let offAcion = UIAlertAction(title: "네",
                style: UIAlertAction.Style.default, handler: {
                ACTION in self.lampImg.image = self.imgOff
                self.isLampOn=false
            })
            let cancelAcion = UIAlertAction(title: "아니오", style:
                    UIAlertAction.Style.default, handler:  nil)
            
            lampOffAlert.addAction(offAcion)
            lampOffAlert.addAction(cancelAcion)
            
            present(lampOffAlert, animated: true, completion: nil)
        }
        
    }

    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message:  "램프를제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let offAcion = UIAlertAction(title: "아니오, 끕니다(off).", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgOff
            self.isLampOn=false
        })
        let onAction = UIAlertAction(title: "아니오, 켭니다.(on).", style: UIAlertAction.Style.default) {
            ACTION in self.lampImg.image = self.imgOn
            self.isLampOn=true
        }
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertAction.Style.destructive, handler: {
            ACTION in self.lampImg.image = self.imgRemove
            self.isLampOn = false
        })
        
        lampRemoveAlert.addAction(offAcion)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        present (lampRemoveAlert, animated: true, completion: nil)
    }
    
}

