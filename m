Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4CF3BFACA
	for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 22:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782684007; cv=none; b=dvpnnkq82eLXeIemsNJdLFf7SHfiVJEr7/z5DkKReXMky1XRxy3oubPbRb4BHdfLIZ6bCZuTYNvh2p+kiRJiXRXlTR3F8eXzT9dQSBcQ+80KQ1NyjBxyKI05J8RwTd6Wc3okMHSh5ipo1VNfwnIGOAPb4dHsOI+x/CO1z1/VBX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782684007; c=relaxed/simple;
	bh=NgFIaNYZUTAb/qbQGVV7XbPgH8zU63CWw/lfUHiIAEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p9hfYaGYenQd2xxpYQyyhc2uIv/S7HOJPTJNsNYc89pMAPs0ewVYY6AaJTWxkPZw7CbXi9oy75452ze6NVy5DAWo4ukOkr6dd92uuDPvYr0BSaYcMWLgr3D+RG3a6q0FiHCFHM+lxsJa6d5hM1xexkLqc8PcQC+O9sCJBJZHmig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BorpY0Gj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BorpY0Gj"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49270caa5c0so19853155e9.3
        for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 15:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782684005; x=1783288805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9S9Td7HcPIRlq4udFKGKuYJR7Lbizbz8bkEKru4NUU=;
        b=BorpY0Gjd9e/LALcHGlBUs62qMvR/MqpReolGxXOMZQxtMRQdCXZoH1uehjrQOUUkL
         cVSfyZLPW+uOml5KpeqeqaadpSrExtQQXe4litJyrLmZMXFxyOD7P7Oy+wXoiGRW5umM
         jY4m7Qe+jb1LOe3XqXk5+O4aFgtBmH3rgv8gL1IMsaX3SFWaQLUbDgdFG4Fw0BOVD/A/
         jfcDWzl2SYCeh0iKPSvbop8nbauHEHGgAA65Kf3HkmymzMy+inVmND2pidG+U3SNculA
         U8Y38Ehmg7M2ZrHC91P0SgillkmFs0t/HlRo5VRoLY0FdnUjAxRhFhv+EtiXqE3cNO/q
         /n6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782684005; x=1783288805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f9S9Td7HcPIRlq4udFKGKuYJR7Lbizbz8bkEKru4NUU=;
        b=B8dTsaZ0OduMKMFpR0WYOLQb48qbAogYipIP/q4+7v/FS53/8wwI8pPQc292cNMdWl
         QppyyFCyIktjRyMY3rUzYyVuM0NLEpeW+P+hYBi5OTofWorBblj701yVTK3fvU6GnnLv
         i/M8sIOh9qwTKCTt8E8tlgvRcCQo+61j+AqvHw1E9I2TgpHUPaWPFLygWbUbGPbgCKvE
         5+x4ELZIm1g7/LTWQh4KgLV1bZIuw5MmYd9EavhpKIyxCPsC/OWHsdXIy5bmSA0BXqjv
         ezGmPlnadEo6t9d66HBvGEX+h0YTvCJLGdid1zX/479RgBj7z4CIwW12xfZaQT+kCO+h
         pHHg==
X-Forwarded-Encrypted: i=1; AFNElJ/OpiUcpacn/lBhJB000P2G/SZcN+jSgCDlYZ2P5x/0EOgCHbCv9CPNCh51tWpUV+zXpm0SevJiiQg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9HlkXu7KZlFhqqwR7m5MeOPXLKWZtGKXOdKBBxNTz07RLpBMt
	HQdVEBsR9+uQf1H+i+GdQ0H4wcXylTmhK1MmY/CcTQasM7uSNLpxgKRDslhOZq4VdMU=
X-Gm-Gg: AfdE7cmZH+cd5cKdh+kcE2M1vUSls4A9oUt1gucVJrqDoFLEDviVC5a7ZxU/iatbf7B
	wRBoG2g/Kiu6exfVGSEl4/D6T3TwYKifBa1ekuFMIYPc4vyDxxzKnxlpimdUr029MSgoAqi50sC
	oXQ/woAaNXoOceJELeJmbKkgf+vxpZbhXU4a1otKllXjxjpj12HUl7ijx9B5hN4hxGxkqXljeYZ
	6jioaMTI7Zwv6NmKEpRghGjl29IBRAYO4LlArpheUpg6rmDKdhd9ha8PWBq7+LO6XAGxVZzyPgn
	c5rzhfPfNfpy/YGIecE6N/PTw4HAScauxEAlAuziN1RDz/sTzaAPACPzQ+3vcJ/2x2k8S9c4+FE
	kUc2ci/kvHiXlc1dCasI5xGOhttai7XBlP8GOlvntabWeDZBXjzZrbQpgW8e36Ifv8Qa5c/yA9F
	ZaUgPHPGTiPnaX4bUaHkIX5Nk79BkW
X-Received: by 2002:a05:600c:4f8f:b0:493:a75e:cf2e with SMTP id 5b1f17b1804b1-493a75ed171mr48961045e9.25.1782684004887;
        Sun, 28 Jun 2026 15:00:04 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4734df60acesm6710385f8f.25.2026.06.28.15.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:00:04 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Minas Harutyunyan <hminas@synopsys.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 11/16] usb: dwc2: Add include defining struct pci_device_id
Date: Sun, 28 Jun 2026 23:58:46 +0200
Message-ID:  <9147201c2ccb659812c9db7f1c82c8bc05070049.1782682124.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782682124.git.ukleinek@kernel.org>
References: <cover.1782682124.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1070; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=NgFIaNYZUTAb/qbQGVV7XbPgH8zU63CWw/lfUHiIAEU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqQZktROp1s1RaB0+IvfvXUGYHeZ0Rs0b1QJZk+ SOUkUtsjLmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakGZLQAKCRCPgPtYfRL+ Tg+2B/45A4QVWrgu9uDLFv7Z0V4kAQFesbtqBr2LOVSQMc7YGgbB5/N62DR0W0Vy4CPv9zNXtl/ YCBPKD3adsKfsJTEPj3EpSnw5EOXOQ86aW1BhbdpwTLhfd+vDrZKGtsVHqJfq8zLn+k8pyJTM4d EeKzeKWDEwGspqHrpA1yczpC6MiU9MUOQF3T9j99HsCDuepRcP5tDO3PS0Iq0zuHNojR6WGMvXs CAOrqTTs7syuoDfwxysOzFAjeeUv9/aQ7nVO5V4JWGFecZ+tkyLBwgHAIsIbgR5OerNyw6UtYEV hP2IMLKeY6C3y4yZGDDR4EsRQrAuk2J31Ocs3Bin8MMHb49R
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Up to now <linux/acpi.h> includes <linux/mod_devicetable.h> that
provides struct pci_device_id. However <linux/mod_devicetable.h> was
split into per bus headers and <linux/acpi.h> will only include the acpi
related one (and similar for other bus headers).

As struct pci_device_id is used in drivers/usb/dwc2/core.h, add an
include to ensure it's defined also after the includes in <linux/acpi.h>
are tightened.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/usb/dwc2/core.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 34127b890b2a..767251aa1aa3 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -9,6 +9,7 @@
 #define __DWC2_CORE_H__
 
 #include <linux/acpi.h>
+#include <linux/device-id/pci.h>
 #include <linux/phy/phy.h>
 #include <linux/regulator/consumer.h>
 #include <linux/usb/gadget.h>
-- 
2.47.3

