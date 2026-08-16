Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369BD35838E
	for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 04:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786853746; cv=none; b=QXTBvRJd+sIgLtBGfsQf3tyYjIHFEC9YmjJmBWmABZ5mX4cPq7BJdwA6ufMu9/XRZYbCwg0b28XMv4DR9t7J2zP76TS13EvuYcFliWjKuNcD7hWllRZ/KjSjBLYy8AEUIjRRp7Bu2yZ0OGKdZx/8dldefYLmAWTKm/lozh62gIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786853746; c=relaxed/simple;
	bh=nNm/QRaJ/y3CNuk5oavkzkvXthwcbkYwN0TWtBgDZ4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rEkh5YeW3tmxwaxIgjRdBOxC0tzaOglqEwuIUSOLXqZ1Q7CkSCT/cOxjwgKwRpcI4QpiF3zFrrB4JQUqECQ+DsIirf7giaNWM7alCgY3I+pdSmRWGK/FzXoU/SFMRmXsHDd0/YXAgtXoZi/VjAMpCPdvzMhhvxPqRtg3uyHmhHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkhwZTis; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkhwZTis"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66825847b2cso2580828d50.3
        for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 21:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786853743; x=1787458543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Uj2rF2EF2u5Ttp6n1CkYp299l14iOey9vUEfQ6T0RM=;
        b=AkhwZTis9maSXighzc2i57yB8zm7cUbTHK585mdmWrNwNjUYmMULhua6gfmgjIxPyW
         esq4kDwvp7JfDHia9T2o9EmX/e29DlobBNJZRTu1P4jfWyGXv+IjUjtapegkmSjmt/1d
         YN/RKNty+lzL1uhlZW2aceXwvVX3GrOIPh4OF95oeOYlcWZg7nCgV6MDSKUJrGN7qbhR
         hf8ZkD4cnqbI8QbsNBvMrl50Z7w60sNMDpoXLiLwj2cwpr2SV3HhVcQ/tgcjatEcSGrr
         YPJnqX30xWRsB6+V9bbl4vDw/n2dwJvk+ZYgVhzOxIgT2iV7Rea40k3cMLyl0H0VwCyK
         MEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786853743; x=1787458543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Uj2rF2EF2u5Ttp6n1CkYp299l14iOey9vUEfQ6T0RM=;
        b=F4TwbSAdUUNHPeFXIvbmT7A4s4tAIaFf6kfeBaR7lE4GCm8hc4iOT/oNqjC8K7k6CJ
         ezFsxts8/eZeLKLrH5HbUEcVser2FH/wpENAxRvlkdqgCJ1NLd7OnTSQfbfsClpdspYV
         Gk9nitnPu9o78jX6IfM9IV8gkEnqA5TnXcjT8SYbi4V/zvofFX/RMm6Vn4mthUp5u9HU
         IIct88wjw8053t57QJXQOIAVjCWdXNc2nvBJL0jmJGlgCijdhnf/VGeZU5uEbBqogegF
         knPGykfRk/ydNjqEdLbPVdM0a9HFATGwqrp/1WGiq1TCFzG7TwhcSttP5IRcOKflV0JC
         S6qg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1bPyEp4dbP1r+UZj86B/AtE8m2etprF2WhHMsktRXpLw5T2sY6dVdXMjURzDprIy2cbbugSIJb6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3TF4E/P5bn6LIBs8TrOm/baGaR43QzQPi3OqDPFbyJ/uGe6oz
	5UaADImGLGN9nf6myoQBcWyZH0ABEitFBYCBOFjAk75Jvvg68Xz/hJ56
X-Gm-Gg: AR+sD13lO37X1GH3j+mRvBa6xHLH0gTzOfFjWTEVmzwFvT6hXSjPRwWDlGZ7VcIbXUJ
	uY9kkCdw/7X7LPpKo6PHh0AAdr5ih+OJzeoh/RIFhqfz8ZtJO3YvJ9LPBVoq88annac4nGi1LId
	u2D1/fF6fUSRGRoaRai5UwGc5oldB0SK68YMF96zC6+IqmeRQ/j3ub7S3nY5CmcRWMibQYo1Qwb
	3PO+dgI2kemDQ94/YFZdusGtq2+4AVnUoIGh3T5ak2/tZC2vTdfVTQGakI4/vBv/T5oE4TljmF/
	mhdvP4V6T3LyTgZruqsphcyt7XZJTvru2yiv7kzZfw1IDU4r0fwG8qwfUw4a+z/vu3EHrQtQ6Rz
	k2Xx2oilPRlzem9ZAekkbSxiW0kORfUVPoK3ZpaZ4m5MpAtoPb2ff8kFQTijSW6zemW5PfedQ3A
	jIUjgmqYQ8PDc0AkxH630/PRUnjfF/cHRuP7QcdIXN5BKJsprNvUzqHv3GazyEvUsrigEfsjdr6
	H75gyZOZzYcuM6BTZbm8kunyaG0Ws1E/C5QDbk3aYZ8R8MpcEKn64RphWU7YNduAXO5LopAEAft
	ejlrFUtwbot1IikZwV91arr0sleG5mzMGJSW6WwTE/WbsngtyCjcuh5LTs49PELQFQuC1uzSvhy
	9F8/8anujaeQZuupyN1AAtLJc
X-Received: by 2002:a05:690e:78c:b0:66c:7332:7ca with SMTP id 956f58d0204a3-66c73320883mr4537600d50.13.1786853743090;
        Sat, 15 Aug 2026 21:15:43 -0700 (PDT)
Received: from localhost.localdomain (c-76-108-143-213.hsd1.fl.comcast.net. [76.108.143.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-836bda13fe2sm32908387b3.22.2026.08.15.21.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 21:15:42 -0700 (PDT)
From: Jason Colapietro <jasoncola1@gmail.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	skhan@linuxfoundation.org
Cc: greg@kroah.com,
	i@zenithal.me,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jason Colapietro <jasoncola1@gmail.com>
Subject: [PATCH v5 RESEND] usbip: make remote list honor parsable output
Date: Sun, 16 Aug 2026 00:15:18 -0400
Message-ID: <20260816041518.48053-1-jasoncola1@gmail.com>
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
Signed-off-by: Jason Colapietro <jasoncola1@gmail.com>
---
v4 -> v5:
- Drop Cc: stable@vger.kernel.org. This changes the user-visible output
  of "usbip list -r -p", so it is not a stable backport candidate.

v3 -> v4:
- Make parsable file-scope instead of passing it through list helpers.
- Drop the option-ordering change to preserve existing behavior.

Resend: the v5 posting did not reach the lists (rejected as HTML). No
code changes from that posting.

v4: https://lore.kernel.org/r/20260812210326.21485-1-jasoncola1@gmail.com

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
 
@@ -246,7 +257,7 @@ err_out:
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

