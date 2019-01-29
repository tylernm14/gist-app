import { Controller } from "stimulus"
import { getFileType } from "../helpers/gist_helper";

export default class extends Controller {
    static targets = ["gFilename", "gContentsTextArea"];

    initialize() {
        window.editors = {}
        for(let i = 0; i < this.gFilenameTargets.length; i++) {
            console.log("Text area " + this.gContentsTextAreaTargets[0])
            window.editors[i.toString()] = CodeMirror.fromTextArea(this.gContentsTextAreaTargets[i], {
                    lineNumbers: true,
                    viewportMargin: Infinity,
                    lineWrapping: true,
                    readOnly: "nocursor",
                    mode: 'text/plain',
                })
        }
        // for all the filename targets
        this.gFilenameTargets.forEach((el, i) => {
            let filetype = getFileType(el.innerHTML)
            console.log("Filetpye: " + filetype)
            window.editors[i].setOption("mode", filetype)
        })
    }
}
