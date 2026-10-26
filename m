Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017934;
	b=18IL1JpUM8uYyPOmzI0Yis6LDCCVi7kL3E5tH2DXCDCdzGNe/W7IbIElSdPSsQ9pUnGt
	 EFXSi/cFSC+gSh3ljiFTcXPHe3AtNVQ+kMmxSi3zB5cGGgAx4TJTJZWBeUcIB+b8vWDEy
	 J9lHD4EX23hQnElJltwaZxsG9tICbm57GjMUPUJATQ9Fk/pq33LrQ/eDGAhQs9cYtcuiw
	 OAMDLZJc4HZ3B3FiO1VOJVZrCjVztrPanTQVkd5Zug50k2Xu3UALxWyUEI/51sjiQ54ok
	 wNYqeU27kQic/kuyWI2d6fM5RZoZITLgDddPFExm4PBdI8hgOP7d3cg3BggEDwfxuMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ktUKdiKYfb7DoM5zhVHml/g4TQZHJlrIih9rFWqZVKQ=;
	b=g9Yf2qGymmIZqXFHiFMzslR5cnwFVgWCEz1hTuIHVFAw4tIQZGT6tU1pPtZPKhb2EyWL
	 KuAaX4mUnY+pj1qkiHUi4IcBv88gxSCw/A+fRdwarNt37qgtDZMXZ8TBXsFbS2pV7Xci7
	 MO/qTLmX4sHl4Pc4oZNv1fohuImgFgUJU4+QyClnA/kCmZ+k+YGq63pudwOjS9GJ2iNtR
	 8QEG5ZGgblPJjaelrTHBoF1Pe3/LHeMJsNfcw4bZN8wP9w1ruQFIaCI5N8QdhW0SjVVeF
	 aRLkmk+QdOFYIH89os6F4xUjpB+rhlMgKgXuBDw+IP762RNTokOeyYsNPo9Wa0N8uaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mivMcba8;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCB2606A32A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 12:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DCB2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mivMcba8
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso13647025e9.2
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 05:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793017932; x=1793622732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ktUKdiKYfb7DoM5zhVHml/g4TQZHJlrIih9rFWqZVKQ=;
        b=mivMcba8uYDlFfKaqTMPiPMpITmJGgJrVgHOAE8jYmLoBhYW45mBdXMQ02LqG2updu
         9LeHTzDGRg5A4F89RhWaUFJZ5c+VI/1ilvjcrv5DlQxsAoj2wFryqCx3b/uPou7AXDeb
         Wss9LdDOSh3+0Gu7kqjVfhjI8DS+Lu5UP/fenZyhi4gwhMFIDpqrbDyquPelPmXH+51y
         m+m44LxpXGLxus7eX+O3txTAid5lu69y7VhycvS1snpdVZw/LgFjEanIemDgwrso3110
         rirMGQoCitHWBLayc4HPMr+aanfRqUmn39o06PX8Oae+V0uea0+PN4brPriZTVyZxsuE
         4C4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793017932; x=1793622732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ktUKdiKYfb7DoM5zhVHml/g4TQZHJlrIih9rFWqZVKQ=;
        b=SprXnfeHQroW6krbWtSGKLjyH9O72PTpBmURcaJqFeIxP06nvI1FIvarIt1VLl1BgL
         RqvVC4ygMGWf5SNJIKGk+mMaFomY0/8rBx5b4cg0Y2V4I053R4G/ioq1bqQApk5rpULX
         1n0UoKjHk5YSoHqFmKlHDgaNdsywtvqH9XG7aRfpqHxqEHdKobB65oM88lvmU5bmLXvJ
         efaCryUNe1fCwmaCV97PIWyRP+1KGp2E6tEB1lBJN8pW0zsRrtMPoNGf1RHUg47LIHMz
         xnEzzoYJ1zcWWSNACKi+jarpGfXjxq3COyFKV8eNePHVUQrtJAuEtrvkceKboARBhRoG
         N+8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzqYT/XwaUFs01V1aoCpLuMbyVimdr7v2r+JLevJGN8eLM4Lx+Ao42oT5R6obNkEQYcG9n6nHyi4/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9TyJkjCY5E2vR5dgAHjBJxtBGt3i9qATLfExhGc62rQ48aUBw
	POex55cbmd4BOKgHk6garyLxYgdjr3BEAaA2a8SWEab3DS2/eu3IWET7
