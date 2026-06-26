Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102593B7769
	for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 18:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782496907; cv=none; b=e7vmrrACvSiRRiU2+vxJGvZXthXQVJnIwMJpvcxUk4QTFLq7ZM/YsjIXBAXb5GV4jLsUUoBMtj9RZiCHDQfjW5X4sZPbyPho3Gb3O01mFJ52FiZc72WWz65/oQbegWmlTcwJoSMglMhIUueVf2o9+wum+i2q3FSddyl7n6ZPPOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782496907; c=relaxed/simple;
	bh=r7vxesBrzZDjvjTGe+XTldotE6z+81ZdxiiG0Ffs58c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=edGH+aIShtsofEjvSFyt7jz5q6KQ1DSnwNQcWdRhp0EhmygzDjPV+N9sWKPG1h/rt50xxKtZigqdLAOLJ5RB99rO+XijpS8hlXp5E4ofoob5+Yhd1uBfViPRRxMjuqgjGKQQ86tVSXxW7xYZKBuKzhj8UQK+hMuzFdtwQmnG8Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TIzGf7zD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TIzGf7zD"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4926f8e02e8so4331925e9.0
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 11:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782496904; x=1783101704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbJy4WUYqykXyAhf72VpceqrjFWkWmG97zuPI81aHH8=;
        b=TIzGf7zDfRR8eULa3uS2gvt8UeG6xX0ZTZX9f/RxH+knNtWAtd1DhwXbuA77NPQGmo
         gG+u0lFPZfNzcd9KrZOGaEIP7jEetpgyVrh5cLPOWitIfmbHflGlR+chCfPaWHvoQTQW
         ETJg8NvnVjGxzBgcQecTPbTDk+alOKSNS5Wv0B0EC5x3rGKZcAT4wGWAlXJq5uzIheET
         fBNU1Gp631x4tVkB1MaILieP4Iu9b5A4fGwQwi0YRWyP41qw0sDOrhklJj6WaR7BNCa1
         /J3PRkoE4WqY/PVBdxurxVEynK8w2Lhdn2nHyRnOtOWUutZ7T499+91FoQi2A9f/NM1f
         RSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782496904; x=1783101704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QbJy4WUYqykXyAhf72VpceqrjFWkWmG97zuPI81aHH8=;
        b=dDOBNqpSRYV//5CG2Q3lFyvK+nDvfcz2ZjEuEkAjRAPYbkuEPk+BhlXOFnpek78XuV
         IWvcZzmsbZohzDQvDKwSo2CC03/tDpJKhIvUtHbRAB1wM0L+Bj3kOXsJncKrQPNO+Qkh
         nl3pFPsc8vf4LoOSliADZnRN3+add24ExJzaX4ClNgZ9/S0EGUaiYIp0IotN/OTN8uTm
         GRRZo2cyKF5w9BGJQTG3PifySMk58O2O+YtBGVgjE+DrIwLpwl3j+BTsJnw/4LlElcZQ
         cA0Bxci1X/cyKeazkwaQmUk5RBXlzWvmAv0VcLM0UScOpSMRkEaQvi3l8KB/193urhCB
         apcg==
X-Forwarded-Encrypted: i=1; AFNElJ9xF/5LLDdrcMZFqQ4dZyYEBRcztBV3jA7/9Z+MwK07ApdxRSxo0Y1xJ6vHPdTOxxwzW38AkTWdeXY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh213rfJcGCtAtXfG2takLyXJP0joYpFWO+1lJWd1DJPpU1jlY
	h43hG/32gW6w+YifEevZN1cPckaMlL+DWOA3fB96HLxmKFypGp77rKC88Ob4llrY2ms=
X-Gm-Gg: AfdE7cmJKDuyK0xwiffcs7nD5qFwZcdAEjqpBJwyMofE6fCMsI+yhUcMyLHhvs/JDsz
	RYfxYYtBLBjQPh6hcd9jF24gT3t8vky+J8uh7AN0pPw+ISJ21hHaYsjE4OX+wNQD0jG6hx6VpBV
	/UgzFSnosJXN95DC2epLVT8r3FbaV9sFFnXLN9Do1A0zA60iSjCqjk2NnwDXmz7DIsq2GmdCgMw
	jBYZ4B7kcvl4dRa+y1jE5vu6wxpMsFdJo1vwpwIYI28KXQJt0vNv4H128HDEIDxU7CIAygNPJDk
	u/piMa7u8KHo6aghKUBwSl1NjYITzG9dFvZUT1tko00ME4cytWU7akfzhrIYJhoHCCXawMLIQlE
	9Qx3NkPVPUf8k9BNAv9L2P7WtBylVBbL7UTPyI+aRjUW/CPCXCIbNVf4AK6PA7yOTMjLY6tlZSq
	FU7csbjTuws9DRwutLyFIkHiWliekw0WEbq0dpD6AAzVORkBXmEwGYuRwk7GtJ6gjnFFUQneB5K
	aRd
X-Received: by 2002:a05:600c:8b18:b0:492:41a1:f217 with SMTP id 5b1f17b1804b1-4926683b1b5mr112668095e9.1.1782496904591;
        Fri, 26 Jun 2026 11:01:44 -0700 (PDT)
Received: from localhost (p200300f65f47db04b3606a871f5f1c38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b360:6a87:1f5f:1c38])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4926c01de4fsm84556865e9.0.2026.06.26.11.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 11:01:43 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Minas Harutyunyan <hminas@synopsys.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/17] usb: dwc2: Add include defining struct pci_device_id
Date: Fri, 26 Jun 2026 20:00:31 +0200
Message-ID:  <654248182ed13e226844f9c6c257475b08215386.1782490566.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=969; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=r7vxesBrzZDjvjTGe+XTldotE6z+81ZdxiiG0Ffs58c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqPr5UV4+d+B0lC5KK+vrJLvo8wPxLye0orNkVE 6sw8OZtwO2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaj6+VAAKCRCPgPtYfRL+ TjLpCACzO402Sj2lLrM9PnexRP241j1NmVj2cXsM+nBzAqu8UQymbVwCdIK2SwZIDczfectRC++ WgjnVKyus7zBt/5f3HkuOrKY1ZtwxextzfKueBOarIrkQWF0Bgj7PgYhFN5AnxL3UYBEdImzCuQ ja9Yotu6tml4YOViPPXy5BNFs9iNlnRwW8trGE9JlIsbN4LJoHSkFb0szsP5rlHeGxELAA1YG9O JKSgegtBCUnfsDR62BsKNOvF3FVnMyqdGWf4Xjk6yRa9gjT/ivOmojqiHZUvCdPhkcVchXToOoT NRCvCsjUMEcW2R55x5vWvPJxdlUWcf2fd9XBVbadUkQK0i6V
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Up to now <linux/acpi.h> includes <linux/mod_devicetable.h> that
provides struct pci_device_id. However <linux/mod_devicetable.h> was
split into per bus headers and <linux/acpi.h> will only include the acpi
related one (and similar for other bus headers).

As struct pci_device_id is used in drivers/usb/dwc2/core.h, add an
include to ensure it's defined also after the includes in <linux/acpi.h>
are tightened.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/usb/dwc2/core.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 34127b890b2a..68738fe173ed 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -9,6 +9,7 @@
 #define __DWC2_CORE_H__
 
 #include <linux/acpi.h>
+#include <linux/mod_device_id/pci.h>
 #include <linux/phy/phy.h>
 #include <linux/regulator/consumer.h>
 #include <linux/usb/gadget.h>
-- 
2.47.3

