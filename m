Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1969B471CE0
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 12:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314356; cv=none; b=I6IMyiDV1p9oqKA1aweM6nWpxMzxnUCUQNAnNop3iTK34ThzOSZmZvzxS7YMZKFjQRIZo26pvO/+PGqMZgtDIACNJDuYsz5SBzj+wMkvToHHvLRgs7Vgu2ceCKIWyOwmpcLQMIlao8mEY0lT5rJKg3K51SbkDySx7PQKVTVM0gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314356; c=relaxed/simple;
	bh=oLUli+P8bzYCuTlCELw1c6zJxnu/hhj7hprjoNdvKtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L7GWlL9B47VNLWzDvCPVWOWfVKyGG2+qFqkcLfTbGbQVSCvEN6NoLwOiiqC/LyWfQI+TapXXFh5o8Iw6+ZdfhkvHOKB92Ut9pKD+kme+IU8V2285KF7Dc/UykX/Pqcr2RH+ATKLWCdM6QlfDctUmF4JUjUOm7KRr2oEjjnziD0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZU4pw1R; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZU4pw1R"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceaf8a1265so10590315ad.2
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 05:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787314350; x=1787919150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VigDYn6ALPC/LWfKMn5vGX78fbZhwGngiwf3ToGZ5uQ=;
        b=dZU4pw1RQQCEZA/VIqpQWUlx4B/lFRiXY2Zw3mLr2hr9RuE6F7wL7LYrY35NxFq8Al
         LNSwNJflCc3R2lMZ0Dd4Wrmtva+DGpH8LdC95aS0gH89Jq3jeLdskjUkns/nnhgArvxm
         bcaMk51w/sspnuIyLBhtOu+T+T4q65CuYnYq5AiorXB9INPaMiO4W4dXsyoOZVkZ6TEY
         wWWhJiFJA7ZYuhh1DO7wX0bQUtlvB4hTy+x0O36l9t72+z6W3Z9wmVLqSZqCPllVnFhO
         NvKLmtCVl5c2SzKMh7oSzfRXul3MwYQbHrAkV+n/t5iHHbTbE1G9CNu8KXgofr3MAS+S
         tpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787314350; x=1787919150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VigDYn6ALPC/LWfKMn5vGX78fbZhwGngiwf3ToGZ5uQ=;
        b=aE1PJLBchl5bjFfEYcFUUeXwkM0o3wjDdFRjes8/woEsVPdebuw9/YRuXlF5jufrq8
         tG6FhRAFMCwB75jFD8tn7GDo66pzi6HQE6OR+iWFlZRqcaGDosQmZ88as4KY8+woLoaI
         R1IHEJCGmOde9imHJOSO4BTg5ocCm/8VREGdoT3Vs9Vzy0sTh/ER7VgY05TDXLta9FFB
         N7I6nDIkm5D45PNo5RHMtWZ76AItj5D+fS+rEnPH8yOamzMR12qrUTR1f0SfGBGYPEWt
         ds1VxpJOtQXEi1rYERurO39UFf0g40upifm/UTBMJiEwTLAhz3+IMlSC/BVBQmQrF+4X
         mhkA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1aDZbmteLNph4zRIk/Lwx9aI2/mJE5TXTlaPaeOYm9yntKN4yTlGdirLQX8p+Dc880GZnmxPbExo=@vger.kernel.org
X-Gm-Message-State: AFuF++m3U5inho/QZ/ZGGTXheVgg290PqP+f7n+sDrcZ4QZQT8V/JcLJ
	aMsKTUIBHpStdrDXilTbAwgS1C72WLQcynOEZ3b9Xyum+dALzZgSZcNY
