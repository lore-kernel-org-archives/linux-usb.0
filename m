Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704916;
	b=lu6rVX+e7eDgt3N+sSgIqoKZAA5jyvo0yT7fKi/KqreGBGqRqrtFNZrtHFI532Kcd2jr
	 QQU17OXM1JVzgIMlkiy/O8uH+7tk66e7PFOfm7T9w7XDFcjG80NcOxcX5AydSUdXkRmkX
	 EYzDlvKQusMClIOqV/V1STJ1nIeHEJ1b8WtpNk4K7gzj8a7mZrLCgv03h0o7yup8SHCxZ
	 6MYvfdy2gBLWQOprUONoSh+WyB2PjeQwDlqWaV2yYAbDV+DKZNKKr5XVSpMqsStgeL2hE
	 XvwTi1CSkvEnMt1AAgbaZCxUS2vjYS/K/ifVNLFgUpuO1t4DLb/rKLsn+PAmIUpjIpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=HFOZXn3SNhUjvpIBYknRBYgAw9YsYWk6kZ/ncm73rb8=;
	b=jSsf88J+GIYs7Jo63S2p6Vtek+vI+07szSaHJefzHyuMHVyMbeWFUBKXwtod7SOGo4fH
	 NsGhTwEdYX53UGbnDJ4SKzjMtGCrrd/pZWCzkHoY3/z9cQgWRY6GXgIkcofQ/s1tFfjEp
	 037i8CpW4MpZdZgdNnrED0pXUntfeMeTxRSWCfD1pQELARF242XN6CTr4orBM+EKTQ5UE
	 00Zv+SvM5vkHpbUu2H06ju+EEUNw4efeNleQpokdeZWXuwcZ1ibRj7eTjxf0ZK3i/hbmi
	 KKVOAvJ350NwusBEbaVxNTnZNtIniRc8Roq2eywOOOpIobnZdA2N9YVu2N5bWvPeCoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=xcuudCoq;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA99606C57F
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 11:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CA99606C57F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=xcuudCoq
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214af2076so30880955e9.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 03:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793704914; x=1794309714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HFOZXn3SNhUjvpIBYknRBYgAw9YsYWk6kZ/ncm73rb8=;
        b=xcuudCoqG4jJx8BrJBU6psSJCAYHuiz00EdNNYfy9FUsYQB/oaxD9Lu3kPrkHfZCjv
         1t30hoFU9kUrO7V/jhKwmSCDOSa0oCL5RQhDldB4Y82wzk2c3Id7+ym/QXBt4ouzOipr
         wUTR3FbmR6p+pZN4q3G69cnZa30YjJy1iSm5IAwepzUYCxpouKSm7yWzmsFLjE0dFDjb
         FW1ZRDAT4Tt0englgmmaoq2UNH2cd/ycKNJYmhDwUmyjtMvdfD2lPjGPC8njLJSPHgXn
         3t693chQHz89AWaBSJFN9TodB//0VnL3EFe4FirtRevY82M+5f1UGl3gqPVE4HJXVwvZ
         /mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704914; x=1794309714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HFOZXn3SNhUjvpIBYknRBYgAw9YsYWk6kZ/ncm73rb8=;
        b=zw7nDmgF9I/D+iTlMhimo2QEYfQ6UdaqRVMjYgtZffSb9hmw8AJexOXnmTc3tjrghe
         xFiRKN8a0uHgrjLfIa3Omxa0QNM6+I3cAGeqVwhtg4XO05U0VMbIXejUy5V1uk/ikV2i
         Gv2XnE1Dhd2uiw6vey0xQqbXNZ+3OreqDzSp7HWqPbQ2RPaw7ESlkvssJhjIOzEkDZ1x
         XQ2t2B0x2yrmX+clrxhsAh4fCeeecsQAGsUByZlT1G3dqsCv938RiCS+LZJxsdRxKgDR
         gEGwaaXd2mfbqcwyNrhNgLse0jNcntCBnQ7q/KgeDGxawYGjK3GIDGA3wFJPOrexeAaH
         q5dg==
