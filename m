Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005628;
	b=xCa3TJf9nk5/JAOmJ4WN3s3P18QwI2+8auL5JMjYWeDW0PXym90YynbQg1TLVVmlHz1k
	 4lzbExBVIbYiu0p+RH6QveKHcLgZvke2vaf1K/hwYVdpE3UqxyyYn2TgAtYX5bHL8deq0
	 eS2ETUc8dzoJtM+pBsyGfqqMNHaCH4usAk0kdi6Trlifgg2c+aLjS08VRNkjrfPPJwftv
	 /bHA3e1y6iSBTbqjYazmB2R7/+eL6oUsfuwEijRdPjqWZVfzeWtwLElDO42BO1DOz5jDT
	 Dia/x0qsoHY3t224MSi4/5pnzVLs9+RX+crm49E4eWqxQn4+tD38g5G0JOyKfAR++Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1fLgAjtCCKjoVBG7/UvopeS2Qcc4ohL10xzSiTgRuPw=;
	b=VL40KJYb1mhA6gOUMiJ1qMPANeB0XY6+1BTqk3qgS5QLDPeTUlzoohFZHF5JBfosh8ji
	 WVJntwilxMWnEHyCW8wMBaCNSbSGsgUw3KXw1FASN6jes9ae2R+hqDbPoQsfNbq1Cgbcp
	 beRJKpQS6zCzj58ln3iO3CNxAba4FDcqeE1WPJ4+bf7lAc0SbHXYMxCPZmZNTQJvyQcsZ
	 A5xP0KJMs6nURlBTGQmA8bqi2ZQECkEhZ3okamJXj0XD90QwVnTkQTx/lZhlApOqSgsLr
	 H4UzS0LhP7f9Wd3B8wSMEgNfenUNv1qaR+RAoX4pIzA0Q328PNeLYARbL4ikfzo8szA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=de0KmxCO;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CB260A2602
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 12:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3CB260A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=de0KmxCO
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so542225a91.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 04:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795005627; x=1795610427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1fLgAjtCCKjoVBG7/UvopeS2Qcc4ohL10xzSiTgRuPw=;
        b=de0KmxCOwsMT+Q7JG1G1Ao1bVgvmu+KIUWF9XBL77XKi9Npqia5BWLthh6/AsNxofe
         1AePDOzls+Y6RTUFAqfPuBUWKytnR9wa6yCFny5iSPUChNKwDZVA3/fh3IPY/Ka8cAUe
         h+95ROccfHwWHlm5nAQvOevgnyqR0zlayv5PtMzt8EXLJSBBM+PrX7iLMllfhoQ9j5kS
         R9jzRgOkMQgtfKiVfKbhM04l+w5fYDd/ElyGfDecjbVVmS7tnXBVuR4Tm2GpsnVAjele
         n3l4ZT4bOvxsHxJLj/Cxj3gCT9M7wuedB+U/0ywgkPL574Y8FPwuOCyem9bPkIcvvIMe
         24OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005627; x=1795610427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1fLgAjtCCKjoVBG7/UvopeS2Qcc4ohL10xzSiTgRuPw=;
        b=1ryPzNzC/HA2I5IWWUNbaoKqUpkFOyVsBJkhmddu3fIMY776hlpiyLql84pfyDPXGb
         OgmJHG+dpceYf8W3C2NNvkiiLaBvP2bP+lNI43gmTuQa37mR8kBxIN8A6xy2fkznwPHH
         rfO9fvkOJs2qojiSna2fCFIfx0dqiD/E9k+MBMG9beKWpwsSGMAIJz8J/F/Niz2td0dk
         UzUlFmqAS8mkEF70AfN0wM8+5fUu68uRIIdQzqDHUzn6jzslhY4jA4M2LLh4M8t1UWZo
         Zr7y/ofubZMtsPCMMdYoFGSm0F/KV2pqaUPd5EKXuczWfRE1InCPlCyguJizeqs4Ci13
         BfeA==
