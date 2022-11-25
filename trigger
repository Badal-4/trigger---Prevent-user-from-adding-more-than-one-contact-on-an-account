trigger trg2 on Contact(after Insert,after Update,after Delete,after Undelete)
{
    if(trigger.isAfter && (trigger.isInsert || trigger.isUndelete))
    {
        if(trigger.newMap != null)
        {
            trgController.trgMethod(trigger.newMap,null);
        }
    }

    else if(trigger.isAfter && trigger.isDelete)
    {
        if(trigger.oldMap != null)
        {
            trgController.trgMethod(null,trigger.oldMap);
        }
    }

    else if(trigger.isAfter && trigger.isUpdate)
    {
        if(trigger.newMap != null && trigger.oldMap != null)
        {
            trgController.trgMethod(trigger.newMap,trigger.oldMap);
        }
    }
}
