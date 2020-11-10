public class WrapperController {
    
   
 
      public list<wrapperExtension> WrpExtLst {get;set;}
  
    
    public WrapperController(){
     
      WrpExtLst = new list <wrapperExtension>();
        
       wrapperExtension WrpExt = new wrapperExtension();
       account accnt= new account(); 
       accnt= [select id, name ,fax from Account limit 1];      
       wrpext.acc =accnt ;// [select id, name, fax from account limit 1];
        wrpExt.name = 'varin gupta';
        WrpExt.age= 29;
        WrpExt.height = 5.6;
        WrpExt.ist = true;
        WrpExtLst.add(wrpExt);
        wrapperExtension WrpExt1 = new wrapperExtension();
       
        wrpExt1.name = ' gupta';
        WrpExt1.age= 35;
        WrpExt1.height = 6.6;
        WrpExt1.ist = true;
        WrpExtLst.add(wrpExt1);
        
        
    }
    public class wrapperExtension{
       public account acc {get;set;}
        public string Name{get;set;}
            public integer age {get;set;}
        public decimal height {get;set;}
        public boolean ist{get;set;}
        
    }
        
    
    

    
    
 /*   public list<account> aclst();
    public list<WrapperExtension>WrpExtlst{get;set;}
    
    
    public WrapperController(){
        aclst = new list<account>();
        WrpExtLst = new list<WrapperExtension>();
        Aclst = [select id, name, fax, phone from account where name like 'United%'];
        for (account a : aclst){
            WrapperExtension w = new WrapperExtension();
            w.detail = 'my wrapper';
            w.acc = a;
            w.tf  = false;
            w.num = 50;
            wrpExtlst.add(w);
        }        
    }
    
    public class WrapperExtension{
        public string detail {get;set;}
        Public account acc {get;set;}
        public boolean TF {get;set;}
        public integer num {get;set;}
        
    }*/
    
    
    
    
    
    
}