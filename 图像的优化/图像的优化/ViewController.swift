//
//  ViewController.swift
//  图像的优化
//
//  Created by hu yr on 2017/1/19.
//  Copyright © 2017年 terry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // -PNG 图片是支持透明的
    // -JPG 图片不支持透明,使用 jpg 用 imageNamed方法, 需要指定扩展名(没有放在Asset中)
    
    
    
    
    /// 将给定的图像进行拉伸,并且返回'新'的图像
    ///
    /// - Returns: UIImage
    func avatarImage(image: UIImage, size: CGSize, backColor: UIColor?) -> UIImage?{
        
        let rect = CGRect(origin: CGPoint(), size: size)
        
        //1.图像上下文 - 内存中开辟一个地址,跟屏幕无关
        /**
         参数:
         1> size:绘图尺寸
         2> 不透明:false(透明) / true(不透明)
         3> scale: 屏幕分辨率,如果不指定,默认生成的图像默认使用 1.0 的分辨率, 图像质量不好
            可以指定0, 会选择当前设备的屏幕分辨率
         
         */
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        
        //0>背景填充
        backColor?.setFill()
        UIRectFill(rect)
        
        //1> 实例化一个圆形的路径
        let path = UIBezierPath(ovalIn: rect)
        //2> 进行路径裁切 - 后续的绘图, 都会出现在圆形路径内部, 外部的全部干掉
        path.addClip()
        
        
        
        //2. 绘图 drawInRect 就是在指定区域内拉伸屏幕
        image.draw(in: rect)
        
        //3. 绘制内切的圆形
        UIColor.darkGray.setStroke()
        path.stroke()
        
        //4. 取得结果
        let result = UIGraphicsGetImageFromCurrentImageContext()
        
        //5.关闭上下文
        UIGraphicsEndImageContext()
        
        //6.返回结果
        return result
        
    }
    
    


}

