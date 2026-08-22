Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE48493627
	for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 20:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787431112; cv=none; b=QE81jYfwrvURMTtTdjKqgeJya5ddT5uB9Wzl+nTQ+0yYeXOkjIpZqviysAUe0hbd+VCE259IWfTEoPPT6/Q48/gsxOWNrIc0NJKSylflCKu2aKukXI6oeWOpbBAeHe+evKR9tm+lOFRJ8pshDKQGrtCLqCr9yH14VtPAOYKmbvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787431112; c=relaxed/simple;
	bh=xasbg8xg0V6mGthcRH9BjgxbF+lt+jr2vn8oSbt+EtE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GQ6C/DtkhonqSUufkvrZrl5omSVoRKjueDoAkReqTFki44023+2sH20XP73Rn0BOwpx5uhfD+DRjDa9Ujq8hgcV5vi0O/1ggebZ7fsZHC6abmYOJn9vor07t8DqvgkKuY9j/XqhUuX4zH5zilS9ic7eeFrYa/3xgiFBbeZbSqkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4SorSJy; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4SorSJy"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-836ccf53ef9so17680897b3.1
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 13:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787431110; x=1788035910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c/0oonYeNYdcmlvpj9HRZq3vqMjbDlIOZXAp4v7qnLg=;
        b=R4SorSJyx8vdsG2w2+waSm0h/E97IV8//WY7meWyWFfc3jvEZ/VZ8xW/b/zmGpoM/n
         M/mSEyPxIfC4sfS9KgGfDAJ1YbUWbAb5LSdQV+XJDZDoDRdubDC4+FZ4pPk/nR7M65mW
         /bkGR8RUEg5QkU0ZzzUfq9uXc8HjixD/9pLq8GBhcQFBrus6zm/J2R5H0cRun7dn3HD4
         kUil0FMIOlI/a2/QbDjbkrjl1m+LLfWL5EHsImLtVHTu4gkLgzYDwYMgcVNHvAAxjDLF
         /NuOwyhwoUmi3yWZiHa8eQuNc5FRWITtNcWznPd0Xwgo4TmhgxRwyiCfQM7puXB9u1vM
         rJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787431110; x=1788035910;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c/0oonYeNYdcmlvpj9HRZq3vqMjbDlIOZXAp4v7qnLg=;
        b=Xck9qIRzd84HJMBKGvSkDrW8B9dSA4wjV0aQ4fMuK0gTlrzS0WgXggvIZVYAjn9tKx
         ZMx9PVaG4ZpLtV47QyjSU02yKvCCo6p2+GhPOCkMom9N6Tbys08f/pNO3WCBF51elBNb
         mEaSIsuKNxSrJAIMFV+No5gagdS6PCHps2mluKXlwNczTmM4Y5OaeJ8BATjRe076PWr3
         aSy6DKqRDRGxV1lYXiO0aSg6i6+RGpSPB8wAMnCMUDda24AC9VIdRGxykFj1aj2sLu5u
         nlbfhuW5H9nPb9cE/ZBW2hlD/m1cEZnILexOQiHAm/E2iivjp1faV8lxWJ0lY+9pErq1
         o15A==
X-Forwarded-Encrypted: i=1; AHgh+Rpwjhw4dkbAbIds7tzYpEFYcMyKSAoXar+B8vbc/ebI7Vo6EsWKDoJ5NnkRbL0JXQV4U10pVyXLV7o=@vger.kernel.org
X-Gm-Message-State: AFuF++m/kVUiQ1o0Afm8zsv3714LcK5evbsElEjBCInoOSooQ9w3lw1r
	HrSqobzCt0/dEVpTfjylnYjeGVqdOF14awbOtkWlMQDacZQbDloMVN9F
X-Gm-Gg: AR+sD10WPXLOJZO/rnDgqiti4Zb+mMVdSanJlbF/ANrfSR6j3+mU8qnq567QG4gKVga
	XGXsOkOxQEnkXenLWdyfFBYJajlh0nIaRUWtTbtcUIvfUf5EA763JTwOj1/m9ss7b2T0LNDcKR2
	yOAP/Gs8g3i9tqJnRlGcZaiRmO0NiaAZxmXEIK2/3jmINGYzjwGyagg2uW4GnG7lWAvaBhWdYYB
	+CrL71h+wiYRw0pLwC/5Gh1D58hsdP1OjdHZykwaank7+lB0vBOuhN/WNDE4q5DRIKUWjLIY1Vi
	QfgT0s847ZORy1VG12mvr02P8t8I9yJT4fvE+yE61rs+T2ODWIHXnVhKOFY5uXDqqdpW3m10WQx
	sOdf7DZkS1+50mlKKL+o1stS+lpx0lpPOCSBzjGuFXopjXnte5hZrwvBJ+QPTm4iIDw32xPBPsV
	VJcxAvLcVvGTZCHdNSewsS7Hamr5OCZcZmYQ/7ZJ9Pv36qzuqtd/UcQt/I4VQrCM6DP+vddmUxw
	KmrGoadMZx8gBpGegJsjUsmSQnPusxx+MY/l5w3PgkIBBXOvnmO5UyYeSItRgku5pCKmFqatqe5
	3aIpG8IllSZR4Z+Wmd5yAQs6rEtKpR/K4+vVxLCOGdZ3luN8M9KsMyP+BAdVUbGZfm0jzd69SYB
	w+yJOJlAmG/3uZPVGXHdWDtJZn79D48Cv9eD39kxK1EFcgLo0ofNCE323hXYjENJNvgzi2dhcUf
	KMIJBXC8OcswfR4dua
X-Received: by 2002:a05:690c:580d:b0:845:d58c:cc8 with SMTP id 00721157ae682-849f4a7ae61mr44731597b3.20.1787431109746;
        Sat, 22 Aug 2026 13:38:29 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (c-76-108-143-213.hsd1.fl.comcast.net. [76.108.143.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84cac4ef4edsm14125047b3.45.2026.08.22.13.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 13:38:29 -0700 (PDT)
From: Jason Colapietro <jasoncola1@gmail.com>
To: shuah@kernel.org, skhan@linuxfoundation.org, valentina.manea.m@gmail.com
Cc: greg@kroah.com, i@zenithal.me, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6] usbip: make remote list honor parsable output
Date: Sat, 22 Aug 2026 16:38:28 -0400
Message-ID: <178743110815.11397.14988078342421111980@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

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
Assisted-by: LLM
Signed-off-by: Jason Colapietro <jasoncola1@gmail.com>
---
v5 -> v6:
- Fold a condensed before/after into the commit message, as Shuah asked
  for on v2. No code changes; the diff is identical to v5.
- Restore the Assisted-by tag, in the format required by
  Documentation/process/coding-assistants.rst. v2 carried it as
  "Assisted-by: Codex:gpt-5", which predates that document.

Tooling disclosure, per Documentation/process/generated-content.rst: an
AI coding assistant was used for the original code change, and in this
revision to rewrite the commit message so it carries the before/after
requested on v2. The code is byte-identical to v5. checkpatch.pl
--strict reports no errors, and the patch applies cleanly with git am
onto mainline.

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


