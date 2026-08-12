Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78EE3B6C16
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 21:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568615; cv=none; b=MPBgPe3pYI3AIKDljzLRQkAi8RqifCEnjqYK7PfMHd7YQ/9lAkDSesEVcnutvJqYk7VBqCpJUb6SLb9qTnMHH8U56YWHP+ytz7XGh4AyMIXUJHJTRN0pSah0e3iCgveilxM9oaKndpDruzEwXQTM10QdWQrNrEn8g4aohgwi1yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568615; c=relaxed/simple;
	bh=tDf3xKnTdPpk/hGFGCZnMdnScx6Pj+e5wK3CXmZ1vFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QcQGQ+FhEm98JaCclJXZpGPCen+DTDLqqhHEsfwSRMVhQSIdAX1i2YCia4NX7Mr+GyYKrMcEbqipIvHwp3JKvJSSeSsC4d6EQpD0A9tseK41JfnuZeQ3E2vTN7QkmkPSkoKGNzmoouVBA1kZQvj6ebXAaH1uXjHwXc3nw1bt5nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCVyQDFx; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCVyQDFx"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8228ed0081fso22411337b3.2
        for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 14:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786568613; x=1787173413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vRg/zf0vzXMp9C0vEV+QtS8jMuS5BuXWj0OUL5KpinA=;
        b=tCVyQDFxMlIKWJTM7hG/XuGuDfF8y6LYOFWwCeddIWJBY9AOQT569L5F2eN033ck2c
         c6+AWc5ZZhlUELH55w0oOplUjtLWPXF1ohD/6snXsWUL6+8op437by8amzEQI8a/u95A
         GjowEB1YO9ICQn783oi+E28FN3XBaA49mS3Vq1PKyz63nEs0vkAD4x1XfCD+3olMCJ1U
         7JjS4Wl3IkHUVAuJsXzf+a3des/bexxBqG4jBU9+rjfmtk976PwVkMd9GEOOS26Ex7fM
         gbWwwkUqTQbPBYQG0ASESsF/6l2HTvyhqGVBhkpx3F1biyo9lCQiUWE+1ZKnQKRrdveQ
         vUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786568613; x=1787173413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vRg/zf0vzXMp9C0vEV+QtS8jMuS5BuXWj0OUL5KpinA=;
        b=RgbsIRSPVB9gqboibA3zvGlLCQBfXgUP30g75oDX3nrwCbjRdGA61o2WSRU2+wDm1b
         Km8egBnEmrP786m7HNwYhpbFQM3atYqLuQDRS9Lat6/F+sZcgCnAwzddEL8L6gsl7+tY
         GYDmIZNIO9m5/vd+tckTuRHtAI0c8Guva2OUnNMUhYhKaklTOlsMoR0M8wiaDXiJuUaS
         AbsUTmuT4LrFw+sCZI/RSB818ne5b+gnq+kVyaTxyk4g8lkbIbBSsGbckbNrkyvbTBex
         efk7yCq9l8A1OBD/fHHKa2y0+5pPLoj/fHXc+K9LvatXDYu8+ZmCkwTnSUhQFhGo3sO+
         LeLw==
X-Forwarded-Encrypted: i=1; AHgh+RrQSNOn+Q+wtVdVfKOxxgoSqJjr/7CwieWXE34vyGVjynIffY+4u/QuxnZpaYc6KJz9+m1+WieM7fU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGSxG0KDslL6Ebd0TrOcOlB+wAMvWgfh+CvNfaxQd+cFwVnFMO
	I17JXuKbECZl12MGNDv9Vl78ZBL0t3Lf6CsCecsH8NTWCWrARrgLMdJV
X-Gm-Gg: AR+sD12H417nO52wETdmGBXN4gyMAYklzSAulSWK1mZbNJwPMfZQXQAPbSVHPYKaY03
	sFPeD0eqTD+e5RWLMsvADlvrFxS+d/+xHFzROgOnub51xqLqAk8L0J5aFGOOuF+QIn4dMcgjZ4h
	WDj9T+sUM16cuygVjKkwF67kh7LVeqTYoPBC1iaA1gvMPn0zlqHZLA5bprR7xMWEk1/Txau7jSb
	SeSuLASv9Zj3qZtQX+IHjzhDlO5hbftg35hRFy6BznPI7eXhnK8m7/W8ms83cj2prBsvrdSgnj8
	Bx8PfAiII7vYaJ/GaFuzEHGwE0guPB2v+yht5BB8TX43UMRaeJq0vMMr9z4S9d+XnBcUqfhH1Gi
	eEnSYzwqSfW60dK1TWgwtGRJWoXr3z1EeBq6C0dr2DqXC0mDvlfKJO6mbKVEdwXX0QCzVvCRSMZ
	Jf85miE/Bi/cg/oBTMo9NrUsVdhVvYEbUdufG0dwyK0euKFmsh1KNH46Fm3mRQnYNw2MwD6t59c
	o2ROcPn323DifIMo/qsPECLH0o+hdpv3BYYSHD7hksrqaZilloKkStkW/tAOONo+nqziJggHjtZ
	lSr4vjswsSJ9cjomxtqyEMrqU8uXB1jTzAVoxUjrmTA5a5s3
