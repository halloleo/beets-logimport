"""
Report more  details about  imported items.
"""

import os
import logging

from beets import importer, util
from beets.plugins import BeetsPlugin
import confuse


class LogImport(BeetsPlugin):
    def __init__(self):
        super().__init__()
        try:
            self.logatlevel = self.config['logatlevel'].get()
        except confuse.exceptions.NotFoundError as e:
            #self._log.error('Configuration error: {}', e)
            self.logatlevel = 'info'
        
        register = self.register_listener
        register("import_task_files", self.report_destination)

    def report_destination(self, task, session):
        level = getattr(logging, self.logatlevel.upper())
        self._log.log(level, "Imported tracks to the following files:")
        for item in task.items:
            self._log.log(level, item.path.decode('utf-8'))
