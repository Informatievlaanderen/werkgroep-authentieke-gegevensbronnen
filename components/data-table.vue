<template>
  <vl-data-table mod-hover>
    <caption>
      {{
        title
      }}
    </caption>
    <thead>
      <tr>
        <th>Naam</th>
        <th>Verantwoordelijke organisatie</th>
        <th>Status</th>
        <th>Datum van status</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="dataSource in sources" :key="dataSource.naam">
        <td>
          <a :href="'/bronnen' + dataSource.dir">
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
        <td>{{ dataSource.statusDetail || 'Geen status bekend' }}</td>
        <td>{{ dataSource.datumStatus || 'Geen datum bekend' }}</td>
      </tr>
    </tbody>
  </vl-data-table>
</template>

<script lang="ts">
export default {
  props: {
    id: {
      type: String,
      default: 'data-table'
    },
    title: {
      type: String,
      default: ''
    },
    sources: {
      type: Array,
      default: () => []
    }
  }
}
</script>
