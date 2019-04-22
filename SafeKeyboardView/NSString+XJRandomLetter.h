//
//  NSString+XJRandomLetter.h
//  theCustomKeyboard
//
//  Created by superButton on 2019/4/22.
//  Copyright © 2019 superButton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XJRandomLetter)

/**
 *  返回单个随机大小字母 如果yes是小写 反之大写
 *
 *  @param islowercaseString  如果yes是小写 反之大写
 *
 *  @return 返回大小写字母字符串
 */
+ (NSString *)DYRandomLetterLowercase:(BOOL)islowercaseString;


/**
 *  返回26字母全部随机   大小字母 如果yes是小写 反之大写
 *
 *  @param islowercaseString  如果yes是小写 反之大写
 *
 *  @return 返回大小写字母字数组
 */
+ (NSMutableArray *)DYRandomAllLetterLowercase:(BOOL)islowercaseString;

+ (NSString*)DYRandomSymbol;

+ (NSMutableArray *)DYRandomAllSymbol;

@end
