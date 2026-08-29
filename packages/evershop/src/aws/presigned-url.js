import { S3Client, PutObjectCommand, GetObjectCommand } from "@aws-sdk/client-s3";
import { getSignedUrl } from "@aws-sdk/s3-request-presigner";

const client = new S3Client({
    region: "ap-south-1"
});

const BUCKET = "riyaa-product-images";

export async function generateUploadUrl(fileName) {
    const command = new PutObjectCommand({
        Bucket: BUCKET,
        Key: fileName
    });

    return await getSignedUrl(client, command, {
        expiresIn: 300
    });
}

export async function generateDownloadUrl(fileName) {
    const command = new GetObjectCommand({
        Bucket: BUCKET,
        Key: fileName
    });

    return await getSignedUrl(client, command, {
        expiresIn: 300
    });
}