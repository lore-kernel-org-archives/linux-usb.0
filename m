Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641206;
	b=tlI07Yw0RFZBHhLTmGI3MVefsyWSL0yGSb3fk2j6xFfmKNKHpRqTh4t2uNH53zWsP4v5
	 78tqnKDP3RlpvMjrmHPahsAeM0Kt30JXsgeiiJPB75bKClVT7VD+5DmGqPgMcenDucz12
	 8ldyxR4lNiTS1F8npJOyQIQqrLtMdp7pZZKYhsZxG8HDT06VQGwjWLx5mRnZXEbXdqGvu
	 l6Sv1s1V1oefuBlQmYqH9OwY+cER9o70alLAMPSm2bqvgmFUQl5GdGeKZpr4HPCclRR9u
	 89k2+fB1bLN/pMqtUMjwRskpC4zBomFQll0TCNsb4ogzqEvRga30P2c1vjqQOrXB3YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641206;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=AYxNwlYjoI2/uyAaF5PFCrzANhHSTAvl+pCJ088T5bY=;
	b=heaevcw7V/ZTiWi9IJTm1Hne174UnfmRkAmV1IglcJQcpmJ2D59VJC5qszksnfJJw0RV
	 l0p/NqG2Y00sGRoknI/sJxbNG6F2bVjeWgNJ4UXOyA9RE5WLo/2ctJbjIBV7JoNpQ8sgi
	 BuCMPq8d6cTFi72MuF6uxpMFzssPLVzJhX8Tiuyuk4mOfFwVwLAo8EXNtcEOdUcr6ILes
	 COPwsduMVK5q0fniT6smJCLqi+b9YG8sg0LYU4Ie7XzIu6RVOW0C806WRzlsOYia7RdBM
	 lGfpNSdSkT/ZjqyBodNyGviA5Cog1BMcsnoFVFrNMLZd7PN/VLvM6bQzVGbI51XvGfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3D9606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 03:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB3D9606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-170135e43c7so1232765c88.0
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 20:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792641205; x=1793246005;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AYxNwlYjoI2/uyAaF5PFCrzANhHSTAvl+pCJ088T5bY=;
        b=KcjCiSZljNUpgOMB6q7EGL49nSeS1cw02aRVEktwTlFjNmVEB9z9S8GbbY0yGm8/xe
         mYFnUIBdMk+CQME46y20QpgtB+ZgeapjcWykOAK0kRGp55N7Up1nzEDNXm41ZoEHnzc+
         Kps5c3C4G/lXBXbRBCpoj4m5BX/DfuGyj9+2PF+DTTkmqh9bouFB/1R7uNduZ12qUCMQ
         BhE5HY51cFAm7d2Cf1HGd5X6V+P8Mb/HbpskHC0yfTG+UolqO//ymzWSjuauhlcu6x0M
         kvl36Xcwhk3EK0m2stXuzL1op3j1tU2HRb9RK0778BGHbBKT2dYvpHOnm+gViQ2Z0IBZ
         T5Ag==
X-Gm-Message-State: AFq9FYKqk5iCo0D7xWoErrhlFjR2PrHuOYuKi2ff2yJZn4+csYzBRkEr
	+cSaUn7Y7Hicp9rrkMyHO7/Si+Av7THmuNh2p+/a3aSc+wTtoMWeqBUdaN2IwQ==
X-Gm-Gg: AYBFou3sU5vvaMW0/KgngLiw1wE4dq8ILqyiW3Wi6efCzHSkx48+XBLb0Kf7HsPSo8p
	h9Dk7gJ92l3fOvumOFvpIn1CauHUIBi4KNrbQZ34b/5jjh1nDrEm8+Yu2Q9lHh7JE8t/B10VO1+
	RyeZoVbEJfPBk2yPOhgwvGJuPyfaChO2hBdxh4xC3LlCpWS7Qww89Vvzfwk8fV1t0VTKc9IHMZ4
	TPW99cAAlzQJ0xfnZwCACFBcYvL0zDbS98m52c77vCOm/nyb5vCyA73GMrwpqynJE7oRB2dyL9h
	OYlpiIeAsbWreO7tRHlnVU7SwqAuxMcQ1dnZeRDaSHVF73QKzONszsge88TNyw5r5Nxnra5ZQp2
	I0CP0PEjKLnG9eL/R2wNeBvNH7EfI0Xe2KBQ9MDPzOUxX6w7AurryHXUNBGa4Bcx3bM5nj96cjI
	EvIarrJCx3C4tb0XWwgkvR8KTCH559A5QWljAvA2K2KyuNYxor29zyt+pX50g7RlMSw1YckibFO
	m64nn+sjB6pzQf9WT6Q73by/5AikcI2whEzl7okU5EVO5+DovKwDLV1KuVeZyHAj7YAXAVlIKAF
	x0OMbRPUcYLkPs/OxEUTUxXwjs9YkVFDNJXdPNmmXtbNjOn+rYW0H82h0R8=
