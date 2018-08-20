// This is alpha everyting in here is subject to and will change.

#include "x0_i0_anims"
#include "x0_i0_treasure"
#include "x2_inc_switches"
#include "x3_inc_skin"
#include "x2_i0_spells"
#include "lutes"

object ModifyArmor(object oItem)
{
    int color1=Random(64);
    int color2=Random(64);
    int color3=Random(64);
    oItem=    IPDyeArmor(oItem,ITEM_APPR_ARMOR_COLOR_CLOTH1,color1);
    oItem=    IPDyeArmor(oItem,ITEM_APPR_ARMOR_COLOR_CLOTH2,color2);
    oItem=    IPDyeArmor(oItem,ITEM_APPR_ARMOR_COLOR_LEATHER1,color1);
    oItem=    IPDyeArmor(oItem,ITEM_APPR_ARMOR_COLOR_LEATHER2,color2);
    oItem=    IPDyeArmor(oItem,ITEM_APPR_ARMOR_COLOR_METAL1,color1);
    oItem=    IPDyeArmor(oItem,ITEM_APPR_ARMOR_COLOR_METAL2,color2);

    if(GetItemACValue(oItem) > 0)
    {
        oItem=    IPGetModifiedArmor(oItem,ITEM_APPR_ARMOR_MODEL_LBICEP,X2_IP_ARMORTYPE_RANDOM,TRUE);
        oItem=    IPGetModifiedArmor(oItem,ITEM_APPR_ARMOR_MODEL_LFOOT,X2_IP_ARMORTYPE_RANDOM,TRUE);
        oItem=    IPGetModifiedArmor(oItem,ITEM_APPR_ARMOR_MODEL_LFOREARM,X2_IP_ARMORTYPE_RANDOM,TRUE);
        oItem=    IPGetModifiedArmor(oItem,ITEM_APPR_ARMOR_MODEL_LHAND,X2_IP_ARMORTYPE_RANDOM,TRUE);
        oItem=    IPGetModifiedArmor(oItem,ITEM_APPR_ARMOR_MODEL_LSHIN,X2_IP_ARMORTYPE_RANDOM,TRUE);
        oItem=    IPGetModifiedArmor(oItem,ITEM_APPR_ARMOR_MODEL_LSHOULDER,X2_IP_ARMORTYPE_RANDOM,TRUE);
        oItem=    IPGetModifiedArmor(oItem,ITEM_APPR_ARMOR_MODEL_LTHIGH,X2_IP_ARMORTYPE_RANDOM,TRUE);

        int nPart = GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_MODEL ,ITEM_APPR_ARMOR_MODEL_LTHIGH);
        object oOld = oItem;
        oItem= CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_MODEL ,ITEM_APPR_ARMOR_MODEL_RTHIGH,nPart);
        DestroyObject(oOld);

        oOld = oItem;
        nPart = GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_MODEL ,ITEM_APPR_ARMOR_MODEL_LBICEP);
        oItem= CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_MODEL ,ITEM_APPR_ARMOR_MODEL_RBICEP,nPart);
        DestroyObject(oOld);

        oOld = oItem;
        nPart = GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_MODEL ,ITEM_APPR_ARMOR_MODEL_LFOOT);
        oItem= CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_MODEL ,ITEM_APPR_ARMOR_MODEL_RFOOT,nPart);
        DestroyObject(oOld);

        oOld = oItem;
        nPart = GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_MODEL ,ITEM_APPR_ARMOR_MODEL_LFOREARM);
        oItem= CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_MODEL ,ITEM_APPR_ARMOR_MODEL_RFOREARM,nPart);
        DestroyObject(oOld);

        oOld = oItem;
        nPart = GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_MODEL ,ITEM_APPR_ARMOR_MODEL_LHAND);
        oItem= CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_MODEL ,ITEM_APPR_ARMOR_MODEL_RHAND,nPart);
        DestroyObject(oOld);

        oOld = oItem;
        nPart = GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_MODEL ,ITEM_APPR_ARMOR_MODEL_LSHIN);
        oItem= CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_MODEL ,ITEM_APPR_ARMOR_MODEL_RSHIN,nPart);
        DestroyObject(oOld);

        oOld = oItem;
        nPart = GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_MODEL ,ITEM_APPR_ARMOR_MODEL_LSHOULDER);
        oItem= CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_MODEL ,ITEM_APPR_ARMOR_MODEL_RSHOULDER,nPart);
        DestroyObject(oOld);

        oOld = oItem;
        nPart = GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_MODEL ,ITEM_APPR_ARMOR_MODEL_LTHIGH);
        oItem= CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_MODEL ,ITEM_APPR_ARMOR_MODEL_RTHIGH,nPart);
        DestroyObject(oOld);


        //oItem=    IPGetModifiedArmor(oItem,ITEM_APPR_ARMOR_MODEL_TORSO,X2_IP_ARMORTYPE_RANDOM,TRUE);
        //oItem=    IPGetModifiedArmor(oItem,ITEM_APPR_ARMOR_MODEL_ROBE,X2_IP_ARMORTYPE_RANDOM,TRUE);
        //oItem=    IPGetModifiedArmor(oItem,ITEM_APPR_ARMOR_MODEL_BELT,X2_IP_ARMORTYPE_RANDOM,TRUE);
        //oItem=    IPGetModifiedArmor(oItem,ITEM_APPR_ARMOR_MODEL_NECK,X2_IP_ARMORTYPE_RANDOM,TRUE);
        //oItem=    IPGetModifiedArmor(oItem,ITEM_APPR_ARMOR_MODEL_PELVIS,X2_IP_ARMORTYPE_RANDOM,TRUE);
    }
    else
    {
        oItem=    IPGetModifiedArmor(oItem,ITEM_APPR_ARMOR_MODEL_ROBE,X2_IP_ARMORTYPE_RANDOM,TRUE);
    }
    return oItem;
}


