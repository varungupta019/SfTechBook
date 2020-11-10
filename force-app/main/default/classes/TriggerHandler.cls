/**
 * Created by Kritik Garg on 03-10-2019.
 */

public without sharing class TriggerHandler {

    //public static ITrigger activeFunction = null;
    public static map<Id, SObject> sObjectsToUpdate = new map<Id, SObject>();

   /* public static void TriggerHandlerEntry(TriggerState state) {

        System.debug(state.TriggerObject);

        if (state.TriggerObject == 'Contract') {
            processContractHandler(state);
        }

        if (state.TriggerObject == 'P2P_Payment_Plan__c') {
            processPaymentPlanHandler(state);
        }

        if (state.TriggerObject == 'Promise_to_Pay__c') {
            processPromiseToPayHandler(state);
        }

        if (state.TriggerObject == 'fw1__Credit_Memo__c') {
            processCreditMemoHandler(state);
        }

        if (state.TriggerObject == 'fw1__Invoice__c') {
            processInvoiceHandler(state);
        }
        
        if (state.TriggerObject == 'TwilioSF__Message__c') {
            processTwillioSMSHandler(state);
        }

        if (state.TriggerObject == 'Case') {
            processCaseHandler(state);
        }

        if (state.TriggerObject == 'EmailMessage') {
            processEmailMessageHandler(state);
        }


        if (sObjectsToUpdate.values().size() > 0) {
            update sObjectsToUpdate.values();
        }
    }

    @TestVisible private static void processContractHandler(TriggerState state) {

        if (activeFunction != null) {
            activeFunction.InProgressEntry(state);
        } else {
            activeFunction = new ContractHandler() ;
            activeFunction.MainEntry(state);
        }
    }

    @TestVisible private static void processPaymentPlanHandler(TriggerState state) {

        if (activeFunction != null) {
            activeFunction.InProgressEntry(state);
        } else {
            activeFunction = new PaymentPlanHandler();
            activeFunction.MainEntry(state);
        }
    }

    @TestVisible private static void processPromiseToPayHandler(TriggerState state) {

        System.debug(state);

        if (activeFunction != null) {
            activeFunction.InProgressEntry(state);
        } else {
            activeFunction = new PromiseToPayHandler();
            activeFunction.MainEntry(state);
        }
    }

    @TestVisible private static void processCreditMemoHandler(TriggerState state) {

        System.debug(state);

        if (activeFunction != null) {
            activeFunction.InProgressEntry(state);
        } else {
            activeFunction = new CreditMemoHandler();
            activeFunction.MainEntry(state);
        }
    }

    @TestVisible private static void processInvoiceHandler(TriggerState state) {

        System.debug(state);

        if (activeFunction != null) {
            activeFunction.InProgressEntry(state);
        } else {
            activeFunction = new InvoiceHandler();
            activeFunction.MainEntry(state);
        }
    }
    
        @TestVisible private static void processTwillioSMSHandler(TriggerState state) {

        System.debug(state);

        if (activeFunction != null) {
            activeFunction.InProgressEntry(state);
        } else {
            activeFunction = new TwilioSMSHandler();
            activeFunction.MainEntry(state);
        }
    }
    
    @TestVisible private static void processCaseHandler(TriggerState state) {

        System.debug(state);

        if (activeFunction != null) {
            activeFunction.InProgressEntry(state);
        } else {
            activeFunction = new CaseHandler();
            activeFunction.MainEntry(state);
        }
    }
    @TestVisible private static void processEmailMessageHandler(TriggerState state) {

        System.debug('processEmailMessageHandler');

        if (activeFunction != null) {
            activeFunction.InProgressEntry(state);
        } else {
            activeFunction = new EmailMessageHandler();
            activeFunction.MainEntry(state);
        }
    }




    public interface ITrigger {

        void MainEntry(TriggerState state);

        void InProgressEntry(TriggerState state);
    }*/

}