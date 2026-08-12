Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD48835C6AE
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 06:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786516771; cv=none; b=PRJK8XRDa75idcel6OAVVFm3ac0hLdhfWIR7IG0iiAsXfEmO2Rs0rEe2MiMouyOl5+f+ggaTe1E6rEaF0LUMb3PC7HzmjmqAQa5g9Z3PaTPi7Bhkk7mh73S6RckRNHCagxzFO3sLvq5hnJ4FVJ9JaIIFAeEqddCSMdeifijBbzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786516771; c=relaxed/simple;
	bh=vjGh686wZ4pA8kDIgwRcV9cVvfwN2GaRDI0zRt1vvS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AJ9ZOlBPQhzpyUm620ay5slHZxcY50fy5HAsB31/X3IICLXXfv6JLqM/A/KmwaCrQ9uMHuh53B/AC1QaaIEMBE97UqEBqXj5lKMctTQkx9x54qdeeO3qdJuL6WY7w4m0RZXRFIs+QLEVRin7m+da/CIBYppOwQ3ciHM59GePM2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmAafOHF; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmAafOHF"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81ea0b7d137so5351617b3.2
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 23:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786516769; x=1787121569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPNQJW0gliM+4l6OgCS07iChqzAnkwEPHIHVmPErM0U=;
        b=cmAafOHFBtOXGjEwM/UUwEF8ls620wwVI1K3Ta+bF95NYhld1A8xXjX4m1TaRFidsl
         kC83pKRp7ypNO7BDyJd421cnPKI1U+wxYlbG/HyxcTk7pDdBkxYkRH89pWEubVkAj4Il
         dkr6LyZJV078t+Yj/S8s3D3TM+fE85UhQExwCSPly2vXd5SYtkicFXfaUsLSm7KkKOxd
         /glqlIT8l7wSnn8e0y0VCQonQUsot73Ou+xCb8zU/+zf9TyVr3lmSIkCLW2bqs4wSY/c
         0u/pD+cJ0aPeHtKMoHngXQkdRy7IjHAoJ4y2JWUbP6hGYaBtv+x8dvaSdVsAkmIEZGMv
         ygWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786516769; x=1787121569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPNQJW0gliM+4l6OgCS07iChqzAnkwEPHIHVmPErM0U=;
        b=UQ74y/uz8mYscyM8Kja5kSZx9uYO8ST0vkS8xDqSyUwj+rIh7/c4lwKmMxK7vvhhhZ
         fjFHIY4lS3lSxBNlw9JuYxDixn5Q4YfFDGEkqw7U0xM5EjMd48G9msRJyGTyuKdLG72+
         RhVf+mA5NbmxF46TGgn30CZSCOeN32F+CMltEX1Qz9xVY/do7Qu3LKttc7Eggbh29Zs2
         rgQJNaYOPGQ3UfLHIbavWnIVqUQI1D3UTXMVBNP34LMhEfsF3MLtnzsVaHhjzAktHfb6
         jTfqp9w+480Q6JaM8Cxy7QNFG7Y+V/vu5pIETk2Dp7z0LT+Jnd4LdVftUcSG4+pqqfCU
         19uw==
X-Forwarded-Encrypted: i=1; AHgh+RqW+keKeQVR1aVNkijm8Lag/FQnob6qn0inShCRYMzzlkg3rlYxPLR8t5eYICj5dlK5jae6KmOp0D8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFVsA01GpXY1mmdyAHI3FSuk8Ph7zP7E1d1Q7lciJzoQIiabGr
	jaxu2FBDvSFWNnafLUVQNRYq6Rx/VMIOSjWjbkWIibUvkYWkiosoccN+
X-Gm-Gg: AR+sD11+3JzhxiFg/UilmXgT+NHgcyGFI/oho0SSvMOz75pTeFbx2jKsJZU18SEFemt
	9PGAF3QbD5lo/mxY3vGpAehYzID2cK86m1g3hP/Vt2Wcd4zdFogM2asZ9WVEsRzWiMnd3Cypog9
	0Ik1a7ekn90IGr+1AjkdlK4OcsY1Mx8sNUlr844/WGywhxY3dnKIYA8xxwYrDDWKCploogD7Od0
	bzn1h6hwa25boevPfcULHnq4JNhO3fiXaaPhLiyjCGgQ2pa5uLkssCN/zsrWYXjf7wPddx5gkSr
	DV7WnirbT0Q/x5D/7ARmial43/V7w1HYrHpPxIXAVP4HxHXPrjPwkdxLKnqQ+SXE9zvLGhA6O0X
	pT+cLl9Vr9GsPcZ4pSh385JtvzdHNHnowdAzfeNBcSGPY8VeX/66JmDqLr1nXmEcLg8wrytpmRR
	Ttz1il1svoiqlE7ChVzAdVnZBkuOwaxBe47ruGzSItzqqkc4CQtszBnt46dBV4EmP5d6trEXdW+
	Cfs0fiqpUkrNZRKxLS7IguSl4A7rJoFKnppP40cV9yCP+eI7Toc9gxUUVu7XjorUYO+BGsDxBx9
	p/+ZbDISI+sY7GR29mRcp/elszIkf0oQR6uEB1syIujqS/cE/36+mq2mrsktlHXYgQvd4b0sAsD
	/XNuXE/nE9RoMw++U6uAGKTvRc51SmesvCwsM
X-Received: by 2002:a05:690c:61c3:b0:81f:650d:1377 with SMTP id 00721157ae682-8310c7cf860mr15850457b3.35.1786516768571;
        Tue, 11 Aug 2026 23:39:28 -0700 (PDT)
Received: from localhost.localdomain (c-76-108-143-213.hsd1.fl.comcast.net. [76.108.143.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-830abb2e076sm8226137b3.47.2026.08.11.23.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 23:39:28 -0700 (PDT)
From: Jason Colapietro <jasoncola1@gmail.com>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Hongren Zheng <i@zenithal.me>,
	Greg KH <greg@kroah.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 RESEND 1/2] usbip: make remote list honor parsable output
Date: Wed, 12 Aug 2026 02:39:09 -0400
Message-ID: <20260812063910.31293-1-jasoncola1@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 tools/usb/usbip/src/usbip_list.c | 33 ++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/tools/usb/usbip/src/usbip_list.c b/tools/usb/usbip/src/usbip_list.c
index 3d810bcca..b9d60b87e 100644
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

