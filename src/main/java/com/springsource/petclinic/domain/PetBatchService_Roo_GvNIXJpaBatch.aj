// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.domain;

import com.mysema.query.BooleanBuilder;
import com.mysema.query.jpa.impl.JPADeleteClause;
import com.mysema.query.jpa.impl.JPAQuery;
import com.mysema.query.types.path.PathBuilder;
import com.springsource.petclinic.domain.Pet;
import com.springsource.petclinic.domain.PetBatchService;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PetBatchService_Roo_GvNIXJpaBatch {
    
    public Class PetBatchService.getEntity() {
        return Pet.class;
    }
    
    public EntityManager PetBatchService.entityManager() {
        return Pet.entityManager();
    }
    
    @Transactional
    public int PetBatchService.deleteAll() {
        return entityManager().createQuery("DELETE FROM Pet").executeUpdate();
    }
    
    @Transactional
    public int PetBatchService.deleteIn(List<Long> ids) {
        Query query = entityManager().createQuery("DELETE FROM Pet as p WHERE p.id IN (:idList)");
        query.setParameter("idList", ids);
        return query.executeUpdate();
    }
    
    @Transactional
    public int PetBatchService.deleteNotIn(List<Long> ids) {
        Query query = entityManager().createQuery("DELETE FROM Pet as p WHERE p.id NOT IN (:idList)");
        query.setParameter("idList", ids);
        return query.executeUpdate();
    }
    
    @Transactional
    public void PetBatchService.create(List<Pet> pets) {
        for( Pet pet : pets) {
            pet.persist();
        }
    }
    
    @Transactional
    public List<Pet> PetBatchService.update(List<Pet> pets) {
        List<Pet> merged = new ArrayList<Pet>();
        for( Pet pet : pets) {
            merged.add( pet.merge() );
        }
        return merged;
    }
    
    public List<Pet> PetBatchService.findByValues(Map<String, Object> propertyValues) {
        
        // if there is a filter
        if (propertyValues != null && !propertyValues.isEmpty()) {
            // Prepare a predicate
            BooleanBuilder baseFilterPredicate = new BooleanBuilder();
            
            // Base filter. Using BooleanBuilder, a cascading builder for
            // Predicate expressions
            PathBuilder<Pet> entity = new PathBuilder<Pet>(Pet.class, "entity");
            
            // Build base filter
            for (String key : propertyValues.keySet()) {
                baseFilterPredicate.and(entity.get(key).eq(propertyValues.get(key)));
            }
            
            // Create a query with filter
            JPAQuery query = new JPAQuery(Pet.entityManager());
            query = query.from(entity);
            
            // execute query
            return query.where(baseFilterPredicate).list(entity);
        }
        
        // no filter: return all elements
        return Pet.findAllPets();
    }
    
    @Transactional
    public long PetBatchService.deleteByValues(Map<String, Object> propertyValues) {
        
        // if there no is a filter
        if (propertyValues == null || propertyValues.isEmpty()) {
            throw new IllegalArgumentException("Missing property values");
        }
        // Prepare a predicate
        BooleanBuilder baseFilterPredicate = new BooleanBuilder();
        
        // Base filter. Using BooleanBuilder, a cascading builder for
        // Predicate expressions
        PathBuilder<Pet> entity = new PathBuilder<Pet>(Pet.class, "entity");
        
        // Build base filter
        for (String key : propertyValues.keySet()) {
            baseFilterPredicate.and(entity.get(key).eq(propertyValues.get(key)));
        }
        
        // Create a query with filter
        JPADeleteClause delete = new JPADeleteClause(Pet.entityManager(),entity);
        
        // execute delete
        return delete.where(baseFilterPredicate).execute();
    }
    
    @Transactional
    public void PetBatchService.delete(List<Pet> pets) {
        for( Pet pet : pets) {
            pet.remove();
        }
    }
    
}
