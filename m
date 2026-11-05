Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793899980;
	b=05xLXHlNLRDLNA5U52UXwLQ3Ur9dMki8Zf8D7wHSphZcByQcvS91q7gOUTHv/oiH7iB1
	 TrXfZdZ49FMprPhHC+OhtUN7FfXdEek24BOwCWC3If4rXEnPhKY7kb7667eyxXsF3gTYl
	 ICrqI8pBBwXkLRXVB17tanCCWVc9uIMn3Yx70odHHMB5wvC/ZJb5WmFd6XuXgpwHjPF7m
	 27gv8mdmeQXFLTpeDdd1nVIPR9y4ph4iYXtcn9PSGC/I4s7v7cPQqd03kxdcHusAO+02j
	 dNOsvzExIkykSCTZp+DLXZLR4n4cq/qIIDdhBocraKCeMQEpLkybYj2LmjWFV22hWjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Vxa6Umhih72Sz6b8mVk9uFA31vdMoynGsZonv43YzuM=;
	b=b5oBNAR1vTrHgClO/Mbaa5d8Wg/kqiyJBXy8JgUrnWCDGLMdda08fB+QEV5R/IP6/Cne
	 aUEMiYAHDQIbZuyvFFfDckAsm2Md3O416JXXo3cWE1eXEfDj6HY2qVb1tetRkFVvY5Cbh
	 lO6w/oO8X7aEiR/hq+VqNHUgmXiiWre5NSbBDcisErK7/EpEaTePEIHaWmeAFgQoT/9bo
	 na3Eb1vGyTmHR2suWLk+td4TyJytHr+vCQg1f6LAzqOkQOctyt8hXKev0+5Ir3bghQWEe
	 /lgZI/leZzhjfe/Tj74y1XYs19v+mbvoAgkFJIQsunsed2RhuXWSwKCEV/3t2LQZvDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BgjLeZus;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC11606A336
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 17:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EC11606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BgjLeZus
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dee593f18so1798970f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 09:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793899974; x=1794504774; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vxa6Umhih72Sz6b8mVk9uFA31vdMoynGsZonv43YzuM=;
        b=BgjLeZusaZmSCwtOC2bWZUv9+eRM59twOMM/N1uLtP2+pMcVcqYuE/RF8wlAi1roS/
         dFUYcJO+AjZfEAKoxf9SZ+dQvG/2JuDedSsftuW1+T21oPuB6k+ymnntZdLpzQW/eXtD
         BKn5caHzQo73vh+ujzJIn0zE81CWKlk2+u1M8bQoNc8qvhhF4w8up4y/iCtJUE7FU5M3
         Rx/9Y/DiSP9qv7wLdLwlzdtn/VudVgbyZdAcoe86TUH31zFdBzqkL6QDp7Rhs6GQ4L03
         DqJzjNkugKk4IwiR3guUGcILCsKV33RVTDgGvEbvgsU8itBxREFBmSdLo88/Lg1yAEOJ
         JGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793899974; x=1794504774;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vxa6Umhih72Sz6b8mVk9uFA31vdMoynGsZonv43YzuM=;
        b=B+uZhNnbZTtvlWDE/85i3nlrKnGPbbqwPRxemlYv5735hyPEBNLPaWfQBLETJF7hEJ
         OOls7ipMOWD6BrJPv5IXaRHUitcWUyPca5xcsaHDEplBquZzG9DsnGI3KFP/vQPxrn3H
         nu14mcjap+IYyALy8jXxmCb0zRbeEtLkJtUxzElkAcYsMdG90Ri46GCQT9IosFKCRZla
         GPjX+qx2cJz7QQ/Y5zupC26uf/45zxQamUgsX6Ly16XSEYY5C51dAZfi6S4LpI+uSnUY
         vqRtV8Atb82QHwzmayRoBIaLsfXyGFgkcO79yrvbI1W1tznV96bJKe9hs1n5WDm5R/8T
         QRZg==
X-Forwarded-Encrypted: i=1; AKwUvBxSY5jMa5117qnejK91zGtldt6XRBLfTbKYnBUTWujSu78nJr0+ELjd62NuzVtU9o8qCYEtVHKFN70=@vger.kernel.org
X-Gm-Message-State: APuU4Z9u+SZIzZQkIwpMCAkkW7l8No5AHaYsCR9A+FmmH2hQjSPLGERT
	KDZithsi8+KJH2Ti8PJlV/R6a/HvDKP6aA5dwSMGHQxIKwgZVdbgoo2T
