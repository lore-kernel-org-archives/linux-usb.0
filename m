Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2BE3644C1
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 22:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788648377; cv=none; b=WUzuky16UdCSrrjV/TTO1HKim7llPqc5s1Id6j39LFSxGpTXhhZ9UhJmk3j0slZcmeb00o+JuWMohaqmEZncXMLJLb1c8ilQtg2YjYU4x5qpP3ZeyvFFaT/7/FHOeppDP4HBhY/OFQ948A/c3B28Hz/EVKZQIv8xCzL4sWKIITg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788648377; c=relaxed/simple;
	bh=kT9kzRdewywE20QTuvLmGN5Xdg6dqraQtlEcimWkFPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lr1StTf4dWfUFIe/qexGOAdJ66ShrtN/hu4absgpgGYsfi2CsSo+eMWqduRrq5KfuBEynjcaIq+jnKt0EXoLBrwHARZAWKNo9vJL9DFMFhctUSzHJmVcw/vSITtTnZ5OAAm+eq8pF/A66Vj+EzTuw1CsUL4+QuizOqBgfwGAQbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxFi9Ggw; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxFi9Ggw"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso19360195e9.3
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 15:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788648374; x=1789253174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zXyLFZp7E7THY6i1Yz79/ZXf1LASAsoTVkBr/TomcTQ=;
        b=DxFi9Ggwl4srI+z9KemND0WzjuWiO7V3XHv4QxWC6uFP+bhoRY/9lzCcayoVtQjvk8
         V/0NWTqCNCmLq9jVRB1zqescBS0dG7UqRHEL0fOz/rot14zhCd4726bde2/HRSTniBK9
         ZvtYLrGyNJBEF8oO1B4WZfzWqunCnZRSmfeDIh8JQ1PjO2LjIVHwcTsOlxZFZDS9AJxN
         qEUW/U6WD3ZUy+pTiwhoO5FZ9nuVURKUfr2+LVp68XKe/0MSZABPlGQ0vz31P9O+dJrm
         sEcdewH7nXwr+vWpScMdonf3IIn7qQJPO/zk8b5gs7TAQcJqLYmJ4SCw28bxcavNldTe
         540w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788648374; x=1789253174;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zXyLFZp7E7THY6i1Yz79/ZXf1LASAsoTVkBr/TomcTQ=;
        b=dYQmGy9YOKkgCXMcBJwJG3wP6bWOgVEQ8KzrcCTodVjpy1yeV0kUzE2bPSjuNOiFab
         tRlNFonyvQac0Qn+WWFO4jM0ilYYldbEhlBmXOb4ov2LccdV0qiEebmFGX/iPulqjbXz
         Kp6XqEi+4leMHILikkbPnrlmd1l1aCw5/C0AjGGuyFYiJePSUPr07EsopJljuieea25E
         xEpfhMFyDTIKgdEwmKbWu29XnFJDsXEsVKPMii38SE/9k0d+k604h1gQiP3sXkONd1E3
         1OyltQseK9ReZg0g7XAT8G6cWfUcVqVQaNK4/Y/aGi4kB9CurbWB4fJck3PwI0yVcWLP
         yahQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2P5G0v+SS+PlD2yrrlNDWhaJPbiKHJ9kDNfWUMZUX9W6FpjiX/pZQE7utc18gg040hS/1PCHQY6E=@vger.kernel.org
X-Gm-Message-State: AFuF++nEuHQ3WckBvanxom7LprrlCN9MrimzrZiXQCzEOCyiJAB8ui0Q
	LN0b+SOHg65eSyKJ1E7yM0pvICfU6hU3xKFH4btXorCGnc8zhpjqMdWz
X-Gm-Gg: AYBFou1Z87es0k+ygicYryyfE2USzZUntqJ4MPgMjM0S0xXrtqQWEOtNcb99itjAfij
	XtxxFP8h0mhSq0/6P7j84CfySzt4Ew9KqohSK5KeaguohEaFHF2tI/L1H9Q1IMxfJHVS2bHGe17
	9GnVb970CQaoD8HCDZvEY8izlRuTH61oWwRiHYQnYBgj9e4AVxIKKFREBgKsEoJBYNalmiZkPV0
	EY62EPVuDbcBGroxOirw9oN5mN4Pi766CoNT8fdzT2I36oXGANcl1neE0c5Uo3B9aUumkIWdcc8
	eX6u2emstJ2qNpmwUCJViUt08pUS/ubqR/CZ8bvRGLcMWUlFu+1PfhB9O3SaOql+c96F4bwMuL7
	o0OGlc7So4xOXmpohQrq+RmurhGqfjb7wzD227ptGzxo5AgY6rOemjnWJ3UiYeOGsMl1ZIQt9yG
	iPSiYj2SKRxPs9pCHDJMxS+73G4I7rbKRGEmrBaEW78j/h/RQH44MjF8Mmpg==
X-Received: by 2002:a05:600c:1c23:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49cf820a8e3mr161180375e9.3.1788648374221;
        Sat, 05 Sep 2026 15:46:14 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm261438995e9.15.2026.09.05.15.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 15:46:12 -0700 (PDT)
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
Subject: [PATCH net v2] usbnet: fix smp_processor_id() use in preemptible context
Date: Sun,  6 Sep 2026 01:45:12 +0300
Message-ID: <20260905224553.595766-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903165456.498079-1-omermetekaya0@gmail.com>
References: <20260903165456.498079-1-omermetekaya0@gmail.com>
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

Fixes: 43daa96b166c ("usbnet: Stop RX Q on MTU change")
Reported-by: syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=04cd90bb99c6ef81a65d
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
v2: Added Fixes: tag, changed prefix to [PATCH net].
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

