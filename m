Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79473E3C5F
	for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2026 06:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783493163; cv=none; b=ZpOtKKk9lBLBR1VgcGLZjjkWvfZsWOqNFk5ESc5NEDCW1ZIWQWiTP1NG5uTgg7Mj7qSOQ/6vfk5EymbHBYbwve0r446Qspkk6XpumKkyxv2xyPja5S32CrbmGdcbhOQqZzcFX75xRZ3V3YAHRCjQV0y5maASxYBq2Z/a5ThV4/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783493163; c=relaxed/simple;
	bh=cqggHoGN0+OcTLvJQjdnCnNSNyfDR+zNyBrEYz/UKgk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=YswF7nje8Gez7zP18YO5g0PdOqRGGrsDe3sKMP/9a31mZzSd7rfn/uR3MmDrdpZDQOhWfUToTGAkx9mZX6FTCIQsvdiAYuu4YNvcT63xiyXVMis/iAG2TKXvpV3iB1Puc0zvwKvYDkhXdEjWaxS9V4LH8WEdkqiGa3KXun1JBDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tIAoyrTj; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIAoyrTj"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2caed617615so3319205ad.3
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2026 23:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783493159; x=1784097959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WJ6VCqrU1S8vuSoFUrp/Z8LoI+05YfC2UR8mKpg8S2k=;
        b=tIAoyrTj9IR6/R70wYDNrdO2vAxufnCBYlwkq+ODpEDjh5zV8XFoXKVuxZPs5fMeSZ
         eb/JE9cparHJAnoE7Qbrem5C9xUbX+0UxKUQN4A8k5h78l+HJsh4SeAhzvoYa50msxDM
         vpIOarJ3I9tWTZOlwpCFFAnp4k4hq9rHqNdmcwga+h1MOm/oua404gbFJgG48cuE18D6
         U1wuzAd4RhEhoK+ftZ5+xoaPw9XB7kacR+beTwhOKNjVLLnoaL/wlxkm1ePwMxkN3/kj
         ydWmkyYU26QGDGj/SLLdM3Nz7dk6uM2/bl0sLlQnKb+jahuYwgxeC/mOLaI7M947W1tI
         SUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783493159; x=1784097959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJ6VCqrU1S8vuSoFUrp/Z8LoI+05YfC2UR8mKpg8S2k=;
        b=g/eRza0HGooSY8+FWHFEQto61uyUzYqWmyIdpNS5560qgoUw/JTY63qRlKGfD7TOP3
         x/EnDmCK2DPTquFWjLMhajbpTrRmEKXpdbu+h9uas3hZskXcec0gqzzD1WUe9+L2HFB1
         1KpNecrfvGa6oudejzW/sMLXKl2w420tboLT8myD1eRAGcoAtz3NzvZJpGDgOSlknhUo
         /PRydecT+3FemMvBaLKenAim6sgc/Ykey0VKukrFd+BekUiN/YokUzCXekGTnCHsBhJz
         f0V65UqFuC5x2XASB29jceUdipGSArH6SFB64Kkf24qHcSTxrJsG0ChaaW3h/vvVmSuM
         7HOA==
X-Forwarded-Encrypted: i=1; AHgh+Ro9WUudjoJmkKlV6uLJdDywdoIFyF2B/Dh3au/nQ+uXuDe3yBSvz+K5NGOyrSfWKe+14dD2bpRfL/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXC/nTuJFyBpJ4kq35X987/PUU34aJB/6thC3fFX6o/5rCYTIU
	EaOGvOlceXVg64BFuLLeP2t+DCmM5ArKDlDzo0V/Ff2/zge3Hmie+q3xEk1U5QRAj4E=
X-Gm-Gg: AfdE7ckIZ+AamDloPiLU6iyA9AisnrO+Wlf6C54mlrU0dZLTZCixSSDz8gY8EHicKc8
	yhHd2dFC5NIa6WvSQQjC+MfhKBpRq1IVPOqy4TN1PSUtoNDaqyVdur4tU98nfwAf5mePGaDbo5C
	T+JxDKpw0qFjkHhfMFLf4tE8fNL5cKXixWzkC4kR+6sHDJ4FJs/jNQrL5zEKINAFSciQqe8zE6S
	w2aK4eDGGgp93oOXSYORO/9nYUvZY867lUfC7/YIXzX2HrRgaCfH++BtiMxA/821MR6pcRyBj3E
	YYXOArcT2wQd7mNCRLz9JBChH7eY8lT5iwTFMFcBZb+Z86FuepWSPS0ptFzSC9wePxGcSfBacy6
	el3M7zOvBjgKlrko7LyoHVKYVsnI3mlX/Zk/9szt6TgoHLYl2U5Xy0xj8fXDg3zfvhpduzt8wH1
	aMBvkda9Efbw==
X-Received: by 2002:a17:903:2443:b0:2c9:cf62:6f61 with SMTP id d9443c01a7336-2ccea3d068cmr12460625ad.17.1783493159585;
        Tue, 07 Jul 2026 23:45:59 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb9bbsm23455385ad.4.2026.07.07.23.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 23:45:59 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	Duoming Zhou <duoming@zju.edu.cn>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Li Yang <leoyang.li@nxp.com>,
	Anatolij Gustschin <agust@denx.de>,
	linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: phy: fsl-usb: clear fsl_otg_dev after freeing it
Date: Wed,  8 Jul 2026 14:45:49 +0800
Message-ID: <20260708064549.719147-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fsl_otg_dev is a file-scoped singleton pointer and is used by
fsl_otg_conf() to decide whether the OTG device has already been
initialized.

fsl_otg_remove() frees fsl_otg_dev but leaves the global pointer
unchanged. A later bind can therefore see a non-NULL dangling pointer,
skip initialization, and continue using freed memory through the global
fsl_otg_dev pointer.

Clear fsl_otg_dev after freeing it so that a later probe does not treat a
dangling pointer as an initialized device.

Fixes: 0807c500a1a6 ("USB: add Freescale USB OTG Transceiver driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/phy/phy-fsl-usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
index 35d79f11b03d..0b5e937633f4 100644
--- a/drivers/usb/phy/phy-fsl-usb.c
+++ b/drivers/usb/phy/phy-fsl-usb.c
@@ -997,6 +997,7 @@ static void fsl_otg_remove(struct platform_device *pdev)
 	fsl_otg_uninit_timers();
 	kfree(fsl_otg_dev->phy.otg);
 	kfree(fsl_otg_dev);
+	fsl_otg_dev = NULL;
 
 	if (pdata->exit)
 		pdata->exit(pdev);
-- 
2.43.0

