Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559777;
	b=qspEis+cvaK6WfiSRHS0zmwUeuj1oI8mElfo9leCzx+MprvlDTiHJuvwUhjFJUAQ3z6q
	 h71jV/yVT2ttVBfWILpbOHkcPAJDkX3kF5SYDpNECGIeAmXl9jR7pp+ACPBCl8AUYosp1
	 9SzA1IgLIUdCBGwIzKqpHTHUIvEkIB9lJPbTgTu12Ve4haIjIFIQzasrGwbovvnBms1ms
	 LfQ8K12Rp6zy0OMHiuNYBSfpw1q1gW3uTNppUkSG22CXwOdN4HdTnQx9fvsA0B02/tl4F
	 bcCrGhJW/jMvPZspgNPsDL4lTH/OZ9FUEduiYKWcEvVn4T/chVgdKNOd29ijshKloog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WrNBo9B3xTaWzZ2y4HsHYSAlT4GX6v7az8VJ8ahlCBM=;
	b=CYeELov2Kdzmf97HpobjC6o50itApso7O4yphdqbmiImi8zhMHmnDtBXjlFoMOjXFul/
	 4dQqXdmMP5SBnG7GRLBJpGsW8vUuk4sNMadXABuVgfw+v3iDm9YQuFCX9llROBQvRl3cK
	 4CzHQvX+shZ+HSRu/tgzxKdcX/igj/0/9lFDosqi5rsphUAmsCx5db9I/TzOTCe/e6lZR
	 PMQI1mjYXcRdzzKuCwQRIhAF2MR7R6fCrY4Zan2MvGm9B2Ia115WTBmWbAkgIUF+AuQ9M
	 4u5gj5tB40uRAHIA6iZ71tgNxrqRGhHQ77JIilMT30gWZgFe8NaGyQ5AodxTGmGj3cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snX0b87J;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E6C606D925
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 08:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10E6C606D925
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snX0b87J
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so1462775eec.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 00:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559776; x=1795164576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WrNBo9B3xTaWzZ2y4HsHYSAlT4GX6v7az8VJ8ahlCBM=;
        b=snX0b87J11mFOBGzUo0ErJ+bzcVNZDZ7YklWw79SqbZh3awoGwBvddI6Fo3Zul737I
         wNBEAtSQKAXavoCVF9pE0//nBWYvMrFoCr3RHK/9yr6ysbLb07UlY9twA8iWpLnU+Xp/
         8vessBDoCKDVFaVTJc35ViAZub7IZLEbzBnqBiJ53SSc1YF8O0X0aeVw3FO5nFoMSOfV
         QtvkxMgJJHisKRUI0b59hk7fYHYkeX6w4eJMSmCR1mcMRFzGxc70Sb3wryyN1kqyLUkb
         OK5bNkQsuJ/CRG2GzfwcL3tCIHPIB/MeFKsmPh4UA6XdyTrglpVRbIXahFV5fs4v0kX/
         n57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559776; x=1795164576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WrNBo9B3xTaWzZ2y4HsHYSAlT4GX6v7az8VJ8ahlCBM=;
        b=vFAfaDPSwaxWLZD05CG8a2JsSGm2bXs9ZXdnQRxQmSOfUVLJ0Jd7O2LmXpEb+hAN9m
         42nNDe2l10ZLkGwnCE+YLHd6zkA/PCTw928stEdBb7JM5RW5Vim7GtReAEJCWUehRwqS
         PpqQKknxTc4EQGBKB5RfUt9kGpJA636AAagS5xjbYYYthsDuQgUdHpnldcPNaIaa6cGM
         /6UuO1I1OL679ozTTCVv6kZWcT3U5ghdNe1C/7a0fo9tPTgCplQd3ACy9jnV1AqAusx/
         LI0q6NWRK04FlLhTAy5x19p4rGEA5MlZBUW1Gy5oDsFozGhVD+Y3XChki3SrwSo71cTm
         vjog==
