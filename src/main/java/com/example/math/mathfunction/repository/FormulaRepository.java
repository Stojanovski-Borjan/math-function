package com.example.math.mathfunction.repository;

import com.example.math.mathfunction.model.Formula;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FormulaRepository extends JpaRepository<Formula, Integer> {
    public List<Formula> findAll();
}
