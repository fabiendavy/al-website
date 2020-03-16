const setLinksToTargetBlank = () => {
  const links = document.querySelectorAll('.trix-content a');

  if (links) {
    links.forEach((link) => {
      link.setAttribute('target', '_blank');
    });
  }
};

export { setLinksToTargetBlank };
