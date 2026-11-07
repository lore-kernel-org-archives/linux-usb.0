Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794072977;
	b=B80/F2Eg8ciF9B/cUZsbJomIYh+66Sjt45cKEf5BD3nkFD1bcafneVU1BphujFn/d9OX
	 T5lBe+EFawJKBm226N6dtFE7N9yGE1WqzFwWPkVpn3q0DiTF9YWQj2mU6DQhpdZV0xaZM
	 OAQyXbtfSZZk6Vz2nqG8RufUMYxq4g2kbvN1gN0XMU7W+eUWUVQ8vAh8Z9SVcFZIFncxu
	 knmVgqHiHSd9ntWqtTbUPEmy0EG+D+m9//FMJhgN9dyX2P3il9KFXlN98dbZb0obfM0eA
	 JR+7KgsLZexwwIIBXRJt6yZEvECmo7bjvo2K2PGCmig0HCdqD/lZq8rrZxOerKeu5+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794072977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uaz4GMFw+Jwy5EdGkS0rWgXGmi0j24GaczxcJZyC6vo=;
	b=v4T4kRp8Yzcix+vaOUMPobK8KndwbdHKTaV8mCf9KjpMG50qjqsgnmqOSt29ZwudRmRA
	 bGZbbJi1vRprt/jr3ZaldjJgHGtvc+p6Yx8KaNrZdmN1nWUqw7zvYb4MA3Q5qsNFgKE0e
	 81FnfElJyw5ZNkFKo1+RRlUgUICiQLvgRjNRa0wAiJ82WxP4lQ167EzKmRjKrH7fYHI2m
	 SqlqFZ5P/VVgu7JJmL3ldCYGS7baeTAZQfcqAKJwrrIZ3d+oS3OnUuf+0IXKgwCQQw+pb
	 Xxerf6ysmJPqIFsnLvt4lABDvs7z5jibTfEbFTkk0SrdALzdfXtrFcC4qLvwfsOcpnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KWcM3yPW;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DAF606A32D
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 17:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03DAF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KWcM3yPW
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b566cf56c1so1760305a12.2
        for <linux-usb@vger.kernel.org>; Sat, 07 Nov 2026 09:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794072975; x=1794677775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uaz4GMFw+Jwy5EdGkS0rWgXGmi0j24GaczxcJZyC6vo=;
        b=KWcM3yPWZajrCpfM4VpWQqZg+4GMoaxVgSP9O8HcY8/OlaGCu91OOFJhR/4cz7q/qK
         NX4e4d5ABbzkxhBMswufhwXOqfWPx6jeR89xZ/Q8jmgmRDV0KDvcRdFWKf2uvwy8qdfA
         ttMYxWo69+TeDef4gaUgrofO0yp+4j9djYPNKnsFTlfAd2QnniHCYPPbykiSAStHVRD/
         jPRkAhB6QGHWrWT1/pBK1imCj3qI4KYLXU78fod2R7a3TPMH0DvXqqUmYFKO9rX5aXhU
         WOcUtZxNQ48tucC/evhHOGf7Iqv3Q8bmbFnDjjfdjrTu9kLb0VohaZdzGf+Zo8/hBn+T
         eFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794072975; x=1794677775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaz4GMFw+Jwy5EdGkS0rWgXGmi0j24GaczxcJZyC6vo=;
        b=aeWpyFG93R20KhxCvcfG44y9S+RsxPMX/Lm2Je6Td8s79WbGtPGOY67ZE4WS8NwENa
         2f94w6DxY9/AyC6FB1Vh7krWpf6/4nAYyWq0XPzFw0eK9hGbJuuJhLKvC6Tul27mJSrY
         ftFJwJzPi4U2Z0Ej/9jmleAXcHz5uM2ikbq23DTqvZNNG5otBeLpuRTS7ojQjvjkqy6x
         5+2aBLeRJq2c3Dl0CDzZueOehFO1SW2dqjxqUt/KPii6Fo1MFr0ck5K1vsmK0UeVXcqL
         uBX6LlVDWKfdXae3PWwEbTRGkDgKeMxUKToGAlecnhWO5Djqbwh1noeJD/D3geob3tzf
         kuHw==
X-Forwarded-Encrypted: i=1; AL+hErFbEzwZLGdHvqWdwmRzGBdqjkVrZp3wET7sNORX6KcMBlUwUTbOSxKJv5rC8pxuJRmkpXfcuHovS8s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qaeSwRV5DhE4w2SYW9Q9LCaSiiW4Fen+zUBe788lXajs+ijzv
	F0ROUutbEtNfmM3HejX7jxmhG9Fqbx9yRILfyYOPWFEhYLGN5UJUm5t1
X-Gm-Gg: AYBFou3J/As2CwWpz+uGaQJuLiFatWyi02E1fKTm8qyOcAdQPoTDvWEPR2M2uavenrR
	sF2y8BXa/M/Uj2FPUkFxhc7EGXPDHIGzzyJo0xtj8u4HdP6CkUfI/YAMs2b1Ow4OfpTEgWVfJKl
	Naimf5cRHoyIwCIjfvKsCMRWpEk9JBtK3OPsUm/L60vd+VCP5jXaCh+40w5HOob21Ac2IuDzH/S
	VRe0frSuhvnCwXcfXAxX5w3/0QCANsOyeghywVXebSBbORbCbsgx32x5Efo1dkuwFUV8cqRRAj9
	LRbUXNVFB3WbUzMCLzmnC61/yVR0mqVzt4039P+tZWeDhtr+WgW7i7pbNeG1QYHxIOFk3ZP1DvF
	856uAbcUayLTpj/ka0fpANPEdBMbmGNFaIJfVmgE7vpKl4MVvC6j0RnCVRLBLgHTCNrnueUsnFu
	uakmmzSU26yi5UMx+eYt8MJ8SAaPRCzC6482zh/MdoZVzKtTUlfjmdNdj8xskvWSAvowcv6vzr1
	jfntzPQmMEWTq/IgKRBQ0xAfOCYxMyAas3Jd7DJSWpo7PY/IhrzRgCt26caB/zW9ZQOjffo0RlS
	P3LWclzLjH67f5W5T8sTHDEkwXwiFn2GijMJn4vEeHGytiiWh74siQ4r6L8=
X-Received: by 2002:a05:6402:5384:b0:6b4:d7fb:affd with SMTP id 4fb4d7f45d1cf-6b5977de20emr4001934a12.12.1794072975168;
        Sat, 07 Nov 2026 09:36:15 -0800 (PST)
Received: from frame (h-155-4-132-44.NA.cust.bahnhof.se. [155.4.132.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664afbc12sm1890076a12.22.2026.11.07.09.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 09:36:13 -0800 (PST)
From: Elvira Khabirova <lineprinter0@gmail.com>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Hubert=20Wi=C5=9Bniewski?= <hubert.wisniewski.25632@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Elvira Khabirova <lineprinter0@gmail.com>
Subject: [PATCH v3 0/2] usb: musb: gadget: don't flush a waiting RX packet
Date: Sat,  7 Nov 2026 18:35:59 +0100
Message-ID: <20261107173601.63095-1-lineprinter0@gmail.com>
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