X-Received: by 2002:a81:8a45:0:b0:81e:3965:40b5 with SMTP id 00721157ae682-8347558dc39mr2638597b3.28.1786568612475;
        Wed, 12 Aug 2026 14:03:32 -0700 (PDT)
Received: from MacBookPro ([12.50.191.82])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8346699645csm1886577b3.15.2026.08.12.14.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 14:03:32 -0700 (PDT)
From: Jason Colapietro <jasoncola1@gmail.com>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Hongren Zheng <i@zenithal.me>,
	Greg KH <greg@kroah.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] usbip: make remote list honor parsable output
Date: Wed, 12 Aug 2026 17:03:26 -0400
Message-ID: <20260812210326.21485-1-jasoncola1@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The -p option only affects local devices and gadgets. Remote lists
still print their human-readable headings and details, so scripts
cannot parse them using the documented option.

Use one file-scope flag for the list command and honor it in the remote
listing path. Emit the same busid and usbid record used for local
devices while continuing to consume every interface record from the
server.

Fixes: e9837bbb3e69 ("staging: usbip: userspace tools v1.0.0")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219502
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5
Signed-off-by: Jason Colapietro <jasoncola1@gmail.com>
---
v3 -> v4:
- Make parsable file-scope instead of passing it through list helpers.
- Drop the option-ordering change to preserve existing behavior.

v3: https://lore.kernel.org/r/20260812063910.31293-1-jasoncola1@gmail.com

 tools/usb/usbip/src/usbip_list.c | 48 +++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 19 deletions(-)

diff --git a/tools/usb/usbip/src/usbip_list.c b/tools/usb/usbip/src/usbip_list.c
index 3d810bcc..482f11d7 100644
--- a/tools/usb/usbip/src/usbip_list.c
+++ b/tools/usb/usbip/src/usbip_list.c
@@ -36,6 +36,8 @@ static const char usbip_list_usage_string[] =
 	"    -l, --local            List the local USB devices\n"
 	"    -d, --device           List the local USB gadgets bound to usbip-vudc\n";
 
+static bool parsable;
+
 void usbip_list_usage(void)
 {
 	printf("usage: %s", usbip_list_usage_string);
@@ -80,9 +82,11 @@ static int get_exported_devices(char *host, int sockfd)
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
@@ -98,9 +102,14 @@ static int get_exported_devices(char *host, int sockfd)
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
@@ -116,10 +125,12 @@ static int get_exported_devices(char *host, int sockfd)
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
@@ -150,7 +161,7 @@ static int list_exported_devices(char *host)
 }
 
 static void print_device(const char *busid, const char *vendor,
-			 const char *product, bool parsable)
+			 const char *product)
 {
 	if (parsable)
 		printf("busid=%s#usbid=%.4s:%.4s#", busid, vendor, product);
@@ -158,13 +169,13 @@ static void print_device(const char *busid, const char *vendor,
 		printf(" - busid %s (%.4s:%.4s)\n", busid, vendor, product);
 }
 
-static void print_product_name(char *product_name, bool parsable)
+static void print_product_name(char *product_name)
 {
 	if (!parsable)
 		printf("   %s\n", product_name);
 }
 
-static int list_devices(bool parsable)
+static int list_devices(void)
 {
 	struct udev *udev;
 	struct udev_enumerate *enumerate;
@@ -229,8 +240,8 @@ static int list_devices(bool parsable)
 					strtol(idProduct, NULL, 16));
 
 		/* Print information. */
-		print_device(busid, idVendor, idProduct, parsable);
-		print_product_name(product_name, parsable);
+		print_device(busid, idVendor, idProduct);
+		print_product_name(product_name);
 
 		printf("\n");
 
@@ -246,7 +257,7 @@ static int list_devices(bool parsable)
 	return ret;
 }
 
-static int list_gadget_devices(bool parsable)
+static int list_gadget_devices(void)
 {
 	int ret = -1;
 	struct udev *udev;
@@ -307,8 +318,8 @@ static int list_gadget_devices(bool parsable)
 					le16toh(idProduct));
 
 		/* Print information. */
-		print_device(busid, idVendor_buf, idProduct_buf, parsable);
-		print_product_name(product_name, parsable);
+		print_device(busid, idVendor_buf, idProduct_buf);
+		print_product_name(product_name);
 
 		printf("\n");
 
@@ -333,7 +344,6 @@ int usbip_list(int argc, char *argv[])
 		{ NULL,       0,                 NULL,  0  }
 	};
 
-	bool parsable = false;
 	int opt;
 	int ret = -1;
 
@@ -354,10 +364,10 @@ int usbip_list(int argc, char *argv[])
 			ret = list_exported_devices(optarg);
 			goto out;
 		case 'l':
-			ret = list_devices(parsable);
+			ret = list_devices();
 			goto out;
 		case 'd':
-			ret = list_gadget_devices(parsable);
+			ret = list_gadget_devices();
 			goto out;
 		default:
 			goto err_out;
-- 
2.50.1 (Apple Git-155)
