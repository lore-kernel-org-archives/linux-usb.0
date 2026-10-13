Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32062425873
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 01:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791856476; cv=none; b=HEsLQ2CoKzKfxeZsd9ilRTuvO6sVx0aoq4R379hL8lUmj6Q4KcOE+Rr8UPsrbv9BVoxbOmNTT3QI30x8G5UiQi96nSHZcb/Olld5r96ieB5aUXmIRH9UaUSNEy6b1MGX0PGOj647xq0AD8VMYhT6zNNTh7KqeyY7EzW3EOr9MNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791856476; c=relaxed/simple;
	bh=/69Sv47VBWsaTNMZuDaTDKZqe8kA0nRBFTZSsIuq/gc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F2UMSPm4NszY2/jYIa7M/CVXGIKbwhq+SSBAe5sIXt5hhBuJElIpA58op6WB/JqN8PFeGSATT6znEkpS7L1+2ElcGyENds6xo12Cwi3P2OauXrS9KlQdH7AK+KfANauCXzmfuOiTUiZm1XXKHqIw+KcOsFWev70Uk3TEhrZZlAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=GB6y6bhz; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="GB6y6bhz"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso736854a12.2
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 18:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791856474; x=1792461274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjxQ0USZRooNIDC4VoMJ18fwWCMaS8NDpeUyYcJZJ7I=;
        b=GB6y6bhzq2hhHjLR25ibg0iTq6/TETz0n78zH1WRy0Q4EzgcSqksFCNV+NtmQUTW+j
         L2bz/w9BfFpNmOi2E+80GGM0XKkNjDLBmhoJfDaVRZwCnZ2BnaghCUtKLMrM+Qo0owCQ
         NkyBGh7l+0WwTiuvZ8kcFLaEOASTiRTeaXr2cM6NhuXG0+vb4MOW3rV5PQpEfhzwbTsU
         4PWrwXtS7iGjJQp8Jdz5om8/lBblFaI/HbfP9Ls0z0LSJ3celNLMfPN8S+agx39VMVqW
         9N8wYZdpk1uOu5oF9W1fq77LgaI619JkLagzUTGhkKXOBsaa45uDgvK1fAV4I3Yj/YHt
         LpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791856474; x=1792461274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjxQ0USZRooNIDC4VoMJ18fwWCMaS8NDpeUyYcJZJ7I=;
        b=UjtEc76h74x7mtUayRfMt6OhNTU1eiOebGFbBmPidzSfCCQtT1Wcm5g4Njeh8HctEU
         ioddT+SA+EYLIekAoDeqRgYviAsNnSQqEc6ly9Gv2tE5fLe+PguFpL+HmxDLhwNhtNyp
         ong6cMq9vwMlJtKHAN6RsZgtewGYrA+IRa2BGbbuVrBovtFLUnNpRYR1G35Uj/W2XaY9
         BvohuziyhdOqSdgrtTyumabT26v5mRg2QYa5zfTtOFCVO+ygOOJaBUeevfgFWEbdGRaN
         2mtti/qeDPKuDIP3U7vP0VYirsnSVVxVETFrbtX2x7kOlJmIul8LIEDNetb5G/Ib+t66
         x3fg==
X-Forwarded-Encrypted: i=1; AKwUvBxiYw5MfTx/nEo2dtWfBO0+crCoaHtvLtWoPNI53wW95i+Y1dVD26qpFGNgRFEKk6KfGodECDTvNds=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWrf0jLQdwolxzx6TAs1OrIO9GxygYlnSBvUiJK+xk/Kg4IN6b
	Kq7wFfm8c0Y89hGHNvS/oIRf9S2woPFhmS2JlnCNn28CRLSOsdtVPpeMD7juvg2MiDk=
