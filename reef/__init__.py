def includeme(config):
    """

    :param config: Pyramid Configuration instance
    :type config: :class:`pyramid.config.Configurator`
    """
    config.add_route('reef.index', '/')
    config.add_route('reef.home', '/home')

