Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455550;
	b=LbFMh5kwzfytCxOxLOvUAGJcpCMGRvPVm0q0ifIYj2dJLrtAzVle9qgY/rrFoBaIzQ9b
	 e3Aq0N/AsUa2K9OSKoKRUTRmb8WwxmeRC24yI9PQYehxNL7b7+IIDqb9OUSXISbCqHOxm
	 HTYPrpOj742346edjGG3LJndq+vsSpPvMoEEMf/FB+RLcWCNkfTKXhHgMhLA09Iekye56
	 0xez2C2qMQvyjhwPWHBjGiOkHVpoMpzdN977/sgUlv4Ga6f03ENEvFU6EUinOkxOrRlg3
	 JRHUu+XdHyHPxNUYzzLVipMeT6i4Mviyxk+JmC+QECLHZ4ty4S+XsWtqq2fBWwTURUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y/N7egXXa0Sj44BdKsS2Txw/MVlcyRGITqcsndVmdeM=;
	b=dd8ORskERkvGczyM1ebe37lqv8GHLBnOygpvHDkW7NtmMGpuo0T/v7yguukkt0Nm4SSQ
	 tXpFh3tlpnhNQiNORvFmVepB0n9KIwCk6ypWIlMfmKFLYAES6WQ7hiQ47SI/ThXEzJUZr
	 nSSy2RIjlXVaCk3qzTuhxsEZUoMMk6oPAVRMvI2qt0LSjvxY+ROubsgrgh+rL1wlPzQox
	 pavRDjJbstWw63Mhdqn5UUa42LKmS9ZpmMHhVJDyrFFwzOKQZJcWevZ4Z4v0522J+xbgD
	 DvRbLywfx6qfObloEBmdgeE2rejPLTh+Yj/5I08JScrrSeyoOgKFa12yuaPnFPmTk0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gt.tech.gov.sg;
	spf=pass smtp.mailfrom=gt.tech.gov.sg;
	dkim=pass header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=Rx8unDJn;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7099606A31A
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 00:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7099606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=Rx8unDJn
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so2493900a91.2
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 17:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792455548; x=1793060348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y/N7egXXa0Sj44BdKsS2Txw/MVlcyRGITqcsndVmdeM=;
        b=Rx8unDJn3OHrbuPKB3uN1v7u5AVU79xe3gRaIRde/W0gSe8MKluBgonFrJyOC7FHAq
         oJhGCHx5x3ATrJqszf1CEpLq0qWJHXfXBUquZSrLxBrdM7SFLGFmoFY8SBaTISsqmyjK
         Lr+MM89snnceR6haMaqmUWp6dr1dhmF/fmRus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455548; x=1793060348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/N7egXXa0Sj44BdKsS2Txw/MVlcyRGITqcsndVmdeM=;
        b=yG7TJ70eu8CQPr0qOmVQ0jUI3OQmcy9TS8OW6u9wi6hwt6HlqhFAQ7i1XvngOt2HKb
         xlTSl8GQVwa419IyxxL+9gIYFUwWNZErJuXzTCQn2Kzo9PfGZZ2J85e3co7P/QRTOsYZ
         YEGVSYSE/h2KoHNO6PGFI7EA3rf1N3MlWdlkEr94AwO76OXw5ruUuY9JsI1FPh7JbBz6
         8bH3eean63iMWYSlobNUGNC1UMXXv1Vh83zjakCdZ8UEYovP/kYDkNNnCYXVPmd2J9zg
         XaSbRd+Zy9jXk1fB76Bi0yUUz/HW3YoKAcIaI014b1/L/7vH9LMVrxb4Ytp4KBcsXjjC
         s1wA==
X-Forwarded-Encrypted: i=1; AKwUvBzxemhw1w4ySx5FxGaNlTGXaZAPqmptf1k53C7a3qkuMoq7DX+PJ8eGhhRxRGYQfNRzKDtDAefVzp4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2kPDucK3G3J7yF9q58nNZ8I8pJKcPUSSj7CaKhpQehy7nsnWr
	pKLITXkhPwz+A3K7gTqnyid6NgvYJrJDnJqHFaf/eSmlACjQAMyT+eBBfwEo8keh2Tc=
