// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.domain;

import com.springsource.petclinic.domain.Owner;
import com.springsource.petclinic.domain.Pet;
import com.springsource.petclinic.domain.Vet;
import java.util.Set;

privileged aspect Owner_Roo_JavaBean {
    
    public Set<Pet> Owner.getPets() {
        return this.pets;
    }
    
    public void Owner.setPets(Set<Pet> pets) {
        this.pets = pets;
    }
    
    public Set<Vet> Owner.getVets() {
        return this.vets;
    }
    
    public void Owner.setVets(Set<Vet> vets) {
        this.vets = vets;
    }
    
}
