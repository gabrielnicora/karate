Feature: Realizar una transferencia Coelsa

  Background:
    * url coelsaUrl
    * def dataUsuariocoelsa = usuariocoelsa
  Scenario: BDSD-17227- Generamos la autorizacion y luego la transferencia de Coelsa Haberes
    ##Recuperamos el RefNo
    Given path 'verFundsTransfer_BdsTrfcoelsalegacyInps()/new'
    And header Authorization = dataUsuariocoelsa
    And header Content-Type = 'application/json'
    When method post
    Then status 201
    * string respect = response
    * def start = respect.indexOf('RefNo')
    * def RefNo = respect.substring(start + 6)
    * def end = RefNo.indexOf('</d:RefNo>')
    * def RefNo = RefNo.substring(0, end)
    * def RefNoUrl = '(' + RefNo + ')'

  ##Usamos el Refno para generar la transferencia
  Given path 'verFundsTransfer_BdsTrfcoelsalegacyInps'+ RefNoUrl
    * def legacyData = randomLegacy
    * def body =
    """
   {
   "AuditDateTime": "",
    "AuditorCode": "",
    "Authoriser": "",
    "CoCode": "",
    "CreditAcctNo": "ARS100040001",
    "CreditAmount": "400",
    "CreditCurrency": "ARS",
    "CurrNo": "",
    "DateTimeMvGroup": [
      {
        "valuePosition": "1",
        "subValuePosition": "1",
        "DateTime": ""
      }
    ],
    "DebitAcctNo": "ARS100010003",
    "DeptCode": "",
    "Id": "",
    "InputterMvGroup": [
      {
        "valuePosition": "1",
        "subValuePosition": "1",
        "Inputter": ""
      }
    ],
    "LCuit": "",
    "LDescConcep": "",
    "LFechaTrx": "20210929",
    "LIdConcepto": "HAB",
    "LIdlegacy": '#(legacyData)',
    "LNomDest": "prueba",
    "LNroDocOrig": "20055365882",
    "LTipoDocOrig": "CUIT",
    "LTipoMensaje": "0210",
    "LTipoOperator": "",
    "OrderingBankMvGroup": [
      {
        "valuePosition": "1",
        "subValuePosition": "1",
        "OrderingBank": "BDS"
      }
    ],
    "OverrideMvGroup": [
      {
        "valuePosition": "1",
        "subValuePosition": "1",
        "Override": ""
      }
    ],
    "RecordStatus": "",
    "RefNo": '#(RefNo)',
    "TransactionType": "ACM3"
}
"""
    And header Authorization = dataUsuariocoelsa
    And request body
    When method post
    Then status 201