X-Gm-Gg: AYBFou1ptHhb33YBuX06ytlisx//p8ywsPY0xHk29p5ioMyOZl6OAzKLWZwEV78e38J
	0oyCjI5Cfcx5JcZ8oHQP74OLKk/fT14lGGFaaXRjhNmV2V1rGYoEubx7WtMxvZy7jQJN0BXYRvY
	oxJysdYEiV4WPfUEFQAUlvBqciCyw0mYRgK4ObBlHLhLuof3oXQd6QMdwxmJQ1BT7qSFQVj6+cQ
	fqoBa8irW6P22yRmD1T98f7Im/WHDEPEKdzQNOG5WtDFT0lTd9nE8Hrx4jU01XaLbPe5heKKTzD
	/WRw258+wIOvu1gRD9fnduMxEUl0Yy+QXjGBUqH+cw2q82DwjImFXC+Ohtm1K19xYaAJhrGJILE
	VaKDN5nrAUnMM2uw1e3yfDpf5VnPIj0AWx2xx1M6bzlTkP8vgyCXzHghzXCw531HpGaForL4HpR
	KjrcHzpKC7ytXl1R6ti0mGMzcClP/GxMdsXe6NskJtBsFd2kOkZ/2IY2Iogpy5WNA6MTDIu5axr
	shahcqSArMVxQv5cWXxnu4RZOk4sRxPm3ckBtY0csly3jr7n+tdF7ShUpuzsNy474DILvmjyG4s
	L/eNL6wxhsbRKKgGpb/9GsvrAsiYtolcVYb9KG/ZY0wSiD+qIQgApHQolt5pgcatfnPa+t5Q4tc
	fX+QIPn0VSozUphvUkcKe2/xGqeSXlJRBWZiSOWxdHpsYBkv+1dD9KtPcBmq+wvZfwjebaViPnW
	J2UinnM/Om/oRxNDKtOWVAtSlfaKVSWNowZnf0JoEHdub1oigrLqZtTJKIxywIqLxmZQKbBvgEn
	21roaUqN5sTDSpgLwYogbL+706lQLp10KDRZFc3HUB4IC0AfZY=
X-Received: by 2002:a05:6000:26cc:b0:48e:60ed:b012 with SMTP id ffacd0b85a97d-4927817451amr552198f8f.57.1793899973416;
        Thu, 05 Nov 2026 09:32:53 -0800 (PST)
Received: from localhost.localdomain ([2a0d:e487:416f:7097:94c5:dccd:cdee:5db1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1f100sm11255497f8f.46.2026.11.05.09.32.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 09:32:52 -0800 (PST)
From: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>,
	linux-usb@vger.kernel.org,
	stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	usb-storage@lists.one-eyed-alien.net,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] usb: uas: ignore UAS for ASMT135x bridges (174c:55aa)
Date: Thu,  5 Nov 2026 18:32:50 +0100
Message-ID: <20261105173250.97239-1-olivier.kaloudoff@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014165741.35758-1-olivier.kaloudoff@gmail.com>
References: <20261014165741.35758-1-olivier.kaloudoff@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Oliver,

On 02.11.26 11:32, Oliver Neukum wrote:
> 1. is this a race that sometimes hits?
> 2. does the error recovery actually work?

I ran the experiment on the attached enclosure today (kernel
7.3.0-rc5-vanilla, quirks param cleared so the bridge binds uas).

Enumeration battery — authorized-toggle re-enumerations:

  * First UAS enumeration after ~3 weeks on usb-storage: STALLED —
    exactly the reported signature. sd probing's first READ(16) at
    LBA 0 timed out at +30 s with uas-tag 1 inflight, abort ->
    host reset -> clean attach in ~140 ms, full 3.73 TiB usable.
  * The following 16 authorized-toggle cycles: all CLEAN, ~1 s each.

So the stall is a race — but specifically a *cold* one: it fires on
the first UAS probe after BOT/power-on, not on warm re-enumerations.
That matches the organic hits (Oct 11, Oct 13, ~Oct 28 — all at
boot/replug/bridge-reset boundaries), and explains the earlier
"reproduce it again this week" observations.

Recovery: works, every time — abort -> host reset -> attach in
~0.14 s. The cost is 30 s of dead I/O per event plus the reset churn,
and under write load that recovery window is what corrupted XFS twice.

Load test — sustained mixed randrw (70r/30w, 128k direct I/O, ~75 GiB
total) at iodepth 32 -> 24 -> 16, ~8 min: zero aborts, zero resets,
zero errors. The full-queue wedge did NOT reproduce in a bounded
soak, so I cannot claim a depth cap helps — the historical wedge
(20+ tags, all timing out together, write+read interleave) remains
organic-only evidence. It either needs a longer/different trigger or
is itself a rarer cold-path bug.

One more data point: re-enumerating back onto usb-storage today ALSO
stalled ~22 s before a reset+attach — so the probe-time wedge is in
the bridge firmware's first-command handling regardless of protocol;
IGNORE_UAS only escapes the queued-command load wedge, not the cold
probe one.

The wedging CDB is already identified by the abort log: READ(16) at
LBA 0 — the 128 KiB partition-table probe. (usbmon isn't available
on this kernel — CONFIG_USB_MON=n, can't hot-add without rebuilding
usbcore — but the abort CDB narrows it to that one command, which is
consistent with your partition-read hypothesis: other OSes typically
probe differently, e.g. READ(10)/smaller LBA0 reads.)

Where that leaves the patch: the enumeration stall is now proven
cold-rare and cleanly recoverable, which by your rule makes
IGNORE_UAS look heavy *for that failure alone*. The justification
that stands is the load wedge — two filesystems lost to a failure
mode that only exists under queued commands. A depth cap could
plausibly mitigate it, but I have no positive repro to prove it
does. If you want, I can run a longer soak (hours) at capped depth
vs. full depth, and/or test whether a first-probe mitigation
(smaller LBA0 read / INITIAL_READ10-style retry) prevents the cold
stall — that would let UAS stay on for this bridge with the enum
race neutralized separately.

        Regards,
                Olivier
