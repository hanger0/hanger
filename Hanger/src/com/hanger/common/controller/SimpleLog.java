package com.hanger.common.controller;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

public class SimpleLog {
 
 // Logger 클래스의 인스턴스를 받아온다.
   public static Logger logger = Logger.getLogger(SimpleLog.class);

   public SimpleLog() {}

   public static void main(String[] args) {

   /* 
     콘솔로 로그 출력 위한 간단한 설정,
     이 설정이 없다면 경고 메세지가 출력되면서 실행이 중단된다.
      */
    BasicConfigurator.configure();

       logger.debug("[DEBUG] Hello log4j.");
       logger.info ("[INFO]  Hello log4j.");
       logger.warn ("[WARN]  Hello log4j.");
       logger.error("[ERROR] Hello log4j.");
       logger.fatal("[FATAL] Hello log4j.");
       //loger.log( Level.DEBUG , "debug") 와 동일하다.
   }
}

 
