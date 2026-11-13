Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794543607;
	b=AyErFskkHvJE0MWuRXshmJWaM7QtQVeNMbedD3BRNr43PFtiYvnK179sZWpcQmQdGqql
	 x/rM/TyBAWlxdxXZyyGbuz2Napn6ZAqjZm2Zfm1T0SmA2Hbc2gTeRAJILZlfUxdiRhUHj
	 oOt/Plx2v4sHsxpCbMU/wobCasGPZtGXr+GgMCfVVpOYo41S1M/rWicpECob1M6YVzrH0
	 j3iZ675axwtCqOB46t8SA/IQpLb11p48Sz7Rb/vxs6S2VVuuy7/uatNyY7Izxgc8/Ptac
	 O6LN9jPtKeRpRjDhuzOglJKJedzqY8V8ZsM4qDEWQQvw+MZdeXgVDxhI/JGIY/BlDtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794543607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 Message-ID:Subject:From:To:Cc:Content-Type;
	bh=dYyr6kASLUC/BUfTOqaEjVuuLM5YzVSIiMSIdWbr0Xo=;
	b=fNqMRD2lijb2E4iSUy2ngmFk8oKKbXoyYQ863Di+aGn1nZzMh7AXX5Z5YRNuwcwrhxBM
	 nj1IEtAaFuN+5NhGtnqJiEys5Ycl/Bir3ubWSbCtbJNCrPVkv9GggznC4VEfQVJQMaozo
	 mFlT2GG+jJc27hbgcd64OGKr2jYHOwSiphtJ7l3cHo631eJ2O0rVpTuR4FFCT/oAG1LYW
	 UWOIxs9AuLvUBHnxdYmAMpYMj11MVA1WORltJqf9Pk9DVB9wmMaANHKwvfh6w7L0XV5PM
	 yuj6curL1hxKM+Z4b1sp8UPb13s6j9XUhJ3xzQti871ZOzhF+3rqGTxoUHqwQXZcTXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rickyniu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DvFdHR7w;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4958606A321
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 04:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4958606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rickyniu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DvFdHR7w
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed47dc8f3dso9868315ad.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 20:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794543606; x=1795148406; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dYyr6kASLUC/BUfTOqaEjVuuLM5YzVSIiMSIdWbr0Xo=;
        b=DvFdHR7wF5OPmGnkgRHeJm+Fetrr9YhAoKZRNghdtZBLBWDE/1aZXq4tRCYmiZfo5W
         qUvuodEuRLLyqnjPAcYVpA8rprEaKlGnkCtTUtR9BC1AJcshvyHcjzLJ8WGrNdGeXGVU
         oxD1Sc78PXLk6m/kSrYGk1IB1PvEI369qjs0+WCFQ62I7NGPEpPKk3Cj4tDdifNXVYMe
         SqMCk6nPkholguWDteciZz4mKf7lbLG/cIy8iLY3k8TMMDFw+Jbzd2OqnNYXMOnV+n/L
         l8hRcDZNJBWNilbJn+ZseGAgjEvf3fSJ1hqBb64PxWMHA0QQxzwlOFNjZe0WlMQegCuV
         toug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794543606; x=1795148406;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYyr6kASLUC/BUfTOqaEjVuuLM5YzVSIiMSIdWbr0Xo=;
        b=ODqZiqa4emKS/vo6AiOT6OsEhT3GeoW5SZ4llje9SFkN3eak7NqYgt7x90+Jr/fn/h
         399/v/+C8A4t5aXdPQdCuz2A3c2nBFMjfVCE7afIJ8yG0PBbXKDBY6L1tafPzcvl0xxx
         st3koHwYIfROtttRm9L5+ffo4QykRB2TQOJN+AfLOGpWxc7TwIMSL9rc80kGQSy+Jd1v
         z73cvZbNJBfuG4NoCnbmvcawCpfzgP5t9kH/I+zrvQON27n7Xfj+DlkqhyQYaflUObi7
         w538R64yQQY3sLpoF7LV5+3ylFPQp/xPrsimU3NUe+XmIRHDrMnxy+AfMeSmRBcQdwoh
         BAFQ==
X-Forwarded-Encrypted: i=1; AL+hErESIvKChMcNJQAfbtkZFb3xXL/lSY7MkPASl++FjSUaq3ReOioedg5jJk8VSZnpa8ejeQwNuteUDoc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tz8cZthWGbxW3H8XrucpPEc06SkuJl2vwSfGUmetf1SYH+8Mp
	se37jVnyEQM3Ko/iX+75+/Jz0agdxjZzwg9itqD4kCyDr2YFTQuYZ17/OiBLs9LwViPzC9CME8x
	his0ZVxJwirTZQg==
X-Received: from pla14.prod.google.com ([2002:a17:902:ffce:b0:2ea:7f9c:2ce])
 (user=rickyniu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ccc4:b0:2ed:118e:7faa with SMTP id d9443c01a7336-2ee0de19c7cmr12354605ad.37.1794543605590;
 Thu, 12 Nov 2026 20:20:05 -0800 (PST)
Date: Fri, 13 Nov 2026 04:02:37 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Message-ID: <20261113041948.1280304-1-rickyniu@google.com>
Subject: [PATCH 0/2] usb: Fix giveback_urb_bh deadlock on URB dequeue
From: Chien Kun Niu <rickyniu@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chien Kun Niu <rickyniu@google.com>
Content-Type: text/plain; charset="UTF-8"

We hit a CPU hardlockup during reboot while usbnet was unlinking
queued RX URBs on a halted xHCI controller.

In xhci_urb_dequeue(), the err_giveback path releases xhci->lock and
restores interrupts before calling usb_hcd_giveback_urb(). Because
usb_hcd_giveback_urb() takes bh->lock with plain spin_lock(), an
interrupt arriving on the same CPU can deadlock on bh->lock either in
usb_hcd_irq() or when softirq runs usb_giveback_urb_bh().

Patch 1 switches usb_hcd_giveback_urb() to spin_lock_irqsave() since
bh->lock is also acquired in hardirq and BH contexts.

Patch 2 keeps xhci->lock held across usb_hcd_giveback_urb() in
xhci_urb_dequeue(), matching xhci_giveback_urb_in_irq() and keeping
per-endpoint URB giveback ordering serialized.

The two patches are independent and can be applied in either order.

Chien Kun Niu (2):
  usb: core: hcd: Disable IRQs when taking bh->lock
  xhci: Give back URB under lock in xhci_urb_dequeue()

 drivers/usb/core/hcd.c  | 5 +++--
 drivers/usb/host/xhci.c | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)


base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.56.0.567.gdb80ae8cd5-goog
