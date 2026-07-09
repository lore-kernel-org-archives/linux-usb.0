Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ED1266576
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 23:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783639825; cv=pass; b=qxoNoaP3TGKiSMZf4UyBZjaFy+u4WxMWc8I4XwPKql4mf4MK+miYzlarVSBA/v/luYlh5B0XHVqx14fjNt6kmrMv2Q6n2E0n/EdZF/8Ebzp7n5sUoH9jLUZmOQP7uZoynYHUDjb4DYAAZrxc4HR0QWwrLN57vWL79cuEOXAP0GE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783639825; c=relaxed/simple;
	bh=qHrLLIFUMAidwOLP9AMS9gcLc4cNFbKus85Wdug6M+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PaPXhDrKCD2LMouIPV6Bs6/kpFXQjXHVNh2s2gCbt7J3PpcQ6YE2KpicpbeKQC8PcKjK//LZXeSVVAOS+LfnNXhzYCFwtQ/4tbd0qy9OArzQzefvZO8pPoTmfsc3Sm5pY+Lxq4Ktc4Ck6ZQMuL8+FNdaKyZWCpqagiaTHTcaxrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OY0ZwSHv; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OY0ZwSHv"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c928bf172so1587511cf.3
        for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2026 16:30:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783639823; cv=none;
        d=google.com; s=arc-20260327;
        b=CRtCudiz9mdkHDKF9EKD6SYzMbc/yGRasDMwoguRk+CPVi26LLJoA7KYwM015FTB9V
         5/Svlpq/+RYu617ticLIv+N1pMytsrdm8nXMTLXKTfjGHA383wE/ONeGy1nUThguJvFG
         sTpH+PKUGXhc9H52cXTg1GY0Mj5cMSqqqZrwEtRzKx2dbC79M1/qKRTBYKGiHMJG34IR
         gqt9r8PswZUDfk3CxNuFHHukCY8CHpdVsFLBZdPmhtkSgO46bunZl4Pbja0wtL+VRfm0
         7/GhPL+L9eweZsXPE+J6YPcmsDVdNCgY1cMrcnL/jk8AjE0Sz/ML5h173SMT7tWNPGkm
         hSJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kHvpcz2UdWbFTHy+aeB3eUEvRNC1vABzNeEZEaXLS24=;
        fh=l+/7vNE5RWPQkwR0IV2qmE0gLASjEEURfkI+HhNdTMc=;
        b=aY2X0z/HzgWeH0XnDHHrrS+0PlysB+Z1RvD1Qxg6nNhKU5BwSQHMbUoUjxlq4mwoN4
         C8hoCDaCKDM2WfaNOcJin5m3W5Qgdisq0RjUU3gxxsfctyC2tx4+t1MO5qKFmp0+Uy1z
         junxo7RQIpAhAvHmhyw4IGxnavAPa14Jy8b+FQh7vDE/TBx4z7ZAPMkYEicVZiGA+hE6
         g1FC2G1fSHRN5Xq2cbB86ZgQAyqpVxNtsuVTqEOFlFcKboH8TkT45udW48jbRE8rDhkY
         xQEI7uRMZf/+2vTP72TjlNWA5EkyxwscXLLJ9vCNRwd6smCpCvR8Sb/ujPIOmZn+DmoA
         iIFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783639823; x=1784244623; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kHvpcz2UdWbFTHy+aeB3eUEvRNC1vABzNeEZEaXLS24=;
        b=OY0ZwSHvDx+QAuvdHmRbhs3i4MhsyZhQSqBGg3w4fHil9P9tZ71VNnt5KgPc1G63ql
         W0nxjcYuVCXs836sSvtMilFABrczqhy38Hb25XZqNVXgcDqmSaJVbRPQYzap2u0hOUJz
         LoxP/xz2wzMH3OBAoxgMmj5xH2cL8iowWJCDnh1tBRqJxtZi6YlgYcTJGRbzz1nVNCji
         FdMmVcnRizXCQIxXprO5KE5WpVRlWDljp+XEpbPyVtXo2r36FVhb36pG4FJYUnZ3WAAS
         4qdqQCkkEcpYHY1CHdggEQxFSTbRTKT4dRUzgdBhF4nlIUuVj5bXgeuCTb3CKf35mRxB
         +MFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783639823; x=1784244623;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kHvpcz2UdWbFTHy+aeB3eUEvRNC1vABzNeEZEaXLS24=;
        b=XWNVoqOd1LgHhYVEP+2vsEBRkSFuJrEfuOKkM87fahXgyjFZujaUoIu20hdMmiwGoI
         swIIU0OaFIhMgRnoiCEENCE3GZMmhOaOYRMTC/TWvKZADY9wNAsWUMbJn+K/hrcFHs6L
         J5A8LeNyBx6JbldtCXvI+WGQ7AX9r4NRK3LTnpPNQwIMZ41li0In7he7j1xp8YPfACBZ
         Dw5KiOMzEAHNhYoVxmzdG+dNyqd341WArYtFdP9ag44lYiZf+jYdb/bBX4KokAe/67M5
         1u58X/tp7B+LQrQYmUu1Xkd1GA0/7CGNJv17BfF+tvnVdvlQSE3vUP5MEAGgGjEYchxe
         3N7A==
X-Forwarded-Encrypted: i=1; AHgh+RrKl2rPYb1O7aiDXJsrCQU69k1Fm5ncwP4R1dY9UxWvhyUnDUSGE58moTxzI+BQSnEwjAa7oNv7nuM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUqULH3WqdIFFtDNTsTCp2ZCqv+4j73TK1MVWthyIcWgVETNez
	R0wXDMoBfjwQAOk3m4Y1DvP4YsShaXasZUfyf46zPCudtCLtzen4Rr5fHYGbhdtGhcKLtW/YA9z
	gk8C00DZ5XvKGm/ZSprrBizirdwGc7Dw=
