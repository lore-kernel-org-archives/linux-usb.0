Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97CF26F29C
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 05:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783921108; cv=none; b=nTsvWmEaMAf75OVL8vrRdgy1KtgPka6E8NayhuveslmWqs8BEL+Anry4sYlftW5tL/K1gEgTZ+gUpYWxziXQ41H2gONfDhIdn0OUG2lwZNGk0gYf5wVnp2SBwRa0aUfxhNeGWKiCCGrb9w/S8IMVNkaKwhltYupzsAYMqmXv09c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783921108; c=relaxed/simple;
	bh=eauprXwXHzSDmMa8lR/3cLb7PNmC7AfAZ0kFs8RPt+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQM1V/8vdAhGFTiljBzbeyqLSOUI2JsOiy1Q4kefXqZQlDCG3nczEJfPrabJCIK8H70RGFbG6nY2Myvx843KDCxoxtGRMqGKPEVxe70TprT4shIZOA4PAQNjw8shpFQ3hBk+/wzl0hY6S54ExiFQqAz/9KfHFZG/nSV3QZNkknA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJbCh6ED; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJbCh6ED"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84864086bfeso2706131b3a.1
        for <linux-usb@vger.kernel.org>; Sun, 12 Jul 2026 22:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783921107; x=1784525907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivIVSVi0tei/ccOpIZ9e7O0axGdkjSgdrLeU2t78Aik=;
        b=cJbCh6EDCQog2mHYuj+NYerBKQFOpfkJs7rLExyfifiER2REhdqaDSJojN5FaLbqrF
         NhM0oCxw3DGQHMYshUsr6swHS4nzkWJwOjuEBC5O14UWsR56HetcNxd1HVTypIP2fk3n
         3gljmi5Hw5FRKNutKinPDhz8+SOn1JbYAM8NTvfYl/ZUfYwTWi9oGrE0l9aN96YagqJd
         JPgcEqkzTJDtD9GG5NOwdZ2R6RTiIfKdHdZC1CTPVncZo8PEsVAS0Yd6kn2IkGSqWfDa
         //HBmKbBOFMlATU6VN+wpkXPqbx7kUGY351Qh6qYAiUaVO7tN++RT19XZbKcI5VzTKZk
         HY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783921107; x=1784525907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ivIVSVi0tei/ccOpIZ9e7O0axGdkjSgdrLeU2t78Aik=;
        b=oD8DRajneFqXwKuDuA8KnyBz4GXbL4swFG36dAU4bQCMfHnsIMXKDAWRidm4w6JVLa
         xquQI3emXu5ideUe42RZWfC03i/tjpeY7/KWCBdgz2eZuTLgCGyAdVbWCGcYBHE4fl+H
         K46I0Fz0QT+iw9GWPSjtZ9z0b9OKssoYzIbzorI/w4in4gVmoKf7q9dsa1PyaQ/8vPml
         NjSB1A1QPZPNCOY87OxrlXcYsCPU1aD5Odhg6FK4eROenW36glUDTCRb/6MiwRkpqsGU
         tTjyGHieOa6Z7Iinig61ng1bGe9enXOpi9O3bwvneDh+ZcBoZchoVSJbDcQCeDId51rj
         ErfQ==
X-Gm-Message-State: AOJu0YyC8FED7NnPvcE8nl/cdYhF0k1g5Y0bs8akm9hIV0Yz7JWT2M46
	BGT7XsbhvMvZFoKp2EOSbAkmzxmc25gyWFPuqGOyBergDL1jiN8h97joAl0C+8kDQBE=
X-Gm-Gg: AfdE7ckLhY/8P7FWdCB2Ej+kLVjwrdEF1ufsy96R3oDjEm/PxO20FmOBzW0ea9DW9jX
	ZZaHC9p1laK77GS0+fHlsLBUcN0WggCa1X69BhFEtQ3n0251YUkpRTBktdMdT3JErv3UM6+xFKC
	pSoISlWB8QfrqxMdeigWkdJe5MeU9cMEX8CJ6X2Kwyhg6OCwDMFkmhOohbB199bLt43ki7+/tlI
	VashFiIfKem1yrTk8Bkf/DCxzOI1bXTtS4hWU3dY+vM6KrKk0gieSAUSjWOyZzOHUVPtEgAzvRW
	1t+ki7nPmasH2S2w1D2icSi1cuM2XayIM8nVkkXYGPLeSEfGETCX/zI5vFjzM7Oma5ehJ+62QMi
	+pUsYdJvL/UHW0eF8IYIQn2lPbte4Fd5UoAJqCi/mPaZQcy+ehOMWWUba0cTX8sNk9DUgvTWtlK
	QPTVerXR5lYHytErcT+/4hQggH8UTIKB9J34EhuA+x0Oq25eVZlyu2C0MFdRvhChhf/dCZhfkF1
	NNea5NL3z0kktNR6JcDgm88ySmu6Y1MGn0lBYkku/YNE1TqyaqWF7lz+0Fu0hg+vvoaUzJo03d9
	wOrH2FHUoo9cNZoFO7P3o3DS9ARAOPg4l/UiAvenK9M9Ck5BfWv5qiIgYNlhsYCalxqU3Ys29MB
	rC/OQp9dzqe3inQ+9eDYH/GUAOPDxiCu6YQs=
X-Received: by 2002:a05:6a21:6f13:b0:3b4:b340:411d with SMTP id adf61e73a8af0-3c1108b5fe1mr8860026637.24.1783921106934;
        Sun, 12 Jul 2026 22:38:26 -0700 (PDT)
Received: from HEXER.localdomain ([175.157.29.69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4b97661sm32915270eec.7.2026.07.12.22.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 22:38:26 -0700 (PDT)
From: Kanishka De Silva <kpskanna1915@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kanishka De Silva <kpskanna1915@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: adutux: fix unlocked read_buffer_length write in adu_open()
Date: Mon, 13 Jul 2026 11:07:37 +0530
Message-ID: <20260713053737.912-1-kpskanna1915@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026071358-illusion-basics-1146@gregkh>
References: <2026071358-illusion-basics-1146@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adu_open() clears dev->read_buffer_length while holding only
adutux_mutex, but every other path that touches this field
(adu_interrupt_in_callback() and adu_read()) correctly holds
dev->buflock, per the locking scheme documented at the top of
this file. This is a data race: an IRQ callback incrementing
read_buffer_length concurrently with adu_open() clearing it can
have its update silently lost, corrupting buffer state.

Take buflock around the reset to bring adu_open() in line with
the documented locking contract.

Cc: stable@vger.kernel.org
Signed-off-by: Kanishka De Silva <kpskanna1915@gmail.com>
---
 drivers/usb/misc/adutux.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
index 369d0d2..606ef91 100644
--- a/drivers/usb/misc/adutux.c
+++ b/drivers/usb/misc/adutux.c
@@ -228,6 +228,7 @@ static int adu_open(struct inode *inode, struct file *file)
 {
 	struct adu_device *dev = NULL;
 	struct usb_interface *interface;
+	unsigned long flags;
 	int subminor;
 	int retval;
 
@@ -265,7 +266,9 @@ static int adu_open(struct inode *inode, struct file *file)
 	file->private_data = dev;
 
 	/* initialize in direction */
+	spin_lock_irqsave(&dev->buflock, flags);
 	dev->read_buffer_length = 0;
+	spin_unlock_irqrestore(&dev->buflock, flags);
 
 	/* fixup first read by having urb waiting for it */
 	usb_fill_int_urb(dev->interrupt_in_urb, dev->udev,
-- 
2.43.0

