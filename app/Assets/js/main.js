document.addEventListener("DOMContentLoaded", () => {
    fetch('consulta.jsp') // Endpoint JSP que retorna o JSON dos serviços
        .then(response => response.json())
        .then(data => {
            const listaServicos = document.getElementById('lista-servicos');
            data.forEach(servico => {
                const servicoDiv = document.createElement('div');
                servicoDiv.className = 'servico';
                servicoDiv.innerHTML = `
                    <span>${servico.tipoServico}</span>
                    <span>R$ ${servico.preco}</span>
                    <span>${servico.nomeProfissional}</span>
                `;
                listaServicos.appendChild(servicoDiv);
            });
        })
        .catch(error => console.error('Erro ao carregar serviços:', error));
});
