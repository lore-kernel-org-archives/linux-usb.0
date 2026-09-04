Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70544CB8A0
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 14:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533598; cv=pass; b=AnaWtgutr0488F8yEwL0XBV0FWeL+ebIgobg2VvhJ9L1rS2/Ud0ibQAMYgTJPvyu1ok4B6KIq1WtrJ892abmQPye1ZzKh45rOPD71qdEjUR2mB9C5i4tQpRWaxZmNR0QCJIMLf6QnXIxYp7scWUzMXq5wWQC4XTGBS2PWTVC7PA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533598; c=relaxed/simple;
	bh=DRRJe+V4nw9WBw4yi0SGMIYkD0IWhh/iTQY8LhmjNeM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=AHkcmJadDCbO9JOxLn0EtRRhBLtMrwPWDs3Pd7mYJXIPUj5ejxNp9g0vtD/dPqjU7qd5MqEg844thYpUOeV/as4LdG914vBVrDoxqct3z5RHrq8/TdT9Qm65K99DROGBcwnxgwzbpK+/vSgiootaHUXRP3S+CmltSrCNn5+f3kU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8XKZPe+; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8XKZPe+"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso17394175e9.2
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 07:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788533592; cv=none;
        d=google.com; s=arc-20260327;
        b=XpAGzWnZqIZZMA/pdMUHJ13E6eq7T1nkqkSMuAeepnDeEMi9h856tNyjjhvRomNwqg
         Tq17X+J+/4+GAEpm/CzZ9INm6/E6cLJGf3P4lRDOnXHj6R7L9LyzgucVHCHyYrQXe6a9
         7q3wWM7tW+nPTK/w5LODwLMOehYYnOF+1Py0U2rMb+7HnLThZkOI2U0MfiftmVPIzP3d
         Be0qnRe6ESrMCvU1qLSQ06D/Hui0tHfWUYX/WfAhKn3+zAJlErVk0fLErGZYz2q7vVpF
         XwHrrr30y9kDa7YVZLjBtFOHElXl5F/XZSwtq6PivdlRdOU7DSm5yqpwyqGA+iqmBcP0
         eYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=8FipXhvEDaET7AyVY0KPzATbtBORRQB8z46njAY/JUY=;
        fh=HqTUQA8h0mDZ7ysIW0qNZAVIGTqXQlFdTxC6y2lnMYE=;
        b=E8pirIEIZhxQvILAvRui0VsHYrxSSz/ISuarqqeDQRQXfAL8qSHrr0uY8cAH2FK7tK
         gbJKXz9dp3fVixF0VhrfLNkGzMV12BfiY3fbvzpOTpqvlOaGy/fRBMzy08WUMsbTYMlO
         PVNzxkLeL7jlTYhYU/10nLvLarE66Z26sOGiUAK2d0mLrwHENWUmUnD07ziTZ5SQkggD
         hOkWeJRx/t425LysPPmNAUChTijimPOtSRK9zo7Cp7SrchlOeiVGrxplIO2/lSrEbpTD
         bcEMqb5lcAe3xoo/h3XM0N30QoYmv+VTK7fFwSFOZsADa+4vh13WTk3ybIOFdl0NXvhM
         la6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788533592; x=1789138392; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8FipXhvEDaET7AyVY0KPzATbtBORRQB8z46njAY/JUY=;
        b=A8XKZPe+dF5MtwAFlkvLpgm8/1PmASX+ryleIaJWnOkO930RVDjyHd7WAXEXDKK4FC
         27/rB5VZWI41sbKiNKSTizwG2+x6yPs5tNJLfWRFBmi+Ztx188TnDmY74nxZRKMNQxuY
         DXz+lxUhbR0ncYUU5/OF7arJINCF45s+8/U4qfcoNKUJ26mX/CMYmrz3GTHdaGXR27xv
         PD3k+AmVEdmPTZ1lFD7GShMdURlDM3KTu8JaZe7VP/32CuOck4hGaEZIufUcZ3Z9Knlt
         lB9E7tbYztOC8XCVh3cNxQmSBghnjFRTJFvaKihl+xzL95joYuaOkURyrrvjUBYOQyXg
         pZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788533592; x=1789138392;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8FipXhvEDaET7AyVY0KPzATbtBORRQB8z46njAY/JUY=;
        b=K4nlW2mgyv/Bhn8/vF+4z8Jp+HGN2ePJqqni0WYsYiKMNp8RP/Id+mCzBI6nOJGCzg
         77mHIACkCFY432TTbXgnyLTkL02AcDOiBrA3I7IwtF5iGX7aZURsYSYOyv/9zywNaKfp
         SYx///hKPKeS4CrW4ylKEdmlEUBeq++Raxe9YkrntFmJAxUWbL6p3Ve2EOm+s/bwXKsv
         RmYkmWhm7aXJbQrVIbhiVQaubzkuwgu0CcVyCxr+v8UftNcmq0gWISVVmVyGtko7dm3V
         EDqONn+duNVyP7JJpPHsbs6I5DWywFjy7VocjEMGeoM2yC5+6TzpQhGi9RfqUJ6Dg8K0
         t5xA==