X-Forwarded-Encrypted: i=1; AL+hErGK/yEh34Q9ufVx23Jdx7N+h3OWQAvZJyFVBGaHZNOHsSXgcWq84ecfIFSgkiqFF1h5NutyvVA/lg0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IZA9DSblK1togCvvOxUtxzCg1ODmJ+7W0vASuaFbZZ72yglv8
	bWdc7itZfmy9FbQHqxRjcDOYUOPDZ1QdUe+7P/nt/gmqRcOvwp0txRzG
X-Gm-Gg: AYBFou2YPyPQojTwaz1hAoz+d4ztJndbGB94kN8uwdvwHPe47TVIn88QGcw+AnZ+eyR
	AzxLY1QX3yFwrg7u7uZUUJ16SPn809k5FLbYc8vW3LurPralHGBAjb97YIpPuFKN6xz4/UxwhSX
	nQju88zgPElw1/Y0NOzR5rakGfpp+33J6601ZfqCIjpAFcX1GKDiEOvmpztegg/KKgh0o+rFuCM
	DHCBUA29m5UNcMp4KwWt0OIhUCoKj/dHcjje5J6n4zJiGYOL0OOzzF0YIrLMHMzk5bra57my74q
	MRE54bA3+bu1fdyvzm8MBY3/nE+mXCNRUhw2yt4zOf022tq/dvNZmDhqCLtkT08TZfZ3BwmNPjv
	+8Vic16HILc9Zk3rhpVFtCct2Db8mNK+gXGOQTPzg469dXudPWdWo0gNJrtt8jdVxKYIExxhwFh
	c3qZ/NgXRsisDIRNb4xQAWtCkYuNdDFh+bxD3aIQaIqIhRlAZ+2+5YQOziY7EJdnwi9KiztRE7S
	GOfTYt2Q9HpVCn2soVpAcU34TYryEqrk6b49Dik2zdBKZweWS5jIZUAdlS3Bsn5MtX6jOp7R+cN
	XuGbcyRlWGWzsplKifpIGQJeUmNVjyaswB3LFy8xRVzxfw/j7C25OYdA6GSaTOpibd2nj+W/tf+
	E/KWNk5u9jHd0N0G44F451orroyGkWx/TaJhvN9OKa+k=
X-Received: by 2002:a05:7301:d189:b0:36e:2b8b:a09e with SMTP id 5a478bee46e88-3796740eaafmr1745784eec.34.1794559775582;
        Fri, 13 Nov 2026 00:49:35 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:38a8:0:1866])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm10946721eec.8.2026.11.13.00.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:49:35 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: badhri@google.com,
	groeck@chromium.org,
	xu.yang_2@oss.nxp.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] usb: typec: tcpci: acknowledge masked alerts and quiesce the IRQ
Date: Fri, 13 Nov 2026 16:49:28 +0800
Message-Id: <20261113084928.211885-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

tcpci_irq() reads TCPC_ALERT and uses the raw status for the event
callbacks, while only the IRQ return value is masked with
tcpci->alert_mask.  A masked alert is still latched in TCPC_ALERT even
though it does not assert Alert# (TCPCI spec 4.4.3), so the handler can
run TCPM callbacks for events that the port has masked.  More
importantly, controllers such as RT1711H enable additional alerts
(FAULT and RX_BUF_OVF) in TCPC_ALERT_MASK that are not part of the
generic software mask.  Dropping those bits before the acknowledge
write leaves a level-triggered Alert# asserted and can cause an IRQ
storm.

Acknowledge every non-RX_STATUS bit from the raw alert value, not only
the bits enabled in the software mask, then dispatch only the filtered
status.  RX_STATUS is still cleared only after the message has been
read successfully.

