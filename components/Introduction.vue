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
        <vl-column width="4">
          <vl-infotext
            class="infotext"
            :value="acknowledgedAuthenticSourcesCounter"
            text="Erkende authentieke gegevensbronnen"
          />
        </vl-column>
        <vl-column width="4">
          <vl-infotext
            class="infotext"
            :value="candidateAuthenticSourcesCounter"
            text="Kandidaat authentieke gegevensbronnen"
          />
        </vl-column>
        <vl-column width="4">
          <vl-infotext
            class="infotext"
            :value="inProcedureAuthenticSourcesCounter"
            text="Gegevensbronnen in procedure"
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
    },
    inProcedureAuthenticSourcesCounter: {
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
