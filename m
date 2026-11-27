Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776074;
	b=SaVZIKkzKsc8RnEQ5X5RZI72qlahKkZxpcC3gJNvGX0FPzXwVz3jNP/UJSmcDOZOUrjX
	 ncRs0N7ZQuzdAl8TW4yX3lFKJNz/y0dnQxgI2r3USAAJBG0tfEG2cNmbQ2Xu9zFBIffX6
	 l3AHM6KVffqpXoBKjsTJLfo/0CGMZOcEETdek/J2J5kq34b1JiNDzPazlQ4hS+Fu5NCsX
	 5yqaVoQrWpisbA/+p0NwSDY5UMDHBkDEnYmmSHMD1M/O1aRDwyVF0IjJQOuOWF8/PvLxB
	 4mEGDuKRM82rCqkUYuYea16VCnPh3f6K3g+G0D4yw6FUN2ytXg6p6+O8Gu+xxXntrCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Zmf4XcDXfboU/T9y5AMJJTmhBSrigNgaynjSxc93C/M=;
	b=Tk5DE6P2dfXR/orFHrQlHTyi8Mo4kNeKCewwK+FZoxakBD1WvP+48hC1T4R/xF0JloPA
	 u3c2Bs6UaTPTTVu8SC4CvGT0eQAswqkEXEFE335JGvq4stuTFMhAbrCOltFOnE+xGWOF2
	 YSC1QCld/k62y02nMhF04Gzn2gOy+tymptd1FICRvHSXqKUpJ6yGaCmu0c64tgjtn17wi
	 qyrnFu5BlWzDWp8qpmkBBA2y4kuVmNlWBrqil1rAcyHAWnGhJoLL053BV28tps0rDWjqC
	 1VYSQI9QHXvAIr/1oSQyIyU/uhnj0EnE+IPK/OvCK6AgjhnjT3zfHDTltt3deFyyJCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=vtkykRFP;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2823560A260F
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 10:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2823560A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=vtkykRFP
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-497614c95f0so4523093f8f.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 02:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795776071; x=1796380871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zmf4XcDXfboU/T9y5AMJJTmhBSrigNgaynjSxc93C/M=;
        b=vtkykRFP8vKE8AHXcPsm9F+p5mpxtnM8OZ+bhdGSCw5LDzi+lqBL8Znkx7dJ/r27Y5
         OY4jLrfGWapYGgKIDGG1h0ml+GkcDgrzQNTXi08DCZ3ZP09dMbH+59LKQmUz6jmGfaRD
         2gCuZPaFCMl+YT3kMVInYoLoXDOAebN8itzNpzoxWYqNGlY+EiTNR6fZBt2ag4Mb64fe
         itbf6G1bkl01/U4Xiw2E1Th1gg8fjxG14CVEZsv510jsWL1eCuhRUS1F9ZosEMif5h+Q
         G29+iib0+BF2VY51ruL8K4TBA27NDUpCS+bR4uM666daJytTDy9rvcBWFVtrQMw3JBnX
         q6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776071; x=1796380871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zmf4XcDXfboU/T9y5AMJJTmhBSrigNgaynjSxc93C/M=;
        b=27k5lMgW8JK2tXdDKB2NPcE5yWuMgqPbVFsPEMZW8GUU/W96Ib0ryMaeMyDbPsThb+
         VNErl1HxkXVPcVajprB9mRyhpChRiYZLIwtFri2xQ37ZRsG9gj11hUSOT1HOOLO+oOij
         FnCEyFkLH6v2wv5Rq5BGk8J0Hn8JtTMoIpUhA3js1CkBWWNzns5X+/gAzZU/DT3FEaAZ
         wXMTrLi+91ffAA9BdXzKjQMmHAILLGGl7PYW+odn+gOjeKhE8zdv+7O7WepT23UrpNC4
         RwUGpfM2QbGdJzk9J5O+1Q+ip4yN7gRmXDDWPtCPYKQ1RBcN+aJo0inGS9GiwAQiJP+D
         HVyA==
