Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722683;
	b=4kyISTfSbP8e3RqiguuAh7kKhxrGwXP2PI/WnGZpkztipZF9Xcxl4ddJOJGsZ8CU0jIJ
	 hzETunlFteaxeIVmuUjA/WBW38eQ7cQy1kXL5pTifhSyiIGhEXmjV4v+ee6HPQ0mqy0l3
	 wSVZ2fiQd1+OKkYs0TsB1Hnw1FLD0yOOvzKwhvo2xm5Sg3H1T5achk8WETnbkBZalwqxr
	 QJCDITV67BtI1CvGSzPpSt06TyIhnL257FOmg4USTBX/aLqwqCCWGsq97wfxd9qb4E2jD
	 Xh2KGQvj+rnbnfUfN0ojgEjKmRkCT9i3i4w+8h6wfoa9lSMZIPxfUVNlx+Rb8bUlY9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vly0CmdUjORbmtqfoq+NzpTLxjcAn8jvLhSrWs+51ig=;
	b=XNRRKmePNR5wjxW/Weet2pOzwtqY1shvMV9/vofz0m7TbkmMzb8+vFfSX9dyPNjM73JE
	 TSgtyY3SUQN3BNi4y4pYYPI/nZtoCBveGUaIYHjo2lEk8i/r7xbZATJoXN2dm20Ur6Na8
	 fN+U4E6Tp0yDzzMNsCvHIk3c6NxV04PAU9rNBT+ej+B4khYeAjfOttvBieA2/ibEOUES0
	 HtCii/+sgg/TOYNOF/WDLivlhVyF3CY+sm5xfVYdYPOk5w91BGsSNKHczyu8zD/W9oHQG
	 G7FUvVY7hq5tFdcrwF7qE+ILwZwjq+DPmxL9n5uKhFKQE0TV0nvyjIpGxKJxsz9xZvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gXsDHF3H;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF835606A321
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 19:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF835606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gXsDHF3H
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eae12762c9so3005372e0c.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 11:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795722681; x=1796327481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vly0CmdUjORbmtqfoq+NzpTLxjcAn8jvLhSrWs+51ig=;
        b=gXsDHF3HYqE87K5skDIuQqocEsYWt7Fc+zSlhipQsPVBaHwuO3Jy+lX/kNwYybjllF
         Yn/A+Pt37OYAYnLAQNhRLQ0Cy7+c/3g0T1vI8RDhiKZVQ7vToNybOznsRCD7r+g1Pks0
         7w1yh8ducipxi5uGK22vK7fNJXlSUqHeN+YYtiaof9d5Q6KwqiB2pyQR5OGP/cGA07H1
         ZNlUiB0yb7/qiAKWeb8h89yV7z8P1UuKsNrKi34BEF+M+CREauF95OTrcPhzn1SuRxcN
         8hfJ2VGRkeDH+SbMAfxjOsB60O4Rtq5UWWY+FgeNuPhgGIS6TV35zki9VRWYpmktiEUd
         jydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722681; x=1796327481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vly0CmdUjORbmtqfoq+NzpTLxjcAn8jvLhSrWs+51ig=;
        b=hEnrp5FkQB1YLGDPzUjlBUGeWij3uNlU80SkpWLS359WxAQWi1wk4rphTp3IvmVNN0
         UgvGVaqVjrCDE1cQYNA1yca93jRVGkF2zNzMbaua0Qk7dDX1YmKLC2S/5s7117UdW+Zi
         RP/DRSqQJcKmyQULDWv0jXdQdlxy17EK2NLeaqkEsmQTLa7ddVi3fsNniAicJVxnYNU+
         eeFTfBUghy+lEvBhOVgbuefsntyvbCUx12LH0BiDvBBU6bqDTwPcZvD/umt8nr6eHLZU
         1i8O9UKmpccQ6UX9upDMrgWeQ5h6Myw8h8mreSHlJ8LsR4SmzH0l5g/657Sx2xlTR//y
         Yylw==
X-Forwarded-Encrypted: i=1; AL+hErEAT5v+Os3WBZ3/ArAEK5fzQDFw+gOVikbnYCpa/vkGw4FGe3EL83nVRK49cAd7WXrT0iS9W5Aba8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+T1RPXYrd+bMNg34S5yZOlcKxilCnFyN6J24oZxkO5NZ5lJYNN
	YrJCJKVd/KpGA+VXmiKczIXavMfWwCxt1UjL+eGjP5A1OLUulOBBEaAIIMXBGw==
