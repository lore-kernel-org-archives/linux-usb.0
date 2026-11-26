Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795678326;
	b=VYsDC45rBLvjcImwui2SGPikE3KfH5/PxnVOJyihUmLG3F5xaIwin6UgZRMceZ6e5y3Y
	 JUBO4QKZM08JDKquZrY4xDHiKJ+A14iNgV3WrWz7fe+ovoa2ac92UjtTWDT8MstYOfErh
	 lUniWTJoATpXwEWArjVHvFHMC38NyLEuxayqunhYwxtIMdrisozV6l32x4vANlm7zdtaF
	 5pyN4FzRU62KKkl0egC/P2Xpq6MZQ/ERzSu3XucUeBBB9HPcAHSD3rV0KgyBTZanIo5NF
	 Q8yf+TJmf+mq5Fzq19yODVTSVscNrqRXKABRQNDxyswe9QoqNdg9ExARRywJP4Hemrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 Received:From:In-Reply-To:References:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=UxfJLJ/kw6NsKgiSQx27YujKpKmMB0ZKnG+0GWKtM58=;
	b=0dYhfI4QYtDNg04X4C0Ieq67K/d+jstghwqF5DGV2ARGfkIzSHXbtdbCn2AsOgO77aTS
	 Dd3brFfbk1hlUFsgLvga5moN5pdC74ZxXxlKEopcDbDCNUj7+E7uze8459mF5SaeoQUQ8
	 TMXolPqKTBdTsDOGALHI+YaFS5GI8J0zpDXyt/RoB2ioleCnl77S8UOXZuLqSsofKlKYs
	 ut8Mjy2IoeIAx6EYRaABdkEqRPmFmHnQYSRGuHwWy010mou7txAkoWv23Rt7hql/3lE6e
	 386kf5AQC8UrTUY5kr/cc5/hmFcxkQEYJLPJfGUhtSyXaBth042BX26F/zSyRlrv66w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gToZehnz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFC5606A31E
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 07:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEFC5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gToZehnz
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6aa9606ddadso4376305eaf.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 23:32:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795678325; cv=none;
        d=google.com; s=arc-20260327;
        b=EILJxSsT36zgGoa7HWdArhSRbm1qqGlIFd7dCHjkmuuTku3ZIQAZ+/xanI0+iSPP6Z
         uu5TtMlRIo5d2T8yKI8g2i+30z+2rhgGRfwVtANK7jY8WrHnOZpYbf6HwIinK4kko0rZ
         VYv61BVEAhdqo0gPbNuqETjcV3JhudDBUtsLwm0qZDKBUa0nDFY7YkDjxzUrxRHyWHWX
         oVWbXvPeGIch+uI5J79fZRqIEZ8uMjWwBQeSKlNDcFUlSJ0iwv/0rbtByi4LcnoWz/0b
         A8wh48O/asY4eWLaef/pGI1R/WJYULZB44Kjo5mZ/KXVqvqy6P4w0eEuLqN73HXh8v9T
         CvxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=UxfJLJ/kw6NsKgiSQx27YujKpKmMB0ZKnG+0GWKtM58=;
        fh=uW0XYUSLYx4DU/FDhFl9q/odVc0v6vpfh+gHDAJi5Rs=;
        b=Wj3cDuvP/aGcu2V6GcDWPtYnRs/t8lo9RXYfGDzq2LYNZMA/7zYGv1kayRySS5zseX
         K9Wch43p3EdZJtdjo4siebMYltiaGF+XRERrIxqdhs9eOKIj3mppi4BIHN1jKDDxwCXr
         lt3ACFjv+kLNp17LPZZjf4KA++O4Q2XyNinbQ1Mmx4/8lEpN2fgREJ+gMEYo9iKDoTzt
         BlT5gb6GVtDIniXmP524+FUoG4JrZskCeisEd0COay+C4A5MiRNw1FvIdrGbxWsqCn6J
         qe7kfEpD3D9ygamou9MxoPM4zp5xhChrJYK7LgwzQqKbSp2QzsBn2FOwGWlhCb/Axzwi
         mx2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795678325; x=1796283125; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxfJLJ/kw6NsKgiSQx27YujKpKmMB0ZKnG+0GWKtM58=;
        b=gToZehnzNxHiXwihqawNvfwWlDoL2hLNJO3A6kWEDfnll1pXFTfJqQCZ6zLV7G7HF5
         cwkzNEXvCKDqK3KL2fBsqTy8mVjUKMZJTAP/JZdAjTirGqd306IPlmfgOqG5LBDcC+ru
         C+RsGbWmyli4UxzZcJZv+1gYol5nBELGzpho/CRWlM4rKBhckGRwPEbBIbnxvsr2U6a2
         QGxwRLLY5IEHi34twbLkzNKeTy+m0YC2GWjeump6s8/EYkhkdQF8pdx5ICLliwwyJJSm
         OFor6LrVuQh1cl7SOIyuQPjMzByQy+2TjWNfhvkX6Mj+tQ0MEBrHT4IrGEMnYP7zz4gi
         Va6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678325; x=1796283125;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UxfJLJ/kw6NsKgiSQx27YujKpKmMB0ZKnG+0GWKtM58=;
        b=l9Tq/v2KJzz0hf9oxjBmb+XX7dii+5D17tsuLxzdtJw5X+b20pI0i9Z2IS7JK4iDXb
         bRvB1cP3o2gaNCGmI7yKsYLBSev4WbufFZSQg4S9sCs+XVoXCE00QQ4Zy4fmfWqOFFQ2
         XWLLDAKslBnYDVGJG7qrsBPDlWnqfx1YxkOQ9JzIdt6pFRr3dIMDpi5AhjT3/TN+7OHz
         U71vvtmOa1kV3/8/v27JPsrdbITrUDfw2dzracWtHHjHxqT6LjaSmGvCq6aOrT6jJ1gu
         k8BUXMrcrJOeovcCXHIIJZDA5ICmU25QFhdMITzN27/g0F4wYf7pAA1Dwh1z7OAhz3nW
         kU+g==
