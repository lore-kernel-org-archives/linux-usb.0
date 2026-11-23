Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795400892;
	b=fCSuU4VGQIGiV4qfZROaYwpxmWXBjFDnaC+ShvQVX2y2OEWLY/EuuCsDO0SLsmw7ZZtC
	 W/8pOZ4RiutdgmRdU+5z0B81pk2URJzs++RXZZJNFBehzYrICtR3MksogjXfn6iN1+Z2A
	 6hPqqEmHx3N5lu78yjom5inPb27O9apgkTSFls59V2akUNfSbIC5w2XsjnjAdUcB+Pykt
	 w5/U+8rxAxKvoIOk/rqtUe9pqAl8QphYiwwjgOjXB+amU+j2JZMpdnr7S6sQC4p+ort1F
	 J1kXWymUg/7/es6+QIDnUlKsi1DYJ+ep5MKjTcEXmeT+sPmxqizyVzIJO7LbnCVNwUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795400892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=FuesKcfc1Js7WUTyCvTWz4Cz4pgickMp1cfQzWbE2CY=;
	b=nJRX8xHaFfn1k7JJpNVDNUiG/xDrmey31AqkXUqCDPUo9bkb/JiyzL+kHiYwf0JA0Kbd
	 JjOnfSssTIJxKjVrqbX9Zl+WkXYvSwGPD6It3W6iMfN5fqGdaAkIdqJCs/gu97yqmgYMi
	 MrQI7NTDL46V/sKJUqH9Vo0y1SwLzECnvzlNfQsCGgOn/Nj+vIEZN9Lp3XWAVi5r95v0q
	 xN8kc7s+PYjWZ958RYyGw0svcX7/TIvhC+iY4asH18Fzk8qxmfZhpef8uAuWsBPVtumrM
	 XXyuSqphU+2ZogFVyW6LfYBa1g9gyMCe8pXQ5BrMgW6aWzDTZdbCgCCpsUdLLxL4RpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h7DDd108;
	arc=none smtp.remote-ip=74.125.231.72
Received: from mail-oa2-f8.google.com (mail-oa2-f8.google.com [74.125.231.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA858606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 02:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA858606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h7DDd108
Received: by mail-oa2-f8.google.com with SMTP id 586e51a60fabf-4ad827109b4so325998fac.0
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 18:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795400891; x=1796005691; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FuesKcfc1Js7WUTyCvTWz4Cz4pgickMp1cfQzWbE2CY=;
        b=h7DDd108o5GP2IznqcAo5q1OAqf8piaqHCH6mnYZ2mfyRuOOgLUJrTscgFfD/KkHFO
         hrlTQk1XPPpzXy9rt517TvXbNnSf4nLESVhZYrFhEjAnl81SiuG3ZfENJ7tSGeYZyOwY
         9HqOkHF4tU53Sf5s2g3OcF1PkFwaA3IFnTaVeI6Cc6oPc8Y5E2rCUJEzlQ4E4nvfhkiX
         aBnwCQj1EZwXRl393Y0mdfr/s0GeM3anITT4jFy3oRbpI6nA1RtV1cgXEIpcDHuONOW/
         ceDiIn6GWHQb4faEWtZBoRdMHS8+OagMGcdSLBHaofxOMvOS4JA0nNbXqldjustAyYed
         YHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795400891; x=1796005691;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FuesKcfc1Js7WUTyCvTWz4Cz4pgickMp1cfQzWbE2CY=;
        b=eLB2wiHslEs9r6YhK852EaCCgb7/YQ77a6exptZlL0uqS/wxO9uhlctlUwOADoXq6O
         Kryra+iGD3hOLI3sfpn+w0z/NF+LJOeQihy7YNtTtvR7acDTM3bfdt7pPbQ7wvZKlaKC
         DRQkgCIqTVxAdBCylRj0j8cHvHaZ7+7p22M8vmdxvqwBbfgX44tHbJkvak+9Mcr0jTD4
         Pc6Fm5mBMbIKEiNRoUZ5553KEib6OPZULcCbdBY7twfrfmNwA/O/XyP+v8C2Hgfltppp
         RSWRYk+XbbAV5N98ukKR9ZpvqFhfWL39YeL7+rLLwuSPQR6ok8xj+JAhSpY0ehqX7pkA
         yU8A==
X-Gm-Message-State: APuU4Z+RMjIpSO8PHmbpbM+P2JCaIUNEdVe0TMug/Y8oO2T5TOpZsKMj
	c7Z2Iit3xLiarsbqZXAaPENbIMO9uN2aXBDnFNbxEtWLlZ39HbSMF6OjhLMLRtlQefcY6w==
X-Gm-Gg: AZFdTZfpNA3+9EY2oge7CzqD7RU4SrFCqdUkJKATKa8vyVJodF5OoQmgOIJ2d/RG0uj
	hK9j71yDq6E//Y0xouELRqISii/EtRn2bM5LxcSDuIwzBZh28s+8F4IzuU7nf4i0cfPEFNOjmWS
	z+GQxtmIOv0Fo7DEu5NUpG6+RDMB6Pt7k5WIl8ReTFeQOWTgkoAvingNgvEB7A9AHlXYoB3GXtX
	AEBznxhmEneIGB6V2jJ5xz4ul9AHnZZLXl8N9MBE+FKOWBrOXYssQ0B0e7am4WpGfs85blOA9mD
	v6k0B/dFA0BrVLpSm0PhyL31oDmJZq9JNX8ABtNfQdPA2iLnvsC7sYmMZoY3UGEckxMekquFokx
	5UjNv5nB3gqd2ao1GXY5nkiBqwqCFoY6sM0NOk/8XJ9wOhafCqBMLXePoi+ffMInPTfRGHUGxr2
	QTGK3upSYEg19QJ9Q2YKsQJqnfMCYHugTbn91x4/64p4YEk/LMLif2O751lejELUpWdptZP+FZi
	e3gMsDMkEKzNgfB2+NadY8A/3o7vbkEd47CgeWzTZY1pXA+bzUCBjT0UmxEOegWINdtpzVq/H3h
	6LPeSi3ukeosTq88tjk92hSf
X-Received: by 2002:a05:6808:10d0:b0:579:7ac6:3a80 with SMTP id 5614622812f47-57a06b2355amr11438197b6e.1.1795400890686;
        Sun, 22 Nov 2026 18:28:10 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::d500])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3575f5bfsm7953975b6e.14.2026.11.22.18.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:28:09 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 22 Nov 2026 20:28:06 -0600
