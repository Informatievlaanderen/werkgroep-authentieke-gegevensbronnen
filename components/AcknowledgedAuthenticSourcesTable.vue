<template>
  <vl-infoblock mod-type="news" title="Erkende bronnen">
    <vl-data-table mod-hover>
      <caption>
        Erkende Vlaamse Authentieke Gegevensbronnen
      </caption>
      <thead>
        <tr>
          <th>Naam</th>
          <th>Verantwoordelijke organisatie</th>
          <th>Erkend op</th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="dataSource in acknowledgedAuthenticSources"
          :key="dataSource.naam"
        >
          <td>
            <a :href="'/bronnen' + dataSource.dir">
              {{ dataSource.naam }}
            </a>
          </td>
          <td>
            <a :href="dataSource.organisatieLink">
              {{ dataSource.verantwoordelijkeOrganisatie }}
            </a>
          </td>
          <td>{{ dataSource.datumStatus }}</td>
        </tr>
      </tbody>
    </vl-data-table>
  </vl-infoblock>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  props: ['acknowledgedAuthenticSources']
})
</script>