X-Gm-Gg: AYBFou1uxvY9eHI4GUBK5s2FizzmS1NO56+p9OhUee8lp1WMnptqlYwpyBr+G0mVYMq
	xUUwdf+fAvucXkr7Zujr81bWjMLUvDMaFR1Mn+6Zc7jcdan5ElimuCwkcloMF4Ny0mUwdw5gqU7
	Jdc9ZEyDQlwJqFVQRCPY662F00Fz5HI1XMEP1FuItOgtVw6tj4skIwv45y6K/RRt2RP0YIl/1X2
	MmYf6kxlSEf7bWPw0H2paoVgwPU2oAbY1qpKSFwaEqqztBXkoUyajpT4A/9Gux5dd1AQj3H+baS
	C+1V/5vUIpLCEZIPlVU4z5i4NpsEqW9TWouxLY0HreEsc/XhKNN451jY+TG4faPeUrX8odQsRZj
	O+pJh3BLKdnH7NQ2Te8JU2ctWMCODKc68oqbAqhqw3HLn1GOL/Ww9e713yIhrqmH8MEc06k15jA
	Y/pvTLucqe22EeQwf+shMqGWAkA9aMbnltC1lEAnbW9mDBn6bqrDmWuCxNfCD6slsW0Dhw+diQ/
	3pl2FQgsFGONKkvKueKPU56pmKcThNs1b9MIZuvlQITeuGIBcQK1GL6IUVNrBm/84YNJ1hd7peA
	CQcRXOk3
X-Received: by 2002:a05:600c:608e:b0:4a6:42cc:bf66 with SMTP id 5b1f17b1804b1-4a642ccc70emr45612025e9.11.1793017931500;
        Mon, 26 Oct 2026 05:32:11 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdf9bdsm15684045f8f.55.2026.10.26.05.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:32:11 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kuen-Han Tsai <khtsai@google.com>,
	Sonali Pradhan <sonalipradhan@google.com>,
	Kees Cook <kees@kernel.org>,
	Felipe Balbi <balbi@ti.com>,
	Jim Baxter <jim_baxter@mentor.com>,
	Francesco Lavra <flavra@baylibre.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_ncm: restart the TX timer if the TX freelist is empty
Date: Mon, 26 Oct 2026 14:31:59 +0200
Message-ID: <20261026123159.53234-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20260817192638.437798-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260817192638.437798-1-cosmin-gabriel.tanislav.xa@renesas.com>
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

On Mon, Aug 17, 2026 at 10:26:38PM +0300, Cosmin Tanislav wrote:
> Under sustained TX saturation the request freelist is empty most of the
> time. Since the timer is never restarted, small packets keep getting
> accumulated into the NTB, until either TX_MAX_NUM_DPE packets are stored
> or NTB_DEFAULT_IN_SIZE is reached, which is an unknown amount of time.

I hit this on a OnePlus Pad 3 (SM8750, dwc3, high speed to a Windows 11
host, qmult 5). Pulling 20 MB from the gadget over ssh stalled for 40 s
or more in 2 of 24 runs, and most of the other runs took ~6 s instead of
~1 s. During a stall the sender kept retransmitting, the qdisc backlog
was empty, tx_packets did not move and the ep1in TRB ring had nothing
owned by the controller, so the frames were sitting in the pending NTB.

With this patch on top of v7.3-rc5: 24 of 24 runs at ~0.9 s, no stalls.
Host to gadget is unchanged.

Francesco Lavra posted the same fix in July [1], but without the
hrtimer_forward_now(), so the timer would fire again right away.

[1] https://lore.kernel.org/linux-usb/20260727165441.1969927-1-flavra@baylibre.com/

Tested-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