X-Gm-Gg: AYBFou1pbclScaPyBlwMc/fMBHI2wu3cqkOVzz7jgpz4NIgOhkzFEQdCUiHR4iN6Tfk
	2iPFoYtC1Syit1ajzAcjtV3hWwFHs2ejv3vyoPOMvsmjdjvHXkVgt97JUUaG6dGGk/rWrdIbLhM
	vDeY2plRq9GFzSBFoWaLifA0bvnUZaqPa2GK4eTxmOOPoV0SHyDL2XtRR+9bM6Fuxl7NSWEnzgh
	XAy9ycqQ9UsPzUHt0m3MxI1f5uT+kZifZtwq3QhKRjSBFNrkh+yR/uk8ZuTDqryAkzYApA+FjbV
	7uedzUdvUk7aRbCSmGCmk0x4D75uFtwvFH5q2FMi9zBNWDVWxfM55ECiVYymxuO2htlWLzniPdQ
	vS7o423W0iOV+MHiNSSFbGiWG3O4iuFUxKeHwDkm7wrmApvwd0dcvvBBilr0/hfv/9tfaO76Gpw
	MtT9T1cW3L4M4p/sU6VhzGerrC5ySlJxxxSgyzjjB2TowkrVVSOnc+e6lfW7/z8t7xPjsA+Dw4t
	09Qsw==
X-Received: by 2002:a17:90b:1d49:b0:3a8:5d57:a5eb with SMTP id 98e67ed59e1d1-3ab3ab5a60dmr7458025a91.15.1791856474526;
        Mon, 12 Oct 2026 18:54:34 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3781d581sm19057755a91.1.2026.10.12.18.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 18:54:34 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Tue, 13 Oct 2026 10:54:16 +0900
Message-ID: <20261013015416.2503787-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usbg_data_write_cmpl() commits the WRITE buffer to the backend as soon as
the OUT request completes successfully, looking only at req->status and
never at req->actual.  A host that declares an 8192-byte WRITE but ends the
data-out after 4096 bytes still reaches target_execute_cmd() with the full
length.

The buffer is not zeroed (transport_generic_new_cmd() leaves zero_flag
clear for a data CDB), so the bytes that never arrived keep the previous
page contents, which the backend writes to the device for the host to read
back. The target core refuses a WRITE whose declared length is wrong, but
it does not see a data phase that simply falls short.

Fail the command when the data-out is short.  The OUT data phase is over
once this completion runs, so clear cmd->data_len unconditionally here:
otherwise a later BOT CHECK CONDITION - from the short write, or from any
WRITE that finishes its data phase and then fails in the backend - takes it
as outstanding data and queues an OUT request to drain a host that has
already stopped, wedging the bulk pipe.  Rate-limit the failure message,
which a host can now trigger at will.

There is no oops; poisoning the buffer and ending an 8192-byte write at
4096 bytes leaves 4096 stale bytes committed before the change, and after
it the command is aborted with nothing committed.

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
v3: clear cmd->data_len unconditionally once the data phase is over, not
    only on the short-write path, so a WRITE that finishes its data phase
    and then fails in the backend does not wedge the bulk pipe either.
v2: fail short data-out and clear cmd->data_len; rate-limit the message.

 drivers/usb/gadget/function/f_tcm.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 9e6d4f39900a2..cf6a394c4196b 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1090,8 +1090,15 @@ static void usbg_data_write_cmpl(struct usb_ep *ep, struct usb_request *req)
 		return;
 	}
 
-	if (req->status) {
-		pr_err("%s() state %d transfer failed\n", __func__, cmd->state);
+	/* the OUT data phase is over; nothing left for the status phase to drain */
+	cmd->data_len = 0;
+
+	/* a short data-out left the buffer unwritten; don't commit stale data */
+	if (req->status || req->actual != req->length) {
+		struct usb_gadget *gadget = fuas_to_gadget(cmd->fu);
+
+		dev_err_ratelimited(&gadget->dev, "%s() state %d transfer failed\n",
+				    __func__, cmd->state);
 		goto cleanup;
 	}
 
-- 
2.43.0

