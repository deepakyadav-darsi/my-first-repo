using btp.demo as db from '../db/data/data-model';

service EmployeeService {

    @odata.draft.enabled
      entity employeeregistry
          as select from db.employeeRegistry;
                @odata.draft.enabled
                  entity city_name
                      as select from db.city_name;

                      }



/* =======================================================
   Employee Annotations
   (NO FUNCTIONAL CHANGES – formatting only)
   ======================================================= */
annotate EmployeeService.employeeregistry with @(

  UI : {

    LineItem : [
      {
        $Type  : 'UI.DataField',
        Value  : name
      },
      {
        $Type  : 'UI.DataField',
        Value  : email_id
      },
      {
        $Type  : 'UI.DataField',
        Value  : department
      }
    ],

    FieldGroup #GeneralInfo : {
      Label : 'General Information',
      Data  : [
        {
          $Type  : 'UI.DataField',
          Label  : 'Name',
          Value  : name
        },
        {
          $Type  : 'UI.DataField',
          Label  : 'Email ID',
          Value  : email_id
        },
        {
          $Type  : 'UI.DataField',
          Label  : 'Department',
          Value  : department
        }
      ]
    },

    FieldGroup #AdditionalInfo : {
      Label : 'Additional Information',
      Data  : [
        {
          $Type  : 'UI.DataField',
          Value  : name
        },
        {
          $Type  : 'UI.DataField',
          Value  : email_id
        },
        {
          $Type  : 'UI.DataField',
          Value  : department
        }
      ]
    },

    Facets : [
      {
        $Type   : 'UI.ReferenceFacet',
        Label   : 'General Information',
        Target  : '@UI.FieldGroup#GeneralInfo',
        ID      : 'GeneralInfo'     // ✅ CHANGED (was "id", now correct "ID")
      },
      {
        $Type   : 'UI.ReferenceFacet',
        Label   : 'Additional Information',
        Target  : '@UI.FieldGroup#AdditionalInfo',
        ID      : 'AdditionalInfo'  // ✅ CHANGED (was "id", now correct "ID")
      }
    ]

  }

);


/* =======================================================
   City Annotations
   ======================================================= */
annotate EmployeeService.city_name with @(

  UI : {

    LineItem : [
      {
        $Type  : 'UI.DataField',
        Value  : city
      }
    ],

    FieldGroup #AdminData : {
      Label : 'City Information',     // ✅ CHANGED (added label)

      Data  : [
        {
          $Type  : 'UI.DataField',
          Label  : 'City',
          Value  : city
        }
      ]

      // ❌ REMOVED:
      // $Type : 'UI.FieldGroupType'
      // (This is INVALID in CDS and was breaking the Object Page)
    },

    Facets : [
      {
        $Type   : 'UI.ReferenceFacet',
        Label   : 'City',
        Target  : '@UI.FieldGroup#AdminData',
        ID      : 'CityInfo'           // ✅ CHANGED (added ID – recommended)
      }
    ]

  }

);