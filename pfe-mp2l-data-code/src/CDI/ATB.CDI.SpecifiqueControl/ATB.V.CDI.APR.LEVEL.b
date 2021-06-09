* @ValidationCode : Mjo3NzM4NTI1Nzc6Q3AxMjUyOjE2MjEzNzk2MjkwOTk6QU1FTkk6LTE6LTE6MDowOmZhbHNlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 May 2021 00:13:49
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : AMENI
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R20_SP4.0
$PACKAGE ATB.CDI.SpecifiqueControl
*
* Implementation of ATB.CDI.SpecifiqueControl.ATBICDIAprLevel
*
*
SUBROUTINE ATB.V.CDI.APR.LEVEL

    $USING EB.SystemTables
    $USING EB.API
    $USING EB.DataAccess
    $USING EB.ErrorProcessing
    $USING EB.OverrideProcessing
    $USING EB.LocalReferences
    $USING AC.EntryCreation
    $USING LC.Contract
    $USING EB.Foundation
    $USING EB.Security
    $USING EB.Interface
    $USING FX.AtbApplicationControl
    
****RG011

    EB.LocalReferences.GetLocRef("LETTER.OF.CREDIT", "L.DEC.SUP.COU", POSSUPC)
    Y.L.DEC.SUP.COU = EB.SystemTables.getRNew(LC.Contract.LetterOfCredit.TfLcLocalRef)<1,POSSUPC>

    EB.LocalReferences.GetLocRef("LETTER.OF.CREDIT", "L.APR.LEVEL", POSAPR)
    Y.L.APR.LEVEL = EB.SystemTables.getRNew(LC.Contract.LetterOfCredit.TfLcLocalRef)<1,POSAPR>
    Y.APR = Y.L.APR.LEVEL[2,1]
    User = EB.SystemTables.getRUser()
    fnUsGp = "F.EB.H.ATB.USER.GROUPE"
    fUsGp = ""
    EB.DataAccess.Opf(fnUsGp, fUsGp)
    
    RecUsGp = FX.AtbApplicationControl.EbHAtbUserGroupe.Read(User, Error)
    Y.L.APR.LEVEL.US = RecUsGp<FX.AtbApplicationControl.EbHAtbUserGroupe.Groupe>
    Y.APR.US = Y.L.APR.LEVEL.US[2,1]
    
    IF Y.APR.US NE Y.APR + 1 THEN
        EB.SystemTables.setText("LC-CDI.NIVAUT")
        EB.OverrideProcessing.StoreOverride(CurrNo)
    END ELSE IF Y.L.DEC.SUP.COU EQ "ACCORD" THEN
        Y.APR = Y.APR + 1
    END ELSE IF Y.L.DEC.SUP.COU EQ "REJET" THEN
        Y.APR = 0
    END

    Y.APR.LEVEL = "HH":Y.APR

    LocalRef <1, POSAPR> = Y.APR.LEVEL
    EB.SystemTables.setRNew(LC.Contract.LetterOfCredit.TfLcLocalRef, LocalRef)
  

RETURN
