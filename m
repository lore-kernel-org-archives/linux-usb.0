Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86267357D1D
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 03:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786419430; cv=pass; b=lXKTlCOLXx6tTuM8IShBm48GSa/nzybJIhkrh1JiO3Dj9VhuTSG8JPLqpJOxVR/fYThJp8CtgdtbR5MtsxM+Y4PZffF9vJpq04VqXOjQTI48ce86OLYSXaUtIvTDzNzsmCxLYBo2F3uqYiNwhs5pnLamA/kS+KLkezZDw/xM7ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786419430; c=relaxed/simple;
	bh=h7ERLeSsm63NpAkva3LUfyOhZMDa714TtANVGouyQCA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=FzvG/NpU56FUHaEb3nVvNp221vvIzmFd1Z+vPX7LoEA3Ptp3GiS8kUMLc4uLWTcn4WEYq9nWOAWIp3slxRoF6QK0FbXbX3dQqB1TZ8e/pnnHxJIl/gdrMAXKnuVHBTiDVStYVLImGJjNb0RybhXHdHr2+6nE60EBzB9DM6270K0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tIFjvkXS; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIFjvkXS"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66892c81725so3462617d50.2
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 20:37:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786419427; cv=none;
        d=google.com; s=arc-20260327;
        b=m76AWjWVot439jIkCbeOKgxTKzSCEY45dYqfuRLJNoh3JeJo+Fjc54ckfypRWoIk2q
         E0qRGIMjXVMTVzNO2wuuOKx0s7mTFuaiHGm4MIWWBBIZvK2b7ScZqbpPcRktW6AxH7sE
         4NQoduRtnaaH7m0lh8lK7SZOSTqoq1h4avPynKRidh6eBVllNnszZa+Ai8Sv0iMYpvFP
         jPbTJstRDyLxihpeym5tAuPXwZe6U2m7HzWsuhj4xoXgj5QUICYWd1yubjI2t1JT2qqD
         NskFbJFl5tbW7dVa5/UgCQEHR1/ndU9itnkvh1UX34AgnL8Em7bihGjHgkTkgow1T+yo
         Qrmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ZnL4Vz4XyDBv6/wX4o2LTm4p1gW6ZuiqBp9YAgRdnNQ=;
        fh=Z/o+nR9bVq8TQbLaOwl5xxpAqQ2icnAf3tN+pI3VDWU=;
        b=iD/EB4oHhZ5TiGQRfPBUk0nPOvUWO08QEm8JTptKqa+/aIaiYiyGna8LuJiM8+YpMN
         rzbigUSCO1a/tYwWe7aw1muf7PsUViMx9C/i4MbV7lhS7zkTQ0QILEmUDcvpLRY1nPY9
         IKHKR57RcOtf7BfPaYuRdDT9S4xK5bdYbNhHG4tVE2CyldnkOWGClld4VbgTlSKMd9kb
         Q/QLiftpVcnPT088saBJAaKoDlH3lyShSq8P09WvOgGJU7lyWHGRSU8IA8VXk4/ohd+R
         SeWtuZxqAYYVIXZiK8HLY816T1abmnMwt5jzYsXEXBAo6una01oi7tC7QtOkwPuNb/tj
         eLCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786419427; x=1787024227; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZnL4Vz4XyDBv6/wX4o2LTm4p1gW6ZuiqBp9YAgRdnNQ=;
        b=tIFjvkXS75TMPj0qvk2DFdYskEEgyh+KWm6wI+cafhqgvdw8wD2bEwJtqWw0xtiOQR
         tVsD22pcMxgj+GREMy745TLPKcQ3T53OP0P654XLQHHTNoiQUmA6ZAFmEofWZiYMIwga
         Fmpa7hVZvo2XKnrbsVoP0iwqhwocxQokhFN27K96ZOC0Ew17hXSWnK/0uEGKfpol6KVO
         O8WuFdHGbGx79MVAXVVDNJWorzag4gO1nvD30FpFB9IvCdJj/vNspou978ulFK4ssS59
         d6+McnYFfCAAYLpWYqFKlFq957huZN5qQchCEPfUZaNA6UmFEvEcGM4r9RdH9lru6D9A
         EC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786419427; x=1787024227;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZnL4Vz4XyDBv6/wX4o2LTm4p1gW6ZuiqBp9YAgRdnNQ=;
        b=m326CYnY6IO4Rc9KRmGVai+4taZroDjnSDZpDo4Kt4YaFIGVq50yaKIbIrXPOLYgTH
         BJ5bDj8+f/4z/bW6zapbVAMIm3m7/lGJgIZv+xF+/qGmdmK3N8U3AzAcwJDw3yT9OK49
         fQZz4iu4zqWLf5o0AUkJd3KBPnOTSCYHI5vt6j7bs1bX1ByAT0GNIrQE4FMIAEOZJUIg
         +R4t/HX2dc59Ipe1uiv+kViRVHPRNDFT59I/SQhD/Xpesw5KrDKVnQ7NQwdMFJLs3vU+
         L4XHHy9Wwerv+fOnnjiEDG43Dpr0dYSeY3Yn/DpEudQZHwerFF24ZxL5n1U7A9J1B9sn
         lbYA==