X-Forwarded-Encrypted: i=1; AL+hErHrTSWYy4cJJ3e4DxH4MpVOeZn3J77vD+T+0i516p3pFS4+MmJo41lhJ9J6f/NKBehSt2w5mJ5XQnE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7gTjdGz8N5mdOa5pl9KGXUNA78QY5R6x1YYURR9Ng4kN7feik
	JwHIdjdNbPYaZOuFL7Sq579+q7ltBJ/3ygKqqzFGJY1YlxjBj0FVkk5mKny8HviNtGU=
X-Gm-Gg: AZFdTZc2ILN52rvq2g2ABXcUJ83VY9YWBC2+/E5Kc0Anr3nlT2+NO1Zuuc9cOJT2sSu
	AiCzi5VhbhgHFiPV55AuQXA6Upu6gH/pBbmMHDf9wZ5Rlwc0z4gaAhohFUxcpNJcz51YR0X9rCl
	yBO9Ednw7W0qOkJJ8uYlt/7limmKDy+Gih2bLrwCidYnt5n5L6WkxGAhThtWpyo4uU12C45yvsj
	0jtWq90JvJllXXwxK5726tHCKhKL3gWLjLnTk5FjKJvoRTX809RbsEn/0Lh4MRVvao6Jkw7629U
	THJctDDVnfA+s/Uqvum+vVu7BJMix2yqAl6eA0/khd2JDlqYB1f0eAM8Nkrm/Ax9Myh0MiHCCqW
	P6lsBff7mXOEBcC5jlnXWsRsnl8N4EWaZuCf2YTPg7ujW6vFCcB14/nZx1H8ECmSW9guhki6TDI
	gS2mfB/AjjPxvhKhEUTX0yUwe8qIoVxLN4BGU9ecnq+4KkjE6cn4YEa/MTc1CdCtCIDcQrgN9vS
	XJVRoe97UcuCe6hGr5INh/qlg30zyjlTPwz8ytPbLfI7gfXw/3oRz48ziyyoF7CauIwCi0idgBL
	5kmKGfXKJVasn+rcRoowyD+ygugs9EehD9Y+VvwSIu3oggsoDu6U32GW4/2RpUqEB7/60XMVmcx
	iXVPrAfPUbo/yJApx5giFf3zilFpcH6s=
X-Received: by 2002:a05:6000:186e:b0:487:6f2:1a4c with SMTP id ffacd0b85a97d-4abb225ebacmr47619848f8f.25.1795776071298;
        Fri, 27 Nov 2026 02:41:11 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm45597649f8f.32.2026.11.27.02.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:41:11 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 27 Nov 2026 14:40:51 +0400
Subject: [PATCH v2 6/6] usb: typec: fusb302: Acknowledge
 Get_Source_Cap_Extended in time
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
Message-Id: <20261127-fusb302-getsourcecap-v2-6-6770eb1e7945@flipper.net>
References: <20261127-fusb302-getsourcecap-v2-0-6770eb1e7945@flipper.net>
In-Reply-To: <20261127-fusb302-getsourcecap-v2-0-6770eb1e7945@flipper.net>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Yueyao Zhu <yueyao@google.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=19958; i=alchark@flipper.net;
 h=from:subject:message-id; bh=d7Hu6OQEpFwkxB2/4qB3Ibobia8rYCJ3xfjDmCsEfRc=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRzxpnnFy4yajX3mDr32b/NlkeuND/6VfRl98342oTlL
 v47dt451zGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBUbzVi+Ctg6SK0h+fJ009OanYcymZbfexaD558zui/aYUyy/qJHx8w/FM5t+L
 S1rMPtk0onBjJcXG6z89pW5Veh3h2vHjuJKlZt4MDAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The GoodCRC the driver sends to a Get_Source_Cap_Extended goes out
2.2-2.8ms after the interrupt, as reading the interrupt and status
registers, waiting for CC to go idle and then reading the RX FIFO over a
400kHz I2C bus takes that long, while it is due within 195us (tTransmit).
Some partners don't accept it as the GoodCRC to a retry either: an iPhone
17 Pro as a source retries 1ms after each attempt ends, and soft resets
after the last one, then hard resets, cutting VBUS each time.

