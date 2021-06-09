* @ValidationCode : MjotMTI4NTkxMzM0NzpDcDEyNTI6MTYyMDY5NjQxMDMxNTpBTUVOSTotMTotMTowOjA6ZmFsc2U6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 11 May 2021 02:26:50
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
* Implementation of ATB.CDI.SpecifiqueControl.ATBICDIDao
*
*
SUBROUTINE ATB.V.CDI.DAO
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
    
****RG003
    User            = EB.SystemTables.getRUser()
    DeptCode        = User<EB.Security.User.UseDepartmentCode>

    EB.LocalReferences.GetLocRef("LETTER.OF.CREDIT", "L.DAO.INIT", posDAO)
    LOCREFSET<1, posDAO> = DeptCode
    EB.SystemTables.setRNew(LC.Contract.LetterOfCredit.TfLcLocalRef, LOCREFSET)
    

RETURN
