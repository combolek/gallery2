try{modules.add("ie7-css-strict",function(){var NONE=[],ID=/#/g,CLASS=/[:@\.]/g,TAG=/^\w|[\s>+~]\w/g;ie7StyleSheet.parser.parse=function(cssText){var DYNAMIC=/(.*):(hover|active|focus)(.*)/;function addRule(selector,cssText){var match=selector.match(DYNAMIC);if(match)new DynamicRule(selector,match[1],match[2],match[3],cssText);else new Rule(selector,cssText)};var RULE=/([^\{]+)\{(\d+)\}/g,match;while(match=RULE.exec(cssText)){addRule(match[1],match[2]);if(appVersion<5.5)cssText=cssText.slice(match.lastIndex)}ie7StyleSheet.classes.sort(Rule.compare);return ie7StyleSheet.classes.join("\n")};function Rule(selector,cssText){this.inherit=ie7StyleSheet.Class;this.inherit(selector);this.cssText=cssText;this.specificity=Rule.score(selector)};Rule.prototype=new ie7StyleSheet.Class.ancestor;Rule.prototype.toString=function(){return "."+this.name+"{"+this.cssText+"}"};Rule.score=function(selector){with(selector)return(match(ID)||NONE).length*10000+(match(CLASS)||NONE).length*100+(match(TAG)||NONE).length};Rule.compare=function(rule1,rule2){return rule1.specificity-rule2.specificity};function DynamicRule(selector,attach,dynamicPseudoClass,target,cssText){this.inherit=ie7StyleSheet.DynamicStyle;this.inherit(selector,attach,dynamicPseudoClass,target);this.cssText=cssText;this.specificity=Rule.score(selector)};DynamicRule.prototype=new ie7StyleSheet.DynamicStyle.ancestor;DynamicRule.prototype.toString=Rule.prototype.toString})}catch(error){}