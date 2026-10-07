Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0260D3B47F5
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 16:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791389859; cv=none; b=o6kHMqlqwba86ojmieW1GNkiYRGVeStI4Gck9JhsxL1KGSl+tXLwcy3YMnqIXXEbwc03yiNXQ9A5+Ac15ZYx+EQkm+xQ0izbVQDKLNwKGtrr8Vh15u/franmGYM0UlJaTDCqd46EFnBzgSO2et8LU5asW7W+Xhatx3Jcd2GYdhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791389859; c=relaxed/simple;
	bh=bKyKGJUGrCb3W9qMGUk7P5fCi8mjHN6oQhIRrQh+ANc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kJ83MZ/i+QdocGwoPOWLGAL7X3maclwiu1F8K9yomgZREYCeasD2sc3+iCSWLVrqZAFA4jx7jnGmk1aoGUMOZfkPedlpcJnsUWQstiicx+HgFWNMVHyjUhr2xw6BNM4h1avvfbAI++axkT4yXfTKC2WGGaRKrgWRUzNknPjT5iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXSFyDk+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXSFyDk+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a168355946so18949145e9.0
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2026 09:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791389856; x=1791994656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6tB2XUCRIczkPoeyE81Ks5+Tx4mLH37sTqp2RF+26pI=;
        b=aXSFyDk+xIHJXei8FJ3g3XQX1C9dcvGU26GzvJYrmcpKE9ARu1+fZuHrEB0DerR4xR
         WUXmjrywjldcX7qMRhDJPz/1z8b6n1bCSVqf2ZCGo0jhORqQsU4y9bvddMl0ogq/6ZAy
         9/Dls7TRFCudt3MMWKFsV9Gy4/Cb7tsdKl7TcC6ukAuURihNwlqydkY1pXv3L3dNOw6b
         y7nh8cmA2n6kql+m5Iimvd7ukFOMwe2c6THtf1yKMjfY7bn8+94KhssJDwDZU6clSms5
         Ypbk2iIrcDsyh7LkpsDFfcHDAJ8iXo9n6uPRazpFeGjvMa730TLN8boHvTSm9gZoX02L
         fOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791389856; x=1791994656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6tB2XUCRIczkPoeyE81Ks5+Tx4mLH37sTqp2RF+26pI=;
        b=FLpY0KdXh+ofVAvHpnChiH6vkq5pzKWR3+fgMJAgDG8AR8OnXbLJhJ4umMjtR4qS1/
         uYBehvyy/f+oNbCT34EXim/3/pcN5REk8y6PJBB5xYfVlK04LpINK4T/u4Fyazui30ZY
         sK57+YnPXl/qTabQ4HjJoVPC8M1fLaGJyXAGs+XaBmplrxBxG84rq6wiD3qUjSkgej2p
         Py5uepTfv1yMxv2kfmt+ahFoc1qoqvKPXLbMLaVA4Q27U/rO5ou/K033kbB7wERcnLL4
         +4Ur8mp235kBSFSV0tUm46UycBkKed+JDKbK6GNuL+VYNj1VT678QVLxTqxZRMMeUkia
         PjmQ==
X-Gm-Message-State: AFuF++mX7zTyom36Nr53vKCfLyOxoq3MGB4obRnxWmdo+ppu7zoM3OeJ
	8EeJC4xCVe5qoogCIyq4ROsF4/VV3sdVymd4Eamh0tLPqJXXIKNAA8YF8DrkNOEiVpI=
X-Gm-Gg: AYBFou1mffnsfFGrHNBgzLWcJw8+TrcNDREeZJl7v4gL5wooim0/FJ7Q1gJy80ZCzyJ
	P2SIm7l8VAD5OH8U2teToPcu1lLL/pNOKcVAZFAeTQnCnqk7Y+tclzle+DGsi6t3kBOQIIJQyz/
	ZFMexLGYoeaYwDcl0jW6Xp5trld5Jy8caYrc9SGkQEPI72gdBooeQIbSJk9cWbh77MnN6bdS2aJ
	Awpvgyh5d+qnDUUEGGkjIws81TnAbyPVdcuGAEmzLVUbyWN/82n9d0w0u3EyEglhpW3dGVYdRMe
	gsbWepJqe1lZcqdkEQjuLcxyz2ymNVu1at+mzeslylTDvaX95E0m9BlgLhW50786/606HiQt9ht
	A98TQI3M+nogkUzAU7neFXAlfPQpjA89z1Fvoo2OTGmNGCK48iAwfC7s/BWs/kTdsQzcHenPDhn
	JHTqzsoBzuViyEn013ku2mfhgogF1ly9b7hyjpz7eTP/1eoEErYOATEkxGKSQK68IIG1iMaH1Xg
	SSbNeIKXA==
X-Received: by 2002:a05:600c:19d0:b0:4a0:1e37:ae41 with SMTP id 5b1f17b1804b1-4a18044ba0dmr42978835e9.24.1791389856079;
        Wed, 07 Oct 2026 09:17:36 -0700 (PDT)
Received: from unicorn.lan.internal ([2a0d:3341:b894:4600:1396:12e1:c92f:1932])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm118989995e9.2.2026.10.07.09.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 09:17:35 -0700 (PDT)
From: Giuseppe Piscitelli <ooonea@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [RFC PATCH] USB: core: emit a device-level modalias
Date: Wed,  7 Oct 2026 18:17:21 +0200
Message-ID: <20261007161721.60593-1-ooonea@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USB device drivers can load from interface modaliases after a userspace
client has already configured the device. Loading apple-mfi-fastcharge
then reprobes the generic binding and interrupts usbmuxd transfers.

Emit a modalias on the device event, with unknown interface fields left
as wildcards. The existing udev module loader can load matching modules
before consumers receive the processed device event. Keep interface
modaliases and the driver teardown paths unchanged.

Signed-off-by: Giuseppe Piscitelli <ooonea@gmail.com>
Assisted-by: OpenAI Codex
---
Tested on x86_64 with Linux 7.2.9 and an iPhone (05ac:12a8). With no
Apple module preload, the first insertion after boot loads the module,
keeps configuration 4 and works with iLoader without restarting usbmuxd.
The current usb_uevent function also passes 18 source-extracted cases.

 drivers/usb/core/driver.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 3c3bbaf89..29d1acba9 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -954,6 +954,17 @@ static int usb_uevent(const struct device *dev, struct kobj_uevent_env *env)
 			   usb_dev->descriptor.bDeviceProtocol))
 		return -ENOMEM;
 
+	if (is_usb_device(dev) &&
+	    add_uevent_var(env,
+			   "MODALIAS=usb:v%04Xp%04Xd%04Xdc%02Xdsc%02Xdp%02Xic*isc*ip*in*",
+			   le16_to_cpu(usb_dev->descriptor.idVendor),
+			   le16_to_cpu(usb_dev->descriptor.idProduct),
+			   le16_to_cpu(usb_dev->descriptor.bcdDevice),
+			   usb_dev->descriptor.bDeviceClass,
+			   usb_dev->descriptor.bDeviceSubClass,
+			   usb_dev->descriptor.bDeviceProtocol))
+		return -ENOMEM;
+
 	return 0;
 }
 

base-commit: 42bcac323cc3b16566fed8c5b250318ad02a0de0
