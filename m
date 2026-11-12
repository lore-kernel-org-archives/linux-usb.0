Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492930;
	b=XS4yXcIfuAbz7DEkUlXNGybMXq8p4yj+qpvqVamiRJNFKnY7+ibfUEKgFb4su8g6kYE8
	 0kaD1npUV3Z7KxcwdWAMNZKJ5PBO6e+tbguuTA08gX6vdJdGjXd/A8SQ+nnnB6OemZvVb
	 VoAWVOfrvbG7459jPewx+53/pbXe50JHjyHRRU21B7U0m7IceVBb1acH0BF4ajtzW7x7p
	 ttiMlOLWQi71UfiiXbDCeryRAMM1iV+UVD+B52TopvXn6X1SioIWU0PqgeptPv8Uw+0Gu
	 BZ/KPTMp3i0Utz7atWu5BxSj4222LqVRoiqjuPesEGONbup13Hls3shFbhN/87y2u+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=tnSOR2iS2NQ60s3hHjAc+QO7cCCKVbLJKOG9OogfW+w=;
	b=j+m93IHDsexLq97TxdIOLzKzmC70wPTp0+tn1w7Pq+71z7uxDdMyG6ZP+OumMYjshRwV
	 Wxuxw8yikCeh73YeIh+zsGlpC1tt8iVawkgZrDqoB1nVaS4+UgxZFVgdjNdekdPT/hE+w
	 Gd4iI7dsbdKb3e+bpVIDaJwC7Kf4/bxkBN5Bnu6mBrsBY5ZZH2Oej8vL4iYdMLgDfrFYk
	 bZNwAKamG2A/HBXcJHD6F0de9x/MprmyvbHW3EHUjlDTSPMtYqLGpYEH9fMv/I6u103AP
	 QSD5bL3C+t7OTpMdSrKMReqwcWleCaYNld6plW6AjpDZBBjr/BdMkNBQuVuNeoRYHfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SXg+8HZB;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D449606A330
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 14:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D449606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SXg+8HZB
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so1986876a12.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 06:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794492929; x=1795097729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tnSOR2iS2NQ60s3hHjAc+QO7cCCKVbLJKOG9OogfW+w=;
        b=SXg+8HZBCzHbQse30xFgMO0sTV5AlF+WfknLNFg1Z+U9ycMsrW/r+iMZtJTYdSHa46
         gc+yF2DSjqi3fo2eDM8nV6Zy4POkXwFJDP8vfiOEe3jpshgG66ZaaBcaxOzsnxxZMBjU
         cn2IM5JKBf09JR59E00cSQzULtTCoxjxO1/xPumB4OE8o2m7T2z6HlKTaFX6EjoMInmq
         Q1burXLz0Y7BaYt8+LssCjc3qD6PKLllV9GhpgPK6EpqbF+NiiAaHBwJdkoVSqf8NK+R
         bEKnKFp515BwjvckF4UCd69lmEeBq/xMMe5o4H+URQ/C2cJEP6dVYBMK/TpmwwAAstuy
         vBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492929; x=1795097729;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tnSOR2iS2NQ60s3hHjAc+QO7cCCKVbLJKOG9OogfW+w=;
        b=zQFklH4M3/iZsGO4Kj7UFNNBnZEmizyo2VYEUMlGPfMSZpFNemNyQTikEzbyBOPMhI
         Ak/vHgDD8giqu0jgHtuhwgLXvffS4jIw3VdqmQQlso9brHJDeqdgj4UX/pJ4W5CFYzuI
         ALEbeDCqBqLrpk0jq9nGOQ/2FOa9kMUuyzhPb9QEA9eR8eo40GtbCx7nk8fsBhttyYmR
         /xYGoZ7li2g7ASIn71kQcM2mpd0vQshaBwvjIkP+MRVH4MTGdyDzGGMVrN7IDcvCit/n
         OYh6l1QJyEgPyN+KntCx+dGMeoO2mSAW/Vc42uXJnowoKs2EtRCIMB0OrrZstghsOueq
         TgBg==