X-Forwarded-Encrypted: i=1; AKwUvBxNdOW58dP5V83iSc7r4f4gPh8/znVpp85jOQHSykbKAP07l9qmoRgiBmkhJOdhZ16NyT3N1isBb2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1DACt6yhQZzpOwQTDkTOr+zHz3OGcMAsGKJYL9Q4Syhe9dgLx
	l/tSlcFlr8sF8zH8S5yt84Xt+q80Ek1U+iq8UtZ5bVF8JdTTtpppW7v1lK6X5is2574=
X-Gm-Gg: AYBFou3+qIRSLOEzvhV9sRvNpEG8+/NDxfWNtl01R5EPB2oFDKqVQFUsGD/YQCrGpMy
	lVs2kkqfIcEkOU4UH5thNbscy9pgwpbXR408ejAigC41KvRxm3RhaZ8eLlO5TI6h02v6k5s+9O7
	3bBidOFWduGzJ7AOIIVKtr5wJQtBhw6EPWkibEHnog103TS/0O2hOZwia38QxDhLwDNWjK+NBoM
	37tmk/sKV+E7pN6F/7qR7D6gSS+N2Z9fPaRESMx5W8VYmMZbtbI+J8oZbgQoZkMqe1LL5Vc4MFT
	3Gowf9GINAxEPJMxweNPbhyHeXzX1hz9qMrsu58X4WguP0Uu43BsfA4mIH9R703Zz6PX5Di8A+W
	Oz9lXLg5G3Jau96HsprCUOMhNhuSUktBDNbeR75bMt79YnXn5RQNRtfwepZ6U0EUP4sC4E6hn/T
	FwNrwyzDwKDQ+eqmHHUwwA2k5sw5WcNHUwXRMV0HTIB/nQb/Hp9MGwLuAjHMIWYil6vPn7gJVAJ
	+ZYk8/m7gmucEutxVuPMCfmr5vji0XpA4UePU7y8niIcZxxfSXzDkZFAA0m1PBZuMXjyRLFXaCG
	MFpptzH7z318uOd0CoIa9K3K7aodApK4ASoeH/3CeQ7OqsNogQcxB9tSySUVexZbj9p/C/TLtyK
	uKf4V3l+LSg==
X-Received: by 2002:a05:600c:3b2a:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4ac18a8882cmr293208605e9.32.1793704913916;
        Tue, 03 Nov 2026 03:21:53 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab3ea6a9sm76135345e9.15.2026.11.03.03.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:21:53 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 03 Nov 2026 15:21:26 +0400
Subject: [PATCH 5/5] usb: typec: fusb302: Enable SOP' communication
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
Message-Id: <20261103-husb311-cable-comm-v1-5-6217dabc1a85@flipper.net>
References: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
In-Reply-To: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 RD Babiera <rdbabiera@google.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4176; i=alchark@flipper.net;
 h=from:subject:message-id; bh=u3YRKSIAusUhQWKL+ejUcsU0YMLhRCqlwi/u+LvNCqs=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS9PHx04v7dIsdrPZWe3JDfce5y7SqliouTpypc4ftf9
 1wpS37bkY6JLAxiXAyWYoosc78tsZ1qxDdrl4fHV5g5rEwgQ6RFGhiAgIWBLzcxr9RIx0jPVNtQ
 z9BIx1jHiIGLUwCmeo0TI8Puu71pHz/8LzJ8JLvAUWlv92EemyPKOz+xbH37/nZQxJSDjAzrxV6
 pn/mpVd7DvdQ3PfLNrYlBAvpMD9UXek92uuJtHM0HAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Let TCPM discover e-marked cables through the FUSB302 and learn their
current and speed ratings.

Receive SOP' only while sourcing VCONN with PD reception on. Only the
VCONN Source talks to the cable plug, and acking the traffic between the
partner and the plug would collide with their own GoodCRC.

Switch SOP' reception off before VCONN or PD reception goes off and on
only once both are on. If that fails, log it instead of failing the
switch TCPM asked for: SOP' reception left off only costs cable
discovery, and left on with VCONN off makes the port ack the partner's
traffic with the cable plug until PD reception goes off, which beats
keeping VCONN or PD reception in a state TCPM did not request.