X-Gm-Gg: AYBFou2ycct3bOFfemgRLjEqGNxPAIYmxdiCmGhMK4o9rq3xlkgzcElQHfKj0IV6CmS
	zD2MB3bWFZgWMblAkHGG1zbA7UGxfSBuUPMFgLE9j0Jv6WgKgax8tU4Vr0U9aRYOzcNLwMOujeZ
	RFswbD2UgEZ3NHi17GhiWMG+Wv9v7q5u12OiFGrsqzYs+M7z3ImA0M+0jHcRH+qNiO4BbTFAQ9/
	hgM3CCkphJkqiR5w6ASbosF9pQOE/a1Oev/QXekWbfNR9+eVvDPGpNyeV8SWB0nkozBRBbLGPc1
	10ZoAwukJGHyIn7hmKPxz/NwV5mmYqHE5UFezrZj6HDKFYzx64ZJw2koeLAtCD11u3h3VqRJAvd
	UYy2MfHBMMvSaWm3j60dzrj/rX1OIFeF/PPRCVgA9zMoMKALC5ny5DOxaCu2FVbCez9ImYkNRPV
	Ek/ls7HZ8HcAYs6dqwoAKdlGiF67rmvGjfBqoFGG3ajrmJUaEDC7TQguAuAhIZs0FYuulAvuuaC
	kiqyT5kSMC0BKMYM0Y9L5O01V4OnG0HDSSeYuSxEcQcR43AU2tp0OgG7lwWyVZItg==
X-Received: by 2002:a17:90a:d2cf:b0:3ac:9c37:9430 with SMTP id 98e67ed59e1d1-3aceeb91898mr7922087a91.21.1792455547951;
        Mon, 19 Oct 2026 17:19:07 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5d6df89fsm1694273a91.11.2026.10.19.17.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:17:56 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Woojung Huh <woojung.huh@microchip.com>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Jie Law <98lawweijie@gmail.com>
Subject: [PATCH net v4 0/2] net: usb: lan78xx: do not use uninitialized data after short reads
Date: Tue, 20 Oct 2026 08:16:19 +0800
Message-ID: <20261020001621.2920-1-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
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

lan78xx_read_reg() and lan78xx_read_stats() accept a control transfer
that returns fewer bytes than requested and then use the uninitialized
rest of their kmalloc()ed buffers. A device that sends short replies can
get stale heap contents used as the MAC address of the interface, and makes
ethtool -S report them to unprivileged users, including kernel text and
direct map pointers.

Patch 2 makes the register and statistics helpers fail on short transfers. 
Patch 1 comes first so that a failing statistics read does not report 
uninitialized stack data instead.

The bugs need a malicious or emulated USB device, which
Documentation/process/threat-model.rst treats as a regular bug rather
than a vulnerability, so they are posted publicly.

Testing: the series builds without warnings (W=1) on net and passes
checkpatch --strict. It applies unchanged to v6.12.105, where it was
tested with a LAN7800 emulated by raw-gadget + dummy_hcd, booted with
init_on_alloc=0:

- Zero-length statistics replies. Before: 40 to 88 of the 235 ethtool -S
  counters are non-zero, including usb_api_blocking_completion() and
  direct map pointers. After: every read fails with -EIO and all
  counters stay zero.

- 100 byte statistics replies. Before: 110 of the 235 counters are
  non-zero. With patch 1 only: 29 are, so the stale tail of the buffer
  still gets through. With both patches: the read fails with -EIO and
  all counters stay zero.

- Zero-length RX_ADDRL/RX_ADDRH replies. Before: the MAC address
  differs on every probe, is programmed into the MAC filter and is
  used as the address of the interface. After: the
  probe fails with -EIO.

Both bugs were found, and the patches written, with LLM assistance,
hence the Assisted-by tags.

Changes in v4:
- 2/2: drop the examples from the commit message and move the note that
  it depends on 1/2 below the --- line (Andrew Lunn)
- 2/2: also fail on a short transfer in lan78xx_write_reg(), for
  symmetry with the read helpers (Andrew Lunn)
v3: https://lore.kernel.org/all/20261018062419.21921-1-law.wei.jie@gt.tech.gov.sg/
- add the missing Signed-off-by; no other changes
v2: https://lore.kernel.org/all/20261018061734.19488-1-law.wei.jie@gt.tech.gov.sg/
- 2/2: the commit message now says that with patch 1 only a partial
  statistics reply (1 to 187 bytes) still leaks, and that patch 2 depends on
  patch 1; the MAC address paragraph no longer claims a write-back to
  RX_ADDRL/RX_ADDRH, which happens only for an invalid address. The cover
  letter gains a partial-reply test. No code change.
v1: https://lore.kernel.org/all/20261014025602.26334-1-law.wei.jie@gt.tech.gov.sg/


Wei Jie Law (2):
  net: usb: lan78xx: do not update statistics after a failed read
  net: usb: lan78xx: reject short register and statistics transfers

 drivers/net/usb/lan78xx.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)


base-commit: 7ec48f396a1d89532c0537bc38b408b8c31ee37f
-- 
2.43.0

