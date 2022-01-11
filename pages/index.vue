<template>
  <div>
    <content-header />
    <vl-layout>
      <vl-grid mod-stacked>
        <vl-column>
          <introduction
            :acknowledged-authentic-sources-counter="
              acknowledgedAuthenticSources.length.toString()
            "
            :candidate-authentic-sources-counter="
              candidateAuthenticSources.length.toString()
            "
            :in-procedure-authentic-sources-counter="
              inProcedureAuthenticSources.length.toString()
            "
          />
        </vl-column>
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
          <transition name="fade"><search-result /> </transition>
        </vl-column>
        <vl-column>
          <vl-title tag-name="h2" mod-alt> Bronnen per status </vl-title>
        </vl-column>
        <vl-column>
          <vl-infoblock
            :id="id"
            mod-type="news"
            title="Erkende Authentieke Gegevensbronnen"
          >
            <data-table
              id="acknowledged"
              title="Erkende Authentieke Gegevensbronnen"
              :sources="acknowledgedAuthenticSources"
            />
          </vl-infoblock>
        </vl-column>
        <vl-column>
          <vl-infoblock
            :id="id"
            mod-type="news"
            title="Kandidaat Authentieke Gegevensbronnen"
          >
            <data-table
              id="candidate"
              title="Kandidaat Authentieke Gegevensbronnen"
              :sources="candidateAuthenticSources"
            />
          </vl-infoblock>
        </vl-column>
        <vl-column>
          <vl-infoblock
            :id="id"
            mod-type="news"
            title="Gegevensbronnen in procedure"
          >
            <data-table
              id="in-procedure"
              title="Gegevensbronnen in procedure"
              :sources="inProcedureAuthenticSources"
            />
          </vl-infoblock>
        </vl-column>
      </vl-grid>
    </vl-layout>
  </div>
</template>

<script lang="ts">
import { Context } from '@nuxt/types'
import dataTable from '~/components/data-table.vue'

export default {
  components: { dataTable },
  async asyncData({ $content }: Context) {
    const acknowledgedAuthenticSources = await $content({ deep: true })
      .where({ extension: '.json', status: 'erkend' })
      .sortBy('naam', 'asc')
      .fetch()
    const candidateAuthenticSources = await $content({ deep: true })
      .where({ extension: '.json', status: 'kandidaat' })
      .sortBy('naam', 'asc')
      .fetch()

    const inProcedureAuthenticSources = await $content({ deep: true })
      .where({
        extension: '.json',
        status: 'lopend'
      })
      .sortBy('naam', 'asc')
      .fetch()

    return {
      acknowledgedAuthenticSources,
      candidateAuthenticSources,
      inProcedureAuthenticSources
    }
  }
}
</script>