Subject: [PATCH] usb: mtu3: keep interrupts disabled in gadget completion
 callbacks
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
Message-Id: <20261122-usb-mtu3-callbacks-irqs-off-v1-1-27733bb678c4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MUQrCMAwA0KuEfC9g41DoVcSPpks0ODdtnAhjd
 x/4DvBWDG2ugRlWbPr18HnCDKkDrPcy3ZR8wAzIBz6lxExLCD0/y5FqGUcp9RHk7R00m9E5iYm
 wDr1V7ABfTc1///1y3bYdQaxVlG0AAAA=
X-Change-ID: 20261122-usb-mtu3-callbacks-irqs-off-71bfbb2ed4fc
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795400888; l=3240;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=Aex+y+91dtK8aIQ4sNmRyr8JQGY1Dd909+lkCK2MTzs=;
 b=M4YvQXt6noE/enwV80nd/23sRWZ6NXQcoF6/XGBBX6Drd8EoP1lXTTqbtd4nE9h11U0CS9Zz7
 YYjFJu75V3fBozGGwwgkXnSJ6bvpw58SqaekR/st0+fYeKjcOwSuAW5
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Commit 625dd9076e35 ("usb: mtu3: don't run gadget completion callbacks
with interrupts disabled") made the threaded mtu3_irq() take mtu->lock
with spin_lock_bh(). mtu3_req_complete() drops the lock with a plain
spin_unlock() around usb_gadget_giveback_request(), so the gadget
function's completion callback now runs with interrupts enabled.

That breaks the gadget API, struct usb_request's @complete "will always
be called with interrupts disabled". u_serial's console relies on it:
gs_console_complete_out() takes cons->lock with spin_lock(), and
gs_console_write() takes the same lock with spin_lock_irqsave() from
printk, which can then interrupt the callback on the same CPU while it
holds the lock.

Keep spin_lock_irqsave() in mtu3_irq() and disable bottom halves around
it instead, as dwc3 does in commit 84918a89d6ef ("usb: dwc3: gadget: Let
the interrupt handler disable bottom halves."). netif_rx() then finds
softirqs disabled and leaves them alone, the completion callbacks run
with interrupts disabled again, and the softirq netif_rx() raises runs
at local_bh_enable(), once the lock is dropped and interrupts are on.

Tested on an MT8173 tablet with PROVE_LOCKING, copying a 21 MB file over
USB ethernet three times per arm: with spin_lock_bh(), all 8,333 completion
callbacks ran with interrupts enabled; with this change, none of about
16,000 did, with no lockdep report and every copy intact.

Fixes: 625dd9076e35 ("usb: mtu3: don't run gadget completion callbacks with interrupts disabled")
Cc: stable@kernel.org
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Greg, commit 625dd9076e35 in usb-linus is v1 of my mtu3 callbacks fix,
the one I asked you on 2026-11-03 not to apply. With spin_lock_bh() the
gadget completion callbacks run with interrupts enabled, which the
gadget API rules out. v2 [1] got no reply, so here is v2's change as a
fix on top of 625dd9076e35; the resulting mtu3_irq() is the same as v2's.

My bad for the original error in v1.

[1] https://lore.kernel.org/all/20261104-usb-mtu3-gadget-completion-callback-fix-v2-1-2769533a39cb@gmail.com/
---
 drivers/usb/mtu3/mtu3_core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index fc274646fcde..f6677f58dd1f 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -790,9 +790,11 @@ static irqreturn_t mtu3_u2_common_isr(struct mtu3 *mtu)
 static irqreturn_t mtu3_irq(int irq, void *data)
 {
 	struct mtu3 *mtu = (struct mtu3 *)data;
+	unsigned long flags;
 	u32 level1;
 
-	spin_lock_bh(&mtu->lock);
+	local_bh_disable();
+	spin_lock_irqsave(&mtu->lock, flags);
 
 	/* U3D_LV1ISR is RU */
 	level1 = mtu3_readl(mtu->mac_base, U3D_LV1ISR);
@@ -813,7 +815,8 @@ static irqreturn_t mtu3_irq(int irq, void *data)
 	if (level1 & QMU_INTR)
 		mtu3_qmu_isr(mtu);
 
-	spin_unlock_bh(&mtu->lock);
+	spin_unlock_irqrestore(&mtu->lock, flags);
+	local_bh_enable();
 
 	return IRQ_HANDLED;
 }

---
base-commit: b0baaf6cbb16bc773d0c76916aac17c44a6cd557
change-id: 20261122-usb-mtu3-callbacks-irqs-off-71bfbb2ed4fc

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

