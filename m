Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213F13B9DB3
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 23:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786403637; cv=pass; b=PONIrBpM7Jk9MPVfhQd/ihwC8P7aM63KN85H+yQ9VQE6IIr1osfpqvfoH94tP1xNdHCqfl0ZhN7CjeTzNDSkWU46gGG68HUl7K3F8eSbwL3saQWGbE+pqYzpWbmt3OrtGU/osX7XV8147/94HvupLp0SBUJhoSyWHtgdurOXbyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786403637; c=relaxed/simple;
	bh=s3AmpGmK1zhxWdtx4TDtq14i50GnbDCggwxCVhys9nY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=SJCdVm47axXAB3tPadXBWaY+wTUsQ+hxeVGuepSOvO1ighyUi2wP9MKySDgXqKZUvK8+rlrCvU18GyjBX+lqbk+jroXUF/ORYx1fIWQ/8J8v0xjjsnu0UbBOntsMUc+xfWPSsCE+lveYiZy+WeVQqZ0yqBWVCw+zq7PELAQFyhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYweyj9K; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYweyj9K"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6685483aad2so3572777d50.0
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 16:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786403635; cv=none;
        d=google.com; s=arc-20260327;
        b=TsVO57kzpQeH910au2veQKROptktERnWcG90aIoDdNV1b6XyFMUm3KRAiwLKUc1tWg
         +J5HPQa2rSDJX5SluIyacF6r4tnnzxs1iAiCyaWg5XslPjGMOhzsTJLyJclPggNJd5fH
         gwGAwNQUP/TEbENTX85O/0ATkkudn56I2PLiflrFYDxQv4iupLk9jLiKqWg3TH2wEPCm
         8NFRPX/KWfEWw2wGWq8Sv1egmNFjvYV8isquSKI9P7uLU0a3KaO8w9JnihQvulV6zrwq
         P5fSKWnT/j56HdorUYy1dM6D8slnCJ0SBKcRf6JGgeNPGMY6IwMhzPUHkunPqegRG8Kb
         3zQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=a5zzbX5UUKb28qJzV8Jk8ol6WUaHCfavAB9FhEI6Yr8=;
        fh=sK9WvwBH0QJHkbtmcjdY2DXXlj85wWpeNBguaXYNtKo=;
        b=TqwCnp856MT9n9Y6lyoXitwXnI8waKzo8gzxrVx10hUEgvyHxAG1LYFWx5sh4qJFKb
         lHzWstVLRURmW89YzQdooBTGg29eHcLPkdLmjmDQqUUV/F6NY2jdJ4wTySePfuFL3QZ3
         iTdewf2/OdaK08J721g3uNIHkFKhnDkeadlfhh9VzeYCiwRwUjqqoQf4Ztx9a3MEIr9c
         pyI+YrlSVX2Te+LEIYfi2ylN/nxbuUBM0spflN/PXVdXgUcW/I7nIU/H8lr1ntTe0No9
         DxAWwUI8RQfDFoMmuCHVR0fIUiYMGpLDvE/Gq9fAF7dZN4D4fFQFZqXKWdbOS23AIagK
         NgAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786403635; x=1787008435; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5zzbX5UUKb28qJzV8Jk8ol6WUaHCfavAB9FhEI6Yr8=;
        b=XYweyj9KgvoPT7d2L3vdBkklPX/e3Yo/tQWQpJb0rlN//p/xzCi7Ui/wSpy0AdLvre
         SYesmlMTGW9XuWn9Ksvk56gncuBrfuaDmcIIsyoZrdUNaENHBUjUq6AgAwXDYcKDdqzz
         4nPCE1opLMcuYQasDYAJUIeXYfI2f7T8U7beTt7TAAnBcu9cBmfmLgWSJRmKZsAEO56y
         bNTyjZ4qDVkcAo8bJNe2DWyZdDaC5Nvxv1fLtxU5tgcqP99Vbj8aMu7hdNZESgXSxZLF
         BbgeiLQJp+lFGtqda6LeY1+XpuxGfQnkWzfw1vK+qSABM2FYHFh4baAbXeglxX8yDink
         DFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786403635; x=1787008435;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a5zzbX5UUKb28qJzV8Jk8ol6WUaHCfavAB9FhEI6Yr8=;
        b=OHN4EVAzmxfSUMQ6coeJekS6Vc6B3HT6LhUifTeC7Hu46bBQUMe9vm9IXL3J6DEUUZ
         3Y425HTIv+M4GuYMIn6ER8xwngUYG+NdrpzF7T1lAZ0m1/fLYSWmR2+GPf10uRG8/Kgw
         NukYP3K2p747GpTnBbf+AeW+FAXpymTzSfY5dPo25JKJBgIeWtohQ3qBVKPW0KolDcoa
         5oYe/IdYiDaL65VotILvluyqrkJ5u1MqzExGd+ZrxHxEVwtSn0ZPf8tPN2njpU8DZAKM
         InTzZSih6PTnHsGNKCiTnXR+78v9nGvoHWF/n3BU8IHXONrtlabp1BJ+176oDdO6TOXq
         Ir6A==
