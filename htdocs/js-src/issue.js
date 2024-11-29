function getSelectionElement() {
    let selection = null;

    if (window.getSelection) {
        selection = window.getSelection();
    }

    return selection;
}

function findAnchor(element) {
    while (element) {
        if (element.tagName.startsWith("H")) {
            const child = element.children[0];
            if (child.tagName === 'A' && child.classList.contains("header-anchor")) {
                return child.href;
            }
        }
        element = element.previousElementSibling;
    }
    return window.location.href;
}

function createIsssueForText() {

    const selection = getSelectionElement();
    const text = encodeURIComponent(selection.toString());
    const link = encodeURIComponent(findAnchor(selection.anchorNode.parentElement));
    const title = encodeURIComponent(`[Error] in article: ${document.title}`);
    const labels = encodeURIComponent("error in article");
    
    createIssue(title, link, text, labels);
};

function createIssue(title, link, text, labels){
    let assignees;

    let url = `https://github.com/Webprogrammering-Lab/python-base/issues/new?template=article-error.yml&url=${link}&copied-text=${text}&title=${title}&labels=${labels}`; //&assignees=${assignees}`;
    
    window.open(url, '_blank');
}

function setLeftOpenMenuBtn(openMenuBtn) {
    const main = document.getElementsByTagName('main')[0];
    main.getBoundingClientRect();
    openMenuBtn.style.left = `${window.innerWidth > 650 ? main.getBoundingClientRect().right + 5 : window.innerWidth - 35}px`;

}

function setPosMenu(menu, openMenuBtn) {
    const rect = openMenuBtn.getBoundingClientRect();
    if (window.innerWidth <= 650) {
        menu.style.top = `${rect.bottom - 190}px`;
        menu.style.left = `${rect.right - 180}px`;
    } else {
        menu.style.top = `${rect.bottom - 190}px`;
        menu.style.left = `${rect.left + 5}px`;
    }
}

function createPopUp() {
    // Create the button to open the menu
    const openMenuBtn = document.createElement('button');
    openMenuBtn.textContent = '⚠';
    openMenuBtn.title = "Rapportera fel i artikeln";

    openMenuBtn.style.cssText = `
    display: block;
    position: fixed;
    bottom: 10px;
    width: 30px;
    height: 30px;
    `;
    setLeftOpenMenuBtn(openMenuBtn);
    document.body.appendChild(openMenuBtn);

    // Create the menu container
    const menu = document.createElement('div');
    menu.innerHTML = `
       <div class="text" style="
            max-width: 130px;
            display: inline-block;
            height: 135px;
        ">
            <p style="margin: 0px 0px 15px 0px ">Rapportera fel i artikeln genom att markera texten som är fel och klicka knappen.</p>
        </div>
        <div style="
            vertical-align: top;
            display: inline-block;
        ">
        <button class="closeButton">x</button>
        </div>
        <div style="display: flex; justify-content:center;">
            <button style="" class="reportTextButton">Rapportera fel</button>
        </div>
`
    menu.style.cssText = `
        display: none;
        border: 1px solid #888;
        background-color: white;
        padding: 10px;
        z-index: 1000;

        box-shadow: -10px 10px 20px #555;
        border-radius: 8px;
        position: fixed;
        width: 180px;
        height: 190px;
    `;
    setPosMenu(menu, openMenuBtn);
    // Create the close button
    document.body.appendChild(menu);
    const closeMenuBtn = document.getElementsByClassName('closeButton')[0];

    // Create the other buttons
    const textButton = document.getElementsByClassName('reportTextButton')[0];


    window.addEventListener("resize", (event) => {
        setLeftOpenMenuBtn(openMenuBtn);
        setPosMenu(menu, openMenuBtn);
    });

    openMenuBtn.addEventListener('click', (event) => {
        menu.style.display = 'block';
    });

    // Hide the menu
    closeMenuBtn.addEventListener('click', () => {
        menu.style.display = 'none';
    });


    textButton.addEventListener('click', () => {
        
        menu.style.display = 'none';
        createIsssueForText();
    });
}

let issue = {
    name: "Rapportera fel",
    action: function () {
        createPopUp();
    },
};



export default issue;