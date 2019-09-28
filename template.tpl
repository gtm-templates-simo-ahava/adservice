___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "categories": ["ADVERTISING"],
  "securityGroups": [],
  "displayName": "AdService",
  "brand": {
    "id": "brand_dummy",
    "displayName": "",
    "logo": "",
    "thumbnail": ""
  },
  "description": "Template to deploy AdService calls.",
  "__wm": "VGVtcGxhdGUtQXV0aG9yX0FkU2VydmljZS1TaW1vLUFoYXZh",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "scriptType",
    "displayName": "Script Type",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "RoutedLastClick",
        "displayValue": "RoutedLastClick"
      },
      {
        "value": "RoutedContainer",
        "displayValue": "RoutedContainer"
      }
    ],
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "cid",
    "displayName": "Feed Category ID (cid)",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "POSITIVE_NUMBER"
      }
    ]
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "properties",
    "displayName": "Properties",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Name",
        "name": "name",
        "type": "SELECT",
        "isUnique": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "selectItems": [
          {
            "value": "order_id",
            "displayValue": "&order_id"
          },
          {
            "value": "pricevariable",
            "displayValue": "&pricevariable"
          }
        ]
      },
      {
        "defaultValue": "",
        "displayName": "Value",
        "name": "value",
        "type": "TEXT",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      }
    ],
    "newRowButtonText": "Add property"
  }
]


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://online.adservicemedia.dk/cgi-bin/Services/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

/* GTMTEMPLATESCOM_CHECKSUM:[5712088936742912,1562313794359,2a86837a55c37a049100bffb0a2d02e7] */

const injectScript = require('injectScript');
const log = require('logToConsole');

const parameterString = '?cid=' + data.cid + (data.properties ? '&' + data.properties.map(prop => prop.name + '=' + prop.value).join('&') : '');

injectScript('https://online.adservicemedia.dk/cgi-bin/Services/' + data.scriptType + '/js' + parameterString, data.gtmOnSuccess, data.gtmOnFailure);


___NOTES___

Created on 10/06/2019, 13:42:03