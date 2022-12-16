from .builder import DATASETS
from .coco import CocoDataset

@DATASETS.register_module()
class MapScaleUnit(CocoDataset):

    CLASSES = ('Closet', 'CoworkingSpace', 'Elevator', 'MeetingRoom', 'Room', 'Stairs', 'Unit', 'Vestibule', 'Void', 'WC', 'WorkingStation')
