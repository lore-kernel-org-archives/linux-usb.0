Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795678313;
	b=LtpqVQxa8iwdnL6agFnwJYUbRAHpX/VQj31a1Z/iUb/Ph4SuMSZk4sDZKx5RExtTYS7J
	 8yRUjAgY23FPSUSIyCsc035BY2FwLD0HPKJwEUX68OaeYosdF7ogMHc+uCNTfq9aE7nsQ
	 N8yVn3F6P+7fm3usKst/ykjS5oF3w1hwT8lDXj0P2OfdEqCewvy0XVbaZQFfWAAX8lyoi
	 tw+xAfWUNJTjJK0+AdQ76un0/xZGr3B36L+pRveRpjiOwcPlSM6gx9MGiHyEY9XZnqYL9
	 W++D2D4vswFCWoo3AFpKy/d/SI3lr8L3nNrZbjGwJPMdwgq5sj0UNzmzlsFXZZXXBdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 Received:From:In-Reply-To:References:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=h5E2UbuP+41IrRgcrwHZJc/VzF7oIUWcIzlONNE+YEs=;
	b=So0kRyxyQ0O1hGReGUS4E9FqP38U58oHTasGYNNDnydHfcfIQeoO662U0Nttl4Hwc0ON
	 jDBRC+Iu6MswmxlAm4G7v04raNRJopmEgmYJo6DP8MqkK2T9iM2DrPmsQ8On+y8Eo88Tm
	 1w15TTFRFWgd1dP8Df3WMpkNvE2qq0R6FG+YvJ6NWXRd+e09SJOtRoQK4Dq6782PEkWkE
	 JWmMNYiEEvjkFzpfls52hjHQwZNTErblYBMTC4vVKnTYQMzwYCF2gBRsoK1D7myZbXeK2
	 KrmjcD6JrrRyNGaiT5dwXlzisHc+30O7fIoLKtUqWaRmtyqijZzbhq7JeWSso8qsRKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RU+vNY8j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC99606A31E
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 07:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AC99606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RU+vNY8j
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-57e4bd7fb1eso1069892b6e.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 23:31:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795678312; cv=none;
        d=google.com; s=arc-20260327;
        b=B0JWLibkaCDGKdV/G60vT9rmSEPYytt1xBWbP9S8L+Y6nalORj51VopYoRGR9tsPSm
         pb+zJLH/bxwKCuwAg/yD6sUHKdoCwrCXmLmP9iUW6taPs/f1/asYeDlDsums7I+QaC+k
         UHb728Hm/oSMOae2kpSRp0ZdWALsldhPDCtcfyKZ3Kvf33N48WtFEaeMLIzPSKpDlmvc
         +78BMybj6Fjb5k+GotSbwf3kz2i24nD66hHZPNJWBYSrRhWUL9/2nbZRK6QVCnWm0NZC
         VTlvyDNKfPgeU4eLX7PkV38bkG7ujcicipwmHHTiAA7H+ADjvakBMslXRsDlzaCKLrMS
         4fTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=h5E2UbuP+41IrRgcrwHZJc/VzF7oIUWcIzlONNE+YEs=;
        fh=uW0XYUSLYx4DU/FDhFl9q/odVc0v6vpfh+gHDAJi5Rs=;
        b=oh9RN3EVxcyCfBbArvR5BEITCq3pHlU64jBuPDU5J+cKbcMpMylZ45iYnLtL2wCUOg
         3ycXvFyTS0AKQmtYpVhGUhfBq3VtJsyWdDDN1G0mYdoKEgmTBwEF5wfFzQaOBKO256UB
         LSVOSRMpP2wfbkNv2XglwVBN/fBB91uo134Bgvz8bPapMkTS0nWCd4QxViYLtriHiRzg
         I8U/BrPHwo074SwyqDzND42AOi53FMMRgfUAnLvOvGWiJrDn128uPrX1AzpRr846etDU
         P+aok4cel3zkKdtPAl3hpq89v64pn596T6Wb9N/Nbz0NwpmlqdGqQhA/3YVKIVb5Lz/c
         hN+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795678312; x=1796283112; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5E2UbuP+41IrRgcrwHZJc/VzF7oIUWcIzlONNE+YEs=;
        b=RU+vNY8jsljRjP1UMdA4zmwXfWpljGfdXQaDlUq07fSvAbSYCc2SwyULiou/PriCd8
         UxjPltJicVRmPJfqNmU1jZzzN5rCBgA73d+7aHMgbq6o6tWghkHG4zZN7shMHza6dUdd
         NlW88YaIIfslZf+HsBxdl1krBAjatqhqwpknVOzbJpjy5F5nfBdtgGzA7E6Z+HaDzHph
         tfTj7biGpLhYLpdMz5qPTqcWqiSoWyqqe1HlgWGgJe9I//VmRHRTqoC065AsIgL7vxWr
         ftGpfBTsU3YWa0PPHkJogyaPCwQ/TiHydqlG71OYJubODPxE1H+wyjXBvMnmudI8/d8s
         CFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678312; x=1796283112;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h5E2UbuP+41IrRgcrwHZJc/VzF7oIUWcIzlONNE+YEs=;
        b=ppuIy6POTFD58r8YaM0PbIRfBbWCd4kKlEyOM9s1GhIUfsjY2leizZsXF3baynkYCU
         2Zx8SvQAOP/mxTJ0hiMaRzAZxMEvf58T41C/ZLCJLf5N8+vd03bk8ANYu8ZR/0yhiR3L
         n1oDPChJXoGPYMonT850F0Rkdy1NbDkk4sqGaZNU6DVGv4kOUwoXgo+UxrleElZZDvKE
         pOhSYHMOs/tD+Z4rxQ+e3eVR3+zLUtJMhAOwCX1SUUsVpDcm8IK2G5XkgYVlw9Q9eDDC
         /7GUvu3XUZU06k3uxUTw2vMxuSaQiTuchHqsu6TbF/li5mqb9WxWSyKK0AObbA2xpJyy
         ZkIA==
