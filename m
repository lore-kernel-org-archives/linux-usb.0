Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE883C5DD4
	for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 22:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546504; cv=pass; b=Mn9tNqn6ZO+4Z4oo310yil3gjA3aIRm1ACnhbS3b627lfdciOSZ4swc9NqwT+DVGngauoYxhRy/bW9eE+H+Z9aCEukeEdqmLGqE8vIF2C4XMkusR88A8YfKMu8a1mm6KZ2YcIYwJwEH37CJLYaQ/ez97xtnHQusJWd0rg+QL0Ks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546504; c=relaxed/simple;
	bh=Pyy7SD6RT8GeOcXKhheqQq5nrt238c/zkSEnH//QW/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PxAliIPeBXQaqODQLiAfPDCwdD0Th7VRdDoGoM1RhdG6tXFrUGawHHBMO0ZMtjSY+rIOJ1x+RbTM/xSPvHEI2lu+kJmj20jtfs7v9EdPUhEZFllwOQMLurgEivKAzuTYsuzrJ2P39ohpQtF8I7EqUkbYrcJehW8JRj85tuEC3DY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCTlp+Ej; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCTlp+Ej"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-34182b58d00so1592738eec.2
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 15:01:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790546502; cv=none;
        d=google.com; s=arc-20260327;
        b=CWP6z18P6eZj9vA0CCPpoDQ1W0gNsriOJ78KontJaENHFa4YkzHTv3W/D+TmT6RCgp
         lLn0Zoq3Ggo9bV6pN2QS63Niax50Atx3DmMjbWXA+1fnTcDh8DdXHURvJBS09AEC1uTl
         mYYdykhvi2hm9uE0qjCYKnifrYbKWKIcQMuJiy9PCCL3zVhLtgbxXKMzqzLAqG+DslqG
         XUnFupAiX9u86up9TjLhNV47NeBUoqedqZHYp+6qsagjILbysKwFxwQkSwOZZXKTY+Zr
         rB6qSPuKwhHHuGiPxWwywXLPy4EjeMhz3mghdZD4DgqbxrSTxcCV06Nq9g5WxT5Fg8Hl
         5vGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SMH0IqJfE7oMGpkLO0PFMf9m4Si2ICbZ5UhcXcmawtI=;
        fh=0L8cqNQyfsTYKqhH2Vc8kFfcXnRZghd0PtA0gdLQW3k=;
        b=O8VqCWpbtXorGiDa3JGoXANaPvtl5iJ7VHvoVoJVYJ17c6unKt9j8utxirYLfCuVfw
         CmB/liCg4SZie7eF8arQAoRQjSlV9QTYnO+FCtc/1CcAKA8mL7wZJrtC3p2H2f98gMbc
         5rpcBIq08Of+1D/g6R3jMHtI2XT0aWnra6V3LzKvSput3sBKHpAS++kgRXsYCu0Ne3SS
         fC6xIuWTKLM7+GqQtcLcTIqRHnbMigJv5LP0XC56xb61WaMBxWTleckzmuebqDmV3Gg8
         pPKkrx8F6fEd9cUK44oodw6VTQ4W8F7vOqAKwdFmq3RsoU2LW1wbd5HlFX6oPwMd2Gq1
         9VNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546502; x=1791151302; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SMH0IqJfE7oMGpkLO0PFMf9m4Si2ICbZ5UhcXcmawtI=;
        b=tCTlp+EjqBpsbEkzwKQPznYxkm+SKuKq/FZbM+p2LFcohO171Qrqq4RLP7lTsXQFad
         WvxJpf2CY9OpaBArRMOF3xX8sxqZWYrcaR1vRTalYUP0s4DUDxOSlNvFn/FElJBktEt8
         z989klW9pMXUO6Uny0TwOGe8k+YxRY7rybLxgAW4XB3ySB9Ktd4OxBXa6O2YxPpgzFkN
         rnVfRj3kP/ljxN5vYUZKhDLhpyRVEDwZG/3+j+J2GAvXiDe9LZ8yscqQ8aXHCh7swNNX
         DZsHZ9I0APP5/pLZZ3b3xaKaz1iPg+t0TvVEWUBMChqUdDLts2W7QjSgHI8rQ5GWljG3
         EhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546502; x=1791151302;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SMH0IqJfE7oMGpkLO0PFMf9m4Si2ICbZ5UhcXcmawtI=;
        b=aPtHeyxIeikqfkxhIazzBGyKIepXMhPns4j6blPH4lGzcg4CUwa2Y+uVbLpn81QNz0
         w6mEz2x88EmH2JTtWF7xyk7OoM40uBgtggqtVrKfC09dnAE22EOVMk5gK9nLPTBrhvGz
         BN391ElsnC0a90gAaFobRXk+RvZyzO9GC7q6Ck+QepicHKh10PHQdkzcOp2WCmkR8M4H
         H/CEA2ki+SUwuPiYjahgHvDf8rSDcHl34CpCXcHkYCQE60ATo2plRV+57SiFgtNmxbfI
         g855B8W5EM2R6DBYGKznzstOaMGGveRCQ/VpAmRA4fsXMm3SpaoE940P5I442Vv8rGmH
         wvig==
