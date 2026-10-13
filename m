Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8080744062F
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 04:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791866405; cv=none; b=qQMlA0422QGkVk5f5k82cM9i1aYMb9x2lR7IUsSk4gXpcoplAOyDj82aGHno6816Px+WjCXQup26z8VXxzstEsGmdHrYzn/Yl4x3K3YrR036lU1/WWPEk+CYryV/6ISOGdsNQsO7+D2P/UPAqgDuM3esG9GtYMYgO+Azm0Uj/AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791866405; c=relaxed/simple;
	bh=vddV8l0mQz8O3IHzxAknbEihgxflXBN5+PEEZMLY3zk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hjxcd88fEX1q3SmrOxtRHdNpE2/PB4DojwPnzRAfQ9TumEAzK1fV8CgW/D2nOprYiZh9feZtsIw5AS6Y4/O6vxLAYJmib/cTg49Xh/ejTg46tQzTPut5YEdG3T2Rv9g9rCsU544OIcmiimwB154tjqVN6TiRKuWtprJDa1R94yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=dEbxDzBt; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="dEbxDzBt"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1043605a12.3
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 21:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791866403; x=1792471203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qnG57MFg7PrIckZ2E9sIhy4PvUmmL/cUOrrKMINTiz4=;
        b=dEbxDzBtqGfbAZgvAPS6kvBfBLy0B/zNie8YP6Z5HtuWaA3npHZH2cSPOvKFDU8v+u
         hxSRJMLDC2y68UTkAu2xjjeDaXahCfs1k23rUe7kCFAeR1Lp/0sOu/M/IiYYnnHoRzxG
         EcrKRpwsiiZVf93zD+VB8x26RCQ62ZWLZFiicaxeBAtuUuRMLG0ZoKycd1AaYtRm3cnl
         E2+y1xblZ3WzBMPheM16ZXfTg3Hyxe8/jQAtjUchVSAlljzint807TeXVHjVJHMv1B45
         3F+iaEzZxHR7BjBd/tZ1BNIrOLeR5pXPyQgFXyNGmqANXClGQUM9Oy+JGoabU4f+qC6f
         MJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866403; x=1792471203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnG57MFg7PrIckZ2E9sIhy4PvUmmL/cUOrrKMINTiz4=;
        b=psZCPKHat+eUjYWiG5MB2pHp9HPXA0Yob5W7Xm/iSP/j9wJ9i/jTRxABt731sqWPvK
         z0OQPzxGeECUgI8tqypdb2hQuPtbrb9UbRZ+uOMc0rKhMdpPBArQnoddniyu1Obcm/ye
         VKbxUy6n98bggOuGAWMNvmQjesu3645PHposOomcQT87lT6LmzUK2SoC37rpeiJdlYsK
         HVNyly+NZ0/TOY9pI+vWs23czoXIn670WUQMKSBMdGaRc1qK3yLtD9v6ggjAuhRpGnNP
         w3Dz9kytsFIjDfqd8/VezkxHoe/mK0GLvzb+zwQBdV8k4f5rqPVlzI3VRu/hzongKdrq
         4mzw==
X-Forwarded-Encrypted: i=1; AKwUvBw5h0rYfimU9+KgjYKmIbqoC9eU8bEThWNo6bsVZFlyTy6U7D2NENq4U9fSKWDRIRPOdttZx1LruH8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAbimqeDKmlRkuZlx2NFdbEoCY7i0IN1ylTrs4oo+TM9dwfDhU
	NKAsr7Ay9+I+08Uv0vBIjl0m38pTQuNaRb180OY9ktimQfDME7ZyecFmJmK+OCrpSuY=