X-Forwarded-Encrypted: i=1; AHgh+RoPKIGv9QCfUNksbcoOgnMegBjcg+y/Hg9/rPU1XMWn5QDNJOBlD30B//RzEryIhcHhJFpXEvoWa9I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyga3VjAWdtIYHMWPp2sPTGdl77DzojtlVcwbAqE5FOup9Jp52y
	xfn/0GS+/RlhWC9PQBmAdRPrFzA90UyZ8H7HxCihUcXA4DRFjADVVYUEEiYIhXNxUpJz2yTGq4o
	LXAS+k6WvqWnLYJ5oIprJcuiwvjwA/Xw=
X-Gm-Gg: AR+sD11HtP3KZ3oc5j7sTxJH/RZ6oLVTLxZTuNmg7YAgCBGKEUOEUGTb0Rq4oa7KQmT
	I5hhk7AN0xDCVu67ltWgkMgubhrnIh5Duxr22ufjzJUvz3kM2rg/t8UCCN+eWvHG9aNqixonjwX
	4PxzK1KbrbyhK5ZOKdGtX/RMW5eHJxoY/IZPUfkoSMEidph1TDna566tat0/PuuKBxZVCed8TY/
	9P5Joid+fjmCK3obQnjBh3ULXZA2ZCqYiuyXW9n4F0pRHGyPlFJi+XHGI05gCw0R1MJBZEWSyNS
	tOmtMUmaGFXkaRPX4MGHo/IbG5mVvsLXClXxwP/+/+nvLe1MYEwZ4qX4pC8793f9lJqAfz9gcSn
	/OK7gjH+SEy9M5Nz8HVLPIbU8diPiYoRkuUCH+rzM61a4KCBoiXL5BaxmeQDic9sgJ/YJ+Iv0lZ
	qG0GK0VEjbj4lC
X-Received: by 2002:a05:690e:4292:20b0:666:39a8:fb82 with SMTP id
 956f58d0204a3-66b22d9f964mr102664d50.14.1786419427395; Mon, 10 Aug 2026
 20:37:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jason Colapietro <jasoncola1@gmail.com>
Date: Mon, 10 Aug 2026 23:36:56 -0400
X-Gm-Features: AUfX_mzF21M26wbAtf2AnhCVFZnA26kG-PD1qMX1SfK5ylkY4TSVFQwLsLDopRk
Message-ID: <CA+Z0x2J-kxsCBJbDP0DbfEHYQxz_Zg_YAHA8t8nrFM7aNnytSQ@mail.gmail.com>
Subject: [PATCH v2] usbip: make remote list honor parsable output
To: Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>, Greg KH <greg@kroah.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The -p option only affects local devices and gadgets. Remote lists still
print their human-readable headings and details, so scripts cannot parse
them using the documented option.