X-Gm-Message-State: AFuF++mc24fOd9PmhNmCeK0qPUE922AbFPzOnbZR2WQzpguqEEXg0t9k
	0rv5NvT658dI9KGnWDbd98ClU2HGoxZlSwuLMa/cK7zbaxsckzvhP2bwVB00R0NMDDZQ54k32St
	xgqRATAWRr1xUkZxQCa7qYx1/RPC2Zld9Mk4W0io=
X-Gm-Gg: AYBFou0swvApOqCiwgpBXNfSwGJ9nfZrb4M++p3MgLi9Iuj+bKQzTXXTX0BtaYj15F/
	mbf6Ml+3Z666Sd9NtxB/vo+16in+2ppWPZ2Kj+8/xxHK9kRaQfI9p81X+q8JAEuWyZ9HdqxSD1+
	95rnslZozrnVADdML72Cbkgp/x6gOyFjbN/DzcpAvnx11VU0VzMr4Sg6vfFhhHip5zEZVZVeSvm
	QJcl2Iw2QWwlbVm6sZpkfmaslrWeJeUa2OQpOq3XnXVEJn8tRKHohDAI9lG+2aFs3Hj1QYhi7wK
	9puiDbcUlMQyaB5SHvrGZNceK+jQSl8OVJ31DUEICwep7NY=
X-Received: by 2002:a05:600c:6211:b0:49c:fa21:1c88 with SMTP id
 5b1f17b1804b1-49cfa211d8cmr43485675e9.29.1788533591509; Fri, 04 Sep 2026
 07:53:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Syed Labeeq Sajid Bukhari <syedlabeeq@gmail.com>
Date: Fri, 4 Sep 2026 19:52:59 +0500
X-Gm-Features: AcwNN1WUUgzrL4m6PMC8XHD2AnVYjXMEHGD5ajcbq6m0K1jIoaKyVFYJWXJUZic
Message-ID: <CAF4-o1c6XLbJr5umK+FRmMetcRkxH5JnRjMUpWw7OpnkUWbvVQ@mail.gmail.com>
Subject: [PATCH] usb: storage: sierra_ms: reject short SWoC info transfers
To: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Cc: stern@rowland.harvard.edu, gregkh@linuxfoundation.org, 
	stable@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000006475e8065aa96dd2"

--0000000000006475e8065aa96dd2
Content-Type: text/plain; charset="UTF-8"

sierra_get_swoc_info() requests sizeof(struct swoc_info) (60) bytes
from the device via usb_control_msg(), but its callers only treat a
negative return value as failure. A device that answers the
vendor-specific GetSwocInfo request with a short IN transfer is
therefore accepted, leaving the tail of the freshly allocated
(kmalloc(), non-zeroing) swoc_info buffer uninitialized.

truinst_show() subsequently prints swocInfo->rev, swocInfo->LinuxSKU
and swocInfo->LinuxVer from that buffer into the world-readable
(0444) "truinst" sysfs attribute. An emulated/malicious USB device
(VID 0x1199, PID 0x0fff) can exploit this to disclose up to 5 bytes
of stale kernel heap memory (kmalloc-64) to unprivileged userspace,
once per sysfs read, indefinitely. On kernels built without
init_on_alloc this leaks recently freed heap contents.

