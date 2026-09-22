Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9223BC69C
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 08:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064360; cv=none; b=gpOEc9j0KEFoitAahqEmsqCDoqdr7y28z8AID64MVNYlwqV3J3SkA2PBOFb2luZ6if0igyzUkWQWd8hFDZ4sRqeLHThuPTg9uZjMAfDBZlf6Z+Q+GIfsHWA41Uxy+/dZvT58/au6EG005ohOJoa39WQ7JAKFJ2QtM7Z7rezvqTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064360; c=relaxed/simple;
	bh=mAzOYQqUt4F72g1YLtR8zyHxUm6A24el4YGVu4iM8tg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hkkVGWxUXz57B3e8Xb38mi6+KIQYrMMp8exGAm8PEEuG/tQenQH1SL04Sv6+H+PNIY2KaB25NMV0dD0WYwZtcxoKrqNtoQbiL3klt1JjhOCxkFMwtgdlOZJRgcKXDay50B3ZQczEjdLinLujXvsyqfvPY7Wt3hEL0qTp5zOrMB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aIYPhoC9; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aIYPhoC9"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so3253338a91.2
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 01:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790064349; x=1790669149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GpOZWpxjdXQXhMPgIqRaZuniCjJ67+oosNX04DosQoc=;
        b=aIYPhoC9ZGSM4JtP5va72Hal9eyr5Xz4XLs2xyYBrtSxL4Z72Ae1WcE2QOhyr5TA+x
         357Dgf6GSbGsoRNakGGD/tZBVQkPfuvGsceMoYV6OOP/o3B7ip+VUvEqCjbp7g9Z/VYw
         eFjglOYXKvVaqP+7me0yjCQjYzuGisIPMTYVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064349; x=1790669149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GpOZWpxjdXQXhMPgIqRaZuniCjJ67+oosNX04DosQoc=;
        b=UU9eQq+adhTYb5e2GZgOZCw+piwcxTNZYpl1Y2uS8w8dJpkT22seYWBCfbdWrPvODY
         8GP4rQHdBwV4O6C7t5ojT80OV7x7ha1sWbuYi3AKTvhcXdawOgzntaTILZEV81dAavLo
         wyZAVlzATJtaephnNLYPNRgVq9ULwznDqCKmNB5Qhj0QHCPyQ8nvta2C55A+lXnW/USV
         az2UPy83qEomTNdoSEws/hi8cD+gCMy36jEJ76YgeD0hWRmkA5zATtaYqCXmkseDs7sO
         bgF+/mKOBzTe1Ae6zP6xeWVf/nedPMVtMgHTCr4/Z47G4LrB25PXJSqchHQp1hEwjT/7
         429A==
X-Forwarded-Encrypted: i=1; AKwUvBydDmtoTWGb/to3DiAKl2lx7Ut4U1fcg4dJq5jq3tVNRJr08RuZ14EpQCmadHeoWG/63p5FmqJipqE=@vger.kernel.org
X-Gm-Message-State: AFuF++kY9GQaaXLOsO/QBu1dYRK90/3VufHHhc38Iz2THD9+4kDe4Pxv
	HGzBuEXVf3AZVrzTIkILV55DaW4PFJS74JV0yx9UVgtTCUE7h5cDbw1nEBfPlwlY8w==
X-Gm-Gg: AYBFou2LIq4K4fKFh4dPzg8P05JbEvRb2cZp9hfsPA0GFH7sep/eWluLPfS6V68jefu
	O0AY/TPc9Wy9e8RGvT28F93KTFYxvQrMKDXRSnnoT4dNfgXP8NfhOq/JTPZw644KoRrJw4QoOgC
	AAcTuwvsc1uDFNdeJIYnDHXQ+4kWxb/d1djKHoCULK47qA9Av2kaPs2MoCsdQhomAlh6J014N1m
	vJruio4quJGTKJo0WdjbIc9Im4bn+8kyJssB+CHslg80dDbvlv4VNfYp3YxxkXQWzzwWwtmC9ey
	xBAFf8LMOydQc9+XZd5XDuL5QoJjC9NbL17J/F/unGu+0JkzC9J6OIHY5Kc/skIBkgsmHJRSHnj
	SWDKY6DNy7KJgHSp9mMpTEYHbx4Z3lG/Pcaw7Qs2U6HDGVKSKNXLldpMDAzj8wJlT18RP/1rwy/
	J4jN3pmtL+nBA661LcjZ3gYNOnI7MLkV7FM+uKTpljUJXGd/COVq9I2gjaKe+AGFfjpOpdjYz/P
	3yarnrDkUbbJsexoY/VSd2vHf+euV/58zNXcxDyoCHQqqg8z4ZAuqWECA==
X-Received: by 2002:a17:90b:35d1:b0:39d:f95d:bd08 with SMTP id 98e67ed59e1d1-3a073112cc5mr356439a91.14.1790064348807;
        Tue, 22 Sep 2026 01:05:48 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:387c:500a:8415:7dd1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674df8bdsm3334602a91.16.2026.09.22.01.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:05:48 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: hub: Set proper message when usb_hub_create_port_device() fails
Date: Tue, 22 Sep 2026 16:05:41 +0800
Message-ID: <20260922080541.1986179-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Right now when usb_hub_create_port_device() fails, it prints a separate
error message to say which port failed, but otherwise leaves 'message'
set to the default "out of memory", which is somewhat misleading.

Allocate some memory to put the custom formatted error message in and
use it as the error message. If the allocation fails, use a generic
version of the error message. The allocation is explicitly freed after
the error message is printed.

Variants of __free() were not used as it ends up mixing usage of __free()
and goto. Also, kfree_const() won't work as it uses is_kernel_rodata(),
which only returns true if the symbol or address is in the kernel image's
.rodata section; it doesn't work for module .rodata. And the USB
subsystem can be built as a module.

Assisted-by: LLM # local reviews
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Explicitly track and free the allocated custom error message instead
  of using devm_kasprintf()
- Link to v1:
  https://lore.kernel.org/all/20260728100005.413868-1-wenst@chromium.org/

Sorry Andy, I ended up not using your __free(kfree_const) patch. My LLM
was telling me that it won't work correctly if CONFIG_USB=m.
---
 drivers/usb/core/hub.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 0e929a4c9fa1..398ae53cd8d7 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1480,6 +1480,8 @@ static int hub_configure(struct usb_hub *hub,
 	unsigned int pipe;
 	int maxp, ret, i;
 	char *message = "out of memory";
+	/* Used to hold and clean up kasprintf()-ed failure message */
+	char *msg_alloc = NULL;
 	unsigned unit_load;
 	unsigned full_load;
 	unsigned maxchild;
@@ -1756,8 +1758,11 @@ static int hub_configure(struct usb_hub *hub,
 	for (i = 0; i < maxchild; i++) {
 		ret = usb_hub_create_port_device(hub, i + 1);
 		if (ret < 0) {
-			dev_err(hub->intfdev,
-				"couldn't create port%d device.\n", i + 1);
+			msg_alloc = kasprintf(GFP_KERNEL, "couldn't create port%d device", i + 1);
+			if (msg_alloc)
+				message = msg_alloc;
+			else
+				message = "couldn't create port device";
 			break;
 		}
 	}
@@ -1792,6 +1797,7 @@ static int hub_configure(struct usb_hub *hub,
 fail:
 	dev_err(hub_dev, "config failed, %s (err %d)\n",
 			message, ret);
+	kfree(msg_alloc);
 	/* hub_disconnect() frees urb and descriptor */
 	return ret;
 }
-- 
2.55.0.1082.g2b9226bbc0-goog

