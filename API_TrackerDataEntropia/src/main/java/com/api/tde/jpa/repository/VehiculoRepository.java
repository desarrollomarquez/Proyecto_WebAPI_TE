package com.api.tde.jpa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.api.tde.jpa.model.Vehiculo;

/**
 * Created by diego on 12/18/18.
 */

@Repository
public interface VehiculoRepository extends JpaRepository<Vehiculo, Long> {

}