X-Gm-Message-State: APuU4Z9sH34Bl3cWY3lfdr+vCyv9WvnptrUPcxPiq4XRxF5tX5wj3YfH
	BgQG9UEfOLwHajQVWXKyXDUVa43/NtIlSLrBiM9kBbgCGKwf62JJLTKV7RxPRpyCIt9EBBh8mjv
	EqG/I1sjHVHsM7BcK6w5DUYgr4r2fXz8=
X-Gm-Gg: AZFdTZee9lusRfOMqYQ4CzjvCFxawQTl8EV28NjEN9XMpFgSQWRMvvD/iK36dRZfmsX
	RpDwUKMhyv7BamZHrf3+hiUovVqDs3Hh8cOLjaeIhVYGNEGE0A5jcY0QAR9HU341WtYFXUUUeM3
	ra+3fDE4Johk0pW4YlFyl3VnHMYp8bsyWUUeIoaKSnRN+AhSUs8iYd29a3a6a6sn29AW1htkEjg
	vp00b/BsCPWtOzgIUEf5p5wz6lieGRnBju+46+X+2qfHYcOcTlS/RpSxPv1fJTRE0KAef/LlPbN
	mMsQmCyyPsSon/J0tem+njTI06cvmN5+S8yTd5xSd6ZCyHhqcV6sf8PZCFkQMs2xrUR7VZZMt1C
	usrLEzevl5kdC2gdqZzB4FzOuElfdA7EG/BWgU9auyIYb8TF+hGysbuqOkULNPcB/jDo=
X-Received: by 2002:a05:6820:c30f:b0:71a:f754:a22d with SMTP id
 006d021491bc7-71b3957ed4fmr13966801eaf.76.1795678324642; Wed, 25 Nov 2026
 23:32:04 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 01:32:03 -0600
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 01:32:02 -0600
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 26 Nov 2026 01:32:01 -0600
From: Lee Youngjoon <getfeus@gmail.com>
In-Reply-To: <CA+m4KrA14J-3ovbau1EGjvwc1R4Maya3wzqD+n-_khotDhcRFQ@mail.gmail.com>
References: <CA+m4KrA14J-3ovbau1EGjvwc1R4Maya3wzqD+n-_khotDhcRFQ@mail.gmail.com>
Date: Thu, 26 Nov 2026 01:32:03 -0600
X-Gm-Features: Aa3M54q5AR0MiMyVtIAOsUeAG0ROYsnFZU4yeWmbzz3XS1iJWiHd725NhN01sDg
Message-ID: <CA+m4KrBqx-_TmWWcoGrYVpGwspxkxWXZ8eOmrT4kfHZECN117A@mail.gmail.com>
Subject: [PATCH v1 2/2] usb: typec: ucsi: gaokun: Defer missing USB events per connector
To: Pengyu Luo <mitltlatltl@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The EC IRQ thread dispatches both connector and USB events through a
blocking notifier. Waiting in the connector callback holds up the IRQ
thread that would deliver the USB event. The first USB event also
completes every port's wait, and those completions are never rearmed.

