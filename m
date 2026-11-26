Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675640;
	b=h44F5MC+DOSueHbUmJb/f6z7qqHWcrKV8sNxpS4lklfSAQGr8FxIzk5F6n5zuC+HL07R
	 0Kdgk1SBMzAeMrLKKZq6noMXcg0J9+bw6rXGlSAFIFVFPayjf9tJGySGkw7kFW+XsYfQt
	 2Y149cVHhD097+6k9sT8b2orKcMwBem2dBPUPszzJRhDuh3qs287ZJoi3pxAKApVaHDQK
	 SQZrOzVgmi52WYfCig91gW9xHMvZ3RG2QwHtdvrbP8Z6CoRRCCFGc475H7kLqnwOUwwP8
	 EGa/dY5uwqvjQrZHjrhp0cPV1aH8li7nWkGnIuWDFrgZ14z6iwO44Vul+fwJiTNKiGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675640;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DUqqxcGMWIG6tnXymk9Lyuyj8m3/xrj/arGN3/CmiM4=;
	b=Bk/QEu4aM41qrLt2FmOs4L3VqIF5Xwa9XI5eUaov3N3xBFMVO31Nrt5q4xzfq77fnRH3
	 AHMmMlia3cLOCYDJr6DCsVxLMxE3vP14HA92UOwWPMq8O7BlWY8o2CVVbsHewi41ytaHw
	 cX//S+M/j08WgbVa4bhb8tfvNaYZ/AxFbGX1tCYXpJ6dq4/FQJTd71mJwBEAizLcn5cGK
	 T7RlD4UCQCU85U+9iYwQCL0atsn5jkZ+poTi9nVj1SjAZityCCdnE8AfJQGaCMbeYBuJ/
	 ipTAf6YZvb1FHx5w/EVpSCsytXSbKiYl0TTxFJ4m22H81xf6kUvXiuNQSgmtIzfi9Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=BTwoOtgU;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77FF606A31E
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 06:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D77FF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=BTwoOtgU
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5C0523FE35
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 06:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795675637;
	bh=DUqqxcGMWIG6tnXymk9Lyuyj8m3/xrj/arGN3/CmiM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=BTwoOtgUpFZJhhsb2IXCUuP3LjxZ3Sml8CK5AtqqIb0HZVBpwe2T+nZ6jw5R85lbT
	 HKrDhxs3ARkQll68P5SOMYYnX+QQOOnvCAL+11M9uO5/0r41MUGk4pkG2aE5M5IVU/
	 HZD+YcTUmIOArTF7276OxCVDADVW+vyt4IYJ6Y1Bp7LhA26GNZDGRquzQszNohb8uy
	 4ElQV3vySj4J0o0R4SPdcgiXmVJQ6m7H/4x3UrWx1JJho3dNzIiva0rfj/0FCrFeRI
	 lc+swVm6o41clTpt8U1iE5136hLLKKIPF13Qq8ITFPUS76EJlnRZSG91manWgUtXQf
	 1AToVmAtgtV2gOU/Gr5H3Gglezm313Y7mBFTBGpUc/VJTktion5JCuEcaj/JJPWROR
	 07kfKmCm6GICwqFXxAVaqqpoTx6Im58c5oKV5ZU/AeM/xRQFxLh3lC3tyY1Vyay5xA
	 eWaUL3P9GQxPznr6IvmR8bcgjfUQrpmbiV+KDf09WJ2G3ud4t4mknIbuioBcbTotfy
	 c5rVqdyZFxQRTv8++CsvI4g91FH38jk3LQu8UoJ6+oxop1iobSvHRau4Hne0MlGTfk
	 vz+Gr9mbtyYu3AJQIsDCVSU0Nr7Vpqvn/MCotptussUOU84fdLbDsAH/HD5+PXeax0
	 uJBnE3Hhkescv1kYnwHhgLRs=
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b4092b645aso5653286a91.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 22:47:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675635; x=1796280435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DUqqxcGMWIG6tnXymk9Lyuyj8m3/xrj/arGN3/CmiM4=;
        b=e0DRgPyShXIYNP33eqrdrSI9nDiC630Zcxm+y4h/X3uqQSmjF6+8/LLyKtyAINtrVa
         yF5RKgxKUe39uFAQ/ijHjmfyyX39l7Cfb97jhbzAIW4T+E6g1B8GTBDh6OA3F+fzEhqb
         bjjyws4vbrBqNaJA6A8nFGYiGcGcZ+ZwM3tLFN+yhA52+UIqHQAHJ/NqgT//r2KAGDeS
         end+LpTt1ZnSgCcjwUzSiy9i8kYTHIbgVIhoJVyS3sEzz2yGpwx6YvLOhc2ExxPttRWv
         fpLim39uNGovUjUU8X8R/SQCIDLXkw3rq77Rnj1cE4MKmn9RcKvRz/p4lIHMnN/8mYQk
         eFYg==
