Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ADB3E63A8
	for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 16:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790527314; cv=none; b=hIE4pqZ1SDVUHRwPOJYTc3pTA427MpKCRjvmSzHS3zPumiR4MFkJUpSvXGDvtR95CPg4pHV7IlwdchOTuITuHOxIv0NW9B24f4jXlzK0sR6+97g1CPKG/3zP1pTgInywUMEkhtYlH9qNn8cFVogHur61FE4+45e9nz0Igcr021c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790527314; c=relaxed/simple;
	bh=oJQ7TehGKQULHuSnn7wX7YQAUj1aG3Y9J5CmP9kRzyk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qQTodXKZdM//9WHL89h5urrLqiQ1GZWHr8vf0rQMBPOEG4RPk5Z36PP/fwDiROAZg0syqlVUb7+RBrJv334S7+IINzLuRtTByAGqTcRWAFxUJ9SGI9Fzwf2b0ALOiwexWOsSZ7vHBdsiPH3pbVSv9bEcRDB6GuikMby3wBWNWCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=SksMmFSX; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="SksMmFSX"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb751so1074378a91.2
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 09:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790527312; x=1791132112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cD1GGOAxo3hdOUsJqunYxfhJul2XQRWSlBhx+D5pmZw=;
        b=SksMmFSXxdmYyASIrD42gGRD8ICKB2i0TitCaaEM3yGf11909KZrtsA235TG5nbpml
         uQ4JqemKmNR2zNSeGbOEfSyErPNnREtaHq8ib2e+1GLNZAjeUnOLQT+vXvD7X2wSK7Q6
         Gw22sr1M+tBlb04P1Bo/rmiV+hBfYkXPLcKcgLcgXB+kzHIBYETgBRi6suIOWjIFUBDf
         iuTAoip9pVqg+JEsCobT03gEojaP3Zkv9bSeUfjCu2RD6IvQjO27KXdJ4P6rRJnDD/xe
         JANan9Ym1/AasQ2FNoUjypkX8DYQjgpsGunaZD+2q3mtdBgoADsb7m8aIW+nFz+vRPCS
         3pIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790527312; x=1791132112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cD1GGOAxo3hdOUsJqunYxfhJul2XQRWSlBhx+D5pmZw=;
        b=xgDIs4bwSAdWUsYVcoLyDZr2cMa50ZuIO5lJ8ifqsLmiHaMMcuKedDDKBIkEQRORCw
         2cQ+9rnOSZSXzCMDyWqJVzRBb9Wu+EJsdLghMlWFyoGpikTkYATiid/KjJJuSisDftcP
         S8CgYGeOE4iZuk7FMi4+2Iy81DB4MJnr662qsR9qR8g1ESTm4NKUioWHIYae6tL/EF50
         t4vNgt0IPCvhwTIUZNqK9zHqxLT61XY8BWTNm+se0Wx4iXpK6HI1rkE1qv3gtdztN7rb
         2cg3ULhRFP1gFzchF6OfkbUI2RVM9eQ9aj+9LX9cUSxJx7GNB+6NQtwIH1XOyp+Oeucm
         bQ3w==
X-Forwarded-Encrypted: i=1; AKwUvByQMRGSSu5WiN1I2lg+Q5pjlR6f4PIs/hugbFtIHDz9Rqu30DKa/+fw6Y38nkN9yg2A+H5sZM17CMw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI15umfpih7B6CwQkYvC9t3wDotDOkf8YaIBkxj5/4ETqCAxeVl
	AVCIe9CIjIJpIJrZGq6Fk2xxLJwscC8g76AHkkF+SkZzER6r/3EdqtmpcCiaXAdbrmoq