Schedule the existing two-second fallback on a freezable workqueue and
return from the notifier. Track each connector independently. A USB
update cancels only the matching fallback. A newer connector change
moves its deadline even if the older worker is already running.

Serialize mode updates and acknowledgments from the two paths. Stop
notifications and drain per-port work before unregistering UCSI.

Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 99 ++++++++++++---------
 1 file changed, 58 insertions(+), 41 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index d4c66de48..9b51b60b2 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -8,9 +8,10 @@
 #include <drm/bridge/aux-bridge.h>
 #include <linux/auxiliary_bus.h>
 #include <linux/bitops.h>
-#include <linux/completion.h>
 #include <linux/container_of.h>
+#include <linux/jiffies.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/notifier.h>
 #include <linux/of.h>
 #include <linux/platform_data/huawei-gaokun-ec.h>
@@ -19,13 +20,15 @@
 #include <linux/usb/typec_altmode.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
-#include <linux/workqueue_types.h>
+#include <linux/workqueue.h>

 #include "ucsi.h"

 #define EC_EVENT_UCSI	0x21
 #define EC_EVENT_USB	0x22

+#define USB_EVENT_TIMEOUT	(2 * HZ)
+
 #define GAOKUN_CCX_MASK		GENMASK(1, 0)
 #define GAOKUN_MUX_MASK		GENMASK(3, 2)

