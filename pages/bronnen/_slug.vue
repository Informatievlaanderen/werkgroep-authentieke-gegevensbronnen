<template>
  <div>
    <ContentHeader />

    <vl-layout>
      <vl-region>
        <vl-button id="prevButton"
          ><nuxt-link to="/"> Terug naar overzicht</nuxt-link>
        </vl-button>
      </vl-region>
      <vl-region>
        <vl-grid mod-stacked>
          <vl-column>
            <vl-title tag-name="h1">{{ data.naam }}</vl-title>
          </vl-column>

          <vl-column width="3">
            <vl-description-data-item label="Verantwoordelijke organisatie">
              <a
                v-if="data.verantwoordelijkeOrganisatie && data.organisatieLink"
                :href="data.organisatieLink"
              >
                {{ data.verantwoordelijkeOrganisatie }}
              </a>
              <div v-else>
                {{ data.verantwoordelijkeOrganisatie || 'Niet gekend' }}
              </div>
            </vl-description-data-item>
          </vl-column>

          <vl-column width="3">
            <vl-description-data-item label="Status">
              {{ data.status }}
            </vl-description-data-item>
          </vl-column>

          <vl-column width="3">
            <vl-description-data-item label="Status in detail">
              {{ data.statusDetail }}
            </vl-description-data-item>
          </vl-column>

          <vl-column width="3">
            <vl-description-data-item label="Datum van status">
              {{ data.datumStatus || 'Datum niet gekend' }}
            </vl-description-data-item>
          </vl-column>

          <vl-column>
            <vl-introduction>
              <nuxt-content :document="description" />
            </vl-introduction>
          </vl-column>

          <vl-column width="6">
            <vl-spotlight title="Documenten">
              <div
                v-for="document in data.documenten"
                :key="document.weergaveNaam"
              >
                <a :href="document.documentNaam">
                  {{ document.weergaveNaam }}
                </a>
                <br />
              </div>
            </vl-spotlight>
          </vl-column>

          <vl-column width="6">
            <vl-spotlight title="Contactpersoon">
              <div v-if="data.contactPersoon">
                <p v-if="data.contactPersoon.naam && data.contactPersoon.email">
                  {{ data.contactPersoon.naam }} —
                  <a :href="'mailto:' + data.contactPersoon.email">
                    {{ data.contactPersoon.email }}
                  </a>
                </p>
                <p v-else>
                  {{ data.contactPersoon.naam }} — E-mailadres ongekend
                </p>
              </div>
              <div v-else>Contactgegevens niet bekend.</div>
            </vl-spotlight>
          </vl-column>
        </vl-grid>
      </vl-region>
    </vl-layout>
  </div>
</template>

<script lang="ts">
import { Context } from '@nuxt/types'

export default {
  async asyncData({ $content, params }: Context) {
    const data = await $content(params.slug, 'configuratie').fetch()
    const description = await $content(params.slug, 'beschrijving').fetch()
    return {
      data,
      description
    }
  }
}
</script>

<style lang="scss">
#prevButton a.nuxt-link-active {
  color: white;
}

#prevButton a:link {
  text-decoration: none;
}
</style>
