package com.example.math.mathfunction.controller;

import com.example.math.mathfunction.model.Formula;
import com.example.math.mathfunction.service.FormulaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/")
public class HomeController {
    @Autowired
    private FormulaService formulaService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String showIndex() {
        return "index";
    }

    @RequestMapping(value = "/index", method = RequestMethod.POST)
    public String saveEditedFormula(@RequestParam("input") String formula) {
        Formula formula1 = new Formula(formula);
        formulaService.saveFormula(formula1);
        return "index";
    }

    @RequestMapping(value = "/index-latex", method = RequestMethod.POST)
    public String saveLaTeXFormula(@RequestParam("input") String formula) {
        Formula formula1 = new Formula(formula);
        formulaService.saveFormula(formula1);
        return "index";
    }



    @GetMapping("/all-formulas")
    public String getAllFormulas(Model model) {
        model.addAttribute("formulas", formulaService.getAllFormulas());
        return "allFormulas";
    }

}
