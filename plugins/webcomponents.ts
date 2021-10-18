import Vue from 'vue';
const VlUiVueComponents = require('@govflanders/vl-ui-vue-components')

// configuration of the built-in validator
const validatorConfig = {
  inject: true,
  locale: 'nl'
}

// install the component library with config
Vue.use(VlUiVueComponents, {
  validation: validatorConfig
});