X-Gm-Gg: AYBFou0LmZ56ApmKcA0nAmRfgdCQ+f1B81Nx83RG9HYvCmkpjgYpEmTEeNpgD7ZoEhs
	/rW1BjspvXOX7VQFTa+GoOHITfX2la6U9fx//Lc8URzoSPh/QuE8PR5fWzR/AcvueWGsbiM1UG+
	HFfiEOaxgxPtJ8T5rFjBC5+/aq+U2mQGPDaguF/XZSKRIiWlD7g+6+orQwIcnsPngfn+HezBRZA
	bCGIMWQoj6a9l2CEdjp+qDO9KTRCNBG7Mx1hP1rRHSqWy6kAD+4SOQ1BQIUWBOS5Df/F0ylmD2Z
	+F+Ch/F+5cx8VgI0CDvMLBp5s7hmDfy9vfH5887IahawB1cARLJShJGOvQs5hPp9Bh5WzvuGseu
	pdgPONVAsHdTKBBimk4EcMdlmOsWDr0ZgpT9PgqkeWI41CJvnzvO3O5a3euGO1RNDbxIovB/Fok
	Mpyalm0HqbxSTCo/c2N+T3M/WlzgB1wcxgVGk0HeVet3mt21IqmgA86vmy4/OX+AAn
X-Received: by 2002:a17:90b:4a8f:b0:39e:423:bb8f with SMTP id 98e67ed59e1d1-3a09853c638mr8360458a91.1.1790527312129;
        Sun, 27 Sep 2026 09:41:52 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972f111csm21993533a91.2.2026.09.27.09.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:41:50 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] usb: musb: Drop the D+ pullup during system suspend
Date: Sun, 27 Sep 2026 23:41:45 +0700
Message-Id: <20260927164145.1956429-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When musb_suspend() clears DEVCTL, the host sees a disconnect. But VBUS
is still there, so the controller can start a new session on its own
and, with SOFTCONN still set, pull D+ up again while its interrupts are
masked. The host then fails to enumerate the gadget ("unable to
enumerate USB device") and gives up, and nothing at resume makes it try
again. On a T113-S3 board the gadget link never survived an s2idle
cycle.

Clear SOFTCONN once the context is saved; musb_restore_context() puts
it back on resume. This is what the FIXME asked for, as USB can't wake
us in time with the interrupts masked. On da8xx, which keeps the
session over suspend, the gadget now disconnects too.

Fixes: 6fc6f4b87cb3 ("usb: musb: Disable interrupts on suspend, enable them on resume")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
I found this on a T113-S3 board (sunxi, s2idle, Intel xHCI host): ssh
over the gadget never came back after a suspend. With the patch, all 30
cycles I ran re-enumerated after resume.

To check for regressions, I also tried a BeagleBone Black (AM335x,
dsps glue, suspend to RAM). There the link came back after every
resume (10 cycles without the patch, 30 with it), probably because
am335x_phy_suspend() powers the PHY off. 

 drivers/usb/musb/musb_core.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 73ac25f536..272683f14d 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2825,18 +2825,24 @@ static int musb_suspend(struct device *dev)
 
 	spin_lock_irqsave(&musb->lock, flags);
 
+	musb_save_context(musb);
+
 	if (is_peripheral_active(musb)) {
-		/* FIXME force disconnect unless we know USB will wake
-		 * the system up quickly enough to respond ...
+		/*
+		 * We can't answer a host with the interrupts off, so drop the
+		 * D+ pullup. musb_restore_context() puts back the state saved
+		 * above.
 		 */
+		u8 power = musb_readb(musb->mregs, MUSB_POWER);
+
+		musb_writeb(musb->mregs, MUSB_POWER,
+			    power & ~MUSB_POWER_SOFTCONN);
 	} else if (is_host_active(musb)) {
 		/* we know all the children are suspended; sometimes
 		 * they will even be wakeup-enabled.
 		 */
 	}
 
-	musb_save_context(musb);
-
 	spin_unlock_irqrestore(&musb->lock, flags);
 	return 0;
 }

base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
-- 
2.34.1

