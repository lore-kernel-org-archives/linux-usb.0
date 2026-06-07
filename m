Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C5C2E7179
	for <linux-usb@vger.kernel.org>; Sun,  7 Jun 2026 10:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780827618; cv=none; b=j9GYSPSOQanPHaLsdtw/2RSh59/AI87psFNJRpasPx060TsDYKh8HulnLqT181GkWMHN9I+bmMBwo1DXUX7BJdI3aYMgY6H0ZfKccAytJiqBdsKq5lM3HDkjFmvaOpIGUkejkq88GLbWHvNhytHMm134NLRtteO2kqJsg0WaNcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780827618; c=relaxed/simple;
	bh=6UPUyR/iIrwRUAlQA+0uiaKnFim+086J02JKKx43t5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FhdgvWPVfDDWSlPI63rxvLAOvpLpFh3wwcgXzkppDtxXyGkucdXJyQX2ssBj4XD5Un2EYbdMM43ux3JR0OwiWp5TrLYsdTxHO6QYf3ywygEJNC/IulK8+bo5lUlNqjue6q3m5d24HklcrEwUq1y05hfJR2+iOpg8N1YwDXevxIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oOeFBdZA; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oOeFBdZA"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf3781ca51so33877655ad.0
        for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2026 03:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780827616; x=1781432416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4cYHoEnn8Lw9yUZnPqIqEGwANKak1fsk1XF/TKoC4MM=;
        b=oOeFBdZAXLKOyZGyxrBNOjPajauWwcwfs2N8oIJaGbEfOOq/FL81pIysXpDX4kbJH+
         yjQ83rIpVE0jlnkpQY9sTC2Q0BILFWVCIusoOqKY+PsxYoMc+7LZ14ImORcv3eXfPbE1
         uJsjCd+a3blEOjzTUdF/JK50UkvYk3UH8RGQZKC4haUDSoKyFnG//geFYnGVK8LCvp6s
         zow6PS5+EAncNbdBKzWZhx6fd09JkaWGIU62G0nwH/1sqvLqJsHhmQRJrLDqnfiVX5FM
         fa3PfnRkhvh4yay1qr2AOB3VsLF0koD+L0ACMRyCDX2p0/oK5u/ue/N+617cgJERtoBl
         6ZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780827616; x=1781432416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cYHoEnn8Lw9yUZnPqIqEGwANKak1fsk1XF/TKoC4MM=;
        b=VtPOrU0GhNJS4goKoKeJxr9LVUOboIbNPj0AWN8Dr7ThKta3PrUfHevbUy1ihsibt8
         3eJFTvWwKa9Rw1HNd0paugPMUvpxr7r6GP3XotRra1hHH36kNIg2MkhzXZd80MBNPetQ
         wCaAjDJBd5AjCiel5nh1q+EajGK9MENpMmEywrjYb1gLRl/IV6BGOp9WLcpj4eff9jBC
         TaQbl4z6vbo3WVb9nEIzv2rscnc7FFHfLz1f5Nu5s4enTqrloihh0nX8sOILNwPlyHTV
         4XiuQ0tqrKX2d2gwhGkjmbi2hpqSIYOpYPKe/VTsK6e+ybcSyl608K62Qd0FDb/CvxZZ
         raNA==
X-Gm-Message-State: AOJu0YwGl1Ie/xJfgAIgcAg1IAb/zdwwSi1RGeW5rNnO5hD5UaatMqcv
	YCd2c7kkLoYVSsDC85WiMNZgY5DQi/TM5yM/qKwul0mOQUMSe93U92F5
X-Gm-Gg: Acq92OFFS7meBjUBdrzltbr2vgGabKewfphdoz6BbDP5kjZpLUq3ctHuC2lt3OW4Aqr
	38j2ayF81GVPm7iL3TNMB/vG7hKt0Hsxdxtnft9nyrfXz0Jjm6m+MMatFiubPhLvA79BfypKyKB
	T8zBcIaWeo++nEmTE8SXaSqQMV0I53HkRI3RiDFlKPxEIaxReyyoTMPpELSBaYi65h0PPFqqvNi
	8aX+4zjj6w3mWPEVyMtf/1LlJvMQ5PCQj+SrTJy22jQP2yJJsvrQSHFZqDEllWb1UphnG5avWjT
	0oLosWiEtKW4QSjEBRQJvZdVLZSvUyJmYtMr+nVcdi6g2H1UJW+o6yM2Kinw65KcSI6c02MFxGG
	wPi/wTxn7KvnRW3A3fvFGWiBOLSnBhSyvzpgXAt6RbJcwPpMEh/s/agTX80snTuHGZEU8txtc0x
	0MXgUTjEv/MQnHZaZhr9eL7z1zNfwImIM=
