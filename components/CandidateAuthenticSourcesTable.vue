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
          <th>Erkend op</th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="dataSource in candidateAuthenticSources"
          :key="dataSource.naam"
        >
          <td>
            <a :href="'/bronnen' + dataSource.dir">
              {{ dataSource.naam }}
            </a>
          </td>
          <td>{{ dataSource.statusDetail }}</td>
          <td>{{ dataSource.datumVanGoedkeuring }}</td>
        </tr>
      </tbody>
    </vl-data-table>
  </vl-infoblock>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  props: ['acknowledgedAuthenticSources', 'candidateAuthenticSources']
})
</script>
