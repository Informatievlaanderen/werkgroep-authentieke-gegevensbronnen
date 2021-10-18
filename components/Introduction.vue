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
            href="#"
            value="5"
            text="Erkende bronnen"
          />
        </vl-column>
        <vl-column width="4">
          <vl-infotext
            class="infotext"
            href="#"
            value="5"
            text="Bronnen in behandeling"
          />
        </vl-column>
        <vl-column width="4">
          <vl-infotext
            class="infotext"
            href="#"
            value="5"
            text="Bronnen in aanvraag"
          />
        </vl-column>
      </vl-grid>
    </vl-region>
  </div>
</template>

<style lang="scss">
.infotext {
  color: #0055cc;
}
</style>
