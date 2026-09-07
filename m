Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C61525F99F
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 19:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788807987; cv=none; b=C3Zk5T7Ce0lXb3QrE2JXeJhg4MPLfC8nwCxhhHXOVEBgZleMryEU6kYfTKbccKIFR/lKgCH5nkXCDs+aLzDEyy7i/YAseWhuOZfyxtT4BKfvRx8BKjcIh6T1bfIhs6rP1oeL35dbfNUdEd2OUrJzt0xVFCPkBpMa6xRrnUMvKYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788807987; c=relaxed/simple;
	bh=mluAk5/UqByeXBGZD17+nPzIfHLNJbieybfivLfNjIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IxCcsDomvS0uHNQVTnc4Sz2dFYjdPjXXn+jZ8t0iCib+rzx4rw44pTkCmcT5S/HCDUyOUK7y1hLgmnNFK8e2Uyv9lS/7YiLNSjyVySqNfauaepBqIs8cIid201YP8v0+eQrN/0vplJ2BqNtwLiODLl44ERJrTVeK68mS/qLWQvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HN28/w02; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HN28/w02"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so18909475e9.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 12:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788807984; x=1789412784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fNV/PaJl+7hbfGUtqotiisfuRbsQmDVNj+CEuEcj11g=;
        b=HN28/w023d543QMHIfXV4uxdrMn0aIy3PWLF4hZbICgvkG8r30E2fT/pcY/j6Ama+t
         O0HlVTNe5HkundSFS5gEXFRIfnVSAnl4RIFcHaidbyQImEyCicQA+K4Uu9GN4bajnthN
         RGUUpAptXs5gonbTZ5ivZiShaVLuTWiyW+ofV15DCPIXrHiVuPQ67JNMiFNgTmoaJCx6
         OYiN/dkueSHUTnpodcTsA+jxKRNGPU5crrw0AgXynofv5z9i4TJ4dvWhXI+eBPcmUBBK
         wQSZ0vBnK+3Caq9FBWVt4+Lab1Ae9JO6aYn5oghT8nA+tS1icSgRDoa/tmIBYfSjSRM9
         kY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788807984; x=1789412784;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNV/PaJl+7hbfGUtqotiisfuRbsQmDVNj+CEuEcj11g=;
        b=dGixfr0bDrKRQsVNPDvVvtI/J2fFyIB3u9cVpDbmY0NgMJDpEthuYmIH42Dhp1J0V8
         dXah0zgLRk5XFLTEm95hyaLiByZML3zfwFqnwsb5BNcclsPJ7UG8Bogf4kIXx+aplSJV
         e7TEuAWh5i0kVlcHUMa+qxmi9xJhNzO2L0qeLou7/uQihxIrk9m/Iupweb1v6nPb+QcY
         1oAYyW1J4M+Fwthzel6mQRnoJ5Vl5U7WczT16k7ST44NbNrs6smIvJiU3alw0tKJ4FYt
         WFpHmov+i+O2SA4psLmAMCgp+PfZuC/FXfrwUU/4yFJ36jPVNZPRzZ8c3QAMFxhkNPlf
         wdeA==
X-Forwarded-Encrypted: i=1; AKwUvBwNCIH81kgbT2wq4oBP6dkKTCj5AeZb+sAjO0aFyFuBYjtD97b4VY5PVqUWxo9Opka8RVluixb3J0I=@vger.kernel.org
X-Gm-Message-State: AFuF++lDaNi3yqZboiqsUU6RWab4QY3xvbeF0lMOg02GmyhQw7QgwM9a
	3fj7t4Uv6mJS4CQjWsvJGG+1Gi+UlmzOc3zuvO5djTOMbUrO4jtVU78Q
