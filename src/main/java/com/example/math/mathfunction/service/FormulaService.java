package com.example.math.mathfunction.service;

import com.example.math.mathfunction.model.Formula;
import com.example.math.mathfunction.repository.FormulaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FormulaService {
    @Autowired
    FormulaRepository formulaRepository;

    public void saveFormula(Formula formula) {
        formulaRepository.save(formula);
    }

    public List<Formula> getAllFormulas() {
        return formulaRepository.findAll();
    }
}