X-Gm-Message-State: APuU4Z8AcAW8YgvobHDhWXAGCfoghysu27uV/pZhoqGKRJ0kXIzVe0tM
	mbSMUA+/I9DOCQeUIxK91evkyIz38Wb7V+STYlXbtJYXSftTFH5fVmEsTQZesuWmcZGdl5eOiVm
	GVwqbXCoRxPwHxO6A9x3PDkanMFK3/68=
X-Gm-Gg: AZFdTZcmok67p0DLt0LOZ2uykvDzhwYS1gaWaEN91b5Bs7S3S8NBX5+kdCeFSiu52xl
	FYSPaIGV4/9Jz8EbUoHAjByA0UV9msGsPSsf6CfaqgfvEdKJCTYLAzuFsphoSoH9sAwUnzctRRl
	PmfvCOkOxva0ze08mnOjZeFENXCBYL1xnBUbxz3RlugCQ06qhjEYrnIsGpqsU/r1wx25vBIpio4
	FaHZeHdqXxmO+/x0BZI4HpqI4w4ifRPmx8800pu68GBZVFrM0JOim2a7jRHl24fBXCdtsHS9rZM
	nQngUb+oyPXmRCiHgY+SizOS0CXY8VLiZTc/q4RQ7MaCJDT/d07qO7J3DQ8l2Rj5wZE+VMlsZNK
	j/vrj/VpXR+CV2NySIxUW9J8H+3oFFzp4+YDoEGxV2DDQh5tXnNEll8F2VcaxwavPeg==
X-Received: by 2002:a05:6808:17a1:b0:571:7f0f:924f with SMTP id
 5614622812f47-57a0c6b7286mr21919451b6e.63.1795678312136; Wed, 25 Nov 2026
 23:31:52 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 02:31:51 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 01:31:50 -0600
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
 Thu, 26 Nov 2026 01:31:49 -0600
From: Lee Youngjoon <getfeus@gmail.com>
In-Reply-To: <CA+m4KrA14J-3ovbau1EGjvwc1R4Maya3wzqD+n-_khotDhcRFQ@mail.gmail.com>
References: <CA+m4KrA14J-3ovbau1EGjvwc1R4Maya3wzqD+n-_khotDhcRFQ@mail.gmail.com>
Date: Thu, 26 Nov 2026 02:31:51 -0500
X-Gm-Features: Aa3M54oA9oN8u4sV-Du88QoM3YccpjHOJyvBkBEekJZag8MEC9gciwwnBEJGyKA
Message-ID: <CA+m4KrCZLr77+p4afs28pKy11GOVTbLmKyqHmPOpD38Lvodsmw@mail.gmail.com>
Subject: [PATCH v1 1/2] usb: typec: ucsi: gaokun: Distinguish empty updates
 from EC errors
To: Pengyu Luo <mitltlatltl@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

A failed port-register read returns the same sentinel as an empty update
mask. The USB notification handler then acknowledges an update even
though it has no valid register contents. Refresh also overwrites the
port count that bounds the array allocated at probe.

Check the initial port count against the register layout and retain that
count for the lifetime of the device. Reject inconsistent counts and
out-of-range mask bits before updating a port. Return a connector number
for a valid update, zero for an empty mask, or a negative error.

Keep the empty acknowledgment for a genuine USB event. When handling a
connector timeout, consume an update only if it belongs to that connector.

Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 55 +++++++++++++--------
 1 file changed, 35 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index 56f8bbab9..d4c66de48 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -273,23 +273,29 @@ static void gaokun_ucsi_port_update(struct
gaokun_ucsi_port *port,
 	spin_unlock_irqrestore(&port->lock, flags);
 }

