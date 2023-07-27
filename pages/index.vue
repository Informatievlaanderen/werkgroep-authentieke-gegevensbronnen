<template>
  <div>
    <content-header />
    <vl-layout>
      <vl-grid mod-stacked>
        <vl-column>
          <vl-title tag-name="h2" mod-alt
            >Vlaamse Authentieke Gegevensbronnen
          </vl-title>
        </vl-column>
        <vl-column>
          <explanation />
        </vl-column>
        <vl-column>
          <vl-title tag-name="h2" mod-alt> Zoek een bron </vl-title>
        </vl-column>
        <vl-column>
          <search-input />
        </vl-column>
        <vl-column>
          <vl-title tag-name="h2" mod-alt> Bronnen per status </vl-title>
        </vl-column>
      </vl-grid>
    </vl-layout>
  </div>
</template>