Read STATUS0, STATUS1, INTERRUPT and the head of the RX FIFO in a single
transfer first thing in the interrupt handler, as the register address
increments up to the FIFO and stays there, and acknowledge a
Get_Source_Cap_Extended at once if the FIFO starts with one, before its
CRC is in. Keep the GoodCRC to the partner's next message staged in the
TX FIFO, except the TXON that sends it, so that sending it takes a single
byte write, and flush it before anything else goes into the TX FIFO.
Neither the single read nor the staged GoodCRC gets the GoodCRC out in
time on its own.

The cost is one more I2C transfer per interrupt with PD on, a flush and a
FIFO write after each message received, and a flush before each
transmission with a GoodCRC staged. All of those fall in less time
critical paths, as the PD specification leaves ample time for processing
other than sending out the GoodCRC.

As the FIFO is read without waiting for CC to go idle, a packet may be
landing meanwhile, and an empty FIFO reads as 0 while keeping the bytes
still to come. Keep only the bytes that are not 0 then, as neither the
token nor the first header byte ever is, and check the CRC to distinguish
a genuinely zero second header byte (which only a sink sends), from a
bogus one created by an empty FIFO. That leaves a Get_Source_Cap_Extended
from a sink with MessageID 0 acknowledged only once its CRC is in, should
the read find CC busy again. Don't read beyond the header, as no rule can
distinguish bogus zero bytes from real ones for the rest of the message.

On a Rockchip RK3576 board, the GoodCRC now goes out 0.4-0.9ms after
the interrupt, and the iPhone accepted all 32 of them, where 118 of 119
had drawn a Soft_Reset before. Of over 26,000 Pings flooded at the
driver as a sink and as a source, none got lost.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/fusb302.c | 321 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 304 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index c98a74fc7a2a..bdba2169ec0f 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -146,6 +146,21 @@ struct fusb302_chip {
 	bool rx_buf_only;
 	/* Drop the messages read: no GoodCRC went out for them */
 	bool rx_discard;
+	/*
+	 * rx_buf holds a token and valid header byte[0], while the header
+	 * byte[1] got read as 0, which might be bogus. See fusb302_pd_rx_keep()
+	 */
+	bool rx_h1_unsure;
+	/* MessageID of the partner's last SOP message, -1 if none since reset */
+	s8 rx_last_msgid;
+	/*
+	 * TX FIFO contains a pre-staged GoodCRC to the partner's next message,
+	 * with predicted MessageID = staged_msgid. See fusb302_pd_stage_ack()
+	 */
+	bool staged;
+	u8 staged_msgid;
+	/* A GoodCRC the driver sent may still be going out on CC */
+	bool ack_on_cc;
 	bool vbus_present;
 	enum typec_cc_polarity cc_polarity;
 	enum typec_cc_status cc1;
@@ -880,6 +895,7 @@ static void fusb302_pd_rx_reset(struct fusb302_chip *chip, bool cut_short)
 	chip->rx_len = 0;
 	chip->rx_resync = cut_short;
 	chip->rx_acked = false;
+	chip->rx_h1_unsure = false;
 }
 
 static int fusb302_pd_set_auto_goodcrc(struct fusb302_chip *chip, bool on)
@@ -920,6 +936,7 @@ static int fusb302_pd_set_interrupts(struct fusb302_chip *chip, bool on)
 
 static int fusb302_pd_rx_start(struct fusb302_chip *chip);
 static void fusb302_pd_check_ack_async(struct fusb302_chip *chip);
+static int fusb302_pd_unstage_ack(struct fusb302_chip *chip);
 
 static int tcpm_set_pd_rx(struct tcpc_dev *dev, bool on)
 {
@@ -951,6 +968,9 @@ static int tcpm_set_pd_rx(struct tcpc_dev *dev, bool on)
 	}
 	/* Nothing flushed reports its outcome */
 	chip->tx_pending = false;
