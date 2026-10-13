Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999F24B44A1
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 06:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791872512; cv=none; b=bXJdStlNbiE/kj5pbkO1Onkbxfs1rAq0I8/FOC5RUJU358APAioCXfHXY69CaO6dQoQ1OO5NXmS7bUkxSSVBL81xJaFuSM/X+1aT9z0VMf+I/PS0n+ClAPHvMy6q6IMBRB3R0Q+H+rtZ+fAXXpyQDl4gVaBp/SuwHpec2t6iOto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791872512; c=relaxed/simple;
	bh=v2xoffiL2VDz5NojqZv0T7MpCAZB7J4RpYDb1c9cCbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n95wuoEOoyDruDnpvvjDOhSTVqhUiTWaAMnd3MuCdNrFZZ25xsjBcfFFJnzKPUrwBI7uupfKXFHOBx5TQTsmYDMZw10tPSqJMiwhnOvfM/D2mf93X8h3gIGfhP1xorthAzgOB6Y/jYBL2emwxDH8Z+InnjIPq/x7wk5QPHY4+G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=zqBE63TG; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="zqBE63TG"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ccc6b11a19aso892604a12.0
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 23:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791872510; x=1792477310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=POSn5GjUfqQ74/iwNoPgD0VKPoE1QYtcinfIgdFuRqw=;
        b=zqBE63TGRXvepYvPvyZReCISYe3dPCAhV4JEldeaU9go7EzhQ7/DUukfzXgNnbsCrk
         mMGs0+APpNeFty37LzKb5+7fFNl1eUHujDrYAqUyprbOydJFAAxlB+zxUiJtbFqo0O3J
         8/qOQQjiuL5xYLepRe2wVQdMf4Iv7Sc23Xp+boiTkHAln7oKbZLAa92kCWhP6Iyl7TS5
         GghxE2dsFgUjfAENLoBjgUmvWWEFtvIJ+eQx0Gv6PfFKzOarRVCTgqYaTzCHtr+HvviY
         cHVWFQBFxc9Jaedx8hKmxqj1v9kujz9YYxY+/QmQNYRB8dcIl0iPdHF+J09OAsq60DY5
         do6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791872510; x=1792477310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=POSn5GjUfqQ74/iwNoPgD0VKPoE1QYtcinfIgdFuRqw=;
        b=wMKtUaxy57einlZjHDWAH582xkjgHWiOiE8RDfWjrPsMN1N277wamha4Z4NS45CajB
         LWdRLLFvQlf4ygKD2Jnh+EknnAIIgE10dSdrTMV6AuQAy23KsGnvC85coBvJv6mIw5eS
         cXJ82BRBSSA/EGflH+bqjJJFbVsvF8UEsaVkK9ai7+/LctMu5h2XCwrbpT0zCU8cRPQx
         nGOxVAL459LUGGkf7uOAxBRwwQFNNphTGkRAyQSa8j9vgWzViyr6/ITqiPH1gveV8FNX
         NNwdv4SmlDARSvWbltVaw053PABUcgueHXn4PPo41pkaBT6nGm5AAGQYUGICU8AdcIpc
         LKhQ==
X-Forwarded-Encrypted: i=1; AKwUvBym/KK7f3a6dmq5IIQ7aaoT71VHqeBmVVdyEdtLcYy3NqKUgMJzaQdOFrso+ZtJIxzPFH5P0dA5weY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+9A2eE+ltoPg0bZERkdTyMb4+8LOJKiIvYnPsAzL0/hsj+V1L
	m2fsgZCjcHJfs6IU4t81lrrIUINhtp8IpNd0Lng+ReTD4U0xCWxNs+a1mjxrQVhx6ns=
X-Gm-Gg: AYBFou1MJB1N8Fsv3nfFphR98REy3C2EH4agkVj+2gDPmNSNLfGXqSOJOFwFhWqmgJ3
	xRJhfWKgqgpwiRREmVYe/j4EiyMjdtpEwfFx/eeKgO7aGArzqjoZ4Dz0yZQQKBLcsEUx8d1Z9sc
	yNSNhJ6CjxU7vNm3SJPLXwD/QKZl0dMpeX4CoF5OmvxU4Awvx0yTnCtDmkDqHXIOmEOFvNxj+qH
	ottYeLkdZr8RBVob1nag3fLG5OBHzlmPd6Rk4oe9tmxuIBARuzA5WHPDX7jCTteV7rq+QW99vLT
	/mkNUH5oIbYhpGIMwXVWUvZz2kouiNiBMdAPSau5lwWNZDT3TKITg8Y3ccuZEhlVhQAcsbzozo5
	WDNi7WKJMBukNQAAG6JVpWYxI5Zew/3HhKCnmsW3ttb4XXjMtR0Cir0LF9lcLtlWat9Y7ZQBDJf
	9grwBkl+DJpS8BoNvUATcP5XlQy0w8QOfGbGjhPIMHw4I7J/GJ0McrQPm86jrpGIKZ0GuXQMOz6
	lZr2Q==
