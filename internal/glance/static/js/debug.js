// Ajouter à votre application pour faciliter le débogage

document.addEventListener('DOMContentLoaded', function() {
    // Ajouter un raccourci clavier Ctrl+Shift+D pour activer/désactiver le mode debug
    document.addEventListener('keydown', function(e) {
        if (e.ctrlKey && e.shiftKey && e.key === 'D') {
            document.body.classList.toggle('debug-mode');
            console.log('Mode debug ' + (document.body.classList.contains('debug-mode') ? 'activé' : 'désactivé'));
            
            if (document.body.classList.contains('debug-mode')) {
                // Afficher la structure dans la console
                const widgets = document.querySelectorAll('.widget');
                console.log(`Nombre total de widgets: ${widgets.length}`);
                
                // Afficher les pages et colonnes
                const columns = document.querySelectorAll('.page-column');
                console.log(`Nombre de colonnes: ${columns.length}`);
            }
        }
    });
});
