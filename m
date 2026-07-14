Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F9936A358
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 10:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784025757; cv=none; b=vABOmoMPLVF9du9CUsA5GS5qxcaJiMsugK8uFaXdeYlnHOrVAyJLia25XypJ2MZ9Byobbtlh5kyK6VW0za2ENvf2TTulPG9Ol24LGZXwPyLPjH731wwIx6yAWO6c5DN8PxAEtGvc8TS5fbBgKhCpxqiqCTTh1r6kjnxDKHm84oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784025757; c=relaxed/simple;
	bh=v2UFRc3hCq6ndzphXPPUaXi0vTBlhfM6fUCfFget3+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KlPT5MgsK/OxWU8er56sMC2GO7K9SLnYVJdieUPU4j4ZFhZIlL+/BFHvK4LjuQUfQ4OUHXlbFqPBIo1mH0jJBw1Fd7kaNghlLUw/WdTvSX+s5L4PgCMta16J85i/pPMLFhU1cSJDMlZzAFtGip3+s64TC5/x2M/3KDkEI8DCXEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaVJhjPo; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaVJhjPo"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-848595b338cso4772959b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 03:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784025755; x=1784630555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rb/9zQ+PZjUoKpNH5YAXgELyTFN4ZKX8rq7xqLFNy+w=;
        b=JaVJhjPo2gL1ve1DxfM7LW59OIVmkI8GqW/aBSvsfwkQb7X2tHc1WmIUWNwltMJtaM
         Fyn6s0AknT9RTq7bFvkf+zAZP2RE0dZ142djcgziqVuuAz5rksqovViHb3p/ZxmvhvCH
         diVoP2aMm4yyI+3t3eBaG2SfsQC5xgzfOSTsCAPGJRToE8eWO0W414SUYrU4fsRFq7zH
         91LdL66DmwjXwrh17IEOUUluI/U6/bfGcCzZdYPPhL4mpgAgpB2wx3EOCgO/u4tGRrEv
         l0R1pR9rfoFEkWrRQPao52/si+KbV4Z5I/cUrwz3vob1gjGMXyQqO2qmvcCUvvhPm1v+
         Pskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784025755; x=1784630555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rb/9zQ+PZjUoKpNH5YAXgELyTFN4ZKX8rq7xqLFNy+w=;
        b=AYR6xNSfU8ua+caSt1aVApeWG5MpGJ2XpzrkHPenLg1zAdzRWJRsUunN874iilJfim
         UcQx8VivS6PM4gkYH2C5fL+qnq2j/EWZDfVnJsXgx9qC+Q3dAwHE3ZDLtPDMLton7ocx
         Ym44vDTkPFVHSAdrhFWbNIEmIMMdg1+awLv+Mj0Rtp4gSWxVBeTj3TA9duaWhEp7Mict
         PvRyoZuxzPlfAoavwrcgrwZIaXK9kFv1yky8kgtJ8sPDOyWySov4eRSEo12QCYd3rgGQ
         V22nNzyC9HyzKTM5CqByRz6PDGFa0i/r9I9/Aa1pSHCQC+YD6SvimQ+r8MgXWdnw3vIU
         AhIw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1bY4n1HleO8iIIhEFce7pxu4BioD7u39D7QQnATPHau2BuuQ9IZmbd+GjGHw99BsYNU/79AMlksU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDI1mVapQ+25Oj0coZSDrRLtSYDAV0kF9z92IispcRd2IBhDom
	42kBxCCSmF1uu1i+WcYMSsS/4N7A8eu85fEu3N7o9aAcxUVE4RWJlQbR
X-Gm-Gg: AfdE7cmDYT4TBPJIuP7v8C5QvUMYTbi3Wqw+0RbiKgdXNsPA80K8oWeUhylzR3nvcQ+
	XEKXTDzgzPG1vN9VBUsoGax6L2rZQqaH0jwL6j4aAnhiWaWJreijeki5ywup1kEtBVGNAFt7Llo
	GI8PFqSI1LYS/aIvC1NMkOGQcaIbFfc+RQoJrmHnrhWBeChZ4j1cuvTvE2HCOJGpp6DgRChPdw9
	hUtO8qHi4i6+0zAXi1XRattMixFgvQs005+k62KWlLWvGJKDD7jXlSRltkKDmuo+IUf0KeW6UXK
	o+WPSWUEKoOnxz8nYYZStfojZbJZ0myqby2MuKABpU77dvFpZ44LMDUmmKJQZy9eOLt13N1gfCL
	fmXSfflcANzSsmYvaBwlBYBZo20b/HfnMDk2MOE/pSL+DatyJF6zAYSMyjuj7QcvrF9L+RQnhWr
	o5y7ri9Sb0rbwnczGpgWGA/JLycA53MWArGJ9QA8Mo5Q==
X-Received: by 2002:a05:6a00:3305:b0:848:2f6e:e52b with SMTP id d2e1a72fcca58-84a55851418mr2036499b3a.63.1784025755439;
        Tue, 14 Jul 2026 03:42:35 -0700 (PDT)
Received: from shpark-MS-7E27.tailee9dcb.ts.net ([218.49.81.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d58e8sm9667849a12.2.2026.07.14.03.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 03:42:35 -0700 (PDT)
From: Sunho Park <shpark061104@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] USB: serial: io_edgeport: cap received transmit credits
Date: Tue, 14 Jul 2026 19:42:30 +0900
Message-ID: <20260714104230.893968-1-shpark061104@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt-status packet reports transmit credits returned by the
device. edge_interrupt_callback() adds the 16-bit value to txCredits
without checking maxTxCredits.

edge_write() uses txCredits minus the software FIFO count as the amount
of data that fits. Since the FIFO is allocated with maxTxCredits bytes,
txCredits exceeding maxTxCredits can cause OOB write in ring buffer.

Cap accumulated credits at maxTxCredits. Conforming devices should never
hit the cap.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: Codex:GPT-5
Signed-off-by: Sunho Park <shpark061104@gmail.com>
---
V2 -> V3: Added missing revision history (no code changes)
V1 -> V2: Replaced min_t() with min() 

v2: https://lore.kernel.org/linux-usb/20260714101316.823942-1-shpark061104@gmail.com/
v1: https://lore.kernel.org/linux-usb/20260714093424.737303-1-shpark061104@gmail.com/
---
 drivers/usb/serial/io_edgeport.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index 34ccf7820537..2ab3f8262259 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -646,7 +646,9 @@ static void edge_interrupt_callback(struct urb *urb)
 				if (edge_port && edge_port->open) {
 					spin_lock_irqsave(&edge_port->ep_lock,
 							  flags);
-					edge_port->txCredits += txCredits;
+					edge_port->txCredits =
+						min(edge_port->txCredits + txCredits,
+						    edge_port->maxTxCredits);
 					spin_unlock_irqrestore(&edge_port->ep_lock,
 							       flags);
 					dev_dbg(dev, "%s - txcredits for port%d = %d\n",

base-commit: fad0fd120e29041b3e6cdf41bb12e3184fb524a2
-- 
2.43.0

