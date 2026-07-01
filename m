Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C0B480DFD
	for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2026 12:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908595; cv=none; b=gLgLuV1H3Xn+WazQJMuI7yhdU7TM6USND0tTvVUJqTMmApd71KsOGew1aQzptXpM8o24dLptNbkLxlPIjbBaO8pwV4W65CRACji7Z9zVQjS1yguG5+yNrRI6PBBL2cFCKjIe+sHrfHSHEpvybvGHy0QVZfu9qEByfmKYaMXQl58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908595; c=relaxed/simple;
	bh=yhC1e0ZzliyRdtlVUueoO1bJdMQisEQkE6746sabsHw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pSyBBIych8zSpAIrBM7VMMB5of59FA0gbp7wmfDkHudANvGYcPylonuL0LESNwPDv4bedDSVmqnrNHyof3o9XpDtWHODQOUUIO62xz//u8nU736g2YCuKyASRKaa6xfr8ho5PwyiSeVLEs4gZfGcS0PCF4lDM/pfHBC6kenhXzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaB84vdI; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaB84vdI"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c9c1779fc8so2438015ad.3
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2026 05:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782908594; x=1783513394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7kp62ieRMyjOkk6mXBcyHmXcTSjtToMp+qoAu3klnJQ=;
        b=eaB84vdIsGgOO3pXysISsZd0EtpY/EOtRg35/iG0grwgplPwSBAkB38H/m7fqHmgXN
         8fcOPB4Q65PWnL+9X3ekoxNF0HfFXMoEktVAbRdkSz0LE0bkZWhb16MBjYKIz0S7g+y7
         5/w1F/6l5aTYz95c8u545ufpjcPrpIGYgGou9/2lRqSZ/FjitktrU5RMO+cedpslX44f
         hCq7gJO7uw7ZdpzKu6inUrFXTDzM8jmstZh99PaLbnhU7w81BjGn7kN5VHf67cf47DRG
         e4ufYglWN9BE7ejfG23v6J6oRiotLJQxl0E2cXHFv7BFw3yaSuWK9kHexMvPj7sd2PDn
         /vdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782908594; x=1783513394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kp62ieRMyjOkk6mXBcyHmXcTSjtToMp+qoAu3klnJQ=;
        b=BDpr+QGlPu4ra5/i+kKmbDRKFnvr8xeRyf7FfVEF0ysYa8Cb3XPFwodvT/iPRpmuzz
         9Mg8faPepmfwUYHk+R+S7OKWmcHmeTn7Cow5GbvI0F0xQV2ZxKY0F/dooybH0NFOSEFU
         gMKj7e5xxn619ObaKh3NElzWfUjEkDq9hElWxEnPPH+zcewDAywY1z3wWIY4oTc3Lrjw
         Cp4Nzu6WlYw8LGVJhPhRsnpeY2He4ztDbmZviUD48iCNfB/rIKd2FDtlGNW9dJH/oU4N
         YM4UF8KErJ6v3ev/cB7QUD1VMh62zTpXthX9t4cDhvAd2gRJEdcm2JBipUdbEK4/+eXa
         L+7g==
X-Forwarded-Encrypted: i=1; AHgh+Rp8PEh0XlHWi8VEcanM7wC8kZabY0kwuAz3PM7K9VvLKwU0DFUnPApd4GF3JsWlyWJIBcKavGi/sV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIsyplBVfPhF/svFGX+cv5mhIRJtJQbSNFjYqrhLNV3zfnnWjl
	tOBYCisD9nZ44z1yeEFZOFfa0dDhV+WwQ5zxiSwcK1LG1FP8KY8PWYs=
X-Gm-Gg: AfdE7cmdiKYEAdY7IQsOhawooPUhGxNeki0QOf1Ug1OsOl9rz/Ajvytvq2za7pAd/+T
	9iBAwpSYwZQIF5EDk85IodV5hP2RDDYa69u+rpef0RYDcOiUsCjinz9+iviiUJRZbBUg8hsBNN0
	fvXB2iNHinaf02s/7m1D8QxDx0ssCz9wesHL0wko4kn2p9/Y0Of8NB0BPacwfXub7dthOR27O41
	ku8TYpye1DcLRcLUekGEufSURpvnAX5zV2D4CgSlHalLPcn9amGsPAaKPzAB/PMNCY1URL01Gea
	gXH3JqVw1AGtGUfsEnfBZFpJhkCCPivTPQ4qxNqrJrIN191p78NYQ4vUwbdmCmUfRXdnIKRsXhK
	sGiCQjDwmbYk9Kth9J1yKMJDY8aYWCVbukYEoen9UPfvFi2RiQv5p99TQ3EgMxA/gZ7bkhP95AK
	WOlVP7l7zOxon45dcU9tvFPLYdvXnZcuZnfpsQAgX+IPwrhRdjifrBIYl9fxF82gGQP59RLAFSF
	Q3gqik5fgaiFZTHm4O0OrJfxxtP1/Vp2MprZLxEcKChDuOsVA==
X-Received: by 2002:a17:902:ebc4:b0:2ca:35d:1148 with SMTP id d9443c01a7336-2ca7e8dbff8mr15486835ad.29.1782908593440;
        Wed, 01 Jul 2026 05:23:13 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca3828c8e8sm31219095ad.42.2026.07.01.05.23.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 01 Jul 2026 05:23:12 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Oliver Neukum <oneukum@suse.com>,
	Alex Henrie <alexhenrie24@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] USB: misc: uss720: unregister parport on probe failure
Date: Wed,  1 Jul 2026 21:22:46 +0900
Message-Id: <20260701122246.2451-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uss720_probe() registers a parport before reading the 1284 register used
to detect unsupported Belkin F5U002 adapters. If get_1284_register()
fails, the error path drops the driver private data and the USB device
reference, but leaves the parport device registered.

Undo the pre-announce registration with parport_del_port(). Clear
priv->pp before unregistering the port, matching the disconnect path and
avoiding leaving a stale pointer in the private data.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 3295f1b866bf ("usb: misc: uss720: check for incompatible versions of the Belkin F5U002")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/misc/uss720.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/misc/uss720.c b/drivers/usb/misc/uss720.c
index a8af7615b1..8a5ffb19a5 100644
--- a/drivers/usb/misc/uss720.c
+++ b/drivers/usb/misc/uss720.c
@@ -749,6 +749,10 @@ static int uss720_probe(struct usb_interface *intf,
 	return 0;
 
 probe_abort:
+	if (pp) {
+		priv->pp = NULL;
+		parport_del_port(pp);
+	}
 	kill_all_async_requests_priv(priv);
 	kref_put(&priv->ref_count, destroy_priv);
 	return -ENODEV;
-- 
2.47.1
