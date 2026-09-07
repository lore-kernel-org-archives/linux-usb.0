Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133671A0BF3
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 08:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770218; cv=pass; b=PYs5LjzAuWD7tWKYPRs5DC9mx91U0fm9aRNqeDOp/yNDOW1NhAaVaRpp0pFVJq1R9nIdSUcZDjvg7HjPyesiwiogzygDhpSeYEUtjy24ezksOPQlO6Fb4Bu9HdKM0DpXSYq7FAUxL2VPPkAXLtvubNP8fxPmm4I1yZsJfZ5OLhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770218; c=relaxed/simple;
	bh=ZvY80yaGJ0kssXRzj36/tkiHQgJloYipZQ9HyoMZulA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=QkNTnLXFuJ27QCs9wfaTXlv/ytTiEz0FfSQCB3/JUvlQLhGNzLlIwx9/Da0mMZkB/XHfaTHn1QYhUg8LCVDvNIRZZtvF0KHHUK1NSMYo2agM/Caub07NSbwNxUWDdPI52P8wrYbQ02dJToiGCt/rv6piuumuYAO0aGB29B5Lx2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZktYlPCq; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZktYlPCq"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-865bdc6ed72so56574987b3.2
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 01:36:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788770216; cv=none;
        d=google.com; s=arc-20260327;
        b=FjHpbHR1QPkzKue+BOwg6jXuZ6IvY58V0aSRI9zDuSy6DqLAfohDD7HdO1XEb0rQXl
         Cw4+MvAw4deHlXZJCOq8iqPZIdR4Ay6m9NHH8x7EFKSqG7rDmLOEaM2qfxtlPGhSA1N5
         /z+H+Xk0Eftx9EzVFKlaUuzcz+mRE3EFdgFM6tpbwhUGD1npYgzwM67dOJm4ewOQNkpH
         6S2zaQhEHQgKgUVxNUvTK/QHTKaKyw/Hxsa6FRZh2Mq6mwoiOsRsrP0EhQ9hOYHwlOTL
         g4e+JUkQMTj4SN1sKO11WD0i2YYQcYSlz5kivcvKkGl5EnLTHOMAm7AVfe8ExxijTzNf
         aI9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ei17KvSwvnLShcgG1y87d9YVMkxzNnLH7w2oz7cWmqA=;
        fh=asGraVbzOBlohD3s2f0SeHWYONqctuiJUx+7btN2Rzo=;
        b=CX0Q6ApCCBg0D7z6T3LUySD4QtAa+wLtEEeK0kZZfTgEIGl23UbzcYCAdfj1YYrsdT
         4xSbvmopWX1qmnDjetLsznS/ooiHXHiXTVV8/m1OvLeQ9wiudPPF0h9eMERZLSTUEABk
         wEvd2/roO6Ms6gm/xsW+ACVaMqOKpoxHXBD+cQMhIm8khz9KZOPeaFXmn5NejokwYAmv
         DkChy7wUEzf9UvyFTUhng7dkeXfZSjjV34NgufNtlhB8jpe1Q9v3fwc94YdRHOc9ueAG
         JIb3k1wf+egxNldXXvpCJGoyHaruFsEp9Tw5X/WkD5hcJa7iIFr9MFmHkEck6AbmlfVF
         JAEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788770216; x=1789375016; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ei17KvSwvnLShcgG1y87d9YVMkxzNnLH7w2oz7cWmqA=;
        b=ZktYlPCqF6AlWwbLc6hA1vfMqsNZ7FP4HFiuQGb69hH1Pj2rgts3foFs7/4G7ebX13
         iGUmkPvzSJVH1/IyFNcDrKsc5FayRKtCUzNbQSRSWsNPrXzpmzjYw6lCwEVRh08Gn91/
         AKrZg4aCOYTlzfVJb0D0QNwwiwqAozkBTDLXl2LdiUSLEKE2HVrk7Ol+bIq6XXVzuFQC
         U9xEtIvFOTi+Xsru4j7wF0U3MLtpMy3jqUnXtcCWRQzjieARmkAfmqngivkk9KhzysnX
         NCBeflGVFhWuAjFTaKASwLcjAFFzSOU6KcTEEwm0ZFIuGgO2QJCMHd5texX5+XsdD5xr
         GGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770216; x=1789375016;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ei17KvSwvnLShcgG1y87d9YVMkxzNnLH7w2oz7cWmqA=;
        b=YMurcqZ7h2jYQzf/G3gZtrI2u0MvGbzVZjMSKm9GxbeBFQ3yaXM84CgqO31mh+CELE
         Meyg7PXwejnISymCamSTy/GOdEOm7nW/QkShhMOPFfT5A2wuc6nuael40Gz72JOgFtpW
         Ow1HM5qxG0yFkFNlqGqfjO/L0auUKmBDh1aRdmMUZQiwvR7AH/5IjwpMI1r3Vcgd6vBd
         Vn6MQO9Xb/LRYIhSS2RQWKS8fDYomD4ioPRWBFHeNgzDyAwdkxVeEuzf98y27X0tc7CS
         hL/3wcIrEMhB47dXNlSKekphcIIiSAP3x0mC+Y0rwQOuZD9tFLHOWF3j3tUYgV4+dgI6
         nspA==
