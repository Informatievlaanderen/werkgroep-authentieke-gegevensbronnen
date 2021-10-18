<template>
  <div>
    <ContentHeader />

    <vl-layout>
      <Introduction
        :acknowledged-authentic-sources-counter="
          acknowledgedAuthenticSources.length.toString()
        "
        :candidate-authentic-sources-counter="candidateAuthenticSources.length.toString()"
      />

      <vl-title tag-name="h2" mod-alt
        >Vlaamse Authentieke Gegevensbronnen
      </vl-title>
      <Explanation />

      <vl-title tag-name="h2" mod-alt> Lijst met bronnen </vl-title>
      <vl-region>
        <AcknowledgedAuthenticSourcesTable
          :acknowledged-authentic-sources="acknowledgedAuthenticSources"
        />
      </vl-region>
      <vl-region>
        <CandidateAuthenticSourcesTable
          :candidate-authentic-sources="candidateAuthenticSources"
        />
      </vl-region>
    </vl-layout>
  </div>
</template>

<script lang="ts">
import { Context } from '@nuxt/types'

export default {
  async asyncData({ $content }: Context) {
    const acknowledgedAuthenticSources = await $content({ deep: true })
      .where({ extension: '.json', status: 'erkend' })
      .fetch()
    const candidateAuthenticSources = await $content({ deep: true })
      .where({ extension: '.json', status: 'kandidaat' })
      .fetch()

    return {
      acknowledgedAuthenticSources,
      candidateAuthenticSources
    }
  }
}
</script>
