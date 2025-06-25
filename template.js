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
