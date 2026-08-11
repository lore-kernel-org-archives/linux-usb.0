Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C9F38A299
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 03:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786419726; cv=pass; b=Sa8yHvLKnnQpab/pknZfeRw1uqcwKWXJfXATT+hEpxUMX7hrZ4XzbksEm4/08OASi3TGtG5Tv77vAoMgd41smAnfMp46t6Bts3OX7AGKXSfxyFQR3x9TtvPJLNW8ir+3jUI/SYGJ8bgp421BeKV+0B37KT3R85R44mmabzDiBRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786419726; c=relaxed/simple;
	bh=iZB2YHuqY/AHAU9asRRVXZpiAJUeAYjNTurWRgZq72A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bs1U7lZ/c+MutCh2YS7cio4aoFdVBC9HlF/eHg+/9iq6JGQ5M5QO9398iZo8A9C1wS3q+Q/CDgSxsp4zTbvqY5sSTmImCOewuWYAr9wudVKVOVDZBittq3VPjjN/XeoAzwjpPfllTsAZRXex0mAOwVDT1o6Z6bMH2POcun/y5/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M56JBqCl; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M56JBqCl"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-664b05d408bso2207095d50.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 20:42:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786419724; cv=none;
        d=google.com; s=arc-20260327;
        b=KkkN9bNLz9iBI2FV22a3hrTppi7ZWVAQ4KyxlZSSUS0rVIP/do1fdB+dbiufaJPdyw
         mMVFZkYNn+geFw6jsa+ebXHYMcN9oGYfd6/whkLP6YnMkBV2LDxRf++ZqEIzVUBgmDoO
         w75bxVrGpgasuDYguZTf6Sef2XR/jKN6cbuk2PjPvrrS6ObGGnmzgTSAmW8nVsUbjIae
         /BEBYEj9JZSr+9yEuPHzPW7D8LlIeptAYOXnkiPhSeoxgEf7nRUat25vmB+wvOZQx1Zh
         /eN/nE6BF3HnwEATWryXcmeHwDRLAfu4AJDy7UIfG7XBndaTTfNK2FpYg5s7DDSB5q2j
         OuzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ZnL4Vz4XyDBv6/wX4o2LTm4p1gW6ZuiqBp9YAgRdnNQ=;
        fh=eY3jZ6POtBZN7VFSr25OyOuS5tVKiMEisV8XMbGtMog=;
        b=Zy9HcKwv1uASF9RizKf3ObkvIlboN4RK6gLwFbaLDzhEhXOeNOSlGQk/uIezHRBW2K
         eFquO84aH376fBKNZ8GZbjt41TmmSx8GCHX4/ZxJcgbdXUJS1gE1iwVJyXeOuICOacj3
         K9ue34D3rt3uXq+beTkCwo96sSclvYTh+7F0TflGCOeolapm0kE0CaC5HThSuYnbY46m
         x3zQnt/AzHyCeSLGQEbDPXbDSbOoRmMQxtA19Wvjx7y3eMY2tXoQR+veHa02fv7zlNJ/
         MM4ogpRcLH0HlW5yAPMEyQT/vdPZgfj+4WvjwFrjIlfbx3bFFswgQJGaHiju1CufL5oI
         YPlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786419724; x=1787024524; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZnL4Vz4XyDBv6/wX4o2LTm4p1gW6ZuiqBp9YAgRdnNQ=;
        b=M56JBqClpfVX3GWOT3FFC04i5IsT3GsTeyvnJpyEKRdXfyWLfuv/bbk6drpa9Syjbb
         ce5IlvO0yG6VLl4ZW/xvPIgrjkhhXmhzYKR6FGits4UhRsmUqp9J5d4pO07VNjNAyDRc
         feZZk5+p3wCKysocUrNJ/u8hfhEinler742J7H2bIEFQJAeOFqzmLOfHFDRXL12MHJJU
         VtjDkKlbDy7uF+B9r+MicQynM7QO0e32g0M73ttxLywukiIbfTl7/a7HWm47Irsto1gZ
         gK9BkQm1WEyb6+/hbgPE84qQanhVIlspbBERt4gn4AloKB3BwPyH65nCGl/9OKhx2m+3
         D5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786419724; x=1787024524;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZnL4Vz4XyDBv6/wX4o2LTm4p1gW6ZuiqBp9YAgRdnNQ=;
        b=LylrXVe8RcTROEXR+ENXZXqDfJQqcOacHPPH0NDFiIfvTawRTnOZ8cDst/OHB4Hh2m
         g/AQNnzzUGD5WChp+uD2dYDi1EPKPj7w/DuYlwS5yXRJQVyQLyG5hQTBXEP433DUFJvp
         7yQptOOV7e7tNI3jBZG3RRYtTE1NRptgD3UAxbtZs3n4sinXgOC6mlXcpJED2RfSmeu0
         DYKlSVCNAJkqA/DLs/DFhaJ7jMvR7x+UY9pbDzBtgcFhW34t8c8yBPRyQ8AYsxMvhZye
         er9zX2hBqmO3VhHmg0F3WCx4iDrom9rYChd7NBpETtYqAPZtpk1c3cMyxOhcXUQG9F07
         qGmQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFB6dlUkBhQ1Dyy1jJopJi6KI78ChjVCac5pKTKtaZ4/V6g+pYecbjY0ng90ElRUya1EYckjuZsqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YznHL17qM8CZZTHjQqEUuuSdfwjfxaWunhpB9LYrQeKpGYCBtX6
	oMqbt6ePJBhCfuW88kSrEqFglU2omcENNACntqTndW1nsXmslMVN+JZnhSRSBkYhIf5WQBPfJBU
	V06LpbV5U0tXMnKJ6BCL2XUnoC34q3jjhEw==