void IncreaseWeaponSize(object oWeapon)
{
    float scale = 1.0 + IntToFloat(Random(1000))/2000.0;
    float n =SetObjectVisualTransform(oWeapon, OBJECT_VISUAL_TRANSFORM_SCALE,scale);
}



void ForceArmor(object o, object oArmor)
{
    // if the object is doing something, have to try and force it to update iut
    if(!GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_CHEST)))
    {
       AssignCommand(o,ClearAllActions(TRUE));
       AssignCommand(o,ActionEquipItem(oArmor,INVENTORY_SLOT_CHEST));
       DelayCommand(1.0,ForceArmor(o,oArmor));
    }
}

object ModifyWeapon(object oWeapon)
{

    object oItem = oWeapon;
    oItem=    IPGetModifiedWeapon(oItem,ITEM_APPR_WEAPON_COLOR_BOTTOM,X2_IP_ARMORTYPE_RANDOM,TRUE);
    oItem=    IPGetModifiedWeapon(oItem,ITEM_APPR_WEAPON_COLOR_TOP,X2_IP_ARMORTYPE_RANDOM,TRUE);
    oItem=    IPGetModifiedWeapon(oItem,ITEM_APPR_WEAPON_MODEL_BOTTOM,X2_IP_ARMORTYPE_RANDOM,TRUE);
    oItem=    IPGetModifiedWeapon(oItem,ITEM_APPR_WEAPON_MODEL_MIDDLE,X2_IP_ARMORTYPE_RANDOM,TRUE);
    oItem=    IPGetModifiedWeapon(oItem,ITEM_APPR_WEAPON_MODEL_TOP,X2_IP_ARMORTYPE_RANDOM,TRUE);

    object o = CopyItem(oItem,oObject);
    DestroyObject(oItem);
    oItem = o;
    return oItem;
}

object ModifyShield(object oShield)
{
    object oldItem=oShield;
    object oItem= CopyItemAndModify(oShield, ITEM_APPR_TYPE_SIMPLE_MODEL,0,Random(255));
    if(GetIsObjectValid(oItem)) DestroyObject(oldItem);
    return oItem;
}

