Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B936D4F054F
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 16:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454522; cv=none; b=BKVQ+h71FkptxyUrDe7U1V2wv/0dBmaGWpTdGFABQe3qAV12i1sQKKpfvud5QJ4e+yLGx/Vl2owwC28y5SCzal78O/RWhk7Hi1B2d2z/YAxlyEbCDZp7QA+Ha8PC32xT/RYlJ3l8lyL8FdEi2HYHhWYBkInidjRq6ICWy29MR1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454522; c=relaxed/simple;
	bh=r4lLAslr3Z/NX7BD2LhfQjN7YicMpHzqO7Pu0yQeDb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q4pvtm3UIPh6Y/fnRqR0S3ALdG2az2QA9MPoit0UAy0IerLRNGJLXh7MeDaw6KJ0xizWH4qZ6p/ZD1iIHiqzVIlkcQzYZEd7H09iLnJhv8pnOhI3rv0GfczIA/M4cuFJft6gfKlqt+CcIzEMDfUeJIcYgN2JqYoTvIkFa8TYy10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdKIdRvU; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdKIdRvU"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso688995e9.2
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 09:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788454519; x=1789059319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XN2S7CaOTGey8tonopGId8lsYub4UAOQaOoySYQOJDk=;
        b=cdKIdRvUnNJ4LIFIzSSXNoTnLc14y2bXiD+dlPCcZ5CNPF1nPS6iSp2RaWCHpMeZHm
         ytnodiwhnC4/+P95l8DzmXqv0DIqIJxW5osgZhAbUHqj+Wt4r0k0yspymUAaG+Kg3k6/
         aM7SkL7Ui072VxrKtCQMcnkkp0+CfmjldQULhwXhu3L6qeqSLGsteaA5wM3Fq99qok52
         YUOetYqQJQyzCxDBSwH1KuqJuJEvEw9JUCjTe8VDmETkfN6nvfXiWchrtz7BFGfmad5M
         gqDyj64ICmTnkmfW2OoPk5POdNypxGgda/uiDlrbuaEubf2qOKjV725kfXdlecGtnY04
         obew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788454519; x=1789059319;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XN2S7CaOTGey8tonopGId8lsYub4UAOQaOoySYQOJDk=;
        b=Bt2IKMu0jZT1VtwAwpkkCmi9+N4Ja4rJ5FFZ6Aqap/tv4AuoF5axmWvm85xcusFtqS
         BDDKrWAKBjMmjhJenFTQIJb/zIQsjlF6ijAJdI8LJ+3hwYhoEEvrACqK47sq+7NwTJEb
         n4IehbijbW7pwFamLnUNk7JAjlYJVhAvG/n5axZCcq+qPH2myl0ou5Bc4pYGKo77nE9n
         PEVnsatdT0Zr3tK/6SC4S30k5bg624uiRJydH0GkNyS7JFtEfqb9C/etbhnBbwaJY9qg
         1QJOXef3wldGH0dHgInbKC42/dBbkbSOTq/1Q7krnDTQpLo3UrAXiF5ZrNiiwFiDZiiI
         QpsA==
X-Forwarded-Encrypted: i=1; AKwUvBwmc/kRgFzsmN6unG5Q/ZnWITZZMlJVFNOrcqan0OQiKsT4O5EB+Hqn5uf3eLpzCC9OygWP8MCAFTU=@vger.kernel.org
X-Gm-Message-State: AFuF++mhIMurxUi83Mt0gaopOWLGH6JaKIVGm4BIFL7mrwIi68pW97Ix
	eKFZ0QhbfhHQfERiBxOb1S3fDp5Mt95Q7VPC5Qe+nzDNMRsh+2txtgvA