Pass the parsable flag through the remote listing path. Emit the same busid
and usbid record used for local devices while continuing to consume every
interface record from the server.

Fixes: e9837bbb3e69 ("staging: usbip: userspace tools v1.0.0")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219502
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5
Signed-off-by: Jason Colapietro <jasoncola1@gmail.com>
---
Changes in v2:
- Make the email From header match Signed-off-by.
- Add Cc: stable@vger.kernel.org.

 tools/usb/usbip/src/usbip_list.c | 33 ++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/tools/usb/usbip/src/usbip_list.c b/tools/usb/usbip/src/usbip_list.c
index 3d810bcca02..b9d60b87e47 100644
--- a/tools/usb/usbip/src/usbip_list.c
+++ b/tools/usb/usbip/src/usbip_list.c
@@ -41,7 +41,7 @@ void usbip_list_usage(void)
        printf("usage: %s", usbip_list_usage_string);
 }

-static int get_exported_devices(char *host, int sockfd)
+static int get_exported_devices(char *host, int sockfd, bool parsable)
 {
        char product_name[100];
        char class_name[100];
@@ -80,9 +80,11 @@ static int get_exported_devices(char *host, int sockfd)
                return 0;
        }

-       printf("Exportable USB devices\n");
-       printf("======================\n");
-       printf(" - %s\n", host);
+       if (!parsable) {
+               printf("Exportable USB devices\n");
+               printf("======================\n");
+               printf(" - %s\n", host);
+       }

        for (i = 0; i < reply.ndev; i++) {
                memset(&udev, 0, sizeof(udev));
@@ -98,9 +100,14 @@ static int get_exported_devices(char *host, int sockfd)
                usbip_names_get_class(class_name, sizeof(class_name),
                                      udev.bDeviceClass, udev.bDeviceSubClass,
                                      udev.bDeviceProtocol);
-               printf("%11s: %s\n", udev.busid, product_name);
-               printf("%11s: %s\n", "", udev.path);
-               printf("%11s: %s\n", "", class_name);
+               if (parsable) {
+                       printf("busid=%s#usbid=%04x:%04x#\n", udev.busid,
+                              udev.idVendor, udev.idProduct);
+               } else {
+                       printf("%11s: %s\n", udev.busid, product_name);
+                       printf("%11s: %s\n", "", udev.path);
+                       printf("%11s: %s\n", "", class_name);
+               }

                for (j = 0; j < udev.bNumInterfaces; j++) {
                        rc = usbip_net_recv(sockfd, &uintf, sizeof(uintf));
@@ -116,16 +123,18 @@ static int get_exported_devices(char *host, int sockfd)
                                        uintf.bInterfaceClass,
                                        uintf.bInterfaceSubClass,
                                        uintf.bInterfaceProtocol);
-                       printf("%11s: %2d - %s\n", "", j, class_name);
+                       if (!parsable)
+                               printf("%11s: %2d - %s\n", "", j, class_name);
                }

-               printf("\n");
+               if (!parsable)
+                       printf("\n");
        }

        return 0;
 }

-static int list_exported_devices(char *host)
+static int list_exported_devices(char *host, bool parsable)
 {
        int rc;
        int sockfd;
@@ -138,7 +147,7 @@ static int list_exported_devices(char *host)
        }
        dbg("connected to %s:%s", host, usbip_port_string);

-       rc = get_exported_devices(host, sockfd);
+       rc = get_exported_devices(host, sockfd, parsable);
        if (rc < 0) {
                err("failed to get device list from %s", host);
                return -1;
@@ -351,7 +360,7 @@ int usbip_list(int argc, char *argv[])
                        parsable = true;
                        break;
                case 'r':
-                       ret = list_exported_devices(optarg);
+                       ret = list_exported_devices(optarg, parsable);
                        goto out;
                case 'l':
                        ret = list_devices(parsable);
--
2.50.1 (Apple Git-155)
