package com.graduation.scheduleservice.services;

import com.graduation.scheduleservice.models.DNA;

import java.time.LocalDate;

public interface GeneticAlgorithmService {
    void initAlgorithm(int yearCode, LocalDate startDay, int totalDay, int populationSize);
    DNA getBestResult();
    DNA getWorstResult();
    void evaluatePopulation();
    void sortByFitness();
    void sortByDayAndTime();
    int calcFitness(DNA dna);
    void calcProb(int worstFitness);
    DNA randomParent();
    void doCrossOver(Float mulRate);
    DNA doMutation(DNA dna, Float mulRate);
}
