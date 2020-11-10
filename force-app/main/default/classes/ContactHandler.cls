public class ContactHandler {
    public static void contactOnInsert(list<contact> contactList){
       map<id, account> accountMap = new Map<id,account>();
        set<id> accountids = new set<id>(); 
        for (contact con: contactlist){
            if(con.accountid != null){
               accountids.add(con.accountid); 
            }
        }
        
        if(accountids != null && accountids.size()>0){
            
            for (aggregateResult agr: [select accountid, count(id) contcontact from contact where accountid in: accountids group by accountid
                                      ]){
                account acc = new account( id = (id)agr.get('accountid'), count_Contact__C = (decimal)agr.get('contcontact'));
                accountmap.put(acc.id, acc);
                
            }
            
            if(accountMap.size()>0 && accountMap != null){
                
                update accountMap.values();
            }
                                          }
    }
    public static void contactOnUpdate(map<id,contact> NewContactMap, Map<id, contact> OldContactMap){
    
Set<id> accountIds = new set<id>();
        map<id,account> AccountMap = new map<id,account>();
        for (contact con : NewContactMap.values()){
        if(NewContactMap.get(con.id).accountid != OldContactMap.get(con.id).accountId){
            if (NewContactmap.get(con.id).accountId!= null){
             Accountids.add(NewContactmap.get(con.id).accountId);   
            }
            if(OldContactMap.get(con.id).accountid != null){
                AccountIds.add(OldContactMap.get(con.id).accountid);
            }
            
        }}
                if(accountids.size()>0 && accountids != null){
            for (aggregateResult agr: [select accountid, count(id)contContact from contact where
                                     accountid in: accountids group by accountid]){
                                         account acc = new account(id = 
										 (id)agr.get('accountid') , count_contact__C = 
										 (decimal)agr.get('contcontact'));
										 accountMap.put(acc.id, acc);
             }            
        }
        
        if(accountMap != null && accountMap.size()> 0){
            update accountMap.values();
        }   
    }
    public static void contactOnDelete(list<contact> contactlist){
        set<id> accountids = new set <id> ();
        set<id> contactids = new set<id>();
        map <id,account> AccountMap = new map<id,account>();
        
        for (contact con: contactList){
            if (con.accountid != null){
                contactids.add(con.id);
                accountids.add(con.accountid);
            }
        }
    
        if (accountids.size()>0 && accountids != null){
            for (aggregateResult agr: [select count(id)countcont, accountid from contact where accountid in : accountids 
                                       and id not in: contactids group by accountid ]){
            account acc = new account(id = (id)agr.get('accountid')
                                    , count_Contact__C =(decimal)agr.get('countCont'));
                                           accountMap.put(acc.id, acc);
                                       }                                           
                                       }
        if(accountmap!= null && accountMap.size()>0){
            update accountMap.values();
        }
        }   
    
    public static void ContactonUndelete(list<contact> ContactList){
        system.debug('method called undelete');
       set<id> accountIds = new set<id> ();
        Map <id, account> AccountMap = new Map <id,account>();
        
        for(contact con: contactList){
            if(con.accountid != null){
            accountids.add(con.accountid);
            }
        
            if (accountIds != null && accountIds.size()>0){
                List<aggregateResult> agrresult=  [select count(id) countContact, accountid from contact where accountid in : accountids group by accountid];
                system.debug('size is '+ agrresult.size());
                System.debug('Total Number of SOQL Queries allowed in this apex code context: ' + Limits.getLimitQueries());
                System.debug('Total Number of records that can be queried in this apex code context: ' + Limits.getLimitDmlRows());
                System.debug('Total Number of DML statements allowed in this apex code context: ' + Limits.getLimitDmlStatements() );
                system.debug('aggregateResult is '+ agrresult);
                List<Account> acLst = [select id, (select id from contacts) from Account where id in:accountids ];
                System.debug('Total Number of SOQL Queries allowed in this apex code context: ' + Limits.getLimitQueries());
                 System.debug('Total Number of records that can be queried in this apex code context: ' + Limits.getLimitDmlRows());
                System.debug('Total Number of DML statements allowed in this apex code context: ' + Limits.getLimitDmlStatements() );
                
                system.debug('acLst is '+ acLst);
               // system.debug('size of contact is '+ )

               // for (aggregateResult agr: [select count(id) countContact, accountid from contact where accountid in : accountids group by accountid]){
                  
                    for(aggregateResult agr: agrresult) {
                    account acc = new account (id = (id)agr.get('accountid'), count_contact__C = (decimal)agr.get('countContact'))  ;
                    accountMap.put(acc.id, acc);
                }
                }
        }
        if(accountMap != null && accountMap.size() > 0){
          update accountMap.values();  
        }            
        }   
    
    
    public static void sendEmailonUpdate(list <contact> conlist){
    list< Messaging.SingleEmailMessage>  Mails = new list <Messaging.SingleEmailMessage>();
        map< id,string> ConOwnerMap = new map<id,string>();
        list <user> userEmail = [select email, id from user];
        for(user us: UserEmail){
            ConOwnerMap.put(us.Id, us.Email);
        }
        
        for (contact con:conlist){
           
            {    
    Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
    attach.setContentType('application/pdf');
    attach.setFileName('Emplo`enter preformatted text here`yee.pdf');
    string ebody;
    ebody = '<html> <head> <title>Page Title</title> </head> <body> <h1>This is a Heading</h1> <p> con.firstname + con.lastname  </p> </body> </html>';
                
    String body ;

   body = '<html> <head> <title>Page Title</title> </head> <body> <h1>This is a Heading</h1> <p>' + con.firstname + con.lastname+ ' </p> </body> </html>';

    attach.Body = Blob.toPDF(body);
    system.debug(con.Owner.email);  
    system.debug(con.Ownerid);
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    string em =      ConOwnerMap.get(con.ownerid);
    system.debug('email is' + em);
    mail.setToAddresses(new String[] { userinfo.getUserEmail(), em});
               
    mail.setSubject('PDF Generation');
    mail.setHtmlBody(ebody);
    mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach });     

    mails.add(mail);  
            }
if(!mails.isEmpty())
{
    Messaging.SendEmail(mails);
}
        }
     
        }
    
    
@future (callout = true)
//https://www.jitendrazaa.com/blog/salesforce/send-visualforce-as-an-email-attachment-from-apex-trigger-alternate-design/

        public static void sendEmail(){
        //List<String> EmailIds = 'varungupta64@gmail.com'.split(',');
        //string ue = userinfo.getUserEmail();
        //List<String> EmailIds = 'varungupta64@gmail.com'.split(',');
        List<String> EmailIds = new List<String>{'varungupta64@gmail.com',userinfo.getUserEmail() };
        PageReference ref = Page.show_contact_details;
        Blob b;
            if(Test.isRunningTest()){
                b= blob.valueof('mamta');
            } 
            else{
                b = ref.getContentAsPDF();}
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        Messaging.EmailFileAttachment efa1 = new Messaging.EmailFileAttachment();
        efa1.setFileName('all Contact Details.pdf');
        efa1.setBody(b);
        String addresses;
        email.setSubject( 'Check VF From PB' +String.valueOf(DateTime.now()));
        email.setToAddresses( EmailIds  );
        email.setPlainTextBody('Hey there, Pls find the contacts details as attachment');
        email.setFileAttachments(new Messaging.EmailFileAttachment[] {efa1});
        Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
    }



}