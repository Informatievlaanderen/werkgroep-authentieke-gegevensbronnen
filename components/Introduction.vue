<template>
  <div>
    <vl-region>
      <vl-introduction>
        Dit register geeft een overzicht van alle erkende en lopende trajecten
        van Vlaamse Authentieke Gegevensbronnen.
      </vl-introduction>
    </vl-region>
    <vl-region>
      <vl-grid mod-stacked>
        <vl-column width="6">
          <vl-infotext
            class="infotext"
            href="#"
            :value="acknowledgedAuthenticSourcesCounter"
            text="Erkende bronnen"
          />
        </vl-column>
        <vl-column width="6">
          <vl-infotext
            class="infotext"
            href="#"
            :value="candidateAuthenticSourcesCounter"
            text="Bronnen in behandeling"
          />
        </vl-column>
      </vl-grid>
    </vl-region>
  </div>
</template>

<script lang="ts">
export default {
  props: {
    acknowledgedAuthenticSourcesCounter: {
      type: String,
      default: '0'
    },
    candidateAuthenticSourcesCounter: {
      type: String,
      default: '0'
    }
  }
}
</script>

<style lang="scss">
.infotext {
  color: #0055cc;
}
</style>
