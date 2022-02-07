<template>
  <div>
    <content-header />
    <vl-layout>
      <vl-region>
        <vl-grid mod-stacked>
          <vl-column>
            <vl-button id="prevButton"
              ><nuxt-link to="/"> Terug naar overzicht</nuxt-link>
            </vl-button>
          </vl-column>

          <vl-column>
            <vl-title tag-name="h1">{{ data.naam }}</vl-title>
          </vl-column>

          <vl-column width="3">
            <vl-description-data-item label="Verantwoordelijke organisatie">
              <a
                v-if="data.verantwoordelijkeOrganisatie && data.organisatielink"
                :href="data.organisatielink"
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
              {{ data.status.charAt(0).toUpperCase() + data.status.slice(1) }}
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
              <span v-if="data.documenten.length > 0">
                <div
                  v-for="document in data.documenten"
                  :key="document.weergavenaam"
                >
                  <a
                    target="_blank"
                    :href="document.documentnaam + '?raw=true'"
                  >
                    {{ document.weergavenaam }}
                  </a>
                  <br />
                </div>
              </span>
              <div v-else>Geen documenten gevonden voor deze bron</div>
            </vl-spotlight>
          </vl-column>

          <vl-column width="6">
            <vl-spotlight title="Contactpersoon">
              <div v-if="data.contactpersoon.length > 0">
                <div
                  v-for="contact in data.contactpersoon"
                  :key="contact.email"
                >
                  <p v-if="contact.email">
                    {{ contact.naam }} —
                    <a :href="'mailto:' + contact.email">
                      {{ contact.email }}
                    </a>
                  </p>
                  <p v-else>{{ contact.naam }} — E-mailadres ongekend</p>
                </div>
              </div>
              <div v-else>Contactgegevens niet bekend</div>
            </vl-spotlight>
          </vl-column>

          <vl-column width="6">
            <vl-spotlight title="Links gerelateerd aan bron">
              <div v-if="data.links.length > 0">
                <vl-link-list>
                  <vl-link-list-item v-for="link in data.links" :key="link.url">
                    <vl-link target="_blank" :href="link.url">{{
                      link.naam
                    }}</vl-link>
                  </vl-link-list-item>
                </vl-link-list>
              </div>
              <div v-else>Geen links gevonden</div>
            </vl-spotlight>
          </vl-column>
          <vl-column width="6">
            <vl-spotlight title="Opmerkingen">
              <div v-if="data.opmerking">
                <p>{{ data.opmerking }}</p>
              </div>
              <div v-else>Geen opmerkingen voor deze bron</div>
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
  },
  head() {
    return {
      title: 'AGB Register - Bron in detail'
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
