package com.api.tde.jpa.controller;

import com.api.tde.jpa.exception.ResourceNotFoundException;
import com.api.tde.jpa.model.Vehiculo;
import com.api.tde.jpa.repository.VehiculoRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * Created by diego on 12/18/18.
 */
@RestController
@RequestMapping("/api")
public class VehiculoController {

    @Autowired
    VehiculoRepository vehiculoRepository;

    @GetMapping("/vehiculos")
    public List<Vehiculo> getAllVehiculos() {
        return vehiculoRepository.findAll();
    }

    @PostMapping("/vehiculos")
    public Vehiculo createVehiculo(@Valid @RequestBody Vehiculo vehiculo) {
        return vehiculoRepository.save(vehiculo);
    }

    @GetMapping("/vehiculos/{id}")
    public Vehiculo getVehiculoById(@PathVariable(value = "id") Long vehiculoId) {
        return vehiculoRepository.findById(vehiculoId)
                .orElseThrow(() -> new ResourceNotFoundException("Vehiculo", "id", vehiculoId));
    }

    @PutMapping("/vehiculos/{id}")
    public Vehiculo updateVehiculo(@PathVariable(value = "id") Long vehiculoId,
                                           @Valid @RequestBody Vehiculo vehiculoDetails) {

    	Vehiculo vehiculo = vehiculoRepository.findById(vehiculoId)
                .orElseThrow(() -> new ResourceNotFoundException("Vehiculo", "id", vehiculoId));

    	vehiculo.setPlaca(vehiculoDetails.getPlaca());
    	vehiculo.setAvl(vehiculoDetails.getAvl());
    	vehiculo.setModelo(vehiculoDetails.getModelo());
    	vehiculo.setMarca(vehiculoDetails.getMarca());
    	vehiculo.setTipo_vehiculo(vehiculoDetails.getTipo_vehiculo());

        Vehiculo updatedVehiculo = vehiculoRepository.save(vehiculo);
        return updatedVehiculo;
    }

    @DeleteMapping("/vehiculos/{id}")
    public ResponseEntity<?> deleteVehiculo(@PathVariable(value = "id") Long vehiculoId) {
        Vehiculo vehiculo = vehiculoRepository.findById(vehiculoId)
                .orElseThrow(() -> new ResourceNotFoundException("Vehiculo", "id", vehiculoId));
        vehiculoRepository.delete(vehiculo);
        return ResponseEntity.ok().build();
    }
}