X-Gm-Gg: AYBFou0extIlHL9/00jBlLUFnf2ioeTYsLmVvDcHCNBxodoh0WPJkWmzjg/Yr6Re+BD
	gE54RjI2wZMupmCeW8P/Ns4kURMCkqoc12q/8IAR2ebNl3YYhSxYBt7WN/Sx2kWPaj68xKZAx9O
	KFqkoETBdRcgf2HL1fo7H3NaXuhqtWJOgCwrBbSYh+Y+elCwbeXqfRRIQ/dQGaQa5/YND8Ewx8f
	pqaWbjzdB59QWOEqCfD8DEPeAI/ZnUzWvaVZv5eG+wJLdaP3hmlvnX4icUMFSoRB+ES9KJUm4qd
	t7b5guXV+027Jc5WSN+GGCLh77lRErsE0EJjLsY/h2TAa4nYuMO9kAPgb/pSdhG8Hs4mfz+MPGw
	SwPLe4JxYj6iIqN+E1TWLIJ1BbYiWf4P0wZqmT3ihdwXDPnKdcYa+wCJbWoVkcSAShnY9eG+ZuY
	ZvIh3aNWAVh+ET81Mp+glMzLuFOz9um2TTzRm6x8YIRFBBcW8DtYOAYnGglg+XMVecVqPS
X-Received: by 2002:a05:600c:4fc4:b0:499:cd34:f7c with SMTP id 5b1f17b1804b1-49ce58168f9mr243889785e9.5.1788454518780;
        Thu, 03 Sep 2026 09:55:18 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf0c1728bsm70772565e9.15.2026.09.03.09.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:55:18 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: netdev@vger.kernel.org
Cc: oneukum@suse.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>,
	syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com
Subject: [PATCH] usbnet: fix smp_processor_id() use in preemptible context
Date: Thu,  3 Sep 2026 19:54:32 +0300
Message-ID: <20260903165456.498079-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

usbnet_skb_return() and tx_complete() call this_cpu_ptr() before
disabling IRQs, which triggers a BUG when running with PREEMPT_FULL:

  BUG: using smp_processor_id() in preemptible code in tx_complete

Fix by saving IRQs first with local_irq_save(), then calling
this_cpu_ptr() and using the non-irqsave variants of u64_stats
update helpers, since IRQs are already disabled at that point.

Reported-by: syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=04cd90bb99c6ef81a65d
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
Resend as standalone patch; previous send was incorrectly labeled [PATCH 1/2].
 drivers/net/usb/usbnet.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index a19ecf718f36..6a48f38e105d 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -325,7 +325,7 @@ static void __usbnet_status_stop_force(struct usbnet *dev)
  */
 void usbnet_skb_return(struct usbnet *dev, struct sk_buff *skb)
 {
-	struct pcpu_sw_netstats *stats64 = this_cpu_ptr(dev->net->tstats);
+	struct pcpu_sw_netstats *stats64;
 	unsigned long flags;
 	int	status;
 
@@ -338,10 +338,13 @@ void usbnet_skb_return(struct usbnet *dev, struct sk_buff *skb)
 	if (skb->protocol == 0)
 		skb->protocol = eth_type_trans(skb, dev->net);
 
-	flags = u64_stats_update_begin_irqsave(&stats64->syncp);
+	local_irq_save(flags);
+	stats64 = this_cpu_ptr(dev->net->tstats);
+	u64_stats_update_begin(&stats64->syncp);
 	u64_stats_inc(&stats64->rx_packets);
 	u64_stats_add(&stats64->rx_bytes, skb->len);
-	u64_stats_update_end_irqrestore(&stats64->syncp, flags);
+	u64_stats_update_end(&stats64->syncp);
+	local_irq_restore(flags);
 
 	netif_dbg(dev, rx_status, dev->net, "< rx, len %zu, type 0x%x\n",
 		  skb->len + sizeof(struct ethhdr), skb->protocol);
@@ -1298,13 +1301,16 @@ static void tx_complete(struct urb *urb)
 	struct usbnet		*dev = entry->dev;
 
 	if (urb->status == 0) {
-		struct pcpu_sw_netstats *stats64 = this_cpu_ptr(dev->net->tstats);
+		struct pcpu_sw_netstats *stats64;
 		unsigned long flags;
 
-		flags = u64_stats_update_begin_irqsave(&stats64->syncp);
+		local_irq_save(flags);
+		stats64 = this_cpu_ptr(dev->net->tstats);
+		u64_stats_update_begin(&stats64->syncp);
 		u64_stats_add(&stats64->tx_packets, entry->packets);
 		u64_stats_add(&stats64->tx_bytes, entry->length);
-		u64_stats_update_end_irqrestore(&stats64->syncp, flags);
+		u64_stats_update_end(&stats64->syncp);
+		local_irq_restore(flags);
 	} else {
 		dev->net->stats.tx_errors++;
 
-- 
2.55.0