X-Forwarded-Encrypted: i=1; AL+hErGe8Q5DZ/Ecx74DqpnZLBvQrJksR5wnIvFrmS3oMQdWb2iZEIUYPSU2AWTY3eiiVemWKUJMJo5uvXs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yAAdMdpTDr9QQn8lDZirOc/140m1VUNvi7NVho0RZJRwF/KKP
	vrwYDhBKcGyc06hf9EaIF/VMlJEAiLcNxvYu17Z4oFh+fR7GKK3gcnYK
X-Gm-Gg: AYBFou3mYdpFd/9aJ1GuDZMUypZpMqnnrvMMvI/G2VmYcf3ZHE5iwbSX/7oeGW1JmLb
	tqqxX8Wfrjydhe/P7HQB4cxF4h1KtI0INeZyQgK1Z3OEP26wYFb9nFaqreHBuHMlB1+SKx0p56a
	4NjZIi0+8mNmPIMCgxZkFkYNFToyaewEC8X0PISbYTOhSLubDaZ2q4//VYUAx0XLdMsBwwOJq+2
	JV5Z2PjYiPi0/Um5hJ02ro0qvscrztAjZ5zzRFAVjGi6B/zco1G321E2Jk4tgqyLsRe09r/4sWD
	lQuUDgZSUUin/8sCeRsWLCW3gLevWZH1aJ9sZqQD546v+6aM+iUje2RhSh+3lBI9nDL1jdVe7ok
	jgWFXg0saFSW0NLRVuTXCDXIb/b1ZPDSD8/OH1U03pjUab8QX6OslADNEF3r65j39a/0b7KoT2V
	jONIdQ/ahVDPGLOmGCtLERSt2gzHmZJwr2CBelTHc6s62NSFaHqm9twtJ0peMilGvhQdrgU2G7L
	fTUaWWpCHfqNeoYPvGkk3BzhpEX2MoTCN/IHxyJwjfQa8TfeY134q4opkbgzHl8T1E3uVc5coOK
	AtpMYUcHu0N0ov1Xre+UhE50gXoTgTZbE/b5VM/FcA==
X-Received: by 2002:a17:90b:5405:b0:3b1:7329:a127 with SMTP id 98e67ed59e1d1-3b182efada7mr5054338a91.20.1794492928640;
        Thu, 12 Nov 2026 06:15:28 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c42a4csm4979523a91.4.2026.11.12.06.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:15:28 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH RESEND] usb: dwc3: tell xHCI that it lost its state when the core is powered off
Date: Thu, 12 Nov 2026 23:15:24 +0900
Message-ID: <20261112141524.112-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <sashiko-outbox-211064@kernel.org>
References: <20261112114053.412-1-26rote@gmail.com> <sashiko-outbox-211064@kernel.org>
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

On Thu, 12 Nov 2026 12:00:08 +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Does the DWC3_GCTL_PRTCAP_OTG case in dwc3_suspend_common() also need to
> set dwc->xhci_power_lost?
[...]
> [Severity: High]
> This problem wasn't introduced by this patch, but in OTG host mode
> does dwc3_suspend_common() power off the core via
> dwc3_core_exit() without telling xhci-plat that power was lost?

Yes, both are the same gap. The OTG case always powers the core off for
system suspend, so v2 sets the flag there too when the host role is
active. OTG mode is not tested; this board switches roles through
usb-role-switch and never runs in DWC3_GCTL_PRTCAP_OTG.

> [Severity: Medium]
> Can dwc->xhci_power_lost remain 1 after resume and cause an unnecessary
> xHCI reset on a later aborted suspend?

Yes. v2 clears the flag in the resume quirk once xhci-plat has read it.

v2: https://lore.kernel.org/all/20261112141512.1840-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
