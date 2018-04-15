var path = '';
/* DO NOT CHANGE BELOW */

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}
var utm_source = getParameterByName('utm_source');
var utm_medium = getParameterByName('utm_medium');
var utm_term = getParameterByName('utm_term');
var utm_campaign = getParameterByName('utm_campaign');
var utm_content = getParameterByName('utm_content');
var gclid = getParameterByName('gclid');
var bidmatchtype = getParameterByName('bidmatchtype');
var current_url = window.location.href;
var referrer_url = document.referrer;
var url = path + "/tracker/ajaxTracker.php";
var parameters = [];
if(utm_source){
  parameters['utm_source'] = utm_source;
}
if(utm_medium){
  parameters['utm_medium'] = utm_medium;
}
if(utm_term){
  parameters['utm_term'] = utm_term;
}
if(utm_campaign){
  parameters['utm_campaign'] = utm_campaign;
}
if(utm_content){
  parameters['utm_content'] = utm_content;
}
if(gclid){
  parameters['gclid'] = gclid;
}
if(bidmatchtype){
  parameters['bidmatchtype'] = bidmatchtype;
}
if(current_url){
  parameters['current_url'] = current_url;
}
if(referrer_url){
  parameters['referrer_url'] = referrer_url;
}
var ctr = 0;
for(var index in parameters) {
    ctr++;
    if(ctr == 1){
      url += "?" + index + "=" + encodeURIComponent(parameters[index]);
    }else{
      url += "&" + index + "=" + encodeURIComponent(parameters[index]);
    }
}
function load(url) {
  var xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      console.log(xhr.responseText);
    }
  }
  xmlhttp.open("GET", url, true);
  xmlhttp.send();
}
load(url);