X-Received: by 2002:a17:902:f603:b0:2c0:b932:8680 with SMTP id d9443c01a7336-2c1e7e3f22cmr132901695ad.10.1780827615986;
        Sun, 07 Jun 2026 03:20:15 -0700 (PDT)
Received: from nuvole ([2001:19f0:8001:53c:5400:4ff:fe86:d241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm143424675ad.40.2026.06.07.03.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 03:20:15 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Pengyu Luo <mitltlatltl@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: ucsi: huawei_gaokun: support mode switching
Date: Sun,  7 Jun 2026 18:18:44 +0800
Message-ID: <20260607101844.820064-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB PHY (QMP Combo PHY) is always initialized in USB3+DP mode. In
the past, there was no MUX, and it was unnecessary to set it, since
MSM only supported 2-lane DP. But now, MST and 4-lane DP support has
been added to MSM, and a MUX has been added to the PHY. To support
4-lane DP and mode switching for gaokun, get the MUX and set it.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 55 +++++++++++++++------
 1 file changed, 41 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index c5965656baba..95b7b77b726d 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -18,6 +18,7 @@
 #include <linux/usb/pd_vdo.h>
 #include <linux/usb/typec_altmode.h>
 #include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
 #include <linux/workqueue_types.h>
 
 #include "ucsi.h"
@@ -82,6 +83,8 @@ struct gaokun_ucsi_port {
 	struct gaokun_ucsi *ucsi;
 	struct auxiliary_device *bridge;
 
+	struct typec_mux *typec_mux;
+
 	int idx;
 	enum gaokun_ucsi_ccx ccx;
 	enum gaokun_ucsi_mux mux;
@@ -226,19 +229,18 @@ static void gaokun_ucsi_port_update(struct gaokun_ucsi_port *port,
 	port->hpd_state = FIELD_GET(GAOKUN_HPD_STATE_MASK, ddi);
 	port->hpd_irq = FIELD_GET(GAOKUN_HPD_IRQ_MASK, ddi);
 
-	/* Mode and SVID are unused; keeping them to make things clearer */
 	switch (port->mode) {
 	case USBC_DPAM_PAN_C:
 	case USBC_DPAM_PAN_C_REVERSE:
-		port->mode = DP_PIN_ASSIGN_C; /* correct it for usb later */
+		port->mode = TYPEC_DP_STATE_C; /* correct it for usb later */
 		break;
 	case USBC_DPAM_PAN_D:
 	case USBC_DPAM_PAN_D_REVERSE:
-		port->mode = DP_PIN_ASSIGN_D;
+		port->mode = TYPEC_DP_STATE_D;
 		break;
 	case USBC_DPAM_PAN_E:
 	case USBC_DPAM_PAN_E_REVERSE:
-		port->mode = DP_PIN_ASSIGN_E;
+		port->mode = TYPEC_DP_STATE_E;
 		break;
 	case USBC_DPAM_PAN_NONE:
 		port->mode = TYPEC_STATE_SAFE;
@@ -287,18 +289,32 @@ static int gaokun_ucsi_refresh(struct gaokun_ucsi *uec)
 	return idx;
 }
 
-static void gaokun_ucsi_handle_altmode(struct gaokun_ucsi_port *port)
+static void gaokun_ucsi_handle_usb_mode(struct gaokun_ucsi_port *port)
 {
 	struct gaokun_ucsi *uec = port->ucsi;
-	int idx = port->idx;
-
-	if (idx >= uec->ucsi->cap.num_connectors) {
+	struct typec_mux_state state = {};
+	struct typec_altmode dp_alt = {};
+	int idx = port->idx, ret;
+
+	/*
+	 * For every typec port on this platform, the only mode-switch is
+	 * controlled by its qmp combo phy which consumes svid and mode only.
+	 */
+	dp_alt.svid = port->svid;
+	state.mode = port->mode;
+	state.alt = &dp_alt;
+
+	if (idx >= uec->num_ports) {
 		dev_warn(uec->dev, "altmode port out of range: %d\n", idx);
 		return;
 	}
 
+	ret = typec_mux_set(port->typec_mux, &state);
+	if (ret)
+		dev_err(uec->dev, "failed to set mux %d\n", ret);
+
 	/* UCSI callback .connector_status() have set orientation */
-	if (port->bridge)
+	if (port->bridge && port->svid == USB_TYPEC_DP_SID)
 		drm_aux_hpd_bridge_notify(&port->bridge->dev,
 					  port->hpd_state ?
 					  connector_status_connected :
@@ -307,7 +323,7 @@ static void gaokun_ucsi_handle_altmode(struct gaokun_ucsi_port *port)
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }
 
-static void gaokun_ucsi_altmode_notify_ind(struct gaokun_ucsi *uec)
+static void gaokun_ucsi_usb_notify_ind(struct gaokun_ucsi *uec)
 {
 	int idx;
 
@@ -320,7 +336,7 @@ static void gaokun_ucsi_altmode_notify_ind(struct gaokun_ucsi *uec)
 	if (idx == GAOKUN_UCSI_NO_PORT_UPDATE)
 		gaokun_ec_ucsi_pan_ack(uec->ec, idx); /* ack directly if no update */
 	else
-		gaokun_ucsi_handle_altmode(&uec->ports[idx]);
+		gaokun_ucsi_handle_usb_mode(&uec->ports[idx]);
 }
 
 /*
@@ -352,7 +368,7 @@ static void gaokun_ucsi_handle_no_usb_event(struct gaokun_ucsi *uec, int idx)
 	port = &uec->ports[idx];
 	if (!wait_for_completion_timeout(&port->usb_ack, 2 * HZ)) {
 		dev_warn(uec->dev, "No USB EVENT, triggered by UCSI EVENT");
-		gaokun_ucsi_altmode_notify_ind(uec);
+		gaokun_ucsi_usb_notify_ind(uec);
 	}
 }
 
@@ -366,7 +382,7 @@ static int gaokun_ucsi_notify(struct notifier_block *nb,
 	switch (action) {
 	case EC_EVENT_USB:
 		gaokun_ucsi_complete_usb_ack(uec);
-		gaokun_ucsi_altmode_notify_ind(uec);
+		gaokun_ucsi_usb_notify_ind(uec);
 		return NOTIFY_OK;
 
 	case EC_EVENT_UCSI:
@@ -429,8 +445,15 @@ static int gaokun_ucsi_ports_init(struct gaokun_ucsi *uec)
 			fwnode_handle_put(fwnode);
 			return PTR_ERR(ucsi_port->bridge);
 		}
-	}
 
+		ucsi_port->typec_mux = fwnode_typec_mux_get(fwnode);
+		if (IS_ERR(ucsi_port->typec_mux)) {
+			fwnode_handle_put(fwnode);
+			return dev_err_probe(dev, PTR_ERR(ucsi_port->typec_mux),
+					     "failed to acquire mode-switch for port: %d\n",
+					     port);
+		}
+	}
 	for (i = 0; i < num_ports; i++) {
 		if (!uec->ports[i].bridge)
 			continue;
@@ -502,10 +525,14 @@ static int gaokun_ucsi_probe(struct auxiliary_device *adev,
 static void gaokun_ucsi_remove(struct auxiliary_device *adev)
 {
 	struct gaokun_ucsi *uec = auxiliary_get_drvdata(adev);
+	int i;
 
 	disable_delayed_work_sync(&uec->work);
 	gaokun_ec_unregister_notify(uec->ec, &uec->nb);
 	ucsi_unregister(uec->ucsi);
+	for (i = 0; i < uec->num_ports; ++i)
+		typec_mux_put(uec->ports[i].typec_mux);
+
 	ucsi_destroy(uec->ucsi);
 }
 
-- 
2.54.0

