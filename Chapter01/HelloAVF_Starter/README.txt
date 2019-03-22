HelloAVF_Starter

HelloAVF工程的UI框架

（1）实现HelloAVF应用的UI框架
（2）计算UILabel的实际高度
    /**
    计算文本高度
    
    @param str         文本内容
    @param width       lab宽度
    @param lineSpacing 行间距(没有行间距就传0)
    @param font        文本字体大小
    
    @return 文本高度
    */
    -(CGFloat)getTextHeightWithStr:(NSString *)str
                        withWidth:(CGFloat)width
                withLineSpacing:(CGFloat)lineSpacing
                        withFont:(CGFloat)font
    {
        if (!str || str.length == 0) {
            return 0;
        }
        NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc]init];
        paraStyle.lineSpacing = lineSpacing;
        paraStyle.lineBreakMode = NSLineBreakByWordWrapping;
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:str
                            attributes:@{NSParagraphStyleAttributeName:paraStyle,
                                        NSFontAttributeName:[UIFont systemFontOfSize:font]}];
        
        CGRect rect = [attributeString boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                                    options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                    context:nil];
        
        if ((rect.size.height - [UIFont systemFontOfSize:font].lineHeight)  <= lineSpacing){
            if ([self containChinese:str]){
                rect.size.height -= lineSpacing;
            }
        }
        return rect.size.height;
    }
    //判断是否包含中文
    - (BOOL)containChinese:(NSString *)str {
        for(int i=0; i< [str length];i++){
            int a = [str characterAtIndex:i];
            if( a > 0x4e00 && a < 0x9fff){
                return YES;
            }
        }
        return NO;
    }

    （3）实现UITableView自适应高度