X-Gm-Gg: AYBFou0I7nNrCgoTkL/pbF56OFaCAZUHrNMMu2cLD8MeZfLTDB9H9j5xNDoqBgKaoOp
	ZmXErKLil6bF62Lf2UbR9e4Xrh28v8FN3y6ZR3UrncyV8v9kQS+i2KseWmQfhkfy/ZVvYfGvHNx
	7UjlcCHBQJ1VqRdjmmGb5BgAigk33jhp2KBNpLbboFe2BVFOtxv17EzaNUmNVjz5HGJEb9IPUhy
	TjcWG5M/y2KMcAJC28vm8mCZsc5vV/XHJXDodjlmvxCifwlYIq/nRpWXdNqg3VzauDZYeaTC9L8
	BB6h153OpicDA60e029mRQ1+N1qDL99RHX5ns/BBWJgaz86wzYf35RHdMHKEQjq/zqZbZzwpE5x
	4laGI7nDbHzfjEKIVlkoi4+7H3svZ6aLcAHax8Y2z9wd6dT3zPdjvQd24wHrsaDGqIdB6tjm/yQ
	31bTDDqJRVhxcfyszC90nofuYb/eHUeD637pCUK52i43eXp9mPIW4072ab+fL5R6ZUUWcrYlX4E
	UH9/Q==
X-Received: by 2002:a17:90b:5864:b0:3ac:38dc:6b9e with SMTP id 98e67ed59e1d1-3ac38dc6d80mr1310335a91.25.1791866402713;
        Mon, 12 Oct 2026 21:40:02 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9638fsm18861327a91.3.2026.10.12.21.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:40:02 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v4] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Tue, 13 Oct 2026 13:39:51 +0900
Message-ID: <20261013043951.2534225-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
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
committing the stale tail.  The short packet means the host has already
ended the OUT stage, so mark the command and report the residue in the CSW
without re-arming ep_out to drain data that will never arrive, the way
f_mass_storage treats a short_packet_received.

A short 8192/4096 WRITE then commits nothing to the backing store instead
of 4096 bytes of stale heap, and the CSW reports a residue of 8192 with no
OUT drain queued.

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
v4:
- Keep cmd->data_len so the CSW still reports the untransferred length as
  the residue.  v2/v3 cleared it, which reported a residue of 0 and told
  the host the whole transfer had been accepted.  Skip the ep_out drain
  with a command flag instead, matching f_mass_storage.
  v3: https://lore.kernel.org/linux-usb/20261013015416.2503787-1-yhlee@isslab.korea.ac.kr/
  v2: https://lore.kernel.org/linux-usb/20261013005854.2470384-1-yhlee@isslab.korea.ac.kr/
  v1: https://lore.kernel.org/linux-usb/20261012154422.2436134-1-yhlee@isslab.korea.ac.kr/

 drivers/usb/gadget/function/f_tcm.c | 14 +++++++++++---
 drivers/usb/gadget/function/tcm.h   |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 9e6d4f39900a2..d686fbcf36f72 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -120,7 +120,8 @@ static void bot_send_bad_status(struct usbg_cmd *cmd)
 
 	csw->Residue = cpu_to_le32(cmd->data_len);
 
-	if (cmd->data_len) {
+	/* a short data-out already ended the phase; draining it would hang */
+	if (cmd->data_len && !(cmd->flags & USBG_CMD_OUT_SHORT)) {
 		if (cmd->is_read) {
 			ep = fu->ep_in;
 			req = fu->bot_req_in;
@@ -1090,8 +1091,15 @@ static void usbg_data_write_cmpl(struct usb_ep *ep, struct usb_request *req)
 		return;
 	}
 
-	if (req->status) {
-		pr_err("%s() state %d transfer failed\n", __func__, cmd->state);
+	/* a short data-out left the buffer unwritten; don't commit stale data */
+	if (req->status || req->actual != req->length) {
+		struct usb_gadget *gadget = fuas_to_gadget(cmd->fu);
+
+		if (!req->status)
+			cmd->flags |= USBG_CMD_OUT_SHORT;
+
+		dev_err_ratelimited(&gadget->dev, "%s() state %d transfer failed\n",
+				    __func__, cmd->state);
 		goto cleanup;
 	}
 
diff --git a/drivers/usb/gadget/function/tcm.h b/drivers/usb/gadget/function/tcm.h
index e1d5a93916127..1f9f7181603f3 100644
--- a/drivers/usb/gadget/function/tcm.h
+++ b/drivers/usb/gadget/function/tcm.h
@@ -88,6 +88,7 @@ struct usbg_cmd {
 
 	u32 flags;
 #define USBG_CMD_PENDING_DATA_WRITE	BIT(0)
+#define USBG_CMD_OUT_SHORT		BIT(1)
 
 	/* UAS only */
 	u16 tag;

base-commit: 2c3418fffa9d037b2038a6db48be63f9e2291806
-- 
2.43.0