X-Gm-Message-State: AFq9FYKkZSpRx3hFtdCs2ch+jwrxiCduCNLnFAye066uVvu1BUiljlNv
	wHPYPjVThu99tTi+2yejk2YZ7LPAI0CV0kRz6pY/SOZ8Xpxi0ptsQciu5hBXiIE6NtUr9P5xBm9
	+/K8/ste5vYkw2wqtbk0XB4CCaxCsK+035ZU=
X-Gm-Gg: AYBFou3HX04BqZUGx5QkWBHum9aieua6Dv5znk3Q9k0JMGBBdYvOlOnjnQwQSjtkfVS
	KQrejlcL+HdTafNfBLAUgWt8EcJLyOC5Xu98d25JH1L4ARbpJslkoM+cPL5DHEkSKkiASEC+o8h
	GoOgly750aoRwv3HkMtYJ8DId7XyLWCggwtRkAbJzLLw8927Q/mzdikDS/0FUA33b9ViUmwM9FW
	up5yykEM2GGiZAu3mPpFkteAM/IUjjD3cdQToPdcSrA1Txwh6quaBDFn1uEN6AWVOoY6TYPR+Hc
	4AvdkAo/DEuYwE4alt+vjC1dohPRwXEwixil76HFTkzaWY38TaoxVW0T6d/5wUZChHR/nZ39xNS
	B5kEhXxwtEf7kbjnm2MVcwxpW8RoYZxDQBkM1AivE
X-Received: by 2002:a05:7300:a986:b0:342:56aa:67a6 with SMTP id
 5a478bee46e88-342711ac262mr12259339eec.7.1790546502439; Sun, 27 Sep 2026
 15:01:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAM6_QD_PoTdwdM7DvzzgHRs-G5EvQu-c5oNGve=GuKV4wFYAvQ@mail.gmail.com>
In-Reply-To: <CAM6_QD_PoTdwdM7DvzzgHRs-G5EvQu-c5oNGve=GuKV4wFYAvQ@mail.gmail.com>
From: Dane Linssen <linssendane@gmail.com>
Date: Mon, 28 Sep 2026 00:01:31 +0200
X-Gm-Features: AclHuK_bGK2LhVv48Yhx7dpSF3Davb0qw8vDUCuDua9qRMsw9hK28exKJJamUlk
Message-ID: <CAM6_QD_xAyTFVvYKvCrrZmS+fV5DBBje9V=VdkDMMSpt2ussRg@mail.gmail.com>
Subject: r8152: RX stops until rebind after -EPROTO on the bulk-in endpoint
To: linux-usb@vger.kernel.org, netdev@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

An RTL8156B on r8152 stops receiving and stays that way until the
driver is unbound and rebound. TX keeps working and nothing is logged.
This has happened 5 times since 2026-09-23 on one host. The two on
2026-09-27 were captured; both followed several minutes of about
10k rx / 6k tx packets/s.

  Kernel: 7.2.6-1-default (openSUSE MicroOS)
  Device: 0bda:8156, bcdDevice 31.04, fw rtl8156b-2 v3 10/20/23
  Host:   HP ENVY 13-ah0xxx (i5-8250U), xHCI 8086:9d2f, 5 Gbps
  Link:   1000baseT/Full, EEE inactive, pause off

During the stall at 18:08, read twice 5 s apart:

  ethtool -S  rx_packets  117909777 -> 117909777
              rx_missed        9214 ->      9504
              tx_packets  111602790 -> 111603644
  host        rx_packets  117835758 -> 117835758

  xhci debugfs devices/02/ep-context, bulk-in endpoint:
    State running mult 1 max P. Streams 0 interval 125 us
    max ESIT payload 0 CErr 3 Type Bulk IN burst 3 maxp 1024
    deq 000000010bd3f960 avg trb len 0, virt_state:0x40

virt_state reads 0x0 when healthy, both here and on a second host
with the same adapter. The stall at 18:59 looked the same.

0x40 is EP_HARD_CLEAR_TOGGLE. xhci sets it when it hard-resets a
halted endpoint, which includes a bulk transaction error that
outlasted MAX_SOFT_RETRY, and clears it in xhci_endpoint_reset() once
the class driver calls usb_clear_halt(). r8152 never calls
usb_clear_halt(). On -EPROTO, read_bulk_callback() re-queues the
buffer without logging, so as far as I can tell the endpoint stays
out of sync until a rebind resets it. No "Rx status" warning was
ever logged, so it wasn't a stall (-EPIPE).

usbnet doesn't clear the halt on -EPROTO either, so I'm not sure
whether the fix belongs in r8152 or on the xhci side. It looks close
to what Mathias's RFC "fix xhci endpoint restart at EPROTO" (March
2026) discusses [1].

The host now keeps an xhci-hcd trace instance with only the reset,
stop, set-dequeue and configure events, plus dynamic debug for the
"Transfer error" and "-reset ep" messages. I'll send those from the
next stall, or anything else that would help.

[1] https://lore.kernel.org/linux-usb/?q=s%3A%22fix+xhci+endpoint+restart+at+EPROTO%22

Thanks,
Dane Linssen
