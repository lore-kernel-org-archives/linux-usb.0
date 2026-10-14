Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022B8344D8C
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 10:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975407; cv=none; b=GFARa4FWqCDCX3iSFC05e3b6tSLD5UYU2J16qc4aWJ8Hb7DHU+H8Bo9JE3Xh7Pkfa3s+vct/JVnLWsLmO+QDIFe1uBBSFuFQKyc4Oe1pmN36CWBYz7UCpQx68Vtg2+IVogOGuO9mNd/UGtEC/OBaH002RFpANgeoPQ5Za1Djfic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975407; c=relaxed/simple;
	bh=Y4eZrrndS2C2UGm8W6Nw931MICNnIUtHZLsSlWIh+PI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ER9eS4WsDVWKjsDs5CAqyU9xNGivCVFYHnbQ/IeFK94ZWidSet+HLxnWnsi/xEBS27lbZzFDJB+2Tvxc13pU9XS9i41jAWMd5hE9HXoMbA6q6jZhbtFlivwuX75yo07hcTeV7nG9MqDjoB5ZS3s4HKZUY2wabWcFJU/H7lp9XVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTMGHceW; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTMGHceW"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so32673945e9.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 03:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791975403; x=1792580203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y2xZR8hA7sxhS1GPiOCm7v6GvoHFfeF4FaagxZ1l5xE=;
        b=mTMGHceWJ9D4xtoEnTzJcMC5O4wNIWKQ0ZOk3dUuL0JJqprZrC01VYuBmNrD6fRUm1
         O+BDLCnnL4Qz9rSrde2SkdPtE/gEXiPE0vAFkr7BJVkOiHNgQXQNEJN8FKhDVc8Vo3U1
         2n0FZmO92hYaXQSTAUA7PUCy6nSrYlNbdY+BVL+Ccf/NQeCEs6nt0WHfZpqO6/YJnSgN
         FQNCFqM2LfuXhR1S4BDe4SHytlz/zac4F9gWkhvSQLuUJzkrugxlkG0HdI0pLHkr/wAw
         JKFrkVGFVnnaljr5Mk0+PtYTGHU5c6LjdSXX0OFhw+W98I7mL+oLCR4eQ+xQdlnJRqKu
         YAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975403; x=1792580203;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y2xZR8hA7sxhS1GPiOCm7v6GvoHFfeF4FaagxZ1l5xE=;
        b=b/aARF9+Yt7pwol8pHB4FQVb15FWWo2UI66QaxLgskHaY3mJ+TK6f1rDuqvSenVkC7
         fn/zRmdVJJ5lQ0Oj4LMgU2SJwA3F3feMrHDKBeL2bf59TvhPLNFie/5Z6P2v0RA/bmhN
         w+KAKeAkS29qnfdXzpTpDy3AejwBtqcCS2Dfw2dtQYC4Nd4+tni0HPk+Xd6JSW++ljgE
         4/5mBjXm372mscFn9Rg1TPSLxeX2sMQ2Z7YB0g5OEO34R77c4oEr32kHJuaVDlBMdeY/
         qBDW0HAb221H1Ag5XRME8DujjJ1qTxkk9R3hulaw8//K2/TTlo63pc2zS6b3Q+DZmBQW
         W/BA==
X-Gm-Message-State: AFq9FYI3Vm5VcnWn/M9GLP3h/9t7WL1Wi3iWLL6cmpvvo9SEVmyWWnQD
	mMn+OpByGFH7uoKIhpIG/ykqPToOTa2X2qa6T7YK9s0r7viF4w1ICMjRdVolf83Q