X-Forwarded-Encrypted: i=1; AHgh+RpF5jeURa8+ocViy8Sdq6gsf4sIeCMYVeE9Iw7IIHi0DzIDiru6GVOsFnjzO3a6qKnP7ejIdZyv7sM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ucJytRQkmkWUuHNql/BgttLtJDs2aV2Oo44b6KBzEcj6j7WU
	Wvmlz4sVNWt0RK0exSAlqCQbCpApTJcpwNBt9PVmfWSHa4FRkK7/hfQaREqYbnxaOt17b5XOqTX
	c7I0DucLrPfSU8wEVHaABRl7qX01SRBY=
X-Gm-Gg: AR+sD128l/Y+QnuSf2+H7+DjYaPHeVM0GALjXofrZctA8Ofc6jLFg99AOlQYgZp3S0E
	jC66m6hyN8YY75RXU0r5szvdpkuhpeBU9iiWMVi7cWL753+kTBfyfmVbhYn1DzLqEo8mS8NJlqB
	i1sh9Ia7R8Vv8jOHHhbQMikahQSz0ooC3O1csyPB4UecEIMvLoInbvORWf931ERKtFUGC883aF7
	CqGuaxa+9TZnx/WVTlG8NH8ABXYZLLyL331iV24M4/OZaPmv7Ek8xEYRBDI+vzHNZW+SMuatD2G
	/G3p1Wo27QW6Ogq6DHVXtp/YM3Qhkzen0fp2VvJSnowt/r7tK+jpkh4oEXg4t6ylaqC4BM2KCfm
	EW5l5ttng/X16eDJheKidel2ftrRHj5J8NER0j9GrMjPyfJPfl7uXUngkGYPRJtnwHbKwJB3kiw
	tvzTgBTiZR1g==
X-Received: by 2002:a05:690e:120e:b0:667:bb60:78a5 with SMTP id
 956f58d0204a3-66ad72af455mr13186309d50.52.1786403634990; Mon, 10 Aug 2026
 16:13:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jason <jasoncola1@gmail.com>
Date: Mon, 10 Aug 2026 19:13:44 -0400
X-Gm-Features: AUfX_myBSolHw0-70-Ggzdm4y00Phsn7b_-SOxtr_Q-m3xkp7IFPYg42q6z4CGI
Message-ID: <CA+Z0x2KjiCjzTzNQVYRk3Zs6YoNsZLs_t+5YNj84AvDqqDjr+Q@mail.gmail.com>
Subject: [PATCH] usbip: make remote list honor parsable output
To: Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The -p option only affects local devices and gadgets. Remote lists still
print their human-readable headings and details, so scripts cannot parse
them using the documented option.

Pass the parsable flag through the remote listing path. Emit the same busid
and usbid record used for local devices while continuing to consume every
interface record from the server.

Fixes: e9837bbb3e69 ("staging: usbip: userspace tools v1.0.0")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219502
Assisted-by: Codex:gpt-5
Signed-off-by: Jason Colapietro <jasoncola1@gmail.com>
---
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