void main()
{

    object sack = OBJECT_SELF;


    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_USE_SPAWN_SEARCH) == TRUE)
    {
        SetSpawnInCondition(NW_FLAG_SEARCH);
    }

    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_USE_SPAWN_AMBIENT_IMMOBILE) == TRUE)
    {
        SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS);
    }

    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_USE_SPAWN_AMBIENT) == TRUE)
    {
        SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS);
    }

    // * Fire User Defined Event 1001 in the OnHeartbeat
    // *
    // SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT);

    // * Fire User Defined Event 1002
    // *
    // SetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT);

    // * Fire User Defined Event 1005
    // *
    // SetSpawnInCondition(NW_FLAG_ATTACK_EVENT);

    // * Fire User Defined Event 1006
    // *
    // SetSpawnInCondition(NW_FLAG_DAMAGED_EVENT);

    // * Fire User Defined Event 1008
    // *
    // SetSpawnInCondition(NW_FLAG_DISTURBED_EVENT);

    // * Fire User Defined Event 1003
    // *
    // SetSpawnInCondition(NW_FLAG_END_COMBAT_ROUND_EVENT);

    // * Fire User Defined Event 1004
    // *
    // SetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT);



    // ***** DEFAULT GENERIC BEHAVIOR (DO NOT TOUCH) ***** //

    // * Goes through and sets up which shouts the NPC will listen to.
    // *
    SetListeningPatterns();

    // * Walk among a set of waypoints.
    // * 1. Find waypoints with the tag "WP_" + NPC TAG + "_##" and walk
    // *    among them in order.
    // * 2. If the tag of the Way Point is "POST_" + NPC TAG, stay there
    // *    and return to it after combat.
    //
    // * Optional Parameters:
    // * void WalkWayPoints(int nRun = FALSE, float fPause = 1.0)
    //
    // * If "NW_FLAG_DAY_NIGHT_POSTING" is set above, you can also
    // * create waypoints with the tags "WN_" + NPC Tag + "_##"
    // * and those will be walked at night. (The standard waypoints
    // * will be walked during the day.)
    // * The night "posting" waypoint tag is simply "NIGHT_" + NPC tag.
    WalkWayPoints();

    //* Create a small amount of treasure on the creature
    if ((GetLocalInt(GetModule(), "X2_L_NOTREASURE") == FALSE)  &&
        (GetLocalInt(OBJECT_SELF, "X2_L_NOTREASURE") == FALSE)   )
    {
        CTG_GenerateNPCTreasure(TREASURE_TYPE_MONSTER, OBJECT_SELF);
    }


    // ***** ADD ANY SPECIAL ON-SPAWN CODE HERE ***** //

    // * If Incorporeal, apply changes
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_IS_INCORPOREAL) == TRUE)
    {
        effect eConceal = EffectConcealment(50, MISS_CHANCE_TYPE_NORMAL);
        eConceal = ExtraordinaryEffect(eConceal);
        effect eGhost = EffectCutsceneGhost();
        eGhost = ExtraordinaryEffect(eGhost);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eConceal, OBJECT_SELF);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, OBJECT_SELF);

    }

    // * Give the create a random name.
    // * If you create a script named x3_name_gen in your module, you can
    // * set the value of the variable X3_S_RANDOM_NAME on OBJECT_SELF inside
    // * the script to override the creature's default name.
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_RANDOMIZE_NAME) == TRUE)
    {

        ExecuteScript("x3_name_gen",OBJECT_SELF);
        string sName = GetLocalString(OBJECT_SELF,"X3_S_RANDOM_NAME");
        if ( sName == "" )
        {
            sName = RandomName();
        }
        SetName(OBJECT_SELF,sName);

        //SetName(OBJECT_SELF,RandomName(NAME_FIRST_HUMAN_MALE));
    }




    if(  GetStandardFactionReputation(STANDARD_FACTION_HOSTILE) > 50 )
    {
        if(GetAbilityScore(OBJECT_SELF,ABILITY_INTELLIGENCE) > 5)
        {
            int class = GetClassByPosition(0,OBJECT_SELF);

            if(class == CLASS_TYPE_ASSASSIN) SetLocalInt(sack,"Assassin",TRUE);
            if(class == CLASS_TYPE_BARD) SetLocalInt(sack,"Bard",1);
            if(class == CLASS_TYPE_CLERIC) SetLocalInt(sack,"Cleric",1);
            if(class == CLASS_TYPE_FIGHTER)  SetLocalInt(sack,"Fighter",1);
            if(class == CLASS_TYPE_GIANT) SetLocalInt(sack,"Giant",1);
            if(class == CLASS_TYPE_ROGUE) SetLocalInt(sack,"Rogue",1);
            if(class == CLASS_TYPE_WIZARD) SetLocalInt(sack,"Wizard",1);
            if(class == CLASS_TYPE_DRUID) SetLocalInt(sack,"Druid",1);
            if(class == CLASS_TYPE_RANGER) SetLocalInt(sack,"Ranger",1);
            if(class == CLASS_TYPE_PALADIN) SetLocalInt(sack,"Paladin",1);
            if(class == CLASS_TYPE_DRAGON) SetLocalInt(sack,"Dragon",1);
            /*
            if(class == CLASS_TYPE_OUTSIDER) SetLocalInt(sack,"Outsider",1);
            if(class == CLASS_TYPE_ABERRATION) SetLocalInt(sack,"Abberation",1);
            if(class == CLASS_TYPE_UNDEAD) SetLocalInt(sack,"Undead",1);
            if(class == CLASS_TYPE_MAGICAL_BEAST) SetLocalInt(sack,"MagicalBeast",1);
            */
            int rt = GetRacialType(OBJECT_SELF);
            if( rt != RACIAL_TYPE_ANIMAL &&
                rt != RACIAL_TYPE_VERMIN &&
                rt != RACIAL_TYPE_BEAST &&
                rt != RACIAL_TYPE_CONSTRUCT &&
                rt != RACIAL_TYPE_OOZE &&
		rt != RACIAL_TYPE_UNDEAD )
            {
                //SendMessageToPC(GetFirstPC(),"Lutes");
                iChestLevel = GetCharacterLevel(OBJECT_SELF);
                Lutes(OBJECT_SELF);
            }
        }

    }
    object oArmor = GetItemInSlot(INVENTORY_SLOT_CHEST);
    if(GetIsObjectValid(oArmor))
    {
        oArmor = ModifyArmor(oArmor);
        if(GetIsObjectValid(oArmor)) {
            ActionEquipItem(oArmor,INVENTORY_SLOT_CHEST);
            DelayCommand(0.1,ForceArmor(OBJECT_SELF,oArmor));
        }
    }

    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
    if(GetIsObjectValid(oWeapon))
    {
        oWeapon = ModifyWeapon(oWeapon);
        if(GetIsObjectValid(oWeapon))
            ActionEquipItem(oWeapon,INVENTORY_SLOT_RIGHTHAND);
    }
    if(d20() == 1) IncreaseWeaponSize(oWeapon);

    oWeapon = GetItemInSlot(INVENTORY_SLOT_LEFTHAND);
    if(GetIsObjectValid(oWeapon))
    {
        if(GetMeleeWeapon(oWeapon))
        {
            oWeapon = ModifyWeapon(oWeapon);
            if(GetIsObjectValid(oWeapon))
                ActionEquipItem(oWeapon,INVENTORY_SLOT_LEFTHAND);
        }
        else if(GetBaseItemType(oWeapon) == BASE_ITEM_SMALLSHIELD ||
                GetBaseItemType(oWeapon) == BASE_ITEM_LARGESHIELD ||
                GetBaseItemType(oWeapon) == BASE_ITEM_TOWERSHIELD)
        {
            oWeapon = ModifyShield(oWeapon);
            if(GetIsObjectValid(oWeapon))
                ActionEquipItem(oWeapon,INVENTORY_SLOT_LEFTHAND);
        }

    }

    SetSpawnInCondition(NW_FLAG_FAST_BUFF_ENEMY);
    SetSpawnInCondition(NW_FLAG_END_COMBAT_ROUND_EVENT);
    SetSpawnInCondition(NW_FLAG_SPELL_CAST_AT_EVENT);
    SetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT);    

}