X-Forwarded-Encrypted: i=1; AL+hErEBAgysrShanbNJW6mqlpen9QMXCwlT2csSQxR82pCOyDc6saLVI5RQpUP1Z/FxSgJc+yrcCc/deII=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lDYExTKErtGhWA/I4vKftz9QUkiLiDt1+himI07s6fOvfYol6
	7aALNmtn6S54MtDPKgvAF4XJAVVoDA5o2xOasC3O7ZxxerrzlfXIGf6W6EDrEolqUgId33tY8Xz
	9pHjlDD73p9yQKlwaSFlLnC1Y1vwD8ABtUaIr/7cj4nc5j4fZE4uvJZiJ2Qu3xhDiIWtNY0s/93
	Tkyw==
X-Gm-Gg: AZFdTZfcMtFnMrskQ965f+PtDS8yBK2q+q5e9B7tKJ1Fuyz+MZxTC2Tw7P5u404G0eX
	ZvXdD6j7bCSXS0kcQP/V2KmMmS9N2lZCokmq9kD8Tmg7uTHyckzCLK29/QkhoqP5VY78S24+2Tf
	h7raEDjBlHBd89vrH7B3GeXpqTTnZD3psEofIjSoZq77KFi2Qnbh2Wkr4vfrI5kbhB0REHipoDe
	aA7ioleP2B/67s1nk1+yS5EQAvRHaBvII3QSinsFBFqqeZmUIFVgf03o10l/ztnUNd2hXy4/yPI
	BxXPJci+SRlh7NZK9CUEdLjDZ4JarcoHv5kDVKfaXEGRyfpkgUPxNfPYlgkylJZ8mGJk1uCPkQM
	Lrq/1MrBIS3j4tkHM1sWYKwu2YdACDvBHYYnlKGlzukBQAK3Dsuu4x2eqgFQbrasqnV6EylSuEH
	3RkqxagEdA4DmO1ryoFV0LM6R5V9+1PA==
X-Received: by 2002:a17:90a:e7d0:b0:3b0:aaa3:ce8c with SMTP id 98e67ed59e1d1-3b41c8debe8mr18647746a91.14.1795675635517;
        Wed, 25 Nov 2026 22:47:15 -0800 (PST)
X-Received: by 2002:a17:90a:e7d0:b0:3b0:aaa3:ce8c with SMTP id 98e67ed59e1d1-3b41c8debe8mr18647731a91.14.1795675635145;
        Wed, 25 Nov 2026 22:47:15 -0800 (PST)
Received: from resolute-linux.lxd (124-218-37-86.cm.dynamic.apol.com.tw. [124.218.37.86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm33398567a91.16.2026.11.25.22.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:47:14 -0800 (PST)
From: Aristo Chen <aristo.chen@canonical.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Alexey Charkov <alchark@flipper.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neill Kapron <nkapron@google.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: gadget: udc: do not fail bind when the UDC has no pullup callback
Date: Thu, 26 Nov 2026 06:46:49 +0000
Message-ID: <20261126064649.75179-1-aristo.chen@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <722603d5-ad2b-44d4-93b5-a629ceec9305@rowland.harvard.edu>
References: <722603d5-ad2b-44d4-93b5-a629ceec9305@rowland.harvard.edu>
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

On Wed, Nov 25, 2026 at 09:35:39AM -0500, Alan Stern wrote:
> Your patch may conflict with this one from Alexey Charkov:
>
> https://lore.kernel.org/linux-usb/20261117-udc-connect-v3-3-9413b491d213@flipper.net/
>
> You should look into this and see if any changes are needed.

Thanks, I had missed that series. I have added Alexey.

Yes, they conflict. Both patches change the same code in
gadget_bind_driver(). My patch 1/2 applies on top of v3. My patch 2/2
does not.

v3 3/3 also handles a UDC without a pullup callback:
usb_udc_update_connection_locked() returns 0 for it, so the bind no
longer fails for that reason.

I ran the KUnit test from my cover letter (emulated MAX3420, with KASAN
and UBSAN) on usb-linus, commit 730acad0b83d. That tree already has
v3 1/3.

  usb-linus:
    The bind fails with -EOPNOTSUPP.

  usb-linus plus v3 2/3 and 3/3:
    The bind works. 2 tests pass. The 3 tests with bad endpoint
    numbers fail, with UBSAN and KASAN reports. 1 test is skipped.

  The same plus my patch 1/2:
    5 tests pass. 1 test is skipped. No UBSAN or KASAN report.

The test that is skipped in the last two runs only runs when the bind
fails.

Alexey, I saw the bind failure that you describe in 3/3 on the emulated
MAX3420.

Two things follow from this.

1. With v3 the bind works and the test hits the out of bounds index.
   So my patch 1/2 should go in before either bind fix, or together
   with it.

2. For the bind fix I see two ways.

   a) Take my patch 2/2 now, so that stable can pick it up. It only
      changes the bind step. v3 then takes over that code. I tried
      this order. With my two patches first, v3 2/3 applies cleanly.
      A three way merge of v3 3/3 has one conflict, in
      gadget_bind_driver(). Taking the v3 side of it gives the same
      tree as in the last test above.

   b) Use v3 for the bind fix. I can resend patch 1/2 alone, so that
      it can go in before v3 3/3 or together with it. Once v3 is in
      mainline, I can propose the small bind fix as an equivalent
      backport for the affected stable trees.

I would prefer a), but I am fine with either. Which do you prefer?

I used an AI coding assistant to run these tests and to draft this
reply.

Thanks,
Aristo
