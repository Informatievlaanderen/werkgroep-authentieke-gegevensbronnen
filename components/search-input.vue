<template>
  <div>
    <vl-input-field
      id="source-input-field"
      v-model="input"
      autocomplete="off"
      name="source-input-field"
      placeholder="Geef minstens 3 letters in..."
      mod-block
    />
  </div>
</template>

<script>
export default {
  data: () => {
    return {
      input: '',
      result: []
    }
  },
  watch: {
    result(newValue) {
      this.$root.$emit('onResult', newValue)
    },
    async input(input) {
      if (input.length >= 3) {
        const data = await this.$content({ deep: true })
          .where({ extension: '.json' })
          .sortBy('naam', 'asc')
          .fetch()

        // TODO: this should be handled by the $content ↑
        this.result = data.filter((source) => this.filterByName(source, input))
      } else {
        this.result = []
      }
    }
  },
  methods: {
    filterByName(standardObject, searchValue) {
      return standardObject.naam.toLowerCase().includes(searchValue)
        ? standardObject
        : null
    }
  }
}
</script>