X-Gm-Gg: AZFdTZd8/vuL9Wyr3asVqtvEPN+ik/u7KFtD1EFLANV/9i3XVZ27HqTPjZB564WvEWY
	YUDAo9Kv/5V2koKZVOjsnrY/K7tm/yX/PsSBzYHbeVZuhlV4Ld3h6uqmk0dNsFkSYVVJWQuZNom
	M+UTOvGyRTI5wxTCfyB/wh7RrYcJjHmBKTGrFaLECGPLlsuHAUqMrRr2QfTJuASkcH5jbiLOaol
	y1EupRiNu1p/EDIsfXZXgsZQpfS2Pe2e8hDkLpGXiBLBW0HElQwHLzDcDzFv1JCcDmGQPehbfKf
	2k//ZiBs1l07lqEtC8zBjMNk7Y5pSpTr55Za8g+TWTPeg6FmEAzMqHTkgAfqO7chWxdXXRXpuII
	LsiY2OIGQAtvu849LheNQS2JUfm6C2I+10sYxBn3m/k6on0vGXxaaL+AvRfb3Q1itDKePI6z3ox
	3TOYsGAj0lmgne6BWe0uoVukM8oPTQ8j/JaJ9kqG16psjr7AzjH4BsEPqx67swtSD+BU0UlCVYh
	XsbCZYv0Yw2HvZwMiNXncLyFZ1za8lXf/XqWP7yLXHbGI5yFpDRVQAQZe2tMKCQUvJgS+5c+xC+
	ZOi++B+zuO3Lqc3v3fW26VWl0jThf3nLHSA0RP1YFjyZEkuVQ+Qmcu15s6C5qpV3T6FWphxsHsS
	KASakJuf6YPZSbLL9fdyS2E/92eDnGSF/Z4C+QKUtYvEWDg0=
X-Received: by 2002:a05:6122:7cc:b0:5ea:a0f0:192f with SMTP id 71dfb90a1353d-5ee8aee2709mr12650427e0c.10.1795722680819;
        Thu, 26 Nov 2026 11:51:20 -0800 (PST)
Received: from localhost.localdomain ([2804:1b2:aa42:30d0:f9c6:2eb5:66c4:899])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b6641d6sm21675692e0c.17.2026.11.26.11.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:51:20 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] usb: typec: tcpci_rt1711h: unmask alerts before registering the port
Date: Thu, 26 Nov 2026 16:50:59 -0300
Message-ID: <20261126195059.1139494-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rt1711h_probe() masks all alerts before tcpci_register_port() and only
writes the real mask after devm_request_threaded_irq(). TCPM starts
looking for a partner several milliseconds after the registration
returns.

The ET7304 (RT1715 compatible) does not latch a CC status change in
TCPC_ALERT while its mask bit is clear, and setting the bit later does
not bring it back. If the partner shows up before the mask is written,
CC_STATUS has the Rd but no alert is pending. TCPM stays in
SRC_UNATTACHED and VBUS stays off until the cable is replugged.

On a Radxa Cubie A7Z (Allwinner A733) with PREEMPT_RT, a source-only
port and a sink attached at boot, 6 of 12 boots ended like that. In each
of them the mask write finished after TCPM started driving Rp, and in
each of the other six it finished before. With this change 0 of 12
failed.

Write the mask right before the registration, so the setup before it
still runs masked, and drop the write after the interrupt request. The
interrupt is still requested after the registration. It is level
triggered, so an alert raised in between is handled once it is requested.

Fixes: d6b82dafd17d ("usb: typec: tcpci_rt1711h: Unmask alert interrupts to fix functionality")
Cc: stable@vger.kernel.org
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
I only had the ET7304 on a Cubie A7Z. RT1711H and RT1715 are untested.

 drivers/usb/typec/tcpm/tcpci_rt1711h.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index 0581659763a..635ea9aa8fc 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -337,6 +337,15 @@ static int rt1711h_probe(struct i2c_client *client)
 	chip->data.set_vbus = rt1711h_set_vbus;
 	chip->data.set_vconn = rt1711h_set_vconn;
 	chip->data.start_drp_toggling = rt1711h_start_drp_toggling;
+
+	/*
+	 * Unmask alerts before TCPM starts looking for a partner. The ET7304
+	 * does not latch CC changes in ALERT while its mask bit is clear.
+	 */
+	ret = rt1711h_write16(chip, TCPC_ALERT_MASK, alert_mask);
+	if (ret < 0)
+		return ret;
+
 	chip->tcpci = tcpci_register_port(chip->dev, &chip->data);
 	if (IS_ERR_OR_NULL(chip->tcpci))
 		return PTR_ERR(chip->tcpci);
@@ -352,11 +361,6 @@ static int rt1711h_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	/* Enable alert interrupts */
-	ret = rt1711h_write16(chip, TCPC_ALERT_MASK, alert_mask);
-	if (ret < 0)
-		return ret;
-
 	enable_irq_wake(client->irq);
 
 	return 0;
-- 
2.43.0