+	chip->staged = false;
+	chip->ack_on_cc = false;
+	chip->rx_last_msgid = -1;
 	ret = on ? fusb302_pd_rx_start(chip) :
 		   fusb302_pd_set_auto_goodcrc(chip, false);
 	if (ret < 0) {
@@ -1011,6 +1031,8 @@ static int tcpm_set_roles(struct tcpc_dev *dev, bool attached,
 	}
 	chip->pwr_role = pwr;
 	chip->data_role = data;
+	/* A GoodCRC staged before carries the old roles: never send it */
+	fusb302_pd_unstage_ack(chip);
 	fusb302_log(chip, "pd header := %s, %s", typec_role_name[pwr],
 		    typec_data_role_name[data]);
 done:
@@ -1072,12 +1094,14 @@ static const u8 fusb302_sop_tokens[][4] = {
 	},
 };
 
-static int fusb302_pd_send_message(struct fusb302_chip *chip,
+/*
+ * Fill buf with the TX FIFO bytes for msg, all but the TXON that sends them,
+ * and return how many
+ */
+static int fusb302_pd_pack_message(struct fusb302_chip *chip,
 				   enum tcpm_transmit_type type,
-				   const struct pd_message *msg)
+				   const struct pd_message *msg, u8 *buf)
 {
-	int ret = 0;
-	u8 buf[40];
 	u8 pos = 0;
 	int len;
 
@@ -1108,6 +1132,21 @@ static int fusb302_pd_send_message(struct fusb302_chip *chip,
 	buf[pos++] = FUSB302_TKN_EOP;
 	/* turn tx off after sending message */
 	buf[pos++] = FUSB302_TKN_TXOFF;
+
+	return pos;
+}
+
+static int fusb302_pd_send_message(struct fusb302_chip *chip,
+				   enum tcpm_transmit_type type,
+				   const struct pd_message *msg)
+{
+	int ret = 0;
+	u8 buf[40];
+	int pos;
+
+	pos = fusb302_pd_pack_message(chip, type, msg, buf);
+	if (pos < 0)
+		return pos;
 	/* start transmission */
 	buf[pos++] = FUSB302_TKN_TXON;
 
@@ -1115,11 +1154,41 @@ static int fusb302_pd_send_message(struct fusb302_chip *chip,
 	if (ret < 0)
 		return ret;
 	fusb302_log(chip, "sending PD message header: %x", msg->header);
-	fusb302_log(chip, "sending PD message len: %d", len);
+	fusb302_log(chip, "sending PD message len: %d",
+		    pd_header_cnt_le(msg->header) * 4);
 
 	return ret;
 }
 
+/*
+ * For staged_msgid: the TX FIFO may hold some of a GoodCRC, or one gone stale,
+ * which is never to be sent, only flushed
+ */
+#define FUSB302_STAGED_STALE	0xff
+
+/*
+ * Unstage a previously staged GoodCRC from the TX FIFO, as our circumstances
+ * have changed and we no longer want to send it. Should the flush fail, it is
+ * still there, to be flushed before anything else goes into the TX FIFO, but
+ * never sent.
+ */
+static int fusb302_pd_unstage_ack(struct fusb302_chip *chip)
+{
+	int ret;
+
+	if (!chip->staged)
+		return 0;
+	ret = fusb302_pd_tx_flush(chip);
+	if (ret < 0) {
+		chip->staged_msgid = FUSB302_STAGED_STALE;
+		fusb302_log(chip, "cannot flush staged GoodCRC, ret=%d", ret);
+		return ret;
+	}
+	chip->staged = false;
+
+	return 0;
+}
+
 static int fusb302_pd_send_hardreset(struct fusb302_chip *chip)
 {
 	return fusb302_i2c_set_bits(chip, FUSB_REG_CONTROL3,
@@ -1152,6 +1221,10 @@ static int tcpm_pd_transmit(struct tcpc_dev *dev, enum tcpm_transmit_type type,
 	 */
 	fusb302_pd_check_ack_async(chip);
 	chip->ack_check = false;
+	/* Didn't need that GoodCRC we pre-staged in the FIFO - get rid of it */
+	ret = fusb302_pd_unstage_ack(chip);
+	if (ret < 0)
+		goto done;
 	switch (type) {
 	case TCPC_TX_SOP:
 	case TCPC_TX_SOP_PRIME:
@@ -1182,6 +1255,7 @@ static int tcpm_pd_transmit(struct tcpc_dev *dev, enum tcpm_transmit_type type,
 		chip->tx_pending = true;
 		chip->tx_start = ktime_get();
 	}
+done:
 	mutex_unlock(&chip->lock);
 
 	return ret;
@@ -1554,6 +1628,12 @@ static int fusb302_pd_reset(struct fusb302_chip *chip)
 {
 	/* What was read of a message before the reset is of no use after it */
 	fusb302_pd_rx_reset(chip, true);
+	/*
+	 * MessageIDs start over, so the staged GoodCRC is gone or stale. Should
+	 * the flush fail, it is never sent at least: see fusb302_pd_unstage_ack()
+	 */
+	chip->rx_last_msgid = -1;
+	fusb302_pd_unstage_ack(chip);
 
 	return fusb302_i2c_set_bits(chip, FUSB_REG_RESET,
 				    FUSB_REG_RESET_PD_RESET);
@@ -1617,9 +1697,8 @@ static bool fusb302_pd_tx_waiting(struct fusb302_chip *chip)
  * The chip only decodes the low four bits of the message type, so it mistakes
  * Get_Source_Cap_Extended (0x11) for a GoodCRC (0x1): it neither acknowledges
  * it nor raises GCRCSENT, only CRC_CHK, yet still queues it in the RX FIFO.
- * Send the GoodCRC from here once the message checks out. It goes out well
- * after 195us (tTransmit), but the partner retries with the same MessageID and
- * usually accepts it then, rather than soft reset over and over.
+ * Send the GoodCRC from here: from fusb302_pd_rx_fast_ack() as soon as the
+ * header is in, or else once the whole message checks out.
  */
 static void fusb302_pd_rx_ack(struct fusb302_chip *chip)
 {
@@ -1648,14 +1727,30 @@ static void fusb302_pd_rx_ack(struct fusb302_chip *chip)
 	 * sends as one that needs no GoodCRC in return, so it sends this one
 	 * once, without retries or RETRYFAIL, whatever the retry count is.
 	 */
-	ack.header = PD_HEADER_LE(PD_CTRL_GOOD_CRC, chip->pwr_role,
-				  chip->data_role, PD_REV20,
-				  pd_header_msgid(header), 0);
-	ret = fusb302_pd_send_message(chip, TCPC_TX_SOP, &ack);
-	if (ret >= 0)
+	if (chip->staged && chip->staged_msgid == pd_header_msgid(header)) {
+		ret = fusb302_i2c_write(chip, FUSB_REG_FIFOS,
+					FUSB302_TKN_TXON);
+		if (ret >= 0) {
+			chip->staged = false;
+			fusb302_log(chip, "sending staged GoodCRC, id %u",
+				    pd_header_msgid(header));
+		}
+	} else {
+		ret = fusb302_pd_unstage_ack(chip);
+		if (ret >= 0) {
+			ack.header = PD_HEADER_LE(PD_CTRL_GOOD_CRC,
+						  chip->pwr_role,
+						  chip->data_role, PD_REV20,
+						  pd_header_msgid(header), 0);
+			ret = fusb302_pd_send_message(chip, TCPC_TX_SOP, &ack);
+		}
+	}
+	if (ret >= 0) {
 		chip->ack_check = true;
-	else
+		chip->ack_on_cc = true;
+	} else {
 		fusb302_log(chip, "cannot acknowledge PD message, ret=%d", ret);
+	}
 }
 
 static void fusb302_pd_rx_drop(struct fusb302_chip *chip, int n)
@@ -1663,6 +1758,7 @@ static void fusb302_pd_rx_drop(struct fusb302_chip *chip, int n)
 	chip->rx_len -= n;
 	memmove(chip->rx_buf, chip->rx_buf + n, chip->rx_len);
 	chip->rx_acked = false;
+	chip->rx_h1_unsure = false;
 }
 
 static bool fusb302_pd_rx_is_token(u8 byte)
@@ -1707,6 +1803,50 @@ static int fusb302_pd_rx_find(struct fusb302_chip *chip)
 	return 0;
 }
 
+/*
+ * Append n header bytes that fusb302_pd_rx_fast_ack() read from the FIFO while
+ * a packet may have been landing to rx_buf. Reading an empty FIFO returns 0
+ * and takes nothing, so real bytes may come interleaved with such zeros. As
+ * neither the token nor header byte[0], which holds the message type, is ever
+ * 0, the real bytes are the non-zero ones. The only exception is header
+ * byte[1], which holds the power role or cable plug bit and is non-zero from
+ * a source or a cable plug, but may be 0 from a sink: leave that case to the
+ * CRC, see fusb302_pd_rx_resolve_h1().
+ */
+static void fusb302_pd_rx_keep(struct fusb302_chip *chip, const u8 *fifo,
+			       int n)
+{
+	int i;
+
+	for (i = 0; i < n; i++) {
+		if (fifo[i])
+			chip->rx_buf[chip->rx_len++] = fifo[i];
+		else if (chip->rx_len == 2 && chip->pwr_role == TYPEC_SOURCE &&
+			 (chip->rx_buf[0] & FUSB302_RX_TKN_MASK) ==
+			 FUSB302_RX_TKN_SOP)
+			chip->rx_h1_unsure = true;
+	}
+}
+
+/*
+ * rx_buf holds the token, header byte[0] and the 4 bytes that followed it in
+ * the FIFO. If header byte[1] was a real 0, those are the CRC of a message
+ * with no data objects. Otherwise we need to look for the real header byte[1]
+ * in the first of the bytes that followed the bogus 0.
+ */
+static void fusb302_pd_rx_resolve_h1(struct fusb302_chip *chip)
+{
+	u8 header[2] = { chip->rx_buf[1], 0 };
+
+	chip->rx_h1_unsure = false;
+	if (~crc32_le(~0U, header, sizeof(header)) !=
+	    get_unaligned_le32(chip->rx_buf + 2))
+		return;
+	memmove(chip->rx_buf + 3, chip->rx_buf + 2, chip->rx_len - 2);
+	chip->rx_buf[2] = 0;
+	chip->rx_len++;
+}
+
 /*
  * Read up to n more bytes into rx_buf and return how many. When the FIFO is in
  * step, rx_buf starts with a message the chip has received in full, so read the
@@ -1776,6 +1916,18 @@ static int fusb302_pd_read_message(struct fusb302_chip *chip)
 			fusb302_pd_rx_drop(chip, 1);
 			dropped++;
 		}
+		/* See fusb302_pd_rx_keep() */
+		if (chip->rx_h1_unsure) {
+			if (chip->rx_len < 6) {
+				ret = fusb302_pd_rx_read(chip, 6 - chip->rx_len);
+				if (ret < 0)
+					goto out;
+				if (ret)
+					continue;
+				goto out;
+			}
+			fusb302_pd_rx_resolve_h1(chip);
+		}
 		if (chip->rx_len < 3)
 			len = 3;
 		else
@@ -1834,12 +1986,14 @@ static int fusb302_pd_read_message(struct fusb302_chip *chip)
 	 * TX_SUCCESS and GCRCSENT events out of order on occasion, so we need
 	 * to check the message type to ensure correct reporting to TCPM.
 	 */
-	if (!len && pd_header_type_le(msg.header) == PD_CTRL_GOOD_CRC)
+	if (!len && pd_header_type_le(msg.header) == PD_CTRL_GOOD_CRC) {
 		fusb302_pd_tx_complete(chip, TCPC_TX_SUCCESS);
-	else if ((token & FUSB302_RX_TKN_MASK) == FUSB302_RX_TKN_SOP1)
+	} else if ((token & FUSB302_RX_TKN_MASK) == FUSB302_RX_TKN_SOP1) {
 		tcpm_pd_receive(chip->tcpm_port, &msg, TCPC_TX_SOP_PRIME);
-	else
+	} else {
+		chip->rx_last_msgid = pd_header_msgid_le(msg.header);
 		tcpm_pd_receive(chip->tcpm_port, &msg, TCPC_TX_SOP);
+	}
 out:
 	if (dropped)
 		fusb302_log(chip, "dropped %d bytes from the RX FIFO", dropped);
@@ -1965,6 +2119,65 @@ static int fusb302_pd_rx_drain(struct fusb302_chip *chip)
 	return 0;
 }
 
+/*
+ * Prepare a GoodCRC to be sent for the next message from the partner, so that
+ * it can be sent with only a TXON byte on the timing critical path. If it's not
+ * needed, it means we are in a less time constrained path and can afford to
+ * flush the TX FIFO and re-stage the correct message normally.
+ * See fusb302_pd_rx_fast_ack() for why that matters.
+ */
+static void fusb302_pd_stage_ack(struct fusb302_chip *chip)
+{
+	/* From 0 after a reset, as rx_last_msgid is -1 then */
+	u8 msgid = (chip->rx_last_msgid + 1) & 7;
+	struct pd_message ack = {};
+	u8 buf[40];
+	u8 status1;
+	int ret;
+	int pos;
+
+	/* While TCPM waits for its own message, that may still be in there */
+	if (!chip->pd_rx_on || fusb302_pd_tx_waiting(chip) ||
+	    (chip->staged && chip->staged_msgid == msgid))
+		return;
+
+	/*
+	 * Flushing the TX FIFO would cut short a GoodCRC from the driver still
+	 * going out: CC is busy until it is done. Leave staging for later if
+	 * CC stays busy.
+	 */
+	if (chip->ack_on_cc) {
+		ret = fusb302_wait_cc_idle(chip, &status1);
+		if (ret > 0)
+			return;
+		if (ret < 0)
+			goto err;
+		chip->ack_on_cc = false;
+	}
+
+	/*
+	 * Whatever is left in the TX FIFO would go out first, and should the
+	 * flush or the write fail, it holds what is never to be sent
+	 */
+	chip->staged = true;
+	chip->staged_msgid = FUSB302_STAGED_STALE;
+	ret = fusb302_pd_tx_flush(chip);
+	if (ret < 0)
+		goto err;
+
+	ack.header = PD_HEADER_LE(PD_CTRL_GOOD_CRC, chip->pwr_role,
+				  chip->data_role, PD_REV20, msgid, 0);
+	pos = fusb302_pd_pack_message(chip, TCPC_TX_SOP, &ack, buf);
+	ret = fusb302_i2c_block_write(chip, FUSB_REG_FIFOS, pos, buf);
+	if (ret < 0)
+		goto err;
+	chip->staged_msgid = msgid;
+
+	return;
+err:
+	fusb302_log(chip, "cannot stage GoodCRC, ret=%d", ret);
+}
+
 static void fusb302_pd_rx_recheck_work(struct work_struct *work)
 {
 	struct fusb302_chip *chip = container_of(work, struct fusb302_chip,
@@ -1978,6 +2191,8 @@ static void fusb302_pd_rx_recheck_work(struct work_struct *work)
 			fusb302_log(chip, "cannot read in PD message, ret=%d",
 				    ret);
 		fusb302_pd_check_ack_async(chip);
+		/* A message read here moves the next MessageID on */
+		fusb302_pd_stage_ack(chip);
 	}
 	mutex_unlock(&chip->lock);
 }
@@ -2120,6 +2335,75 @@ static int fusb302_read_interrupts(struct fusb302_chip *chip, u8 *status0)
 	return ret;
 }
 
+/*
+ * A GoodCRC is due within 195us (tTransmit) of the message, and the partner
+ * retries once 0.9-1.1ms (tReceive) pass without one. Reading the interrupt
+ * and status registers, waiting for CC to go idle and only then reading the
+ * RX FIFO takes far longer over I2C, so start by reading STATUS0, STATUS1,
+ * INTERRUPT and the head of the RX FIFO in a single transfer, as the address
+ * increments up to the FIFO and stays there, and acknowledge a
+ * Get_Source_Cap_Extended at once if the FIFO starts with one. Together with
+ * the GoodCRC staged in the TX FIFO, that makes it in time. This reads the
+ * FIFO without waiting for CC to go idle: see fusb302_pd_rx_keep() for the
+ * bytes still landing.
+ *
+ * The GoodCRC then goes out before the CRC of the message is in, as waiting
+ * for it would take past 195us (tTransmit). Should the CRC fail, the message is
+ * dropped as if the GoodCRC had not gone out, and the partner, which
+ * considers it delivered, soft resets when no answer comes, as it does when
+ * the message goes unacknowledged.
+ *
+ * A Get_Source_Cap_Extended from a sink with MessageID 0, every 8th from it,
+ * has a second header byte of 0, which a read that finds CC busy again can't
+ * tell from a byte still to come: that one is acknowledged once its CRC is in.
+ */
+static void fusb302_pd_rx_fast_ack(struct fusb302_chip *chip)
+{
+	u8 regs[6];
+	int ret, n, tries;
+
+	if (!chip->pd_rx_on)
+		return;
+
+	if (!chip->rx_len) {
+		ret = fusb302_i2c_block_read(chip, FUSB_REG_STATUS0,
+					     sizeof(regs), regs);
+		if (ret < 0)
+			return;
+		chip->pending_interrupt |= regs[2];
+		/* With ACTIVITY clear, the token is over 250us away */
+		if (regs[0] & FUSB_REG_STATUS0_ACTIVITY) {
+			fusb302_pd_rx_keep(chip, regs + 3, 3);
+		} else if (!(regs[1] & FUSB_REG_STATUS1_RX_EMPTY)) {
+			memcpy(chip->rx_buf, regs + 3, 3);
+			chip->rx_len = 3;
+		}
+		if (chip->rx_len && !fusb302_pd_rx_is_token(chip->rx_buf[0]))
+			chip->rx_resync = true;
+	}
+
+	/*
+	 * A read that catches the header as it lands gets only part of it,
+	 * and the rest comes in within tens of microseconds: read the rest,
+	 * but no further, as fusb302_pd_rx_keep() can only tell what zeros
+	 * in the header mean. The packet is still landing then, so skip the
+	 * status registers.
+	 */
+	for (tries = 0; tries < 2; tries++) {
+		n = 3 - chip->rx_len;
+		if (!chip->rx_len || n <= 0 || chip->rx_resync ||
+		    chip->rx_h1_unsure)
+			break;
+		ret = fusb302_i2c_block_read(chip, FUSB_REG_FIFOS, n, regs);
+		if (ret < 0)
+			return;
+		fusb302_pd_rx_keep(chip, regs, n);
+	}
+
+	if (chip->rx_len >= 3 && !chip->rx_resync)
+		fusb302_pd_rx_ack(chip);
+}
+
 static void fusb302_irq_handle(struct fusb302_chip *chip)
 {
 	int ret = 0;
@@ -2134,6 +2418,7 @@ static void fusb302_irq_handle(struct fusb302_chip *chip)
 	bool intr_comp_chng;
 
 	mutex_lock(&chip->lock);
+	fusb302_pd_rx_fast_ack(chip);
 again:
 	/* grab a snapshot of intr flags */
 	intr_togdone = chip->intr_togdone;
@@ -2276,6 +2561,8 @@ static void fusb302_irq_handle(struct fusb302_chip *chip)
 	if (chip->ack_check && fusb302_pd_check_ack(chip) >= 0 &&
 	    chip->pending_interrupt)
 		goto again;
+	/* Get the GoodCRC to the next message ready */
+	fusb302_pd_stage_ack(chip);
 	mutex_unlock(&chip->lock);
 }
 

-- 
2.56.0