-static int gaokun_ucsi_refresh(struct gaokun_ucsi *uec)
+/* Return a one-based connector number, zero for an empty mask, or an errno. */
+static int gaokun_ucsi_refresh(struct gaokun_ucsi *uec, int expected)
 {
-	struct gaokun_ucsi_reg ureg;
+	struct gaokun_ucsi_reg reg;
 	int ret, idx;

-	ret = gaokun_ec_ucsi_get_reg(uec->ec, &ureg);
+	ret = gaokun_ec_ucsi_get_reg(uec->ec, &reg);
 	if (ret)
-		return GAOKUN_UCSI_NO_PORT_UPDATE;
+		return ret < 0 ? ret : -EIO;
+	if (reg.num_ports != uec->num_ports)
+		return -EIO;

-	uec->num_ports = ureg.num_ports;
-	idx = GET_IDX(ureg.port_updt);
+	if (!reg.port_updt)
+		return 0;
+	if (reg.port_updt & ~(BIT(reg.num_ports) - 1))
+		return -EPROTO;

-	if (idx < 0 || idx >= ureg.num_ports)
-		return GAOKUN_UCSI_NO_PORT_UPDATE;
+	idx = expected >= 0 ? expected : GET_IDX(reg.port_updt);
+	if (idx < 0 || idx >= uec->num_ports || !(reg.port_updt & BIT(idx)))
+		return -ENODATA;

-	gaokun_ucsi_port_update(&uec->ports[idx], ureg.port_data);
-	return idx;
+	gaokun_ucsi_port_update(&uec->ports[idx], reg.port_data);
+	return idx + 1;
 }

 static void gaokun_ucsi_handle_usb_mode(struct gaokun_ucsi_port *port)
@@ -324,20 +330,20 @@ static void gaokun_ucsi_handle_usb_mode(struct
gaokun_ucsi_port *port)
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-static void gaokun_ucsi_usb_notify_ind(struct gaokun_ucsi *uec)
+static void gaokun_ucsi_usb_notify_ind(struct gaokun_ucsi *uec, int expected)
 {
-	int idx;
+	int num;

 	if (!uec->ucsi->connector) { /* slow to register */
 		dev_err_ratelimited(uec->dev, "ucsi connector is not initialized yet\n");
 		return;
 	}

-	idx = gaokun_ucsi_refresh(uec);
-	if (idx == GAOKUN_UCSI_NO_PORT_UPDATE)
-		gaokun_ec_ucsi_pan_ack(uec->ec, idx); /* ack directly if no update */
-	else
-		gaokun_ucsi_handle_usb_mode(&uec->ports[idx]);
+	num = gaokun_ucsi_refresh(uec, expected);
+	if (!num && expected == GAOKUN_UCSI_NO_PORT_UPDATE)
+		gaokun_ec_ucsi_pan_ack(uec->ec, GAOKUN_UCSI_NO_PORT_UPDATE);
+	else if (num > 0)
+		gaokun_ucsi_handle_usb_mode(&uec->ports[num - 1]);
 }

 /*
@@ -366,10 +372,13 @@ static void
gaokun_ucsi_handle_no_usb_event(struct gaokun_ucsi *uec, int idx)
 {
 	struct gaokun_ucsi_port *port;

+	if (idx < 0 || idx >= uec->num_ports)
+		return;
+
 	port = &uec->ports[idx];
 	if (!wait_for_completion_timeout(&port->usb_ack, 2 * HZ)) {
 		dev_warn(uec->dev, "No USB EVENT, triggered by UCSI EVENT");
-		gaokun_ucsi_usb_notify_ind(uec);
+		gaokun_ucsi_usb_notify_ind(uec, idx);
 	}
 }

@@ -383,7 +392,7 @@ static int gaokun_ucsi_notify(struct notifier_block *nb,
 	switch (action) {
 	case EC_EVENT_USB:
 		gaokun_ucsi_complete_usb_ack(uec);
-		gaokun_ucsi_usb_notify_ind(uec);
+		gaokun_ucsi_usb_notify_ind(uec, GAOKUN_UCSI_NO_PORT_UPDATE);
 		return NOTIFY_OK;

 	case EC_EVENT_UCSI:
@@ -411,8 +420,14 @@ static int gaokun_ucsi_ports_init(struct gaokun_ucsi *uec)
 	int i, ret, num_ports;
 	u32 port;

-	gaokun_ec_ucsi_get_reg(uec->ec, &ureg);
+	ret = gaokun_ec_ucsi_get_reg(uec->ec, &ureg);
+	if (ret)
+		return ret < 0 ? ret : -EIO;
 	num_ports = ureg.num_ports;
+	if (!num_ports || num_ports > ARRAY_SIZE(ureg.port_data) / 2)
+		return -EINVAL;
+	uec->num_ports = num_ports;
+
 	uec->ports = devm_kzalloc_objs(dev, *uec->ports, num_ports);
 	if (!uec->ports)
 		return -ENOMEM;