tcpci_remove() unregisters the TCPM port, which destroys its kthread
worker, while the devm-managed threaded IRQ can still be running and
queue work on that worker.  Disable the hardware mask first, so an
alert that fires during the write is still handled by the live TCPM
port; then publish the quiesced software state and use
synchronize_irq() to wait for handlers that already entered the normal
path.  A handler that runs in the quiesced state acknowledges latched
alerts without dispatching them to TCPM; when the alert register can be
read and acknowledged, this prevents a software-induced level-triggered
storm.  If the alert access itself fails, that is the existing
alert-read failure path; this change does not add an unbounded retry.

The IRQ handler can also call tcpm_tcpc_reset(), which calls
tcpci_init() and publishes the normal alert mask again.  Protect the
software mask with alert_mask_lock and an alerts_quiesced state:
tcpci_init() only publishes the mask while alerts are not quiesced.
Apply the same quiesce ordering on the probe error path when the final
ALERT_MASK enable write fails, including an attempt to disable the
hardware mask in case the controller partially accepted the failed
write.

The masked-status handling and the unquiesced teardown date back to the
original TCPCI driver.  The TCPM port worker was later migrated to
kthread_work, and the probe IRQ ordering was changed separately; the
Fixes tags record both origins.

A KASAN-enabled test reproduces a use-after-free when the IRQ
handler races with TCPM port removal. With this change, teardown
waits for the handler and no use-after-free is reported.

Fault-injection tests also cover masked alerts, reset during
removal, and failure to update the hardware alert mask. Real TCPCI
hardware and PD traffic remain untested.

Fixes: 74e656d6b055 ("staging: typec: Type-C Port Controller Interface driver (tcpci)")
Fixes: 862a9c0f6848 ("usb: typec: tcpci: fix NULL pointer issue on shared irq case")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Changes in v4:
- Acknowledge every non-RX_STATUS bit from the raw alert value before
  filtering; masked hardware alerts (e.g. RT1711H FAULT/RX_BUF_OVF) are
  cleared without being dispatched to TCPM.
- Add a quiesced IRQ path that acknowledges latched alerts without
  touching TCPM.  Disable the hardware mask first, then quiesce the
  software state, then synchronize_irq(); a failed hardware mask write
  does not leave a level-triggered line storming when the alert
  register can still be read and acknowledged.
- Attempt to disable the hardware mask on the probe enable-mask failure
  path as well, before quiescing.
- Handle ALERT read/acknowledge failures in the quiesced path without
  dispatching to TCPM; do not add an unbounded retry.
- Keep alert_mask_lock/alerts_quiesced so tcpci_init() cannot restore
  the mask during teardown.
- Update tests: RT1711H-style masked FAULT, masked TX acknowledgment,
  quiesced shared IRQ acknowledgment, probe partial mask acceptance,
  quiesced ALERT read/write failure; rerun reset-race, inject,
  postsync, maskfail, probefail, CC/TX/RX.

AI tools assisted with source review, patch iteration and test harness
development. The author reviewed the resulting code and test results.

v3: https://lore.kernel.org/r/20261112084014.2564834-1-shunsheng1218@gmail.com/
v2: https://lore.kernel.org/r/20261106091725.1334097-1-shunsheng1218@gmail.com/
v1: https://lore.kernel.org/r/179378589227.74015.8259496684787732118@gmail.com/

Test details (not part of the commit log):
- Unpatched: a handler parked in tcpm_cc_change()/kthread_queue_work()
  while the device is unbound produces a slab-use-after-free on the
  destroyed TCPM worker.
- Patched: synchronize_irq() waits for the parked handler; the handler
  queues on the still-live worker, then the worker is destroyed; no
  report.
- Normal CC, TX and RX events still reach the corresponding TCPM
  callbacks.
- Masked/unmasked mix: with TX_SUCCESS masked and CC unmasked in the
  same ALERT, only tcpm_cc_change() runs; the masked TX bit is
  acknowledged and cleared, not left latched.
- RT1711H-style masked FAULT: FAULT is acknowledged from the raw
  status, CC is dispatched, and the alert register is left clear.
- Shared IRQ after synchronize_irq(), with a stale alert: the quiesced
  handler acknowledges it, returns IRQ_HANDLED, and does not call
  TCPM.