X-Gm-Gg: AYBFou2Faj49NKwM2/pmQqaunIqZ+/FTi1Zs2HPavzmZzp7oZ2J2cJJb9zOL4fQ464t
	OKTc39l6zUnUkJad8h4XmmkoG4CR6zbVkz8kYgaU+A7IazgCsfE0YoBYDz2g72bif8pXCxqDeEF
	OPK989ipiVbTm3dsTsrF++1Yg3MMlShYzDylma465Bzr0u7EnDy+4UEmjQgyZpEI0IoUUUQejBu
	j9zPAcI5FI/GSkVKQk/KBc+6CsxUssfopyAss8TQr0RQle15FTXIvn1vAw2KUCHIrZs01vpIwZx
	7fy9bF3YJHMD1nrGL5rjiQXzYMeua7yfZC0RUFS9IMRipl5Mn2l+yot1Wb3SaZbhdGCyhcS/47N
	vRXGJ5Yup/CoSArRxWd+GswLYDnTu8ito+Gtfop9cRr4wmmVAfHL8BPhNTNlmxgkk7aj//fWfXL
	j14CnThiyYt3SFbrpffZOiDIVcPjFjBmmUUASF1bZOODYE/OXoDykVo+Ugqw==
X-Received: by 2002:a05:600c:4e4c:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-49cf8206e4dmr255845505e9.3.1788807983653;
        Mon, 07 Sep 2026 12:06:23 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf770fcf5sm328296815e9.6.2026.09.07.12.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 12:06:23 -0700 (PDT)
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
Date: Mon,  7 Sep 2026 22:05:25 +0300
Message-ID: <20260907190606.662033-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6e0dbfed-cadd-4274-8165-886725413d0f@suse.com>
References: <6e0dbfed-cadd-4274-8165-886725413d0f@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

usbnet_skb_return() and tx_complete() call this_cpu_ptr() before
disabling preemption, which triggers a BUG when running with PREEMPT_FULL:

  BUG: using smp_processor_id() in preemptible code in tx_complete

Fix by disabling preemption around the this_cpu_ptr() call and the
per-CPU statistics update.

Fixes: 43daa96b166c ("usbnet: Stop RX Q on MTU change")
Reported-by: syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=04cd90bb99c6ef81a65d
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
v3: Use preempt_disable()/preempt_enable() instead of
    local_irq_save()/restore() as suggested by Oliver Neukum.
 drivers/net/usb/usbnet.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index a19ecf718f36..f1e5bc8bf932 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -325,8 +325,7 @@ static void __usbnet_status_stop_force(struct usbnet *dev)
  */
 void usbnet_skb_return(struct usbnet *dev, struct sk_buff *skb)
 {
-	struct pcpu_sw_netstats *stats64 = this_cpu_ptr(dev->net->tstats);
-	unsigned long flags;
+	struct pcpu_sw_netstats *stats64;
 	int	status;
 
 	if (test_bit(EVENT_RX_PAUSED, &dev->flags)) {
@@ -338,10 +337,13 @@ void usbnet_skb_return(struct usbnet *dev, struct sk_buff *skb)
 	if (skb->protocol == 0)
 		skb->protocol = eth_type_trans(skb, dev->net);
 
-	flags = u64_stats_update_begin_irqsave(&stats64->syncp);
+	preempt_disable();
+	stats64 = this_cpu_ptr(dev->net->tstats);
+	u64_stats_update_begin(&stats64->syncp);
 	u64_stats_inc(&stats64->rx_packets);
 	u64_stats_add(&stats64->rx_bytes, skb->len);
-	u64_stats_update_end_irqrestore(&stats64->syncp, flags);
+	u64_stats_update_end(&stats64->syncp);
+	preempt_enable();
 
 	netif_dbg(dev, rx_status, dev->net, "< rx, len %zu, type 0x%x\n",
 		  skb->len + sizeof(struct ethhdr), skb->protocol);
@@ -1298,13 +1300,15 @@ static void tx_complete(struct urb *urb)
 	struct usbnet		*dev = entry->dev;
 
 	if (urb->status == 0) {
-		struct pcpu_sw_netstats *stats64 = this_cpu_ptr(dev->net->tstats);
-		unsigned long flags;
+		struct pcpu_sw_netstats *stats64;
 
-		flags = u64_stats_update_begin_irqsave(&stats64->syncp);
+		preempt_disable();
+		stats64 = this_cpu_ptr(dev->net->tstats);
+		u64_stats_update_begin(&stats64->syncp);
 		u64_stats_add(&stats64->tx_packets, entry->packets);
 		u64_stats_add(&stats64->tx_bytes, entry->length);
-		u64_stats_update_end_irqrestore(&stats64->syncp, flags);
+		u64_stats_update_end(&stats64->syncp);
+		preempt_enable();
 	} else {
 		dev->net->stats.tx_errors++;
 
-- 
2.55.0