X-Forwarded-Encrypted: i=1; AKwUvBwI8aeAb7Y49S4yuxCU0M+mN++m+k7Vm9ga9jPzeEwk05w1myNuK0O2QLRoWBUTzYS/Vt82TpGWLNU=@vger.kernel.org
X-Gm-Message-State: AFuF++mPzeR8PtA0F6/ZuQrtJTJxWSUUG5y+84s6aAaRdW/m7mZO+S/7
	1A5h/pGQnbzeDNay2SSxHOR7vElDAB1qbwMez/pHX1X9Rg6LztW5g+bPmatgqrojXFqwUM1Tkf/
	x+jCudctbeZSlCMhoFwhR3kPWJLbrCpIro3iS
X-Gm-Gg: AYBFou3ViMfFBHm2xdux/Il+l/xhAWmPsZ3YvL/KScKsFNNOlEobPn29JSh/+ADRe5m
	Ibv1XOjDNNFZPG/e2s79TDuprJMdTZJpwkUM9jOLDnlHxI1DvhUIJHmKAbrGh/rtGa8NuXbx4it
	qmkkzLmdBkO8INOTmgYPih0MJOuU0vSAH5CvC3E3wyXbBxWKkBB4GGGg8RX0xJ2juVyt5S4G1lP
	pvt+vXRyoyrrrhRgGKX0QDpwwudHG1BQ391LeNqOlaa8XatfAQTsVMNfS3tzwfC9+9kUxcUUAJk
	VrKh1znkJQg7btAX4Lvy5x72KbwDmk/UGn36IG7wPm9kN77vRlr2W/o/fWj42ATbxh2O5toY714
	QI8xbF+5tYcn+gOvAcjHqAjTihd3fkN5yjpF+v7UARMdr01b/BN0geL18lbZbYd/186KoYHh7Vb
	U8bIxLdkkS
X-Received: by 2002:a53:cc4a:0:b0:66f:c1bc:8807 with SMTP id
 956f58d0204a3-66fc1bc8b5dmr2991188d50.96.1788770215839; Mon, 07 Sep 2026
 01:36:55 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 7 Sep 2026 17:36:54 +0900
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 7 Sep 2026 01:35:56 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jason Colapietro <jasoncola1@gmail.com>
Date: Mon, 7 Sep 2026 17:36:54 +0900
X-Gm-Features: AcwNN1V3Sx9dMpHhOLxWE0ShMfplPMhy7J6VQWqQB9sq_1e4Dce-r77PatQL6nQ
Message-ID: <CA+Z0x2JTGOsnu7gNPWBfxCZD0vesbezJ7-yhT1sOOuUdmdcQRQ@mail.gmail.com>
Subject: [PATCH v7] usbip: make remote list honor parsable output
To: shuah@kernel.org, skhan@linuxfoundation.org, valentina.manea.m@gmail.com
Cc: greg@kroah.com, i@zenithal.me, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The -p option is accepted in every list mode and `usbip help list`
documents it as "Parsable list format", but it only ever reached the
local (-l) and gadget (-d) paths. list_exported_devices() never took
the flag, so -r ignores it and always prints the human-readable report.

