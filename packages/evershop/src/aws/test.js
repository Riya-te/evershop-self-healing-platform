import {
generateUploadUrl,
generateDownloadUrl
} from "./presigned-url.js";

(async()=>{

const upload = await generateUploadUrl("shoe.webp");

console.log(upload);

const download = await generateDownloadUrl("shoe.webp");

console.log(download);

})();