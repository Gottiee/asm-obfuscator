# asm-obfuscator

## TODO

- [ ] fichier qui parse la ligne `def parse_line(file: str, new_file) -> str | None:`
    - split les lignes en deux et reecrire les commentaire en haut si y'en a et return la str a modifier
- [ ] fichier qui s'occupe de modifier les lignes selon l'instruction (switch l'instruction appel differentes fonctions)
    - `def modify_asm(line:str, new_file):`
- [ ] fichier qui modifie les labels (prendre le fichier complet en entree)
- [ ] obfuscateur de string
    - meme algo
    - meme clee
    - pas ecrire la clee en dur
- [ ] createur de int
    - mov rax, rsp + 0x56
    - mmap un tableau de int [2,2,3,3,5,5,1,3,3,60,6]
    - push dans la fonction start l'address du tableau
- [ ] control flow flattening
    - mdr jamais

exemple control flow flattening
```py
fonction b(
)

fonction a (
)

a()
b()

fonction ab(param)
{
    switch param
    case(a.1)
        param + 2
        ab(param)
    case(b.1)
        param + 2
        ab(param)
        ...
    case(a.2)
        ...
    case(b.2)
        ...
}
ab(b.1)
ab(a.1)
```
