Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEDA433BC1
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 13:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784900575; cv=none; b=o9Xv7FbBXrY6agz2y4Tj93z47pCU47QumKzNRis+lyVPmbputS8XvzTiVCEZ0yV9i+XXbXZyjpfpACsLIl5eiLpmsupjKYSrts0k5n8j1rxxZ3LWQ6OrZBaMJuQJOv6FBgTmphsIrDj7v0hoj6rxnF+4X18ZgkAl1h0zzs4ELJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784900575; c=relaxed/simple;
	bh=nmS6H4FTGfwQIoCXwTuZi7xAO3R/0s18DSvjvFnlIn4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f5NPkmRBRf6HWsHTvAnXPgnpVNbIfDVcmOnocX7YYq40aoOLgnNFkHutw9Aq2vPWQ3LMVylX3D2sGdlq/j3K+f4jVliQ/bgWVjUO8JVnfAmQEyDlb9ZXRs1TULDwvtdJ7FagZDxfGkEPe9vAzqigXccaQ4BSXHmq7+WkMfAidnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=TUoORDvp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="TUoORDvp"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4957eefd361so4048025e9.1
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 06:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1784900572; x=1785505372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hzokFwbqCQcQa0BrIKwjqqwQpe6YFNwdchqjati0oWs=;
        b=TUoORDvpHUE7jt0UnLuCr3U1DxrW1G21GQgo3dKWkZcHd67wMIhjWYLOZpzrdyDPsu
         5YvUsIVX/PSk1ovTgm9VjNpZKxy9fk7UMdgzEvA+eoagaZM8kd2jZ3XTfjVe5YUE+lie
         3oM2VrJQ2O3B774l0Kq8vYrfIdrh9k8iR/6LfhWA6+W1ejXsVKsHwisfRujj3Z20yiwq
         P4hdRTJuuo9dTImnEgZi80LbsjPdAydRtnmrY9A2AoCBiJ7fTo4LFaBTEWOX4yNFQ/qL
         ncUnT5o629xMIGHgLeJ0x33MJ8H6js/4J3Dc0bd/b7RfzRWtI95UrXU1P9E0K7VeVwKL
         HZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784900572; x=1785505372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hzokFwbqCQcQa0BrIKwjqqwQpe6YFNwdchqjati0oWs=;
        b=PoprRzo/w+Jz/y1JOpHuctG2/h2RYCllXiG6ObZLn8U4Etpbz0uW0HmbBNQukiDK27
         9kBEkbFWfaRPcVOBWnrLbXPnQIZX8YeWJdwBXwlpN3EYUYb/0YK87vZY5piVqqa9+FSO
         2Q58YOPx+3GAgyFEjoT+QO60mteR+ZyspqsPqySq8N5Big5jXt8kRBaG1XBWjb4uhnPf
         GunfBmHGOSuB18bMq8c210/AA2IEAOp2vNtFqxJz+ZzmlVpzw+3zTL1ELmm+ho5ol8CG
         kBGGJZRXd/yUhFBemQCbtIbxG7EeZs9gg0FJgwoOaVkLLE24WrwzkXV6brgf/wHpzC6u
         f5+w==
X-Forwarded-Encrypted: i=1; AHgh+RrENAyOd9qsywfX8Mm5NpJFIgLxL01zCQCufKd2wGAMw8ok7eN0L24uFM+4/fflt9dEdBr88ZNBccw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBkGEt2WDLNrf7ZqlSEaN8Red9zCzKDlCWET+wtBvkMuL00fs4
	XQ7/wi0AF5wh1JttM3gJSlcCEOnEanhZrTes7NSWDLoOKGU4662b5nmV2f68pmgOsp2Z
