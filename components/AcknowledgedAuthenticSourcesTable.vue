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
            <a target="_blank" :href="'/bronnen' + dataSource.dir">
              {{ dataSource.naam }}
            </a>
          </td>
          <td>
            <p v-if="dataSource.verantwoordelijkeOrganisatie == ''">
              Organisatie niet gekend
            </p>
            <a v-else target="_blank" :href="dataSource.organisatielink">
              {{ dataSource.verantwoordelijkeOrganisatie }}
            </a>
          </td>
          <td>{{ dataSource.datumStatus || 'Geen datum bekend' }}</td>
        </tr>
      </tbody>
    </vl-data-table>
  </vl-infoblock>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  props: {
    acknowledgedAuthenticSources: {
      type: Array,
      default: () => []
    }
  }
})
</script>