Tested on a FUSB302B as source with an e-marked 5A EPR cable. The
datasheet documents the auto-GoodCRC header bits for SOP only, but the
cable plug took the chip's acks to its SOP' replies without retrying.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/fusb302.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 8b3a2e095ef8..10f2dabf3318 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -725,6 +725,27 @@ static int tcpm_set_polarity(struct tcpc_dev *dev,
 	return 0;
 }
 
+/*
+ * Without VCONN from us, SOP' traffic is between the partner and the cable
+ * plug, and our GoodCRC would collide with theirs. So stop receiving SOP'
+ * before VCONN or PD reception goes off, and start only once both are on.
+ * Neither is worth failing the VCONN or PD reception switch over.
+ */
+static void fusb302_pd_set_sop_prime(struct fusb302_chip *chip, bool on)
+{
+	int ret;
+
+	if (on)
+		ret = fusb302_i2c_set_bits(chip, FUSB_REG_CONTROL1,
+					   FUSB_REG_CONTROL1_ENSOP1);
+	else
+		ret = fusb302_i2c_clear_bits(chip, FUSB_REG_CONTROL1,
+					     FUSB_REG_CONTROL1_ENSOP1);
+	if (ret < 0)
+		fusb302_log(chip, "cannot turn SOP' rx %s, ret=%d",
+			    str_on_off(on), ret);
+}
+
 static int tcpm_set_vconn(struct tcpc_dev *dev, bool on)
 {
 	struct fusb302_chip *chip = container_of(dev, struct fusb302_chip,
@@ -743,6 +764,8 @@ static int tcpm_set_vconn(struct tcpc_dev *dev, bool on)
 		switches0_data = (chip->cc_polarity == TYPEC_POLARITY_CC1) ?
 				 FUSB_REG_SWITCHES0_VCONN_CC2 :
 				 FUSB_REG_SWITCHES0_VCONN_CC1;
+	} else {
+		fusb302_pd_set_sop_prime(chip, false);
 	}
 	ret = fusb302_i2c_mask_write(chip, FUSB_REG_SWITCHES0,
 				     switches0_mask, switches0_data);
@@ -750,6 +773,9 @@ static int tcpm_set_vconn(struct tcpc_dev *dev, bool on)
 		goto done;
 	chip->vconn_on = on;
 	fusb302_log(chip, "vconn := %s", str_on_off(on));
+
+	if (on && chip->pd_rx_on)
+		fusb302_pd_set_sop_prime(chip, true);
 done:
 	mutex_unlock(&chip->lock);
 
@@ -848,6 +874,8 @@ static int tcpm_set_pd_rx(struct tcpc_dev *dev, bool on)
 		goto done;
 	}
 
+	if (!on)
+		fusb302_pd_set_sop_prime(chip, false);
 	ret = fusb302_pd_rx_flush(chip);
 	if (ret < 0) {
 		fusb302_log(chip, "cannot flush pd rx buffer, ret=%d", ret);
@@ -873,6 +901,9 @@ static int tcpm_set_pd_rx(struct tcpc_dev *dev, bool on)
 
 	chip->pd_rx_on = on;
 	fusb302_log(chip, "pd := %s", str_on_off(on));
+
+	if (on && chip->vconn_on)
+		fusb302_pd_set_sop_prime(chip, true);
 done:
 	mutex_unlock(&chip->lock);
 
@@ -1136,6 +1167,11 @@ static void fusb302_bc_lvl_handler_work(struct work_struct *work)
 	mutex_unlock(&chip->lock);
 }
 
+static bool tcpm_cable_comm_capable(struct tcpc_dev *dev)
+{
+	return true;
+}
+
 static void init_tcpc_dev(struct tcpc_dev *fusb302_tcpc_dev)
 {
 	fusb302_tcpc_dev->init = tcpm_init;
@@ -1150,6 +1186,7 @@ static void init_tcpc_dev(struct tcpc_dev *fusb302_tcpc_dev)
 	fusb302_tcpc_dev->set_roles = tcpm_set_roles;
 	fusb302_tcpc_dev->start_toggling = tcpm_start_toggling;
 	fusb302_tcpc_dev->pd_transmit = tcpm_pd_transmit;
+	fusb302_tcpc_dev->cable_comm_capable = tcpm_cable_comm_capable;
 }
 
 static const char * const cc_polarity_name[] = {

-- 
2.56.0

