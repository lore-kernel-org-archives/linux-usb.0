Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794089958;
	b=2aL1T1zDtMZS2Y9binVp3zaPFAOwQ4Zde+vJeqPKc9UXWzPNBzcNDGe26Ebmm+bCpq2o
	 ub+K7h7N+4PuY9WUsnrGFvK0uzIH80Nd/AU4J+11eEQTkZtY3k2rhURShffaVm0VnCPTX
	 ntKuJZwmZApN2NrfMbUe557XuAASnkUo5t/sTlzCHJagvGroz/lV90Ga36HQ30fmKbWqX
	 MeQQ6ypt0AdGKnwRi81LDWe1tdL0OBEkW2iRIdvlUhH5VwlDq3Llgn05m9tYwj5zDKIie
	 EnlHIFI6LI/lC3gMZOszeULc8U6WINRXP+K+Gh9r8qOplXTPGvg7TbZmCnTZir7IofQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T5ifILwxqBW41ZTJj3g7LF1tT8j/uMMKaI1dqm1hN9I=;
	b=MSCXCWFuhNjqBS59EpHv787oQktuERuiJ3+sI0YTcbl0/5xAypaPH3FjIIgVbjd0QH4y
	 Fjub+bWtsb6vy2slRH8zpYgxXp8IPh/UjxovW5feean5n+31HKcS6TLlcjq5ywji6z4mG
	 /w1/N1Oryy6dDuz+Jl8JQdKScV90fs1iSOAyaAFoOI1RJmCE7ymfWwsUrXbqETW5c+hWC
	 +AF5KQePjhIwpE+JPFdS92y3LDUBaYZlvWf+STaf7/LuPLR/+20qCDUL1vKGNGOsB1lCB
	 SnfJePQVBZSnThSyyROYDTEfxLBv3dD1T+1ZJUuN9nJyFzitumaGg8mXSGfSSr1vQYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bgrEUxjH;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC29606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 22:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC29606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bgrEUxjH
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c49c32650adso4332966b.0
        for <linux-usb@vger.kernel.org>; Sat, 07 Nov 2026 14:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794089956; x=1794694756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T5ifILwxqBW41ZTJj3g7LF1tT8j/uMMKaI1dqm1hN9I=;
        b=bgrEUxjHPyo76/jXJ7FJmIMSUT+CYLz0nYMJi3pmYqKIJtn2t+flz0qvDvjcCSKZxV
         /Jv45O3jNVCUeW1CtRPN9hLlyCLPsq7Qc9p74dSoCbpnAc06VokqOu4vOcvRL+XjhUWe
         R01ay9RTEe0A02oghkRUBSD4gR1BX+uV24Eq+WKN5D2viJRsrBvT0akh1KhRvTksGAnM
         JsjKfGCqD9sqfbFQvLH2tCV9JvLtwKF+G//tdl0UwN+zXWswGKpiOW4pRS4he60nfbNv
         5VqfThWHeOv5ywbK78kvpoOnL4RcJOiQ6vd1SFjYclYTgyOILOEhtXGcOMTo2KyA1G4I
         GEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794089956; x=1794694756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5ifILwxqBW41ZTJj3g7LF1tT8j/uMMKaI1dqm1hN9I=;
        b=d2ay8e3RjZiXHJw/21/XRaAiwNvZrLnMJwEqr/z/qTqrX5X27UddYN0CslRMFHpBue
         O1DidEfoMYuRjfQCN86boB+CU8g2+ntiY6jXGGhSI1cijk07LZVl+Zgejh8Br1flcedu
         naIdpGoev6WL8Hd0yGXD7d+kZaiwa6daAanHv4szOCbYBMxEIP6z9ExZ1rx8+JvXQil4
         m2tVC7dANgOpfGFjj81iNqJVsZKaVnzO/Trv6yrz564Z92GxIO4LBjOEUWMMie+zgJOH
         ofqoJ0UMua0kZ2mi11hVZddKKIBzVRZiTAxVPXc9ugoMVOTo8i1S3GB5Owq0IkG/bhBT
         4oQQ==
X-Forwarded-Encrypted: i=1; AL+hErHboR6unJqKES81zr32qACeGnx/lP3SauhGT2OMADRbdaEq1jCAJSZ1JS/VPzWDylr9FWt5xbDLoPw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fWtxI7wbV6zBcV2JsKS1WxK7RUakr6dVEtnTQnnMJFE1fODVi
	v6GSZQ+sajY06zFLDBuVIMO5CZhfcE1dh6UzPcwRcDLYHcpV/9CP4ikv