- Hardware ALERT_MASK = 0 write forced to fail during removal, with a
  continuous alert stream: the quiesced handler acknowledges events
  but no TCPM callback runs after the worker is destroyed.
- Probe final enable-mask failure: quiesce before unregistering.
- Reset-race: the handler is parked in tcpci_init() while remove
  quiesces and waits; the guarded code keeps alert_mask at zero, a
  shared IRQ is acknowledged without TCPM, and no report appears.
- Probe final enable-mask failure with the hardware mask left non-zero:
  the error cleanup writes the mask back to zero before quiescing.
- Quiesced handler ALERT read failure returns IRQ_NONE; acknowledgment
  write failure returns IRQ_HANDLED; neither path dispatches to TCPM or
  touches the destroyed worker.

 drivers/usb/typec/tcpm/tcpci.c | 94 ++++++++++++++++++++++++++++++----
 1 file changed, 83 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 6717ac914c6a6..54a23776e838d 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -39,6 +39,8 @@ struct tcpci {
 	struct regmap *regmap;
 	unsigned int alert_mask;
 	unsigned int rx_type_mask;
+	spinlock_t alert_mask_lock; /* protects alert_mask and alerts_quiesced */
+	bool alerts_quiesced;
 
 	bool controls_vbus;
 
@@ -648,10 +650,21 @@ static bool tcpci_attempt_vconn_swap_discovery(struct tcpc_dev *tcpc)
 	return false;
 }
 
+static void tcpci_quiesce_alerts(struct tcpci *tcpci)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&tcpci->alert_mask_lock, flags);
+	tcpci->alerts_quiesced = true;
+	WRITE_ONCE(tcpci->alert_mask, 0);
+	spin_unlock_irqrestore(&tcpci->alert_mask_lock, flags);
+}
+
 static int tcpci_init(struct tcpc_dev *tcpc)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
 	unsigned long timeout = jiffies + msecs_to_jiffies(2000); /* XXX */
+	unsigned long flags;
 	unsigned int reg;
 	int ret;
 
@@ -710,29 +723,60 @@ static int tcpci_init(struct tcpc_dev *tcpc)
 			return ret;
 	}
 
