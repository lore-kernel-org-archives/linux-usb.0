Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653014;
	b=gQqFWKGDX6uUgsVOQw04888JL2fvJImhiAFHaVDOAlRP7RSMX2G96gebLo6JeUvJasnx
	 TtURAv9CtTmsT5geQ/eLaqoYugFMMxNVuLjiCMwLwra0m2+rVR2duccOEuld/GZRSs9Fu
	 6vHaA7p/H8FOxQ96XCMf50BYNVQqGlO9EFCD39m24Ov2K844ORyVOM/xFrE5dBLGdFR8t
	 +hMVWizb7JtGK5koz/zjYP3y08RCz+4siWssbjTNXfh8YzMlrKn9oqsOfxroJq3P2d72o
	 MSDBPx9EWfLliSJQH2FRSBjl9VBpOMw3RoSJP3U50h5C8OfrWarxThgsQbgVxm50zYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nnZ0MwCj80U+rG8upbc3A6/J8KNZsuBJGtpG/de36Io=;
	b=EL/lhKVPe44uCf6FtmsX1vsoSaKZGZxJ3ASsNtdnDRrk9G3SFfr2VosKbRzylZWblQdr
	 oL+eVWFuz4Q1dPeORhQzJG/MMqdcronFN1DjrD6HQivhYUsyRVwig2Vqh2p3D5pSq5yiZ
	 dv85aU/gDe7y/1tUwwXV8nCGGFOvJsaRXFYYdWKMvHBBgabcHkPMkxfgkNj5rmYeF/LGQ
	 J5V1efBLmrz75HHvDX0/hUdifMId83t5XQFQe37hG0fqbuHf+xAXotSHLCOFe4DxfX9sb
	 WWRT6lf0/RtddU1yGp4Qs8YZ/oSuUp1QMhlaIly3YuUVVhf/ONoMiWS7k3KhEVUHReA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=elYBUVHv;
	arc=none smtp.remote-ip=74.125.228.5
