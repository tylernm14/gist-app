import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ["gFiles", "gFile", "gFileDelete"];

    genGFileForm(index) {
        let formStr = `<div data-target="gist-form.gFile" id="gFileForm_0">
        <div class="row">
        <div class="col-sm-6">
        <div class="form-group">
        <label class="sr-only" for="gist_g_files_attributes_0_filename">Filename</label>
        <input class="form-control" placeholder="Filename" type="text" name="gist[g_files_attributes][0][filename]" id="gist_g_files_attributes_0_filename">
        </div>
        </div>
        <div class="col-sm-6 text-right">
        <div data-target="gist-form.gFileDelete" id="gFileDelete_0">
        <button class="btn btn-outline-danger" data-action="click->gist-form#deleteGFileField" id="gFileDeleteButton_0" type="button">
        <span class="glyphicon glyphicon-trash"></span>
        </button>
        </div>
        </div>
        </div>
        <div class="row">
        <div class="col-sm-12">
        <div class="form-group">
        <label class="sr-only" for="gist_g_files_attributes_0_contents">Contents</label>
        <textarea class="form-control" placeholder="File contents..." rows="10" name="gist[g_files_attributes][0][contents]" id="gist_g_files_attributes_0_contents"></textarea>
        </div>
        </div>
        </div>
        </div>`;
        formStr = formStr.replace(/_0/g, "_"+index.toString())
        formStr = formStr.replace(/\[0\]/g, "["+index.toString()+"]")
        return formStr
    }

    genGFileDeleteButton(index) {
        let button =
            `<button class="btn btn-outline-danger" data-action="click->gist-form#deleteGFileField" id="gFileDeleteButton_0" type="button">
            <span class="glyphicon glyphicon-trash"></span>
            </button>`.replace("0", index.toString())
        return button
    }

    numGFiles() {
        return this.gFileTargets.length
    }

    firstGFileHasDelete() {
        let firstVisibleHasDelete = false
        let gFiles = this.gFileTargets
        for (var i = 0; i < gFiles.length; i++) {
            if (!gFiles[i].classList.contains("d-none")) {
                if (gFiles[i].getElementsByTagName('button').length > 0)
                    firstVisibleHasDelete = true
                else
                    firstVisibleHasDelete = false
                break

            }
        }
        console.log("FirstVisibleHasDelete: " + firstVisibleHasDelete)
        return firstVisibleHasDelete
    }

    // firstGFileHasDelete() {
    //     let element = document.getElementById('gFiles')
    //     let numHiddenGFiles = document.getElementsByClassName("d-none").length
    //     let gFileCount = this.gFileTargets.length - numHiddenGFiles
    //     let delBtnDivs = this.gFileDeleteTargets
    //     let delBtnCount = 0;
    //     for (var i = 0; i < delBtnDivs.length; i++) {
    //         if (delBtnDivs[i].getElementsByTagName('button').length > 0)
    //             delBtnCount += 1
    //     }
    //
    //     console.log("gfileCount " + gFileCount + " delBtnCount" + delBtnCount)
    //     return gFileCount === delBtnCount
    //     // console.log("child length" + element.children[0].children.length)
    //     // if (element.children[0].children.length == 3) {
    //     //     console.log("returning true because first gfile has delete")
    //     //     return true
    //     // }
    //     // else {
    //     //     console.log("reutnr false because first gfile doenst have delete")
    //     //     return false
    //     // }
    // }

    updateGFileDeletes() {
        if (this.numGFiles() > 1)
            if (!this.firstGFileHasDelete())
                this.addDeleteToFirstGFile()
            // else if (this.firstGFileHasDelete())
            //     this.removeFirstGFileDelete()
        return
    }

    addDeleteToFirstGFile() {

        // console.log("Add Delete to frist GFile")
        // let date = new Date
        // let mSec = date.getTime()
        // let element = document.getElementById('gFiles')
        // let firstGFileDivId = element.children[0].getAttribute('id')
        //
        // let divDelBtn = document.createElement('div')
        // divDelBtn.setAttribute( 'class', 'form-group')
        // divDelBtn.setAttribute( 'id', 'del_g_file_btn_0'.replace('0', mSec))
        //
        // let delBtn = document.createElement('button')
        // delBtn.setAttribute('class', 'btn btn-danger')
        // delBtn.setAttribute( 'type', 'button')
        // delBtn.innerHTML = 'Delete'
        // delBtn.setAttribute('onclick', 'deleteGFile(\'' + firstGFileDivId + '\')')
        // divDelBtn.appendChild(delBtn)
        //
        // element.children[0].appendChild( divDelBtn )
        console.log(this.gFileDeleteTargets)

        let gFiles = this.gFileTargets
        let dels = this.gFileDeleteTargets
        for (var i = 0; i < gFiles.length; i++) {
            if (!gFiles[i].classList.contains("d-none")) {
                let delId = dels[i].getAttribute('id')
                let regexp = /gFileDelete_(\d+)/
                let idNumStr = regexp.exec(delId)[1]
                dels[i].insertAdjacentHTML("beforeend", this.genGFileDeleteButton(idNumStr))
                return
            }
        }
    }

    removeFirstVisibleGFileDelete() {
        let gFiles = this.gFileTargets
        let dels  = this.gFileDeleteTargets
        for (let i = 0; i < gFiles.length; i++) {
            if (!gFiles[i].classList.contains("d-none")) {
                let delButton = dels[i].getElementsByTagName('button')[0]
                delButton.parentNode.removeChild(delButton)
            }
        }
    }

    addGFileField(event) {
        console.log(event.details)
        let date = new Date
        let msec = date.getTime();
        document.querySelector("#gFiles").insertAdjacentHTML("beforeend", this.genGFileForm(msec));
        // need to check if all previous gFiles have delete button
        if (this.numGFiles() > 1)
            if (!this.firstGFileHasDelete())
                this.addDeleteToFirstGFile()
    }

    deleteGFileField(event) {
        let delButton = event.currentTarget
        let delButtonId = delButton.getAttribute('id')
        let regexp = /gFileDeleteButton_(\d+)/
        let idNumStr = regexp.exec(delButtonId)[1]
        let gFileDiv = document.getElementById("gFileForm_"+idNumStr)
        // rather than remove child, should set class to d-none and update hidden field for _destroy
        // gFileDiv.toggleAttribute("class: d-none")
        let hiddenDestroy = delButton.previousElementSibling
        console.log(hiddenDestroy)
        if (hiddenDestroy != null) {
            gFileDiv.classList.add("d-none")
            hiddenDestroy.setAttribute("value", "true")
            delButton.parentNode.removeChild(delButton)
        } else {
            gFileDiv.parentNode.removeChild(gFileDiv)
        }

        let numHiddenGFiles = document.getElementsByClassName("d-none").length
        let visibleGFiles = this.numGFiles() - numHiddenGFiles
        console.log("Visible GFiles: " + visibleGFiles)
        if ((visibleGFiles == 1) && (this.firstGFileHasDelete()))
            this.removeFirstVisibleGFileDelete()

    }
}