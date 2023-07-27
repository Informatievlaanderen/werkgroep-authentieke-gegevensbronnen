import VlUiVueComponents from '@govflanders/vl-ui-design-system-vue3';


export default defineNuxtPlugin(nuxtApp => {
    // configuration of the built-in validator
    const validatorConfig = {
        inject: true,
        locale: 'nl'
    }

    // install the component library with config
    nuxtApp.vueApp.use(VlUiVueComponents, {
        validation: validatorConfig
    });
})
