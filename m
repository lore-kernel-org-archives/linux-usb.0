Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA1638D41F
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 07:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876826; cv=none; b=SRGIlLZtW3dGBPMZFJPplIrDFx9Zs3zQcG0Y4zWKrsadSMVVo48vBe4un6z93T3XOC57s+29Epur28PfSUUP0t9rNgG8SWUrF9p1MMTOXE5nHnPlZMUvtWJ5jLRfRNaw229Pmxxc/TXxgO1jf08mVhISUlrfIfCdy7ZVqd+QsKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876826; c=relaxed/simple;
	bh=KucUBB9lTSz8tRyvoLPHAINkNXwe2/G1KGvnMr1jeZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IL8DflXOo95mkqvhtivgOPhq0SfnpzlDim2VqaqlJTQ9eQvmG2Z7pACBOlhUHxuAWaOehHG/SAlU2qZbwABekQKDQdwJhEJyiDW568v7+K5vX2ocEWIbuxXFqZzjeiBJME6kUoRM6OwFSyB2zyA8/nxMVvgoYRDu5azWqArahqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=Netz97Gz; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="Netz97Gz"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc751eddf25so1522417a12.3
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 00:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791876822; x=1792481622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TRRiHYy6zpA6xKEITPlGXwjo9lrzT4B8JgkHU6vPJVM=;
        b=Netz97GzE4CGHPuMHo58ZbhQ2vxGYyXPM2dB+JwkmfZPxkLThaK4BibcO+DVwq2de+
         x9hYSzclzZazRlLfogQitJMWpsqIhjX/i4AbymNkN7IhcwqtFxgPD+KFbwOLitm7w+97
         GziNBlJekrirEOQ//rn55R2hSp3iVqcwiOT9lJtjkFUZ1hjzSG4iqbg+O/vmb5iGp77I
         MKKE7K6eCeBcvCFsE/zOlXeDXdPN129ZiAOaMGOpwqS7T5UsAAFapd80LcIZ6dhtwywg
         yK0TobyVusgAn9JNjTz8LFT25DcMfeEm5ZvDQ7SsAXBUsWlKqQeAJiDpHClQYPi6cem1
         ddWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791876822; x=1792481622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRRiHYy6zpA6xKEITPlGXwjo9lrzT4B8JgkHU6vPJVM=;
        b=dDC0FOc4mW+LznCpotVMx9Wrr+g2a3zkzZ29dB3QGEL8MPajmWrs2FI8C6PQ8MeBKA
         jbGx67ixpAMH7hEAFjOAShB3BmtAPZZMFMRtF8cbV44qhsXSkNEMv54Z8/IMbtxUExxG
         7osETB3tsXLUHpjdHC5k3CnVo+RfrNnDdfoHT08zUlq1gKFA6LzXgSfIzF+SCv3wUjQx
         3lgYU/d/Sews/Vfnu5+yzE3kITHQpDaeK5thaichfrNHzjnTped8//EMIq3uMeWs1NPe
         YzCad+j18RiGqDPQjAqy9casPpjXFOaUlR2/6T2X/tjm/ItwIg8hWCSSx8Rx4gR0EZ6L
         cOLg==
X-Forwarded-Encrypted: i=1; AKwUvBxhSCgAEKSLGk+a9UrPV69BZnXut1jOmpppgFZKX9KZV5P5JBEoyC9APg2Yg43K7jeAS4AOpv/tkHU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfEIsP7GyidfmtdtFw3y9/UeJAi8clkYDX/8tcKE8Zc7gacA1p
	Ntyvdw1Xn5oXCZenBDS/XY1ZvZVMz2w8YoLc/zHqv13yl8DH2u6saQtw+DUt7jioo4ozgSX3YMa
	FvG+akbiHHg==
X-Gm-Gg: AYBFou301mfyO4i4NGih3PP+B3BkvmDFrYE/716aBLZfKgBeTHRl8p8YBa9Rfa65lLG
	ufVi5TaqlW45StgrS/or5yZl9SsU9uU/PoHzA0zueoywTLp4ePRKgwG5soG4QyLZqyzZNN0PvKS
	TtedZiLfQiKxl9ooZA+B7wxpd6JZNp4RBKErqe6Hfczf8CIhcFVcwuV9iHaq1x0ulGjZUw5aMmw
	DKKUOtqSkGn2wGRj0WtkDtdBTXLLR3iKO74InWuFKvif6UzINxu9MgfeUTUtbUqhbSVpC31eckr
	peHuKhXwP+UR90fnTiN3Zc9Rx61i7gX4GqxjGB+TMYQaSO5yka0EGCw5vwYddOHJ47eMNbUnIek
	fGlPku3jagJPfibhgOOEmkIugAmthTQhdvNQl+CXFPN7svDKj5xvOabFclinJ3I4Tjx5ZX0NHsR
	83ypuYHM6OduAAjFugrvxxLdxVMrm3ajB3Ps0L4nOX1rcx5qLBdLQunPfneKtrKexnTiDihAK+Y
	hrkvzYGdZyGN9i0
X-Received: by 2002:a17:90b:3a48:b0:39d:f6a6:60d8 with SMTP id 98e67ed59e1d1-3ab3a33db57mr9822164a91.3.1791876822064;
        Tue, 13 Oct 2026 00:33:42 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed0daesm19973923a91.5.2026.10.13.00.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:33:41 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v7 0/3] usb: gadget: f_tcm: fix infoleak, sleep, and UAF in the BOT completion path
Date: Tue, 13 Oct 2026 16:33:25 +0900
Message-ID: <20261013073328.2936318-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three fixes in the f_tcm BOT completion path, all reachable from a remote
USB host.

Patch 1 queues the status requests with GFP_ATOMIC: bot_send_bad_status()
and bot_send_status() run from endpoint completion callbacks, which are
called with interrupts disabled.

Patch 2 rejects a short write data-out transfer, which otherwise commits
the uninitialised tail of the bounce buffer to the backing store, and stops
the status phase from draining ep_out once the OUT data stage is over.

Patch 3 clears the scatter list when the BOT status request is reused, so
an sg-capable UDC no longer walks the freed scatterlist of the previous
command.

v7:
- New 3/3: clear req->num_sgs/req->sg in bot_send_bad_status() to fix a
  use-after-free of the previous command's scatter list.
  v6: 2/2 skips the ep_out drain whenever the OUT data stage has completed,
   not only on a short packet.
  v5: split the GFP_ATOMIC fix out as its own patch.
  v4: keep cmd->data_len so the CSW residue stays correct; skip the drain
   with a command flag.
  v3: https://lore.kernel.org/linux-usb/20261013015416.2503787-1-yhlee@isslab.korea.ac.kr/
  v2: https://lore.kernel.org/linux-usb/20261013005854.2470384-1-yhlee@isslab.korea.ac.kr/
  v1: https://lore.kernel.org/linux-usb/20261012154422.2436134-1-yhlee@isslab.korea.ac.kr/

Yehyeong Lee (3):
  usb: gadget: f_tcm: queue the BOT status requests with GFP_ATOMIC
  usb: gadget: f_tcm: reject a short write data-out transfer
  usb: gadget: f_tcm: clear the scatter list when reusing the BOT status
    request

 drivers/usb/gadget/function/f_tcm.c | 21 ++++++++++++++++-----
 drivers/usb/gadget/function/tcm.h   |  1 +
 2 files changed, 17 insertions(+), 5 deletions(-)


base-commit: 2c3418fffa9d037b2038a6db48be63f9e2291806
-- 
2.43.0