Both commands below pass -p, and only the local one honors it:

  $ usbip list -p -l
  busid=1-2#usbid=1a86:55d4#
  busid=2-1#usbid=0627:0001#

  $ usbip list -p -r localhost
  Exportable USB devices
  ======================
   - localhost
          2-3: ATECH FLASH TECHNOLOGY : Kingston SNA-DC/U (11b0:6298)
             : /sys/devices/pci0000:00/0000:00:1d.7/usb2/2-3
             : (Defined at Interface level) (00/00/00)

`usbip list -r <host>` and `usbip list -p -r <host>` produce
byte-identical output, so a script has to scrape the decorated report
instead: the column padding, the " - <host>" banner, the blank line
between devices and the per-interface lines. That is what the reporter
hit in bugzilla 219502.

Use one file-scope flag for the list command and honor it in the remote
listing path. Emit the same busid and usbid record used for local
devices while continuing to consume every interface record from the
server. After the change -r produces the record shape -l already does:

  $ usbip list -p -r 127.0.0.1
  busid=1-1#usbid=0781:5583#
  busid=1-2#usbid=046d:c52b#

so the obvious loop works against a remote host:

  for b in $(usbip list -p -r "$host" | sed 's/^busid=//; s/#.*//'); do
          usbip attach -r "$host" -b "$b"
  done

Without -p the remote output is unchanged.

Fixes: e9837bbb3e69 ("staging: usbip: userspace tools v1.0.0")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219502
Assisted-by: Codex:gpt-5
Signed-off-by: Jason Colapietro <jasoncola1@gmail.com>
---
v6 -> v7:
- Fix the Assisted-by trailer to use the required
  AGENT_NAME:MODEL_VERSION format.
- No code changes; the diff is identical to v6.

v5 -> v6:
- Fold a condensed before/after into the commit message, as Shuah asked
  for on v2. No code changes; the diff is identical to v5.
- Restore the Assisted-by tag. v7 corrects its format.

Tooling disclosure, per Documentation/process/generated-content.rst: an
AI coding assistant was used for the original code change, and in this
series to rewrite the commit message so it carries the before/after
requested on v2 and to correct the trailer format in v7. The code is
byte-identical to v6. checkpatch.pl --strict reports no errors, and the
patch applies cleanly with git am onto mainline.

v4 -> v5:
- Drop Cc: stable@vger.kernel.org. This changes the user-visible output
  of "usbip list -r -p", so it is not a stable backport candidate.

v3 -> v4:
- Make parsable file-scope instead of passing it through list helpers.
- Drop the option-ordering change to preserve existing behavior.

Two behaviours I checked beyond the output quoted above:

- The connection stays in sync. Interface records are still read from
  the socket in parsable mode, only the printf is suppressed. To confirm
  that rather than assert it, I had the test server withhold the final
  4-byte usbip_usb_interface record for 3 seconds: the patched client
  with -p blocks for the full 3 seconds, so it really is draining every
  record.

- With no exported devices, -p prints nothing on stdout ("no exportable
  devices found on <host>" still goes to stderr), so stdout stays clean.

Testing disclosure: my checkout is on macOS, so I have not run a native
USB/IP stack end to end. The output above comes from building the real
usbip_list.c, usbip_network.c, usbip_common.c and names.c against a stub
libudev -- the remote path never calls udev, and the stubs abort if
reached -- and pointing that binary at a small mock usbipd answering
OP_REQ_DEVLIST with a real OP_REP_DEVLIST payload. The -p -l side is a
second build with a fake udev backend presenting the same devices. So it
is the real listing path over a real socket, but not usbip-host or
usbip-vudc on hardware. I am happy to redo the runs on a Linux box, or
to wait for someone with a usbip setup to confirm, before this goes in.

v5: https://lore.kernel.org/r/20260816041518.48053-1-jasoncola1@gmail.com
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
@@ -158,13 +169,13 @@ static void print_device(const char *busid,
const char *vendor,
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
2.50.1