@@ -77,7 +80,9 @@ struct gaokun_ucsi_reg {
 } __packed;

 struct gaokun_ucsi_port {
-	struct completion usb_ack;
+	struct delayed_work usb_fallback;
+	unsigned long usb_fallback_deadline;
+	bool usb_fallback_pending;
 	spinlock_t lock; /* serializing port resource access */

 	struct gaokun_ucsi *ucsi;
@@ -102,6 +107,7 @@ struct gaokun_ucsi {
 	struct gaokun_ucsi_port *ports;
 	struct device *dev;
 	struct delayed_work work;
+	struct mutex usb_lock; /* serialize EC mode and PAN operations */
 	struct notifier_block nb;
 	u16 version;
 	u8 num_ports;
@@ -330,56 +336,63 @@ static void gaokun_ucsi_handle_usb_mode(struct
gaokun_ucsi_port *port)
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-static void gaokun_ucsi_usb_notify_ind(struct gaokun_ucsi *uec, int expected)
+static void gaokun_ucsi_usb_event(struct gaokun_ucsi *uec)
 {
+	struct gaokun_ucsi_port *port;
 	int num;

-	if (!uec->ucsi->connector) { /* slow to register */
-		dev_err_ratelimited(uec->dev, "ucsi connector is not initialized yet\n");
+	guard(mutex)(&uec->usb_lock);
+	if (!READ_ONCE(uec->ucsi->connector))
 		return;
-	}

-	num = gaokun_ucsi_refresh(uec, expected);
-	if (!num && expected == GAOKUN_UCSI_NO_PORT_UPDATE)
+	num = gaokun_ucsi_refresh(uec, GAOKUN_UCSI_NO_PORT_UPDATE);
+	if (!num)
 		gaokun_ec_ucsi_pan_ack(uec->ec, GAOKUN_UCSI_NO_PORT_UPDATE);
-	else if (num > 0)
-		gaokun_ucsi_handle_usb_mode(&uec->ports[num - 1]);
+	if (num <= 0)
+		return;
+
+	port = &uec->ports[num - 1];
+	gaokun_ucsi_handle_usb_mode(port);
+	port->usb_fallback_pending = false;
+	cancel_delayed_work(&port->usb_fallback);
 }

-/*
- * When inserting, 2 UCSI events(connector change) are followed by USB events.
- * If we received one USB event, that means USB events are not blocked, so we
- * can complelte for all ports, and we should signal all events.
- */
-static void gaokun_ucsi_complete_usb_ack(struct gaokun_ucsi *uec)
+static void gaokun_ucsi_usb_fallback(struct work_struct *work)
 {
-	struct gaokun_ucsi_port *port;
-	int idx = 0;
+	struct gaokun_ucsi_port *port =
+		container_of(to_delayed_work(work), struct gaokun_ucsi_port, usb_fallback);
+	struct gaokun_ucsi *uec = port->ucsi;
+	unsigned long now;

-	while (idx < uec->num_ports) {
-		port = &uec->ports[idx++];
-		if (!completion_done(&port->usb_ack))
-			complete_all(&port->usb_ack);
+	guard(mutex)(&uec->usb_lock);
+	if (!port->usb_fallback_pending || !READ_ONCE(uec->ucsi->connector))
+		return;
+
+	/* A newer connector notification may have moved the deadline. */
+	now = jiffies;
+	if (time_before(now, port->usb_fallback_deadline)) {
+		mod_delayed_work(system_freezable_wq, &port->usb_fallback,
+				 port->usb_fallback_deadline - now);
+		return;
 	}
+
+	port->usb_fallback_pending = false;
+	if (gaokun_ucsi_refresh(uec, port->idx) > 0)
+		gaokun_ucsi_handle_usb_mode(port);
 }

-/*
- * USB event is necessary for enabling altmode, the event should follow
- * UCSI event, if not after timeout(this notify may be disabled somehow),
- * then force to enable altmode.
- */
-static void gaokun_ucsi_handle_no_usb_event(struct gaokun_ucsi *uec, int idx)
+static void gaokun_ucsi_queue_usb_fallback(struct gaokun_ucsi *uec,
unsigned int num)
 {
 	struct gaokun_ucsi_port *port;

-	if (idx < 0 || idx >= uec->num_ports)
+	if (!num || num > uec->num_ports || !READ_ONCE(uec->ucsi->connector))
 		return;

-	port = &uec->ports[idx];
-	if (!wait_for_completion_timeout(&port->usb_ack, 2 * HZ)) {
-		dev_warn(uec->dev, "No USB EVENT, triggered by UCSI EVENT");
-		gaokun_ucsi_usb_notify_ind(uec, idx);
-	}
+	guard(mutex)(&uec->usb_lock);
+	port = &uec->ports[num - 1];
+	port->usb_fallback_deadline = jiffies + USB_EVENT_TIMEOUT;
+	port->usb_fallback_pending = true;
+	mod_delayed_work(system_freezable_wq, &port->usb_fallback, USB_EVENT_TIMEOUT);
 }

 static int gaokun_ucsi_notify(struct notifier_block *nb,
@@ -391,8 +404,7 @@ static int gaokun_ucsi_notify(struct notifier_block *nb,

 	switch (action) {
 	case EC_EVENT_USB:
-		gaokun_ucsi_complete_usb_ack(uec);
-		gaokun_ucsi_usb_notify_ind(uec, GAOKUN_UCSI_NO_PORT_UPDATE);
+		gaokun_ucsi_usb_event(uec);
 		return NOTIFY_OK;

 	case EC_EVENT_UCSI:
@@ -402,7 +414,7 @@ static int gaokun_ucsi_notify(struct notifier_block *nb,

 		ucsi_notify_common(uec->ucsi, cci);
 		if (UCSI_CCI_CONNECTOR(cci))
-			gaokun_ucsi_handle_no_usb_event(uec, UCSI_CCI_CONNECTOR(cci) - 1);
+			gaokun_ucsi_queue_usb_fallback(uec, UCSI_CCI_CONNECTOR(cci));

 		return NOTIFY_OK;

@@ -437,7 +449,7 @@ static int gaokun_ucsi_ports_init(struct gaokun_ucsi *uec)
 		ucsi_port->ccx = USBC_CCX_NONE;
 		ucsi_port->idx = i;
 		ucsi_port->ucsi = uec;
-		init_completion(&ucsi_port->usb_ack);
+		INIT_DELAYED_WORK(&ucsi_port->usb_fallback, gaokun_ucsi_usb_fallback);
 		spin_lock_init(&ucsi_port->lock);
 	}

@@ -523,6 +535,7 @@ static int gaokun_ucsi_probe(struct auxiliary_device *adev,
 	uec->version = UCSI_VERSION_1_0;
 	uec->nb.notifier_call = gaokun_ucsi_notify;

+	mutex_init(&uec->usb_lock);
 	INIT_DELAYED_WORK(&uec->work, gaokun_ucsi_register_worker);

 	ret = gaokun_ucsi_ports_init(uec);
@@ -548,10 +561,14 @@ static void gaokun_ucsi_remove(struct
auxiliary_device *adev)
 	int i;

 	disable_delayed_work_sync(&uec->work);
-	if (uec->registered) {
+	if (uec->registered)
 		gaokun_ec_unregister_notify(uec->ec, &uec->nb);
+
+	for (i = 0; i < uec->num_ports; i++)
+		disable_delayed_work_sync(&uec->ports[i].usb_fallback);
+
+	if (uec->registered)
 		ucsi_unregister(uec->ucsi);
-	}

 	for (i = 0; i < uec->num_ports; ++i)
 		typec_mux_put(uec->ports[i].typec_mux);