-	tcpci->alert_mask = reg;
+	spin_lock_irqsave(&tcpci->alert_mask_lock, flags);
+	if (!tcpci->alerts_quiesced)
+		WRITE_ONCE(tcpci->alert_mask, reg);
+	spin_unlock_irqrestore(&tcpci->alert_mask_lock, flags);
 
 	return 0;
 }
 
 irqreturn_t tcpci_irq(struct tcpci *tcpci)
 {
-	u16 status;
+	u16 status = 0;
 	int ret;
-	int irq_ret;
+	int irq_ret = 0;
 	unsigned int raw;
 
-	tcpci_read16(tcpci, TCPC_ALERT, &status);
-	irq_ret = status & tcpci->alert_mask;
+	/*
+	 * During teardown, acknowledge a latched alert without dispatching
+	 * it to TCPM.  A level-triggered Alert# must not keep retriggering
+	 * after the software mask was cleared or the hardware mask write
+	 * failed; the port may already be going away.
+	 */
+	if (READ_ONCE(tcpci->alerts_quiesced)) {
+		ret = tcpci_read16(tcpci, TCPC_ALERT, &status);
+		if (ret < 0)
+			return IRQ_NONE;
+		if (status) {
+			ret = tcpci_write16(tcpci, TCPC_ALERT, status);
+			if (ret < 0)
+				return IRQ_HANDLED;
+			irq_ret = 1;
+		}
+		return IRQ_RETVAL(irq_ret);
+	}
+
+	if (!READ_ONCE(tcpci->alert_mask))
+		return IRQ_NONE;
 
-process_status:
 	/*
-	 * Clear alert status for everything except RX_STATUS, which shouldn't
-	 * be cleared until we have successfully retrieved message.
+	 * Acknowledge every non-RX_STATUS bit from the raw alert value, not
+	 * only the bits enabled in the software mask.  Some controllers
+	 * enable additional alerts in TCPC_ALERT_MASK (for example RT1711H
+	 * enables FAULT and RX_BUF_OVF); dropping those bits before the
+	 * write would leave a level-triggered Alert# asserted.  RX_STATUS is
+	 * cleared only after the message has been read successfully.
 	 */
+	tcpci_read16(tcpci, TCPC_ALERT, &status);
 	if (status & ~TCPC_ALERT_RX_STATUS)
 		tcpci_write16(tcpci, TCPC_ALERT,
 			      status & ~TCPC_ALERT_RX_STATUS);
+	irq_ret = status;
+
+	status &= READ_ONCE(tcpci->alert_mask);
+
+process_status:
 
 	if (status & TCPC_ALERT_CC_STATUS)
 		tcpm_cc_change(tcpci->port);
@@ -806,8 +850,13 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 		tcpm_pd_transmit_complete(tcpci->port, TCPC_TX_FAILED);
 
 	tcpci_read16(tcpci, TCPC_ALERT, &status);
+	if (status & ~TCPC_ALERT_RX_STATUS)
+		tcpci_write16(tcpci, TCPC_ALERT,
+			      status & ~TCPC_ALERT_RX_STATUS);
+	irq_ret |= status;
 
-	if (status & tcpci->alert_mask)
+	status &= READ_ONCE(tcpci->alert_mask);
+	if (status)
 		goto process_status;
 
 	return IRQ_RETVAL(irq_ret);
@@ -854,6 +903,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 	tcpci->dev = dev;
 	tcpci->data = data;
 	tcpci->regmap = data->regmap;
+	spin_lock_init(&tcpci->alert_mask_lock);
 
 	tcpci->tcpc.init = tcpci_init;
 	tcpci->tcpc.get_vbus = tcpci_get_vbus;
@@ -972,12 +1022,23 @@ static int tcpci_probe(struct i2c_client *client)
 	/* Enable chip interrupts at last */
 	err = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, chip->tcpci->alert_mask);
 	if (err < 0)
-		goto unregister_port;
+		goto quiesce_irq;
 
 	device_set_wakeup_capable(chip->tcpci->dev, true);
 
 	return 0;
 
+quiesce_irq:
+	/*
+	 * The enable write failed, but the controller may have accepted it
+	 * partially or kept a non-zero mask.  Try to disable the hardware
+	 * mask as well; keep the original probe error.
+	 */
+	if (tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, 0) < 0)
+		dev_warn(&client->dev,
+			 "Failed to disable alerts during probe cleanup\n");
+	tcpci_quiesce_alerts(chip->tcpci);
+	synchronize_irq(client->irq);
 unregister_port:
 	tcpci_unregister_port(chip->tcpci);
 	return err;
@@ -988,10 +1049,21 @@ static void tcpci_remove(struct i2c_client *client)
 	struct tcpci_chip *chip = i2c_get_clientdata(client);
 	int err;
 
-	/* Disable chip interrupts before unregistering port */
+	/*
+	 * Disable the hardware mask first: an alert that fires while this
+	 * write is in progress is still handled by the live TCPM port.
+	 * Then publish the quiesced software state.  If the hardware write
+	 * failed, tcpci_irq() still acknowledges latched alerts in the
+	 * quiesced state without dispatching them to TCPM; when the alert
+	 * register can be read and acknowledged, this prevents a software
+	 * induced level-triggered storm.  synchronize_irq() waits for
+	 * handlers that already entered the normal path.
+	 */
 	err = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, 0);
 	if (err < 0)
 		dev_warn(&client->dev, "Failed to disable irqs (%pe)\n", ERR_PTR(err));
+	tcpci_quiesce_alerts(chip->tcpci);
+	synchronize_irq(client->irq);
 
 	tcpci_unregister_port(chip->tcpci);
 }
-- 
2.34.1

