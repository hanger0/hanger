package com.hanger.common.controller;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

public class SimpleLog {
 
 // Logger Ŭ������ �ν��Ͻ��� �޾ƿ´�.
   public static Logger logger = Logger.getLogger(SimpleLog.class);

   public SimpleLog() {}

   public static void main(String[] args) {

   /* 
     �ַܼ� �α� ��� ���� ������ ����,
     �� ������ ���ٸ� ��� �޼����� ��µǸ鼭 ������ �ߴܵȴ�.
      */
    BasicConfigurator.configure();

       logger.debug("[DEBUG] Hello log4j.");
       logger.info ("[INFO]  Hello log4j.");
       logger.warn ("[WARN]  Hello log4j.");
       logger.error("[ERROR] Hello log4j.");
       logger.fatal("[FATAL] Hello log4j.");
       //loger.log( Level.DEBUG , "debug") �� �����ϴ�.
   }
}

 
