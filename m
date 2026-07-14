Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9A318DB2A
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 09:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784021671; cv=none; b=QctbKAjfGQe+Rq4AOdfm5Yjtx/0s4WsKlDYGmMpAMcu8Vx4jtvijB2F94wnUgK6Qf/IuC6vVeRdq0okXBEoLhgG5hunjL/iCBnO7cLlg4t9BwBNRFJwOj78S9RyUChpIC/f94oOb6cbP12eGOK8Zc11oz8TeW0L3YYevsXHKp9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784021671; c=relaxed/simple;
	bh=RTg/1qKo3UGXOLuXy/F+7itQETel3IEcHYP6zA0MqIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m3vTv8m6d1tnZgnnCyKbm5suZChgj11Y1wqsxCA7wJFfhwPa2MxY2N7fNviAJRXycORj866AB1fiw6QpM/7GvLhpV0gs0s6gJDybpSpSGn3+dhGkdpzNuzMbyV0+AggDU7mJz1+pqaNfVkctOuam0GlGAt2FcCO7Bx3FtDQp3ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bB9ncIK5; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bB9ncIK5"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3857093a91.0
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 02:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784021669; x=1784626469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0ciukRNvrXKS4VTFw+CW3KyarZ9Y0Wilda8EYfYO1A=;
        b=bB9ncIK52BGhS+vJVovtqvD4rOqzoDqwD3/OmjEq9SqNBNHvOdQIZ3ViV9B9ax1oBj
         YEXXG4UsJnaROr9E+8lWVp7YiGTybqD6HKidKTPKgtkqbaHoehSI5H2hSUeJIuX1/V/6
         tQb6e6ufcwO5ma9UJdxqhBJNyRKv63BCXCfG7VcsFPbo+zC2fEpJYMT6joDxwO70L+9l
         ydVMXOLwWVjTrff0AZYMSJQYukx3EAGinbeJDSoz96t+KRV/IMs83rbB9qMfp6tv/m24
         eQXB0BaWNPiACre8jNPs/4ef4Kl7jeU6isMYx1HY3wGByNNY8nkWwFvro99l1LzsNcyL
         lIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784021669; x=1784626469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0ciukRNvrXKS4VTFw+CW3KyarZ9Y0Wilda8EYfYO1A=;
        b=lYn2XEyyPqwmPuZySYLkuAYukSktrzoBtVucfuZaT7td9FxFoRjuktmfR+F9DqDvGo
         txGDF730YPGOWJ7Ppcv2u9lIxSEVDTf/+WDZOPqVLMfLDFx/tT7RQyOY4wWLZuJJd1vV
         kMxhSZy+p7ay1eK69vwWB6hv0G6sumz/UdADBOqidJeHq336PumDvGfvW+X0YEpMoPp9
         4/dG3mJRY8VMq0xJ9Bu0knN3OtJI2H27sOZzXbAepeBLGjGBv7T0GL+P94lgP4gR/I+t
         rgcXtwhESjtJmRqHfoBQbvHZBrixLIxeuxqZo4JJTTsKiN/iR6npVtNQTlOFBLKSCCUR
         Z+pg==
X-Forwarded-Encrypted: i=1; AHgh+RonX+FRB0rV+bFwYm0pjObgYm7hxjGo5nUIhHXJYeWogA2/EklDtt90GHWgncKGgokjcbm8Cq0FLp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdNivxq78h5ki97rkvdlCmlsdqd958sNf1JZF+MORAMsjpsAUR
	q8Uj8PikdUVVrwyy8QThuf8QqMfzkDexdsAlcpwkNl0BuyrUxXIwfo9u
X-Gm-Gg: AfdE7ck4Lj/qZs5BhT2vwshS0Ix0x9JfrvU60AonREQKehefSY0Snn9AQr7nbubW9ms
	u3uswysc/8XRkh5iUZBnXf9vMRpiz/pzIi1VFGjXHPcGjAWeSKjtBPfk0XtFBgaAc246oqXx9F1
	qTET+lUgsQ1Kz3ctl+Ox7kZkkE5ZGyxAAJUk7OfvjvTMBoyYsGmmyuMnpm2ozkcUn/ZHfrAaQE4
	vp1cNvCdHjjf8HZOkvKb8EE25zD5xj57bo2CiirNCeEfbVVKpQ4JQSYgBIPuUAnzDiWUvCwsDIB
	9LeFoD6waqKTOp5nbmazTBw1LonGaijo1IlEkIqmDLoSG7pdIIztaDWYGd4Jxovx+PqLBfj4Xj3
	83q81qAPQ4MlrxMhAED3bHoCScI1PMkUXLFpjCTm/RjaDWmKq658aLrbhWcOd379CRfP6UoBP2j
	8OUOLb/+wSF+ScKuMLyUSdeug1BPODeahkMYMKEArmng==
X-Received: by 2002:a17:90b:3c83:b0:389:42e7:991c with SMTP id 98e67ed59e1d1-38e17dc80d5mr2245925a91.17.1784021669259;
        Tue, 14 Jul 2026 02:34:29 -0700 (PDT)
Received: from shpark-MS-7E27.tailee9dcb.ts.net ([218.49.81.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c20616sm113385495ad.34.2026.07.14.02.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 02:34:28 -0700 (PDT)
From: Sunho Park <shpark061104@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] USB: serial: io_edgeport: cap received transmit credits
Date: Tue, 14 Jul 2026 18:34:24 +0900
Message-ID: <20260714093424.737303-1-shpark061104@gmail.com>
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
 drivers/usb/serial/io_edgeport.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index 34ccf7820537..503b3b5bb647 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -646,7 +646,10 @@ static void edge_interrupt_callback(struct urb *urb)
 				if (edge_port && edge_port->open) {
 					spin_lock_irqsave(&edge_port->ep_lock,
 							  flags);
-					edge_port->txCredits += txCredits;
+					edge_port->txCredits =
+						min_t(unsigned int,
+						      edge_port->txCredits + txCredits,
+						      edge_port->maxTxCredits);
 					spin_unlock_irqrestore(&edge_port->ep_lock,
 							       flags);
 					dev_dbg(dev, "%s - txcredits for port%d = %d\n",

base-commit: fad0fd120e29041b3e6cdf41bb12e3184fb524a2
-- 
2.43.0

