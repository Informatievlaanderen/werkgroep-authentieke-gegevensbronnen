<template>
  <vl-content-header
    mod-large
    mod-show-mobile
    :background="{
      src: '//www.vlaanderen.be/sites/default/files/ip_acm/page_banner_narrow/header.jpg',
      srcset:
        '//www.vlaanderen.be/sites/default/files/ip_acm/page_banner_mobile_alt/header.jpg 320w, //www.vlaanderen.be/sites/default/files/ip_acm/page_banner_narrow/header.jpg 1024w, //www.vlaanderen.be/sites/default/files/ip_acm/page_banner_wide_alt/header.jpg 1600w',
      alt: 'Content Header'
    }"
  >
    <div class="vl-content-header__logo-wrapper">
      <vl-content-header-entity
        prefix="Digitaal"
        title="Vlaanderen"
        logo="true"
        href="https://www.vlaanderen.be/digitaal-vlaanderen"
        mod-small
      />
    </div>
    <vl-content-header-title
      title="Register Authentieke Gegevensbronnen"
      tag-name="h1"
    />
  </vl-content-header>
</template>