X-Received: by 2002:a05:7023:a5a:b0:143:6080:668f with SMTP id a92af1059eb24-190a6adc7b9mr4481368c88.7.1792641204525;
        Wed, 21 Oct 2026 20:53:24 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm10979489c88.22.2026.10.21.20.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 20:53:24 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To:
 Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, Oliver Neukum <oliver@neukum.org>,
 Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] usb: core: fix three use-after-free windows in the USB
 anchor protocol
Date: Thu, 22 Oct 2026 11:53:21 +0800
Message-ID: <179264120148.17277.68253767316647311@kylinos.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Anchors are usually embedded in driver-private structures, and several
anchor API returns -- a non-zero usb_wait_anchor_empty_timeout(),
usb_kill_anchored_urbs(), usb_poison_anchored_urbs() and
usb_scuttle_anchored_urbs() -- license the caller to free that memory.
The wakeup protocol backing this license has three windows in which a
URB giveback or unanchor still touches the anchor after the caller has
been told it is unused:

 1. The waiter's condition check and the giveback's suspend_wakeups
    decrement plus wake_up() were not serialized, so the waiter could
    return while a giveback was still in flight.  Reported by syzbot
    repeatedly since 2019; patch 1 references the two reports this
    analysis is built on.

 2. __usb_hcd_giveback_urb() captured urb->anchor at the top of the
    function but incremented suspend_wakeups only after DMA unmapping
    and the usbmon hooks.  A concurrent unanchor could empty the anchor
    with suspend_wakeups still zero, so the waiter returned and freed
    the anchor underneath the pending increment.  No syzbot report is
    attributed to this interleaving; it was found by extending the
    analysis of patch 1.  Patch 2 folds the capture, the increment and
    the unanchor into a single anchor->lock critical section.

 3. usb_unanchor_urb() and the giveback read urb->anchor and only then
    acquire anchor->lock; between the two the anchor can already have
    been freed.  This gap is as old as usb_unanchor_urb() itself and
    cannot be closed with a reference count: the first dereference of
    the freshly read pointer would have to be the increment itself.
    Patch 3 therefore turns the wakeup protocol into a lifetime
    protocol: the lockless anchor reads run in RCU read-side critical
    sections, urb->anchor is published with rcu_assign_pointer(), and
    every return that lets the caller free the anchor holds a
    suspend_wakeups pin across one synchronize_rcu() first.

Patch 3 changes contracts, stated up front:

 - usb_kill_anchored_urbs(), usb_poison_anchored_urbs() and
   usb_scuttle_anchored_urbs() may now sleep even on an empty anchor.
   All in-tree callers already sleep (they sit next to usb_kill_urb()
   calls).

 - usb_wait_anchor_empty_timeout() returns 1 on success instead of the
   remaining jiffies, and a successful wait -- including one with a
   zero timeout -- pays one RCU grace period.

 - The cost is one grace period per successful teardown exit.  On
   x86-64 real hardware, 100 consecutive successful waits on an empty
   anchor cost 3.1 us per call on the base kernel and 8.2 us with this
   series, about +5 us per call.  Callers that wait once per batch
   (zd1211rw) or tear down several anchors at close (btusb) pay this
   per anchor; it is small next to the URB I/O these paths bracket,
   but it is the price of the free-after-return guarantee.

No fields are added to struct usb_anchor or struct urb, and no driver
changes are needed.

Testing:

 - A QEMU/KASAN attack harness reproduced each window separately
   (deterministic arming for the two giveback windows, a forced free
   inside the read-to-lock gap for the third) and verified that each
   patch closes its own window with zero reports under identical
   pressure.

 - The full stack also ran on real x86-64 hardware with KASAN kernels
   built from the same base.  The base kernel hits every probe: both
   deterministic windows fire within 100 iterations (hundreds of probe
   arm hits), and the natural-race variants hit within 2000 iterations
   with no arming at all.  The kernel with all three patches runs the
   identical workload with zero reports -- the attack still executes
   there, its probes arm hundreds of times too, only the windows are
   gone.  The zero-timeout contract probe (empty anchor, timeout 0)
   returns 1 as documented.

checkpatch: 0 errors, 0 warnings for all three patches.  Patch 2 keeps
one CHECK for an extern prototype in a header, matching the prevailing
style of that header.

Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>

Hongyu Xie (3):
  usb: core: Fix use-after-free in anchor wakeup protocol
  usb: core: Close anchor capture-to-increment race in URB giveback
  usb: core: Close residual anchor read-to-lock window with RCU

 drivers/usb/core/hcd.c |  10 +-
 drivers/usb/core/urb.c | 303 +++++++++++++++++++++++++++++++++++------
 drivers/usb/core/usb.h |   1 +
 include/linux/usb.h    |   7 +-
 4 files changed, 277 insertions(+), 44 deletions(-)


base-commit: 22430ae5d90ab288b0ee2ad99ae941f4a666b694
-- 
2.32.0

