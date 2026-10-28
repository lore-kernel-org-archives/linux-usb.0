Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193922;
	b=rcsCdcc/8VBSlMKyy3qnsaWfT+YbL0tkcYeJYEqEN9IJv3bEaJUGE+GFZ1eo32HDOdtn
	 7GmQv02jJlbtrEdZbKKqkzcxt54oUUYxJGurnWxHBOsz4EVkF+o/HA/j4sSIbeuUFyh1n
	 yhLFBYNFnopgIB6FbAhMPWyjJtj+w1BRkaPi5neYuYmkkfic0rH4NJaK0fokq+OpsbJLd
	 sf/5Adto7NYVin3CMXj9Zfc+Jnah5BeVRuU9p0HYNKozGmy1k5zkgephvzAV9tVuzxVxE
	 c6IMT+ctjkAsI3wcKYqKtVZQx+rYpTuWOJci7FgF3jB2n9OVesHYwQhzCwsojqxEJmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=hPJrinTuc8YfKSq20Of15bbl8HF3Z/k9fx6Ti8T3C6w=;
	b=SSjrU5OI1j3q9j79AV+sEH0a5PC3sf4ze7FulJT9xW/TlaiR7/ZczVzPepoX4AqJuJLL
	 UzfULlhXn2M6/jCKsvXvA1INUWNuuRqsVIoc93Cr6sSTstPSinKqeig75a3ICxAlefa9C
	 NKvYtUDmm8YZr7/ZX89qqRUQkkDlCs4QAZyLBo7BoYBFwCSrxm/l9tzD7VmFYOKzYib7D
	 pGSsT3tLFu+FG15L9+GbdSchrhcMwRoEzp1PNqLKbdym7IQ6otuXc2PTjD4lzCIiruPEc
	 tukpS8MTPTYKkJwkgu825AU2P5CeiJUDMS8slRmjai6r+SD/KmC3kLdn0RXiPQtUR6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=s2pnDRRi;
	arc=none smtp.remote-ip=74.125.225.65