X-Forwarded-Encrypted: i=1; AL+hErFH/jlgmR+GHtv/7GIwSrWW+D6ovw19z8gK6lL3oHSpR8mn4N+22NQq0G46GGGArJe6jmhIAqRPhlc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Sy71wfOmQ9rvIZWYMTmLBH/HB9tN6Glmu7KxQyaHDxLKTc96t
	Z4/xSDub+Pz7s+KjlNNXBAPb3JXt5okTvo1EZvUTDFSX1eGJNAFbk8eR3pNtRTpDHcUQaVql7hc
	6Q5sb
X-Gm-Gg: AZFdTZesFMsj/c+aUPwo/Zb5FYsXusvkNxF8NG0jHX0eWCfBySeBlP4vWJMYIY2v1tI
	fX9niN8iPJGRgzUTwU8/dLonJaX/9WbqHFcZUwN2G4qGl8VuElz/dBLW/HSCbKjc9Xyd6TNKvyN
	Xddu56xAsBrStIOXYfxWsg+twGr9zztYM0JBABlOh4GOoISRjFSeCHO/0qOW5h/M14/zogGs93D
	v60SjdMOvYv5bxaADmg/uv/KBLiv5IPcLV+q4avNJg9Gnry7pcI8keBZgFqxkLux+9mABg63yg3
	8KxHhb25RhjwSg6Q7kZxsq+ggCojUuVhC97dJGo3VsNUeS/xsHWOlte/QIb0VsCCuJ0pAtMLgSt
	NOgDdF2S449wjqvx8Hptjr9iAjSatSsBxokJ2p6ha/W4CMBnRbUcNfDghluVesH3bZPGpb+ZWRy
	n2E9LhOHCSHYvD2rimJHApxiEQU+lqk6raqIsv9QyETfiysu9WcjBSuep5HvdV1D/3VppbrPcBD
	Qkfm77tltXZlN5iM52h5HZ5JS5hXgNPNJAOXnoCGU0Dbu2Rtzi6F7+1pw48qZDiYMGGZwUQhHAn
	LJJDBNZ/mUF4qmYLWtFACGg8pCLHQ3igBZseuSy/1kVnTQP1ui1ddINpZZ4fzmTjv9buOpdUHy7
	4amo/YfpZEZLOmIioR5KZeCi9jXeB8B7inyv11w==
X-Received: by 2002:a17:90a:d605:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3b3d07d4100mr2663097a91.39.1795005627059;
        Wed, 18 Nov 2026 04:40:27 -0800 (PST)
Received: from localhost.localdomain ([2406:5900:1044:110c:e78e:f7f0:2120:34e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6e18sm4257980a91.10.2026.11.18.04.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:40:26 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com
Subject: [PATCH v8 3/4] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Wed, 18 Nov 2026 21:40:04 +0900
Message-ID: <20261118124005.2428068-4-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
References: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
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

usbg_data_write_cmpl() copies se_cmd->data_length bytes out of the bounce
buffer into the command's scatter-gather list without checking how much the
host actually sent.  A BOT host can declare a larger OUT transfer than it
delivers and end the data stage with a short packet: req->actual is then
shorter than req->length, but the completion handler still commits the full
declared length.  The tail past req->actual is whatever was already in the
kmalloc'd bounce buffer, which is not zeroed, so bytes the host never sent
are written to the backing store and can be read back by the host.

Fail the command when req->actual does not match req->length instead of
committing that tail.  By the time usbg_data_write_cmpl() runs the OUT
data request has completed, so mark the command and skip the ep_out drain
in bot_send_bad_status() - there is nothing left on the wire, and draining
it re-arms ep_out for data the host already finished sending and wedges the
bulk pipe.  This mirrors how f_mass_storage stops draining once the host
ends the OUT stage.  A command rejected before its data stage still drains,
since the host has yet to send it.

On a dummy_hcd gadget, a WRITE(10) declaring 8192 bytes whose data stage
delivers 4000 and ends on a short packet is answered with a CSW status of
0, and reading the range back shows the 4000 bytes the host sent followed
by 4192 bytes it did not.  With this patch the command fails, the CSW
status is 1, and the range reads back unchanged.

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/usb/gadget/function/f_tcm.c | 14 +++++++++++---
 drivers/usb/gadget/function/tcm.h   |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index f2e7a9ad77809a..970dba09d75e4a 100644
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
index e1d5a939161273..50764a33cdf366 100644
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