X-Received: by 2002:a17:90a:ec87:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3ab3aafbd09mr8834314a91.26.1791872509775;
        Mon, 12 Oct 2026 23:21:49 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32d3b4f7sm9253553a91.0.2026.10.12.23.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:21:49 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v6 2/2] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Tue, 13 Oct 2026 15:21:29 +0900
Message-ID: <20261013062129.2568405-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013062129.2568405-1-yhlee@isslab.korea.ac.kr>
References: <20261013062129.2568405-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usbg_data_write_cmpl() copies se_cmd->data_length bytes out of the bounce
buffer into the command's scatter-gather list without checking how much the
host actually sent.  A BOT host can declare a larger OUT transfer than it
delivers and end the data stage with a short packet: req->actual is then
shorter than req->length, but the completion handler still commits the full
declared length.  The tail past req->actual is whatever was already in the
kmalloc'd bounce buffer, which is not zeroed, so uninitialised kernel heap
is written to the backing store and can be read back by the host.

Fail the command when req->actual does not match req->length instead of
committing the stale tail.  By the time usbg_data_write_cmpl() runs the OUT
data request has completed, so mark the command and skip the ep_out drain
in bot_send_bad_status() - there is nothing left on the wire, and draining
it re-arms ep_out for data the host already finished sending and wedges the
bulk pipe.  This mirrors how f_mass_storage stops draining once the host
ends the OUT stage.  A command rejected before its data stage still drains,
since the host has yet to send it.

A short 8192/4096 WRITE then commits nothing to the backing store instead
of 4096 bytes of stale heap, and no OUT drain is queued.

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/usb/gadget/function/f_tcm.c | 14 +++++++++++---
 drivers/usb/gadget/function/tcm.h   |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 12e2b20e33b92..a37a3ec8e7a4d 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -120,7 +120,8 @@ static void bot_send_bad_status(struct usbg_cmd *cmd)
 
 	csw->Residue = cpu_to_le32(cmd->data_len);
 
-	if (cmd->data_len) {
+	/* nothing to drain once the OUT data phase has completed */
+	if (cmd->data_len && !(cmd->flags & USBG_CMD_OUT_DATA_DONE)) {
 		if (cmd->is_read) {
 			ep = fu->ep_in;
 			req = fu->bot_req_in;
@@ -1090,8 +1091,15 @@ static void usbg_data_write_cmpl(struct usb_ep *ep, struct usb_request *req)
 		return;
 	}
 
-	if (req->status) {
-		pr_err("%s() state %d transfer failed\n", __func__, cmd->state);
+	/* the OUT data request completed; nothing is left to drain */
+	cmd->flags |= USBG_CMD_OUT_DATA_DONE;
+
+	/* a short data-out left the tail unwritten; don't commit stale data */
+	if (req->status || req->actual != req->length) {
+		struct usb_gadget *gadget = fuas_to_gadget(cmd->fu);
+
+		dev_err_ratelimited(&gadget->dev, "%s() state %d transfer failed\n",
+				    __func__, cmd->state);
 		goto cleanup;
 	}
 
diff --git a/drivers/usb/gadget/function/tcm.h b/drivers/usb/gadget/function/tcm.h
index e1d5a93916127..50764a33cdf36 100644
--- a/drivers/usb/gadget/function/tcm.h
+++ b/drivers/usb/gadget/function/tcm.h
@@ -88,6 +88,7 @@ struct usbg_cmd {
 
 	u32 flags;
 #define USBG_CMD_PENDING_DATA_WRITE	BIT(0)
+#define USBG_CMD_OUT_DATA_DONE		BIT(1)
 
 	/* UAS only */
 	u16 tag;
-- 
2.43.0