X-Gm-Gg: AYBFou0fh+uU36NunKLfZm8sZyYAxgrY2oVd5RxFgca8GGGSMpWZz6pLQAolnpqk4AS
	Kq6tnszKRVExkqFz843HJpoRJofavP+1bfID+DkJNEP29SiYWTY5EM84mb9tEailYua9xrUMtbd
	ipT8FUM0hC+awWvW5kE/XgzqpOcVfv0pmOhAZ/ONzYM5+YtGmNB/1XiQ8nUEzBq6E0eoo7PaL70
	K5hGJkAESb6aS8vdaKoVXwHzGA3MyudrTrXJlUJkmePnsb1tQMBDEai06dFplaoB0NgbELjaOhZ
	c9fZeoDGshws8Vlt3v6dMDBipHJjVZjBDixGv4k0hWhKVPPTXPEoYZrOwZPPc6Z+Sm2AMquXTkx
	2SsxQHVfdsSMFy/zNnJOePShKHXrVBf93I2Ti7KHE6ENWhaqKMNpaNtohIhKnJ5h1xDEz467NM2
	Nb4mpud1ycXjNDvSBJkxSrqvKbyY4IavnNviYy0I1305Dxn3Ep7uHvdhN3z7qj/NR/oaFi3opGh
	AyKPkIr4zpnq9sG+OtsK+n3NJzINH9MnhXlpaNDr+AiKjZMgjgIe5KxTqUqWgBfQZrNndUAMzNG
	P2LKcxjoTvgizRNZSvngedq7u/1bfVgpEowG50crRpez8CnDyqpRkyOClWQ=
X-Received: by 2002:a17:907:97c7:b0:c40:38b5:d784 with SMTP id a640c23a62f3a-c4d6d4ec638mr14873266b.22.1794089955748;
        Sat, 07 Nov 2026 14:19:15 -0800 (PST)
Received: from frame (h-155-4-132-44.NA.cust.bahnhof.se. [155.4.132.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a474e3dsm14108866b.42.2026.11.07.14.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 14:19:14 -0800 (PST)
From: Elvira Khabirova <lineprinter0@gmail.com>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Hubert=20Wi=C5=9Bniewski?= <hubert.wisniewski.25632@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Elvira Khabirova <lineprinter0@gmail.com>
Subject: [PATCH v4 0/2] usb: musb: gadget: don't flush a waiting RX packet
Date: Sat,  7 Nov 2026 23:19:02 +0100
Message-ID: <20261107221904.82487-1-lineprinter0@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 3fc137386c46 ("usb: musb: Fix hardware lockup on first Rx
endpoint request"), musb_ep_restart() flushes the RX FIFO instead of
calling rxstate().

When using some functions with musb, for example, f_mass_storage
or f_acm, this code path will be used mid-communication, and it will
cause data loss.

Patch 2 fixes this in musb_ep_restart() and schedules a bh work item
instead of flushing and losing the data in the RX FIFO.

Patch 1 modifies the semantics of musb_ep.busy from a flag to a counter.
If usb_ep_dequeue() runs at the same time as another musb_g_giveback(),
`busy` could end up with a false 1; this would stall an endpoint.
I added this patch in the series as prep for patch 2, because patch 2
would otherwise add one more case where such a race is possible --
a musb_g_giveback() of a work item with a musb_g_giveback() of nuke().

v3 -> v4:
- Move musb_gadget_enable_rx_kicks() in musb_resume() to be
  after musb_enable_interrupts() and under musb->lock (addresses
  sashiko's "premature and unlocked rx_kick queueing in musb_resume()")

v2 -> v3:
- Added patch 1: `busy` is a counter now (addresses sashiko's
  "overlapping musb_g_giveback() calls wedge ep->busy" and
  the nuke() part of "race and ordering bug in musb_gadget_disable()
  for rx_kick")
- Schedule a kick on every OUT ep when resuming to avoid stalls when
  the USB session is preserved across suspend/resume
  (addresses sashiko's "lost rx_kick across system suspend and resume")

v1 -> v2:
- musb_g_rx_kick() does not re-queue itself when `busy` is set.
  Instead, musb_g_giveback() re-queues it when `rx_kick_deferred`.
  This new flag is set in three cases:
  1) `busy` is set inside musb_g_rx_kick()
  2) musb_gadget_queue() adds an RX request to an empty request queue
     and `busy` is set
  3) `busy` is set in the beginning of musb_g_rx() (addresses sashiko's
     "RX endpoint lockup after giveback in musb_g_rx_kick()",
     "softirq busy-loop and livelock in musb_g_rx_kick()", and
     "race and ordering bug in musb_gadget_disable() for rx_kick")
- musb_g_rx_kick checks musb->is_runtime_suspended now and exits early
  if the controller is suspended, and the work items are disabled
  during system suspend (addresses sashiko's
  "unushed rx_kick work in musb_suspend() accesses disabled MMIO")
- This time tested also on a Pine A64+ (Allwinner A64),
  which has both MUSB and 4 cores.

v3: https://lore.kernel.org/linux-usb/20261107173601.63095-1-lineprinter0@gmail.com/
v2: https://lore.kernel.org/linux-usb/20261107105505.6554-1-lineprinter0@gmail.com/
v1: https://lore.kernel.org/linux-usb/20261027202744.79556-1-lineprinter0@gmail.com/

Elvira Khabirova (2):
  usb: musb: gadget: count givebacks in busy
  usb: musb: gadget: don't flush a waiting RX packet when queueing a
    request

 drivers/usb/musb/musb_core.c   |   3 +
 drivers/usb/musb/musb_gadget.c | 128 ++++++++++++++++++++++++++++++---
 drivers/usb/musb/musb_gadget.h |  11 ++-
 3 files changed, 133 insertions(+), 9 deletions(-)


base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.53.0