X-Gm-Gg: AR+sD13NXdF+oOZ+Ih3XaNSstA/CGde8NBCQ88Jb09jkprPSSmzk/1ZaZY/Zrxgk+Ra
	yqFKAqf92/dfneAWyQeZ+6HSUss9TuXWG7s4LYPH5oKhMwS9F/KjYgJ8/S4Y4LWsynPoMCGaVd+
	gmhy0pIIx9AKKkXbmIxhhOy2VCsRK312fVkoqehKE0qm/QsFm9zpDKJ/kgKIxrYiQv6W9Ky4+8p
	/5byk90eeybz9G4F6xPdrmD2OL2ukN/lT2Y+ocn9V/CYG4g3zudAlSCVxXLt6O/a+WJZVeqMATd
	XEOdJNljJQD36lxx0q/w5Rs2C+aobQU8LK0HckjKUBRtK3c5uWzX7NL4jpB+SzLtBK/UhWWR3RP
	vdogXwFQbTE+v9t83VgtE4eYzOfki5AlsaDZExvIPIvV3PCPs5/dMnVeNRTMo6D4tp9NSkm0L9J
	bzPiJEhS1CXBDN
X-Received: by 2002:a53:ec42:0:b0:664:eb8c:9e3c with SMTP id
 956f58d0204a3-66b2328386amr61049d50.46.1786419723806; Mon, 10 Aug 2026
 20:42:03 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 10 Aug 2026 20:42:03 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 10 Aug 2026 20:41:09 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jason Colapietro <jasoncola1@gmail.com>
Date: Mon, 10 Aug 2026 20:42:03 -0700
X-Gm-Features: AUfX_myHsQ52VwnmjRH9a2gnffH86lXLWJczz7oJFqrKYV2cOsVXJTR8qzJz9KI
Message-ID: <CA+Z0x2KotE5hgrFn-vzR+XNF_H_vEbZcE_nXmpVz5F2q1vxE6w@mail.gmail.com>
Subject: [PATCH v2 RESEND] usbip: make remote list honor parsable output
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

-	printf("Exportable USB devices\n");
-	printf("======================\n");
-	printf(" - %s\n", host);
+	if (!parsable) {
+		printf("Exportable USB devices\n");
+		printf("======================\n");
+		printf(" - %s\n", host);
+	}

 	for (i = 0; i < reply.ndev; i++) {
 		memset(&udev, 0, sizeof(udev));
@@ -98,9 +100,14 @@ static int get_exported_devices(char *host, int sockfd)
 		usbip_names_get_class(class_name, sizeof(class_name),
 				      udev.bDeviceClass, udev.bDeviceSubClass,
 				      udev.bDeviceProtocol);
-		printf("%11s: %s\n", udev.busid, product_name);
-		printf("%11s: %s\n", "", udev.path);
-		printf("%11s: %s\n", "", class_name);
+		if (parsable) {
+			printf("busid=%s#usbid=%04x:%04x#\n", udev.busid,
+			       udev.idVendor, udev.idProduct);
+		} else {
+			printf("%11s: %s\n", udev.busid, product_name);
+			printf("%11s: %s\n", "", udev.path);
+			printf("%11s: %s\n", "", class_name);
+		}

 		for (j = 0; j < udev.bNumInterfaces; j++) {
 			rc = usbip_net_recv(sockfd, &uintf, sizeof(uintf));
@@ -116,16 +123,18 @@ static int get_exported_devices(char *host, int sockfd)
 					uintf.bInterfaceClass,
 					uintf.bInterfaceSubClass,
 					uintf.bInterfaceProtocol);
-			printf("%11s: %2d - %s\n", "", j, class_name);
+			if (!parsable)
+				printf("%11s: %2d - %s\n", "", j, class_name);
 		}

-		printf("\n");
+		if (!parsable)
+			printf("\n");
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

-	rc = get_exported_devices(host, sockfd);
+	rc = get_exported_devices(host, sockfd, parsable);
 	if (rc < 0) {
 		err("failed to get device list from %s", host);
 		return -1;
@@ -351,7 +360,7 @@ int usbip_list(int argc, char *argv[])
 			parsable = true;
 			break;
 		case 'r':
-			ret = list_exported_devices(optarg);
+			ret = list_exported_devices(optarg, parsable);
 			goto out;
 		case 'l':
 			ret = list_devices(parsable);
-- 
2.50.1 (Apple Git-155)