Received: from mail-pz2-f5.google.com (mail-pz2-f5.google.com [74.125.228.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F65606A31E
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 07:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60F65606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=elYBUVHv
Received: by mail-pz2-f5.google.com with SMTP id 41be03b00d2f7-cc7c286026aso544816a12.0
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 00:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792653014; x=1793257814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnZ0MwCj80U+rG8upbc3A6/J8KNZsuBJGtpG/de36Io=;
        b=elYBUVHv1G/+HQcaNkxI5vFRLDZdl4qCwIUkcU/qNwNUpTSV4qXGzPUkwBnSmr4nxd
         wwVezuvR6Ife3TvQzjo+6K7A6wFvxXJCNcmsuuvTJNcBisvkxV+yDcLbpa572clLuVCI
         9fKil/njdza/R6iwWl11nH61WeT5Epgq0Zykr/jDqP5yuVO47whXgjdQwt6gp8OmSs0N
         idqR9tjE6FPUjivxfYkN5TBNgTz/JAp3q7tdvuFrtnQjJEmwxm3md7ag84qYIaP0tcvU
         NZsQ8W481LlK7Rdco81h88o/EYxdK/htfSER/FoyHgzzdJITP+DHQbednvYEQYj1EVzy
         tMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653014; x=1793257814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nnZ0MwCj80U+rG8upbc3A6/J8KNZsuBJGtpG/de36Io=;
        b=hW5CJQuGyB/KqKs7C5z1VVnQ3GaUrbiDzJmSS9xTN4qB6avSZlxtRrmy7JBpowDA4K
         g7IWqCuyYweIczVAIv4Kpln7/ICA2BgLno1diQ6nCt2TNw3Xw6lHyxuwHMvt6kkWBN1a
         fzpVhCR1QiZwgKHFaFHurOOOb69oxOa24LFtubd7PgY8bQvHI7Ulp/XGM5Y8edAC84pF
         CZ9xD9Wpz4fXZSM5hBFrFM8dIbm4YxVf7nWFpIZDDh/9KWxTzvbDcHvtBsWy/VbwPsN2
         AnufTpdefvBLDkHgxNN2/nBtuvH2BqyBsRqfE59n1ZQm2+8n52SknC4tskG+UeY3tvLc
         +jkw==
X-Forwarded-Encrypted: i=1; AKwUvBynIPbFs1I2V3gd9q+qgqfd2i55bqfaXnqZLP61x0qZFQrc68tCtL+1MswT84OHI/VdfLHlihGGYzo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUj8WefmfkABKEvzaT+3XuN5bjjGj8osSjJl9kJCa2pouGTW/l
	kEljIrQ1eDDF3T4e1qfbxGfypmP1xHn35Iye/Ed5FgSIrAslX3keaxoc
X-Gm-Gg: AYBFou3BG70oBEgAka1ylMQQw8G+nG7NkEHID1uzybY2DSH5X4GJipZz0zyoe7iom2n
	gaFH7r1LmlapX3viDRkHdEUeJvInMJ19OJq7fWQlwTBZficMprCrsYT5xbI4uxbfwsGInIIc4DX
	8/yy4Iwi/qQxzWL/GGDDtvUhOYevfQDhZwI5kgjZixo051RYzCZSZbYIAMEX83pREbgYkfz9KlL
	GeZ+trCNkTPzESufEsUF0ABZLtRxT1nWIrxd0o3osKfK4t7dl11O3x2Q2B2xN63bEIr2acLOdkp
	S8NSKAlXzol3KV+P/W3Y2Xtg9vLYqAXUKqmZvDwFHW3H1A893khPSEXvbP5SKT9fRBxcliXtpy4
	iA6dkHinxr58SNb98fqI3ImdQ1QuI4S6u61Xb31VguXHjV91/ejv9YQdDX16R0MME7deG8k9SQP
	BAhK7cPPsCvNIVQcFw6yELM1LfDqW5Nbf+RrZaCtfoUfB6janY6jcX8svZ+80Nd634WwxNqr+7d
	MK16AFfdJz6NuEVbuC06r5sXvKrLTLeU0qKBJmup3lxS7hc5uyACwLriZvR3T6wbShQSK2JhA==
X-Received: by 2002:a05:6a00:3020:b0:882:e3a6:27c9 with SMTP id d2e1a72fcca58-8a089d0f2f8mr3839994b3a.30.1792653013784;
        Thu, 22 Oct 2026 00:10:13 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b49d1sm1706039b3a.12.2026.10.22.00.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:10:11 -0700 (PDT)
From: Shihuang Liu <shlomojune6@gmail.com>
To: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Henk Vergonet <Henk.Vergonet@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Alejandro Colomar <alx+linux-hardening@kernel.org>,
	Shihuang Liu <shlomojune6@gmail.com>
Subject: [PATCH v2 RESEND 4/6] Input: mouse - use usb_make_subpath()
Date: Thu, 22 Oct 2026 15:09:27 +0800
Message-ID: <20261022070929.20820-5-shlomojune6@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022070929.20820-1-shlomojune6@gmail.com>
References: <20261021123146.17202-1-shlomojune6@gmail.com>
 <20261022070929.20820-1-shlomojune6@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The appletouch, bcm5974 and synaptics_usb drivers build their input
device physical paths by appending "/input0" with strlcat() after
usb_make_path().

In preparation for removing the deprecated strlcat() API [1],
replace each pair of calls with usb_make_subpath(). The
helper formats the USB path and the "input0" subpath in
one call, avoiding a separate buffer scan and append operation.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
---
 drivers/input/mouse/appletouch.c    | 3 +--
 drivers/input/mouse/bcm5974.c       | 3 +--
 drivers/input/mouse/synaptics_usb.c | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/input/mouse/appletouch.c b/drivers/input/mouse/appletouch.c
index eebeb57515e1c..b536dfae427de 100644
--- a/drivers/input/mouse/appletouch.c
+++ b/drivers/input/mouse/appletouch.c
@@ -874,8 +874,7 @@ static int atp_probe(struct usb_interface *iface,
 	if (error)
 		goto err_free_buffer;
 
-	usb_make_path(udev, dev->phys, sizeof(dev->phys));
-	strlcat(dev->phys, "/input0", sizeof(dev->phys));
+	usb_make_subpath(udev, dev->phys, sizeof(dev->phys), "input0");
 
 	input_dev->name = "appletouch";
 	input_dev->phys = dev->phys;
diff --git a/drivers/input/mouse/bcm5974.c b/drivers/input/mouse/bcm5974.c
index e772bac3b64c0..0732bf3a97adc 100644
--- a/drivers/input/mouse/bcm5974.c
+++ b/drivers/input/mouse/bcm5974.c
@@ -989,8 +989,7 @@ static int bcm5974_probe(struct usb_interface *iface,
 	dev->tp_urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
 
 	/* create bcm5974 device */
-	usb_make_path(udev, dev->phys, sizeof(dev->phys));
-	strlcat(dev->phys, "/input0", sizeof(dev->phys));
+	usb_make_subpath(udev, dev->phys, sizeof(dev->phys), "input0");
 
 	input_dev->name = "bcm5974";
 	input_dev->phys = dev->phys;
diff --git a/drivers/input/mouse/synaptics_usb.c b/drivers/input/mouse/synaptics_usb.c
index 880a0c79148cd..7da22118ce576 100644
--- a/drivers/input/mouse/synaptics_usb.c
+++ b/drivers/input/mouse/synaptics_usb.c
@@ -353,8 +353,7 @@ static int synusb_probe(struct usb_interface *intf,
 	if (synusb->flags & SYNUSB_STICK)
 		strlcat(synusb->name, " (Stick)", sizeof(synusb->name));
 
-	usb_make_path(udev, synusb->phys, sizeof(synusb->phys));
-	strlcat(synusb->phys, "/input0", sizeof(synusb->phys));
+	usb_make_subpath(udev, synusb->phys, sizeof(synusb->phys), "input0");
 
 	input_dev->name = synusb->name;
 	input_dev->phys = synusb->phys;
-- 
2.43.0