X-Gm-Gg: AR+sD12nb0hMLQ4atbPKV1nS4wW6R8q1xxQDBTicUm46CjbwWOcxe8kf0xFwBpt60yn
	/SV+s0W/I2tnsZcyTZhhzuKefut4S8voloGvdm6BBnEBfm2M1+/bES6C+3fWJG0M07h8/+2gGi9
	Fcyr9aQ0jS9a6mLykrcbnk3W3seo9OH2K8liy7a4CWG/EYM/ZtCpGChgb95NDnO2p96TrcA8DXt
	ZKZotBq1eYnCwEm5tJHQTgmIkBzi33B49fZz076kIuP0MDr5LVkgM5t29o7UlLN9/WXkSB8iMch
	uFRf0GOHWReyutJ54JJo6LOH8FHpgm3gprmQESY7Ogwi7mEcrWffCTtP/iPwq8g1oxLCOIOCt3i
	Oe0zeZH8n3ZfVozbdLAnRa8TFGrlDPXe5qGa8kRWOaK+kR0ufmri52PQCUx8ZC7AMpPJtSwLO8u
	4zRJ0CFSSuhjUlnuVw/S7qe+XgEkUOYZbHHe4PpCHJRmy2OSFB8yqMQWo1MuPqUOqtgw+vyc3pg
	xuQajZaSQUQndKW2f4Sutul0mgQSb1Qhuow/59Wy0NrW7QUMmuLfBRfAJfdCspN
X-Received: by 2002:a17:903:354b:b0:2d3:2e86:647a with SMTP id d9443c01a7336-2d64af6f896mr118723395ad.5.1787314350353;
        Fri, 21 Aug 2026 05:12:30 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:569e:7ed4:3735:ea2a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e3a1031sm18300385ad.57.2026.08.21.05.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:12:29 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: kees@kernel.org,
	stern@rowland.harvard.edu,
	lgs201920130244@gmail.com,
	balbi@ti.com,
	ribalda@kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+2ec7fc1793a63864d9d6@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: net2280: fix NULL pointer deref in usb_reinit_338x()
Date: Fri, 21 Aug 2026 17:42:20 +0530
Message-ID: <20260821121220.13006-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

net2280_probe() only maps dev->llregs when the PLX_PCIE quirk bit is
set. usb_reinit() dispatches to usb_reinit_338x() for any device that
doesn't have PLX_LEGACY set, assuming such a device must have
PLX_PCIE set (and thus llregs mapped). That assumption holds for
every entry in the driver's pci_device_id table, but a forced driver
bind (e.g. via sysfs bind/driver_override) can invoke probe() with
quirks that have neither bit set, leaving llregs NULL and crashing
in usb_reinit_338x() on the first readl().

Reject probe() early when quirks has neither PLX_LEGACY nor
PLX_PCIE set, instead of proceeding into a reinit path that assumes
one of them is always present.

Fixes: adc82f77bee3 ("usb: gadget: net2280: Add support for PLX USB338X")
Reported-by: syzbot+2ec7fc1793a63864d9d6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2ec7fc1793a63864d9d6
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/usb/gadget/udc/net2280.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
index 7c5f30cfd24d..02d12c2ad58b 100644
--- a/drivers/usb/gadget/udc/net2280.c
+++ b/drivers/usb/gadget/udc/net2280.c
@@ -3708,6 +3708,17 @@ static int net2280_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		writel(0, &dev->usb->usbctl);
 	}
 
+	/* usb_reinit() dispatches on PLX_LEGACY vs PLX_PCIE and assumes
+	 * every non-legacy chip has llregs mapped (PLX_PCIE branch above).
+	 * A forced/mismatched driver bind can hand us quirks that satisfy
+	 * neither, so refuse to proceed rather than dereference NULL.
+	 */
+	if (!(dev->quirks & (PLX_LEGACY | PLX_PCIE))) {
+		ep_err(dev, "unsupported device (quirks=%#lx)\n", dev->quirks);
+		retval = -ENODEV;
+		goto done;
+	}
+
 	usb_reset(dev);
 	usb_reinit(dev);
 
-- 
2.43.0