Only accept the transfer when the full structure was received.
sierra_ms_init() already retries failed queries, so well-behaved
devices are unaffected.

Fixes: 32fe5e393455 ("USB Storage Sierra: TRU-Install feature update")
Cc: stable@vger.kernel.org
Signed-off-by: Syed Labeeq <syedlabeeq@gmail.com>
---
 drivers/usb/storage/sierra_ms.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/storage/sierra_ms.c b/drivers/usb/storage/sierra_ms.c
index 177fa6cd143ab2837640c26f8336781ddd3cf9cb..8755fda42eed2afd3235283e990a35aac14cb829
100644
--- a/drivers/usb/storage/sierra_ms.c
+++ b/drivers/usb/storage/sierra_ms.c
@@ -76,6 +76,12 @@
  (void *) swocInfo, /* void *data        */
  sizeof(struct swoc_info), /* __u16 size     */
  USB_CTRL_SET_TIMEOUT); /* int timeout     */
+ /*
+ * A short IN transfer leaves the tail of swocInfo uninitialized;
+ * only a full transfer is valid.
+ */
+ if (result != sizeof(struct swoc_info))
+ return -EIO;

  swocInfo->LinuxSKU = le16_to_cpu(swocInfo->LinuxSKU);
  swocInfo->LinuxVer = le16_to_cpu(swocInfo->LinuxVer);
-- 
2.43.0

--0000000000006475e8065aa96dd2
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-usb-storage-sierra_ms-reject-short-SWoC-info-transfers.patch"
Content-Disposition: attachment; 
	filename="0001-usb-storage-sierra_ms-reject-short-SWoC-info-transfers.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mtn2pflh0>
X-Attachment-Id: f_mtn2pflh0

RnJvbSAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTeWVkIExhYmVlcSA8c3llZGxhYmVlcUBnbWFpbC5jb20+CkRh
dGU6IEZyaSwgMDQgU2VwIDIwMjYgMTc6MzA6NTkgKzA1MDAKU3ViamVjdDogW1BBVENIXSB1c2I6
IHN0b3JhZ2U6IHNpZXJyYV9tczogcmVqZWN0IHNob3J0IFNXb0MgaW5mbyB0cmFuc2ZlcnMKCnNp
ZXJyYV9nZXRfc3dvY19pbmZvKCkgcmVxdWVzdHMgc2l6ZW9mKHN0cnVjdCBzd29jX2luZm8pICg2
MCkgYnl0ZXMKZnJvbSB0aGUgZGV2aWNlIHZpYSB1c2JfY29udHJvbF9tc2coKSwgYnV0IGl0cyBj
YWxsZXJzIG9ubHkgdHJlYXQgYQpuZWdhdGl2ZSByZXR1cm4gdmFsdWUgYXMgZmFpbHVyZS4gQSBk
ZXZpY2UgdGhhdCBhbnN3ZXJzIHRoZQp2ZW5kb3Itc3BlY2lmaWMgR2V0U3dvY0luZm8gcmVxdWVz
dCB3aXRoIGEgc2hvcnQgSU4gdHJhbnNmZXIgaXMKdGhlcmVmb3JlIGFjY2VwdGVkLCBsZWF2aW5n
IHRoZSB0YWlsIG9mIHRoZSBmcmVzaGx5IGFsbG9jYXRlZAooa21hbGxvYygpLCBub24temVyb2lu
Zykgc3dvY19pbmZvIGJ1ZmZlciB1bmluaXRpYWxpemVkLgoKdHJ1aW5zdF9zaG93KCkgc3Vic2Vx
dWVudGx5IHByaW50cyBzd29jSW5mby0+cmV2LCBzd29jSW5mby0+TGludXhTS1UKYW5kIHN3b2NJ
bmZvLT5MaW51eFZlciBmcm9tIHRoYXQgYnVmZmVyIGludG8gdGhlIHdvcmxkLXJlYWRhYmxlCigw
NDQ0KSAidHJ1aW5zdCIgc3lzZnMgYXR0cmlidXRlLiBBbiBlbXVsYXRlZC9tYWxpY2lvdXMgVVNC
IGRldmljZQooVklEIDB4MTE5OSwgUElEIDB4MGZmZikgY2FuIGV4cGxvaXQgdGhpcyB0byBkaXNj
bG9zZSB1cCB0byA1IGJ5dGVzCm9mIHN0YWxlIGtlcm5lbCBoZWFwIG1lbW9yeSAoa21hbGxvYy02
NCkgdG8gdW5wcml2aWxlZ2VkIHVzZXJzcGFjZSwKb25jZSBwZXIgc3lzZnMgcmVhZCwgaW5kZWZp
bml0ZWx5LiBPbiBrZXJuZWxzIGJ1aWx0IHdpdGhvdXQKaW5pdF9vbl9hbGxvYyB0aGlzIGxlYWtz
IHJlY2VudGx5IGZyZWVkIGhlYXAgY29udGVudHMuCgpPbmx5IGFjY2VwdCB0aGUgdHJhbnNmZXIg
d2hlbiB0aGUgZnVsbCBzdHJ1Y3R1cmUgd2FzIHJlY2VpdmVkLgpzaWVycmFfbXNfaW5pdCgpIGFs
cmVhZHkgcmV0cmllcyBmYWlsZWQgcXVlcmllcywgc28gd2VsbC1iZWhhdmVkCmRldmljZXMgYXJl
IHVuYWZmZWN0ZWQuCgpGaXhlczogMzJmZTVlMzkzNDU1ICgiVVNCIFN0b3JhZ2UgU2llcnJhOiBU
UlUtSW5zdGFsbCBmZWF0dXJlIHVwZGF0ZSIpCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNp
Z25lZC1vZmYtYnk6IFN5ZWQgTGFiZWVxIDxzeWVkbGFiZWVxQGdtYWlsLmNvbT4KLS0tCiBkcml2
ZXJzL3VzYi9zdG9yYWdlL3NpZXJyYV9tcy5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9zdG9yYWdlL3NpZXJyYV9t
cy5jIGIvZHJpdmVycy91c2Ivc3RvcmFnZS9zaWVycmFfbXMuYwppbmRleCAxNzdmYTZjZDE0M2Fi
MjgzNzY0MGMyNmY4MzM2NzgxZGRkM2NmOWNiLi44NzU1ZmRhNDJlZWQyYWZkMzIzNTI4M2U5OTBh
MzVhYWMxNGNiODI5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9zdG9yYWdlL3NpZXJyYV9tcy5j
CisrKyBiL2RyaXZlcnMvdXNiL3N0b3JhZ2Uvc2llcnJhX21zLmMKQEAgLTc2LDYgKzc2LDEyIEBA
CiAJCQkodm9pZCAqKSBzd29jSW5mbywJCS8qIHZvaWQgKmRhdGEgICAgICAgICovCiAJCQlzaXpl
b2Yoc3RydWN0IHN3b2NfaW5mbyksCS8qIF9fdTE2IHNpemUgCSAgICAgKi8KIAkJCVVTQl9DVFJM
X1NFVF9USU1FT1VUKTsJCS8qIGludCB0aW1lb3V0IAkgICAgICovCisJLyoKKwkgKiBBIHNob3J0
IElOIHRyYW5zZmVyIGxlYXZlcyB0aGUgdGFpbCBvZiBzd29jSW5mbyB1bmluaXRpYWxpemVkOwor
CSAqIG9ubHkgYSBmdWxsIHRyYW5zZmVyIGlzIHZhbGlkLgorCSAqLworCWlmIChyZXN1bHQgIT0g
c2l6ZW9mKHN0cnVjdCBzd29jX2luZm8pKQorCQlyZXR1cm4gLUVJTzsKIAogCXN3b2NJbmZvLT5M
aW51eFNLVSA9IGxlMTZfdG9fY3B1KHN3b2NJbmZvLT5MaW51eFNLVSk7CiAJc3dvY0luZm8tPkxp
bnV4VmVyID0gbGUxNl90b19jcHUoc3dvY0luZm8tPkxpbnV4VmVyKTsKLS0gCjIuNDMuMAo=
--0000000000006475e8065aa96dd2--