X-Gm-Gg: AR+sD10ZR+S+eYS08or/X5gemxnGEgHkkZ+fym5fDuahKqxQGwK49hzCXuqBcZjEI3/
	TWd8v03DOL5qWZY368hGKs3BX6y/iXUPJdjlRhMh2e1UL9aQFqf1/WVjYl29bTz+iPxbxRMLqbQ
	pBu3T9yJ3SgR0f2jNo10KlpTLIo4m83urbNcTtoYr/vhykWEO+nvQV30oJaNKtoweYhqWPLdfuA
	vL9z8c1cUSkuEaSmDHUNp6CW2+aAWfgVcKVEL1TP7DUWGAegh9koU2Io2CXUAVVMfV/fKmZ11OX
	Zb1MjWQMyNqVkVI3Xn7LP9K2PnW8FG1kSc55p+irF1eI6QfsBDNMIusm8H1B3Xk4qJMsIw9okxt
	U4VkIMgUyCX1u0E2RS9sPrn6F7Kv+WaVafx+UTdA111ckysrMEuixyyWoD0doSi5fK/GF9yBOg9
	YNQqgSXWu+nZHhMpDpSOpkfqE9HKVE6MGrEDIJ1Ld2kWk6Qv7MamcG4aLNjPQdOryMyovjJOrga
	Qa7hUxCAMFOIXVorFgHGcMVgQ==
X-Received: by 2002:a05:600c:350a:b0:495:441a:39d2 with SMTP id 5b1f17b1804b1-49573cd8932mr92373025e9.21.1784900572398;
        Fri, 24 Jul 2026 06:42:52 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.219.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bd850asm23982836f8f.15.2026.07.24.06.42.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 24 Jul 2026 06:42:51 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Alexander Kappner <agk@godking.net>,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net] net: usb: ipheth: fix carrier_work UAF on disconnect
Date: Fri, 24 Jul 2026 15:42:50 +0200
Message-ID: <20260724134250.34360-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipheth_sndbulk_callback() re-arms the carrier-check work on any non-zero
URB status:

	else
		schedule_delayed_work(&dev->carrier_work, 0);

ipheth_disconnect() drains that work via unregister_netdev() ->
ipheth_close() -> cancel_delayed_work_sync(), and only then kills the URBs
with ipheth_kill_urbs(). usb_kill_urb() completes any in-flight TX URB
synchronously with -ENOENT, so ipheth_sndbulk_callback() runs after the
drain and re-arms carrier_work. free_netdev() then frees the netdev
whose private area embeds carrier_work, and the pending
ipheth_carrier_check_work() dereferences the freed device, a
use-after-free on unplug while a TX URB is in flight.

Drain carrier_work again after the URB source is stopped and before the
netdev is freed.

Found by 0sec (https://0sec.ai) using automated source analysis; not
runtime-reproduced.

Fixes: bb1b40c7cb86 ("usbnet: ipheth: prevent TX queue timeouts when device not ready")
Cc: stable@vger.kernel.org
Assisted-by: 0sec:multi-model
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/net/usb/ipheth.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/usb/ipheth.c b/drivers/net/usb/ipheth.c
index bb1364f85bd1..fdddd761f83b 100644
--- a/drivers/net/usb/ipheth.c
+++ b/drivers/net/usb/ipheth.c
@@ -672,6 +672,15 @@ static void ipheth_disconnect(struct usb_interface *intf)
 	if (dev != NULL) {
 		unregister_netdev(dev->net);
 		ipheth_kill_urbs(dev);
+		/*
+		 * ipheth_sndbulk_callback() re-arms carrier_work on the
+		 * -ENOENT completion delivered by the usb_kill_urb() in
+		 * ipheth_kill_urbs(), after ipheth_close() (via
+		 * unregister_netdev()) already drained it.  Drain it again
+		 * once the URB source is stopped, before free_netdev() frees
+		 * the netdev whose private area embeds carrier_work.
+		 */
+		cancel_delayed_work_sync(&dev->carrier_work);
 		ipheth_free_urbs(dev);
 		kfree(dev->ctrl_buf);
 		free_netdev(dev->net);
-- 
2.43.0

