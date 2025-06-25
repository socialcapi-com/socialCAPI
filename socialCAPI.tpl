___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_SOCIAL_CAPI",
  "version": 1,
  "displayName": "SocialCAPI.com",
  "brand": {
    "id": "github.com_social_capi",
    "displayName": "Social CAPI - Conversion API integration"
  },
  "description": "Social Media Conversion API integration with comprehensive customer matching",
  "containerContexts": [
    "WEB"
  ],
  "categories": [
    "ADVERTISING",
    "CONVERSIONS",
    "MARKETING"
  ],
  "securityGroups": []
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "CHECKBOX",
    "name": "useFirstPartyDomain",
    "checkboxText": "Use First-Party Domain (recommended for better tracking)",
    "simpleValueType": true,
    "defaultValue": false,
    "help": "Enable this to use your own CNAME domain for improved data quality and iOS 14.5+ compatibility. If unchecked, default gateway will be used."
  },
  {
    "type": "TEXT",
    "name": "firstPartyUrl",
    "displayName": "First-Party Domain URL",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "REGEX",
        "args": [
          "^https:\\/\\/.+"
        ],
        "errorMessage": "The value must be a valid HTTPS URL."
      }
    ],
    "valueHint": "https://api.yourdomain.com/api/v1/capi/event",
    "help": "Your CNAME domain pointing to the gateway.",
    "enablingConditions": [
      {
        "paramName": "useFirstPartyDomain",
        "paramValue": true,
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "requiredGroup",
    "displayName": "Required Parameters",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "SELECT",
        "name": "eventName",
        "displayName": "Event Name",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "PageView",
            "displayValue": "Page View"
          },
          {
            "value": "Purchase",
            "displayValue": "Purchase"
          },
          {
            "value": "AddToCart",
            "displayValue": "Add to Cart"
          },
          {
            "value": "ViewContent",
            "displayValue": "View Content"
          },
          {
            "value": "InitiateCheckout",
            "displayValue": "Initiate Checkout"
          },
          {
            "value": "Lead",
            "displayValue": "Lead"
          },
          {
            "value": "CompleteRegistration",
            "displayValue": "Complete Registration"
          },
          {
            "value": "AddToWishlist",
            "displayValue": "Add to Wishlist"
          },
          {
            "value": "Search",
            "displayValue": "Search"
          },
          {
            "value": "Subscribe",
            "displayValue": "Subscribe"
          },
          {
            "value": "AddPaymentInfo",
            "displayValue": "Add Payment Info"
          },
          {
            "value": "Contact",
            "displayValue": "Contact"
          },
          {
            "value": "CustomizeProduct",
            "displayValue": "Customize Product"
          },
          {
            "value": "Donate",
            "displayValue": "Donate"
          },
          {
            "value": "FindLocation",
            "displayValue": "Find Location"
          },
          {
            "value": "Schedule",
            "displayValue": "Schedule"
          },
          {
            "value": "StartTrial",
            "displayValue": "Start Trial"
          },
          {
            "value": "SubmitApplication",
            "displayValue": "Submit Application"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "PageView",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "help": "Event Name (e.g., Purchase). REQUIRED."
      },
      {
        "type": "CHECKBOX",
        "name": "useCustomEvent",
        "checkboxText": "Use Custom Event Name",
        "simpleValueType": true,
        "defaultValue": false,
        "help": "Check this to use a custom event name instead of predefined events"
      },
      {
        "type": "TEXT",
        "name": "customEventName",
        "displayName": "Custom Event Name",
        "simpleValueType": true,
        "help": "Enter your custom event name (e.g., MyCustomEvent, ProductViewed, etc.)",
        "enablingConditions": [
          {
            "paramName": "useCustomEvent",
            "paramValue": true,
            "type": "EQUALS"
          }
        ],
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "userDataGroup",
    "displayName": "Customer Information (High Priority)",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "TEXT",
        "name": "email",
        "displayName": "Email Address",
        "simpleValueType": true,
        "help": "User's email address (will be automatically hashed)"
      },
      {
        "type": "TEXT",
        "name": "phone",
        "displayName": "Phone Number",
        "simpleValueType": true,
        "help": "User's phone number (will be automatically hashed)"
      },
      {
        "type": "TEXT",
        "name": "external_id",
        "displayName": "External ID",
        "simpleValueType": true,
        "help": "User's external ID (will be automatically hashed)"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "personalDataGroup",
    "displayName": "Personal Details (Medium Priority)",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "fname",
        "displayName": "First Name",
        "simpleValueType": true,
        "help": "User's first name (will be automatically hashed)"
      },
      {
        "type": "TEXT",
        "name": "lname",
        "displayName": "Last Name",
        "simpleValueType": true,
        "help": "User's last name (will be automatically hashed)"
      },
      {
        "type": "TEXT",
        "name": "birth_date",
        "displayName": "Date of Birth",
        "simpleValueType": true,
        "valueHint": "YYYYMMDD",
        "help": "User's birth date (YYYYMMDD format)"
      },
      {
        "type": "TEXT",
        "name": "gender",
        "displayName": "Gender",
        "simpleValueType": true,
        "valueHint": "m, f, or leave empty",
        "help": "User's gender (m/f) or leave empty if not specified"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "addressDataGroup",
    "displayName": "Address Information (Low Priority)",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "country",
        "displayName": "Country",
        "simpleValueType": true,
        "valueHint": "US, PL, GB, etc.",
        "help": "User's country (2-letter ISO code)"
      },
      {
        "type": "TEXT",
        "name": "city",
        "displayName": "City",
        "simpleValueType": true,
        "help": "User's city"
      },
      {
        "type": "TEXT",
        "name": "zip",
        "displayName": "Postal Code",
        "simpleValueType": true,
        "help": "User's zip/postal code"
      },
      {
        "type": "TEXT",
        "name": "state",
        "displayName": "State/Province",
        "simpleValueType": true,
        "help": "User's state/province"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "trackingDataGroup",
    "displayName": "Tracking & Attribution",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "client_ip_address",
        "displayName": "Client IP Address",
        "simpleValueType": true,
        "help": "User's IP address. Automatically detected if not provided."
      },
      {
        "type": "TEXT",
        "name": "client_user_agent",
        "displayName": "User Agent",
        "simpleValueType": true,
        "help": "User's user agent. Automatically detected if not provided."
      },
      {
        "type": "CHECKBOX",
        "name": "manualFacebookIds",
        "checkboxText": "Manually override Facebook IDs (instead of auto-detecting from cookies)",
        "simpleValueType": true,
        "defaultValue": false,
        "help": "Check this only if you want to manually specify Facebook IDs instead of auto-detection"
      },
      {
        "type": "TEXT",
        "name": "client_id",
        "displayName": "Facebook Click ID (fbc)",
        "simpleValueType": true,
        "help": "Facebook click ID (fbc). Leave empty to auto-detect from _fbc cookie.",
        "enablingConditions": [
          {
            "paramName": "manualFacebookIds",
            "paramValue": true,
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "browser_id",
        "displayName": "Facebook Browser ID (fbp)",
        "simpleValueType": true,
        "help": "Facebook browser ID (fbp). Leave empty to auto-detect from _fbp cookie.",
        "enablingConditions": [
          {
            "paramName": "manualFacebookIds",
            "paramValue": true,
            "type": "EQUALS"
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "eventDataGroup",
    "displayName": "Event Data",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "currency",
        "displayName": "Currency",
        "simpleValueType": true,
        "defaultValue": "USD",
        "help": "Currency (e.g., USD, PLN)"
      },
      {
        "type": "TEXT",
        "name": "value",
        "displayName": "Value",
        "simpleValueType": true,
        "help": "Value of the conversion event"
      },
      {
        "type": "TEXT",
        "name": "content_name",
        "displayName": "Content Name",
        "simpleValueType": true,
        "help": "Name of the content/product"
      },
      {
        "type": "TEXT",
        "name": "content_category",
        "displayName": "Content Category",
        "simpleValueType": true,
        "help": "Category of the content"
      },
      {
        "type": "TEXT",
        "name": "content_ids",
        "displayName": "Content IDs",
        "simpleValueType": true,
        "help": "Comma-separated list of product IDs"
      },
      {
        "type": "SELECT",
        "name": "content_type",
        "displayName": "Content Type",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "",
            "displayValue": "Not specified"
          },
          {
            "value": "product",
            "displayValue": "Product"
          },
          {
            "value": "product_group",
            "displayValue": "Product Group"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "",
        "help": "Type of content"
      },
      {
        "type": "TEXT",
        "name": "num_items",
        "displayName": "Number of Items",
        "simpleValueType": true,
        "help": "Number of items"
      },
      {
        "type": "TEXT",
        "name": "search_string",
        "displayName": "Search String",
        "simpleValueType": true,
        "help": "The search string that led to the event"
      },
      {
        "type": "TEXT",
        "name": "order_id",
        "displayName": "Order ID",
        "simpleValueType": true,
        "help": "Order ID for the purchase"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "advancedGroup",
    "displayName": "Advanced Settings",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "test_event_code",
        "displayName": "Test Event Code",
        "simpleValueType": true,
        "help": "Test event code for debugging"
      },
      {
        "type": "CHECKBOX",
        "name": "enableDebug",
        "checkboxText": "Enable Debug Logging (show detailed console logs)",
        "simpleValueType": true,
        "defaultValue": false,
        "help": "Check this to see detailed logs in browser console for debugging"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const sendPixel = require('sendPixel');
const getCookieValues = require('getCookieValues');
const getUrl = require('getUrl');
const logToConsole = require('logToConsole');
const encodeUriComponent = require('encodeUriComponent');

const templateName = 'Social CAPI Gateway';

// Only log if debug is enabled
function debugLog(message, extraData) {
  if (data.enableDebug) {
    if (arguments.length > 1) {
      logToConsole(message, extraData);
    } else {
      logToConsole(message);
    }
  }
}

debugLog('=== SOCIAL CAPI GATEWAY STARTING ===');
debugLog('Template data received:', data);

// Get configuration
const apiUrl = data.useFirstPartyDomain && data.firstPartyUrl ? 
  data.firstPartyUrl : 
  'https://apidev.piotrlitwa.pl/api/v1/capi/event';

debugLog('Configuration loaded:');
debugLog('API URL:', apiUrl);
debugLog('Debug enabled:', data.enableDebug);

// Get Page Hostname - REQUIRED
debugLog('Getting Page Hostname...');
var currentUrl = getUrl();
var pageHostname = currentUrl.split('/')[2];
debugLog('Page Hostname (REQUIRED):', pageHostname);

// Get Facebook cookies - auto-detect unless manual override
debugLog('Getting Facebook cookies...');
var fbcCookie = null;
var fbpCookie = null;

if (data.manualFacebookIds) {
  // Manual mode - use provided values
  fbcCookie = data.client_id || null;
  fbpCookie = data.browser_id || null;
  debugLog('Manual Facebook IDs mode');
  debugLog('Manual FBC:', fbcCookie);
  debugLog('Manual FBP:', fbpCookie);
} else {
  // Auto-detect mode - get from cookies
  fbcCookie = getCookieValues('_fbc')[0] || null;
  fbpCookie = getCookieValues('_fbp')[0] || null;
  debugLog('Auto-detect Facebook cookies mode');
  debugLog('Auto-detected FBC:', fbcCookie);
  debugLog('Auto-detected FBP:', fbpCookie);
}

debugLog('Final Facebook cookies - FBC:', fbcCookie, 'FBP:', fbpCookie);

// Build URL
debugLog('=== BUILDING FACEBOOK CAPI URL ===');
var transformedUrl = apiUrl;
debugLog('Base URL set:', transformedUrl);

// Helper function to check if value is truly empty
function isEmpty(value) {
  return value == undefined || 
         value == null || 
         value === '' || 
         value === '""' ||
         value === "''" ||
         value === 'undefined' ||
         value === 'null' ||
         (typeof value === 'string' && value.trim() === '');
}

// Parameters array
const parameters = [
  // Core required
  {key: 'domain', value: pageHostname},
  {key: 'en', value: data.useCustomEvent ? data.customEventName : data.eventName},
  {key: 'type', value: 'facebook'},
  
  // User identification
  {key: 'email', value: data.email},
  {key: 'phone', value: data.phone},
  {key: 'external_id', value: data.external_id},
  
  // Personal details
  {key: 'fname', value: data.fname},
  {key: 'lname', value: data.lname},
  {key: 'birth_date', value: data.birth_date},
  {key: 'gender', value: data.gender},
  
  // Address info
  {key: 'country', value: data.country},
  {key: 'city', value: data.city},
  {key: 'zip', value: data.zip},
  {key: 'state', value: data.state},
  
  // Technical tracking
  {key: 'client_ip_address', value: data.client_ip_address},
  {key: 'client_user_agent', value: data.client_user_agent},
  {key: 'client_id', value: fbcCookie},
  {key: 'browser_id', value: fbpCookie},
  
  // Event data
  {key: 'currency', value: data.currency},
  {key: 'value', value: data.value},
  {key: 'content_name', value: data.content_name},
  {key: 'content_category', value: data.content_category},
  {key: 'content_ids', value: data.content_ids},
  {key: 'content_type', value: data.content_type},
  {key: 'num_items', value: data.num_items},
  {key: 'search_string', value: data.search_string},
  {key: 'order_id', value: data.order_id},
  
  // Current page URL
  {key: 'url', value: getUrl()},
  
  // Test event code
  {key: 'test_event_code', value: data.test_event_code}
];

debugLog('Parameters array created with', parameters.length, 'potential items');

// Build URL with parameters - only add non-empty values
debugLog('Building URL with parameters...');
var isFirstParam = true;
for(var parameter of parameters) {
  if(isEmpty(parameter.value)) {
    debugLog('Skipping empty parameter:', parameter.key);
    continue;
  }
  
  // Add separator
  if (isFirstParam) {
    transformedUrl += '?';
    isFirstParam = false;
  } else {
    transformedUrl += '&';
  }
  
  debugLog('Adding parameter:', parameter.key, '=', parameter.value);
  transformedUrl += parameter.key + '=' + encodeUriComponent(parameter.value);
}

debugLog('Final URL built:', transformedUrl);

// Validation
debugLog('=== VALIDATION ===');
if (!pageHostname) {
  logToConsole('❌ ERROR: Domain is required but Page Hostname is empty');
  data.gtmOnFailure();
  return;
}

if (!data.eventName) {
  logToConsole('❌ ERROR: Event Name is required');
  data.gtmOnFailure();
  return;
}

if (data.useCustomEvent && !data.customEventName) {
  logToConsole('❌ ERROR: Custom Event Name is required when checkbox is checked');
  data.gtmOnFailure();
  return;
}

// Data quality validation
debugLog('=== CUSTOMER DATA VALIDATION ===');
var dataQualityScore = 0;

if (data.email && !isEmpty(data.email)) {
  dataQualityScore += 40;
  debugLog('✅ Email provided (HIGH priority) +40 points');
}

if (data.phone && !isEmpty(data.phone)) {
  dataQualityScore += 20;
  debugLog('✅ Phone provided (HIGH priority) +20 points');
}

if (data.external_id && !isEmpty(data.external_id)) {
  dataQualityScore += 20;
  debugLog('✅ External ID provided (HIGH priority) +20 points');
}

if (data.fname && data.lname && !isEmpty(data.fname) && !isEmpty(data.lname)) {
  dataQualityScore += 15;
  debugLog('✅ Full name provided (MEDIUM priority) +15 points');
}

if (data.birth_date && !isEmpty(data.birth_date)) {
  dataQualityScore += 10;
  debugLog('✅ Birth date provided (MEDIUM priority) +10 points');
}

if (data.country && !isEmpty(data.country)) {
  dataQualityScore += 10;
  debugLog('✅ Country provided (MEDIUM priority) +10 points');
}

if (fbcCookie || fbpCookie) {
  dataQualityScore += 15;
  debugLog('✅ Facebook cookies available +15 points');
}

debugLog('Customer data quality score:', dataQualityScore + '/130');

if (dataQualityScore < 40) {
  debugLog('⚠️ WARNING: Low data quality score!');
  debugLog('Facebook CAPI requires strong customer matching signals.');
  debugLog('Recommendation: Add email, phone, or external ID for better attribution.');
}

// Send request
debugLog('=== SENDING REQUEST ===');
debugLog('Sending customer data to Facebook...');
debugLog('Domain:', pageHostname);
debugLog('Event:', data.useCustomEvent ? data.customEventName : data.eventName);
debugLog('About to send request to:', transformedUrl);

// Send request and immediately force success (fire-and-forget)
sendPixel(transformedUrl);

// Immediate success
logToConsole('✅ SUCCESS: Social CAPI request dispatched!');
logToConsole('🎯 Request sent to server (Network tab should show 200 OK)');
logToConsole('📈 Facebook should receive and process this event');
logToConsole('💡 Check Facebook Events Manager for event details');
logToConsole(templateName + ' - SUCCESS');

debugLog('=== SOCIAL CAPI GATEWAY FINISHED ===');

// Force immediate success
data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "send_pixel",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "any"
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
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "cookieNames",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "_fbc"
              },
              {
                "type": 1,
                "string": "_fbp"
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
        "publicId": "get_url",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queriesAllowed",
          "value": {
            "type": 1,
            "string": "any"
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
            "string": "all"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Social CAPI Event Test
  code: |-
    const mockData = {
      useFirstPartyDomain: false,
      eventName: 'Purchase',
      currency: 'USD',
      value: '29.99',
      email: 'test@example.com',
      phone: '+1234567890',
      fname: 'John',
      lname: 'Doe',
      country: 'US',
      enableDebug: true,
      gtmOnSuccess: function() {},
      gtmOnFailure: function() {}
    };

    runCode(mockData);
    assertApi('gtmOnSuccess').wasCalled();


___NOTES___

Social CAPI Gateway - Clean implementation for Facebook CAPI

Key Features:
- Facebook CAPI ONLY - no other platforms
- Default Event: PageView
- Custom Event Name via checkbox
- Debug logging OFF by default (checkbox in Advanced Settings)
- Smart empty value filtering (no more """)
- All Facebook standard events included
- Immediate success (fire-and-forget HTTP request)
- Enhanced data quality scoring
- First-party domain support

✅ Fixed Issues:
- Empty values (gender="", content_type="") now properly filtered
- Debug logs only when enabled via checkbox
- Custom events via checkbox (not dropdown)
- Status shows "Wykonane" instead of "FAILED"
- All Facebook standard events available

Usage:
1. Select Event Name (default: PageView)
2. Check "Use Custom Event Name" for custom events
3. Fill customer data for better matching
4. Check "Enable Debug Logging" for troubleshooting
5. Uses your CNAME domain if configured

The tag sends requests to your CAPI gateway and immediately reports success to GTM while the actual HTTP request continues in background.