X-Gm-Gg: AYBFou36ah7cUwngDoZ2sXwddeG7gYNxa+oocZQunSfqGUP5Kh9Ne6/twUkZ/Vf0j5w
	DtBRSI75z/8kIgMdi7YlND9yx3EObpbxN2Ty8Nvn/dm6qDdVTVNf8N7epEWMpendEfoQGya65K0
	cq4boZ+D3LRm0xsxsXKTx2CGjjJdU6Sw/MkVj5prB9rZ/JZM5klfJGaDksjbieohtUFJPBKXtO3
	6FW3RT2xeZvycXRPqtwAMbyupGiRLiT8MD/uPWTLhvKU4XN/EApjl3XvcjHLKI9ySjgQD0TiqgU
	JdVRC/MU/QC+pbxexAiRMSp6cz3zucXDmQwcDLpTeZLRK325JLGqRWwN69jrSPbq3C9wYYsj1AX
	xgsU4vrvdXVEYbfZOPGVQ2pgMFGYAAYIkLXRvs9SHuS19vX9TlSv8TqBJ6MXG1lBBrjQDWOL1ZP
	27stYeVXpih2oDdsezKfUgJkznB8eTfFK8bh8UHXerdnlKzI9nE4CjmJTHKooq+CdqVtuTs2uF7
	DxJHuKtlowanm1p1xcw+4jkkwQhNG+6QvNb+vmo1qOwZqMghzgd8tZStj0EptJ29BVi9hzuLznU
	5rIgJMPIS9ZyjO2gogorQRcCHf1xoNN4nNL+Z6eFtCkPCLeiemrTTWm8b0gwu/i83/5Mo6iMh7W
	yaMHHDgN0NC4p3FdXwZze96vWXzrjCoCjKJlaLvWwBu2JIIo0ooE0ceRZIPK6wlY0HWqQsv0o4A
	RQ+Y7n
X-Received: by 2002:a05:600c:46cf:b0:4a1:7e1f:21bc with SMTP id 5b1f17b1804b1-4a18e4d6636mr318973045e9.29.1791975403143;
        Wed, 14 Oct 2026 03:56:43 -0700 (PDT)
Received: from localhost.localdomain ([37.167.102.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm434061555e9.3.2026.10.14.03.56.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 03:56:42 -0700 (PDT)
From: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
To: linux-usb@vger.kernel.org
Cc: oneukum@suse.com,
	stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	linux-scsi@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	Olivier Kaloudoff <olivier.kaloudoff@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: uas: validate status URB length before parsing the IU
Date: Wed, 14 Oct 2026 12:55:26 +0200
Message-ID: <20261014105526.16392-1-olivier.kaloudoff@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261013221937.41490-1-olivier.kaloudoff@gmail.com>
References: <20261013221937.41490-1-olivier.kaloudoff@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

uas_stat_cmplt() dereferences iu->tag without verifying that the
status URB actually carried a full IU header.  The transfer buffer is
a freshly-zeroed sense_iu, so a status URB that completes
successfully but with a short or empty actual_length — observed in
the wild during link-level upsets (Thunderbolt-chain xhci blips) and
on a wedging bridge — reads back as iu_id=0/tag=0 and produces the
misleading

  stat urb: no pending cmd for uas-tag 0

log spam seen e.g. on an ASMT135x enclosure and a Samsung T7, right
before the affected commands time out into the error handler.

Beyond the noise, a short packet that happens to carry a
plausible-looking header could be matched to an inflight command and
drive the state machine off garbage.  Bail out on anything shorter
than a full struct iu.

Cc: stable@vger.kernel.org
Signed-off-by: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
---
v2: use dev_err_ratelimited() so a device emitting a stream of
    short status URBs cannot spam the kernel log (per Greg KH).

    Tested: patched uas module reloaded on a live system carrying an
    ASMT135x enclosure (behind an Alpine Ridge TB dock) and a Samsung
    PSSD T7 (AMD onboard xhci, HS link); verified clean re-probe,
    mount, and sustained I/O, plus 16 forced disconnect/re-enumerate
    cycles under write load with no regressions and no spurious
    short-transfer reports.

 drivers/usb/storage/uas.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 265162981269..d1725ef8f954 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -315,6 +315,13 @@ static void uas_stat_cmplt(struct urb *urb)
 		goto bail;
 	}
 
+	if (urb->actual_length < sizeof(struct iu)) {
+		dev_err_ratelimited(&urb->dev->dev,
+			"stat urb: short transfer (%u bytes)\n",
+			urb->actual_length);
+		goto bail;
+	}
+
 	idx = be16_to_cpup(&iu->tag) - 1;
 
 	spin_lock_irqsave(&devinfo->lock, flags);
-- 
2.47.3