X-Gm-Gg: AfdE7cnK0Npu98v5PM/kDuIGv8n8Q1Sd+pNXCNuwsXlBfYQCS3aNXnDl7RazjZMoSLi
	7IOlMvhggWCLTtjx3Ze4A1OsBb1REL+qgjQ5JgikbY5bgAoU3mTNhLgOUa/guMskck31Gz1tIFD
	pUj1JemjFG95cnaX9bZ3CakCAvR8XAC8ucg1cMDxdYnxicSQ3ZArp9ftnaN4N+XgJCx/qPOwy7n
	0t5n75xWeGgmpa08zYJwJJKaCX2YMjBcoVQndpQcTc8cvmM5DB7+Ukv0v9ZWCI2gx0nLFSQrZA3
	PBHBVkiVQJiOuWr3LNupFkF4iPmPsA==
X-Received: by 2002:a05:622a:4d0d:b0:51a:bec0:1040 with SMTP id
 d75a77b69052e-51c8b2aa3a0mr110873821cf.12.1783639823328; Thu, 09 Jul 2026
 16:30:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618203053.4725-1-iganschel@gmail.com> <2026070835-thorn-doable-8c28@gregkh>
 <CAPE_3zK0Za9GQaCTX4ZJu4_8Qvq7=c49MXtPduUwHVzQpf1t_w@mail.gmail.com>
In-Reply-To: <CAPE_3zK0Za9GQaCTX4ZJu4_8Qvq7=c49MXtPduUwHVzQpf1t_w@mail.gmail.com>
From: Keshav Verma <iganschel@gmail.com>
Date: Fri, 10 Jul 2026 05:00:11 +0530
X-Gm-Features: AVVi8Cfi-_ZQlFldzX6R-SIleStuO_EU0Nu-UF4IAErwwb0M72HyxJOIpfF_0Jk
Message-ID: <CAPE_3z+DKGJ6yKGD=E5_T+9HCMeUnFBpWdjnB12Mt8UpU4Kquw@mail.gmail.com>
Subject: Re: [PATCH] usb: misc: cypress_cy7c63: check control transfer status
To: Greg KH <gregkh@linuxfoundation.org>
Cc: johan@kernel.org, kees@kernel.org, o.bock@fh-wolfenbuettel.de, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

read_port() currently ignores errors from vendor_command() and always
returns the cached port value. This can report stale data when the USB
control transfer fails or returns a short response.

Convert vendor_command() to usb_control_msg_recv(), which returns 0 on
success and a negative errno on failure, and propagate transport errors
from read_port() instead of returning cached data.

Fixes: 9189bfc2df0f ("[PATCH] USB: rename Cypress CY7C63xxx driver to
proper name and fix up some tiny things")
Signed-off-by: Keshav Verma <iganschel@gmail.com>
---
v2:
- Use usb_control_msg_recv() in vendor_command().
- Remove the obsolete short-transfer check.

 drivers/usb/misc/cypress_cy7c63.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/misc/cypress_cy7c63.c
b/drivers/usb/misc/cypress_cy7c63.c
index 4a7f955ba85b..47cb05c3a870 100644
--- a/drivers/usb/misc/cypress_cy7c63.c
+++ b/drivers/usb/misc/cypress_cy7c63.c
@@ -69,8 +69,7 @@ struct cypress {
 static int vendor_command(struct cypress *dev, unsigned char request,
                          unsigned char address, unsigned char data)
 {
-       int retval = 0;
-       unsigned int pipe;
+       int retval;
        unsigned char *iobuf;

        /* allocate some memory for the i/o buffer*/
@@ -80,17 +79,19 @@ static int vendor_command(struct cypress *dev,
unsigned char request,
                goto error;
        }

-       dev_dbg(&dev->udev->dev, "Sending usb_control_msg (data: %d)\n", data);
-
-       /* prepare usb control message and send it upstream */
-       pipe = usb_rcvctrlpipe(dev->udev, 0);
-       retval = usb_control_msg(dev->udev, pipe, request,
-                                USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_OTHER,
-                                address, data, iobuf, CYPRESS_MAX_REQSIZE,
-                                USB_CTRL_GET_TIMEOUT);
-       /* we must not process garbage */
-       if (retval < 2)
+       dev_dbg(&dev->udev->dev, "Sending usb_control_msg_recv (data:
%d)\n", data);
+
+       retval = usb_control_msg_recv(dev->udev, 0, request,
+                               USB_DIR_IN | USB_TYPE_VENDOR |
+                               USB_RECIP_OTHER,
+                               address, data, iobuf,
+                               CYPRESS_MAX_REQSIZE,
+                               USB_CTRL_GET_TIMEOUT,
+                               GFP_KERNEL);
+       if (retval < 0) {
+               dev_err(&dev->udev->dev, "usb_control_msg_recv failed:
%d\n", retval);
                goto err_buf;
+       }

        /* store returned data (more READs to be added) */
        switch (request) {
@@ -177,6 +178,8 @@ static ssize_t read_port(struct device *dev,
struct device_attribute *attr,
        result = vendor_command(cyp, CYPRESS_READ_PORT, read_id, 0);

        dev_dbg(&cyp->udev->dev, "Result of vendor_command: %d\n\n", result);
+       if (result < 0)
+               return result;

        return sprintf(buf, "%d", cyp->port[port_num]);
 }
--
2.39.5
