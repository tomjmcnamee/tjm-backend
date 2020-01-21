
    class SimulatorSerializer < ActiveModel::Serializer
      attributes :inner_or_outer, :single_tile_above_number,  :games,  :wins,  :losses
    end

