<template>
  <vl-infoblock mod-type="news" title="Kandidaat bronnen">
    <vl-data-table mod-hover>
      <caption>
        Kandidaat Vlaamse Authentieke Gegevensbronnen
      </caption>
      <thead>
        <tr>
          <th>Naam</th>
          <th>Status</th>
          <th>Datum van status</th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="dataSource in candidateAuthenticSources"
          :key="dataSource.naam"
        >
          <td>
            <a target="_blank" :href="'/bronnen' + dataSource.dir">
              {{ dataSource.naam }}
            </a>
          </td>
          <td>{{ dataSource.statusDetail }}</td>
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
    candidateAuthenticSources: {
      type: Array,
      default: () => []
    }
  }
})
</script>
