PAGES = \
    index \
    presentacio \
    recorregut \
    perfil-i-controls \
    reglament \

update:
	@for P in ${PAGES}; do \
		echo -n Updating $$P...; \
		curl -s http://localhost:3000/$$P > $$P.html && echo " OK" || echo " NOT OK"; \
	done