Received: from mail-wr2-f1.google.com (mail-wr2-f1.google.com [74.125.225.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F62606A31C
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 13:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84F62606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=s2pnDRRi
Received: by mail-wr2-f1.google.com with SMTP id ffacd0b85a97d-48df388215cso261947f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 06:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793193920; x=1793798720; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hPJrinTuc8YfKSq20Of15bbl8HF3Z/k9fx6Ti8T3C6w=;
        b=s2pnDRRijKvahDaltyMzIJGmlmf4FlUL+iW9a3Vy8+vpywjk/JA2hObKrewypGZs18
         SUx+4tft6OmkAJXaDnVm5BwHdGeVrYFjyO6EcBf45s5DW9r4HEgUAFk5ZS4lUAS8pJK6
         URfMoJ68NLPRzG8kQslmrUXF4e81f3sPAZCcEPVE/Ci0Vs0bmFPwqsaBqHLjLZ8X2kAk
         auDlJGyRsDvFz97WGRfLXFxRMNZrL6TYV0DsIz50SZZi6GxN5Xn6ge/gv+NapFNnDNXp
         QWjZE7n+HjOFIaUC13jQLjR3/i+3YENbGnt/zGOCNJCAhZ+4o1ydI1yM7EOaLJQt4qhW
         H6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193920; x=1793798720;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hPJrinTuc8YfKSq20Of15bbl8HF3Z/k9fx6Ti8T3C6w=;
        b=KwYqP7RTiHEfNLFtZzn3sNgG5RZHO4mRkW9wCssdVxbdeEMpFDoT/GQM+JJz4GhNSE
         qGM7gHc1KmJsLS3zZIic+LaCYglMbCxKR7HHkLLHFnCE/eC36RSixMqlI2L4TZkPxO+U
         VzvzkwaoabO9UYfu8ug3MUfHgsintiaxLZJPXcnfYRf+Jl4rJCvQ6TG81uVzdIYAAvnO
         BWZZ4sleuKwMZcX/lBjm/6bmw/GXQbm37zQYWgDZD+81z9GU7+/aYXcVfIbzBfxoMEa7
         qfHX8QN+fBXQH6bRSb7wBAuFKIsiFjGywfhEOQ2WkYpbILecvVCeZC1syBlSswdAAoPh
         A6WQ==
X-Gm-Message-State: AFq9FYL3pl46Be8jb/f7IN7eAe6rMt5FR5i1nhOsfEDEMe/Qm9vvhyEV
	Qj4+s2lqqX6S/6wginkRAiRBNT3vek5I8ytcuzXs6nm/EdZX4URG30mHbmN5jmXYGOM=
X-Gm-Gg: AYBFou2THmRfaZOtWKvDyaJrtJKeieMx6Qe9Jf1i1Q+43jNBZe9dC1cnxjnw5zuge6e
	BuC8CADW6oCJabsR6041oEv5b12iqkPJwYIwlWnmBRw+T6REuiwK4cahKRr1Pdc0uVbH5qXQ6b/
	Vs1TxZv+UEjVJMO5/9UTNGvWadZIW2X4cefvz1EDpzkNqNOqfxiYJUDPCd8oOWF3yKn80IKfUt6
	MuLiVYdrbLlZvd11P/AhlL/pqPpnUq5+SwWkr8uPE9YDyoxHMFFgP6iuY/EPumopkri3kD2ep30
	wX2qPctA7peOyANrYvh3fH4ccacA6KdskXa/XPm5Gw1Hh3Yj4xqm//MCy6hv3mtjDQ0PKzIBRPw
	t4dVgCjw3oXSq0SCRyB9+BQ8n5yNDygRefBOJ4L60umCiyLussnFia3i7XrnHeQknpIlPKGDAyp
	mDQmk/MvZ8/9OaAMsXjAjYr27NnzQfNjbyhgpvCTuRXo9zpkMty1Z3K4bX7j1o1Rgg60gQ/JPm4
	R0/464WCfrw4go1fuONX3VWTVcL+77lopkNlDKd0Or84hU2zbFD8kdZzqsoLKwayIfBepnDK/UV
	jOCBeqQT/95S6hQMziCvsf4Q2mqoTDqHzhUWy91SS3VcN6PtU3qFAvIrhAyvyg81G85yXMV6rfi
	8Mby/ZwwjlMf3xkQviE/IjyXEtg==
X-Received: by 2002:a05:6000:454a:b0:48d:f7af:be35 with SMTP id ffacd0b85a97d-48e5d5c8a5bmr4210091f8f.29.1793193919672;
        Wed, 28 Oct 2026 06:25:19 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm28391447f8f.54.2026.10.28.06.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:25:19 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 14:25:15 +0100
Subject: [PATCH v2] usb: musb: musb_dsps: Wait for controller reset
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-patch-ektor5-dm8168-usb-v2-1-c2af306eb228@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQ6CMBBGr0K6dgzTQAFX3sOwKO0A4w8lLRAN4
 e4WPIDLl7zvfasI5JmCuCSr8LRwYDdEkKdEmF4PHQHbyEKmUmGKGYx6Mj3QY3I+B/sqUZUwhwa
 sMlrqHMuqVSKuR08tv4/yrf5xmJs7mWnP7UbPIUY+x/WCu/f/ZUFAqFSRZpjJAq26PnnQ3p2d7
 0S9bdsXDvpjb9EAAAA=
X-Change-ID: 20261014-patch-ektor5-dm8168-usb-d6ca2a5189f6
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Felipe Balbi <balbi@ti.com>, Ravi Babu <ravibabu@ti.com>, 
 Ajay Kumar Gupta <ajay.gupta@ti.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793193918; l=2516;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=+QOONuVXfty/5e7THWehfWD7HTPOkPZMRyLSJHjb+qI=;
 b=6j0RGVGuI5JAIpiKZI5flRyJ9vD+nUxo7MGjBws7EhCEnmIwtYdIWMINFk9DjPgxeXYCFfceX
 TzRq9+9o6Q5BEG33IlEdC5HR0LGJfsrVzDNH4OD+Fea5R8Hvst/bgus
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

After soft resetting the USB controller wait for it to complete and then
set the mode of the controller. This ensures that the controller is in a
sane state. The timeout value used is just large as the board is likely
broken if it is ever reached so no need to optimise. It was tested with
a timeout of 500us which worked so gave it a 10x safety margin and used
5000us as the timeout value. If the reset times out let it cleanup on
error path exit to prevent leaks.

Fixes: 9ecb887522a0 ("usb: musb: Add support for ti81xx platform")
Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
Changes in v2:
- Added cleanup on error path (Sashiko)
- Link to v1: https://patch.msgid.link/20261014-patch-ektor5-dm8168-usb-v1-1-9670414271d6@linaro.org

To: Bin Liu <b-liu@ti.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Felipe Balbi <balbi@ti.com>
To: Ajay Kumar Gupta <ajay.gupta@ti.com>
To: Ravi Babu <ravibabu@ti.com>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/usb/musb/musb_dsps.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
index efd1f0dbb926..91958b7000d7 100644
--- a/drivers/usb/musb/musb_dsps.c
+++ b/drivers/usb/musb/musb_dsps.c
@@ -15,6 +15,7 @@
  */
 
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/irq.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
@@ -35,6 +36,7 @@
 #include "musb_core.h"
 
 static const struct of_device_id musb_dsps_of_match[];
+static int dsps_musb_set_mode(struct musb *musb, u8 mode);
 
 /*
  * DSPS musb wrapper register offset.
@@ -466,7 +468,16 @@ static int dsps_musb_init(struct musb *musb)
 	timer_setup(&musb->dev_timer, otg_timer, 0);
 
 	/* Reset the musb */
-	musb_writel(reg_base, wrp->control, (1 << wrp->reset));
+	musb_writel(reg_base, wrp->control, BIT(wrp->reset));
+	read_poll_timeout(musb_readl, val, !(val & BIT(wrp->reset)), 2, 5000,
+			  false, reg_base, wrp->control);
+	if (val & BIT(wrp->reset)) {
+		phy_power_off(musb->phy);
+		phy_exit(musb->phy);
+		return -ENODEV;
+	}
+
+	dsps_musb_set_mode(musb, musb->port_mode);
 
 	musb->isr = dsps_interrupt;
 

---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261014-patch-ektor5-dm8168-usb-d6ca2a5189f6

Best regards,
--  
Ettore Chimenti <ettore.chimenti@linaro.org>

