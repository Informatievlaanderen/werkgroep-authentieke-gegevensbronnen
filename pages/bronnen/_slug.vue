<template>
  <div>
    <content-header />
    <vl-layout>
      <vl-region>
        <vl-grid mod-stacked>
          <vl-column>
            <vl-button id="prevButton"
              ><nuxt-link to="/"> Terug naar overzicht</nuxt-link>
            </vl-button>
          </vl-column>

          <vl-column>
            <vl-title tag-name="h1">{{ $data }}</vl-title>
          </vl-column>

          <vl-column width="3">
            <vl-description-data-item label="Verantwoordelijke organisatie">
              <a
              >
              </a>
            </vl-description-data-item>
          </vl-column>

        </vl-grid>
      </vl-region>
    </vl-layout>
  </div>
</template>

<script lang="ts">

export default {
  async asyncData() {
    // const data = await $content(params.slug, 'configuratie').fetch()
    // const description = await $content(params.slug, 'beschrijving').fetch()
    // return {
    //   data,
    //   description
    // }
  },
  head() {
    return {
      title: 'AGB Register - Bron in detail'
    }
  }
}
</script>

<style lang="scss">
#prevButton a.nuxt-link-active {
  color: white;
}

#prevButton a:link {
  text-decoration: none;
}
</style>
