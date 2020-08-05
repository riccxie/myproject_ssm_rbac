package com.qf.utils;

import com.qf.entity.ResultEntity;

public class ResponseUtils {

    public  static  ResultEntity writeResponse(int stats){
        if(stats > 0){
            return  ResultEntity.success();
        }else{
            return  ResultEntity.error();
        }
    }


}
