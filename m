Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005620;
	b=0kW42Q5QuSTqhRJ8UcB1aNZGXx7CrB5wb9LLhyaZeoeOdjFUhRBdl6sFi1/CqVLYDqlN
	 Lyfky3hqpPC1/Ql8wELXoS8JGCMdXlgXHjVxCv0mA6MfcmdWGpQo5MLODMERgq5OFBfuW
	 TqITweDKfYVoqHgkb0DByPcHpTKBQDdqoRJm3XEMrwmYQxk/aVbHIvOn87cJPc/QQOyw0
	 xuqO39XdI5Ts/IVvs6fjNjLm+nt1k3inW8AuOrUbNh0VaZHX6BcjFKxEA+ysjclb50o+a
	 9VH1eqHIveZG8oBDCyAsz8jZp7KO9vPdZHwfJg3HqqVN9A00sCSmpL7iDxkTGrIJ9kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5u9A3PL16118dnwDzUsQLtTXzEbAMsk2owyLQhcCKJA=;
	b=d1bFFtC0JXg5bdW9SQoo65vtBCwprYFFlm9ktB5lqcLdF5Xjq0DTH9a5yQnQsa+SiBV8
	 4Hwmy39euINcJ5RcK4dmYmqznPPT9suabd+BaKtS+VJa1ykntq8OZFnpGUJ/YhH/CrHVC
	 AT81iuUKjF5Q5xwFjsn1C5pciGYvI7WsGkASZWXj2C/4TQHnhxX0boL3tKNLGqQMuFFt8
	 HxeLMxTQIZNbkDhX7LOfBrxiBsEWZV5vAr+Fv2H4m448IL6MWIXCrY7FkgPFexaqlMjvs
	 Tg/tfQ/Mxk5orzoWy7XpBUNQ9Y0w4N8NIc9c8Sp0VwnIHlnX3X5t4C80ysDoQuwVlqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fjXVeMEP;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4321E606A320
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 12:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4321E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fjXVeMEP
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b3be948e60so491214a91.3
        for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 04:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795005618; x=1795610418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5u9A3PL16118dnwDzUsQLtTXzEbAMsk2owyLQhcCKJA=;
        b=fjXVeMEPXANBKTkfuitkhxYl4brjaF4kq+WAE1yMT4ZeBGhEKJ9Rag192Ozcpj3g9s
         ZyG2it/ZAVFK+Gdag4q3vNXEFSQZ7TErvrgKKVa0zN3tsRoSAjd477wvZz00KsLYB/fK
         q/GYPIjen06QV0sT8lPYehmyRMiwJTavo7fPnS2ffcB2D+8ezhYJRpgGb15D8gcjxDBX
         vGsYEjKxFYVk8aviP2acTMSq75ELzaRz+jRDFRNulWvTza3el9/K7Br0B2PG5mTEVvbE
         0/SRCQdFrmonZJstIJ3DHKo7Doo2wPLavTa8cfbT1EhTB4TvneOG1SPzgNGR/jwlL0sA
         AVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005618; x=1795610418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5u9A3PL16118dnwDzUsQLtTXzEbAMsk2owyLQhcCKJA=;
        b=BHyUlP3KvT/aLp4SbfxP816lx6OmouFMTORXs0aOhZ4Ax7abRHsO+eCEnkodqRnnRH
         ZYNRBUuvQpJxLBK3aUU65PzZhWU1qCShOmYaeOu2p4o4ENecPIO8xwgA3wco5Xc+/gOD
         LxTIa7uvxl5X0PasXjX9h6opibIc767/QxwU6TLMsDXAWZYwOa9Ukg6oATRjRgjzJbfS
         Hi6ZMRgM39A6fxfRb0/NKWA4L1rhmTE/21qw3oewYo1o/ie1QuvuM0cAxNWpqFxrbLkg
         fQ86FENc+31dpSlSGfbnMnWsONA/sCeb1Nc2iDse+Gg02fA2+1kO2lW/R+1lmZ17qGng
         Q/8g==
X-Forwarded-Encrypted: i=1; AL+hErHCSPRjhQqacTNkfqDkPLhwDQwVXHRKog8PM9VIoAX6sDP0nIsfhKGlK5mGkaacODGu6fDM8hE1ZpE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OToG7Sc7p877JB98HtkWg53xjP4PXOQJLkrrNFpHXhGNCW7xF
	bOE9/+stsmU0zBaEl/upvJlzl8MEkDMU1rperoHmoQ/dfXqrgxhthwDBYN7fFTgD/as=
X-Gm-Gg: AZFdTZdyGWqRWKRsrh409BcdnA6y/kzAOZW/wpFrOcp5UlhvmG3UCzA4wDTKU+N7W1O
	fGDeCjFm3UV/i5D8aCJfXeGRBsEtNP8719tyiraZoV9gGEwMxh0R9Qa0DI9adAjLUh3n+gErub0
	Eb3w/kz4GZDmx14tppcaiHJjG9GYkobL+5wtL46zGTpIp2rZVruXMUmxZGOKLyc0Fy6xU8bKeBp
	LFrBtD5NYSVoPRj1M77HA0bInEtGjyX6QGQGCer9DHI7Ica3pE13tdKDShvnwgFTACyRlXNyy3w
	aIforXuUeskYYwgt3yognPc7yRc+btV6smFBnbSdAV8wtxdQ0JLMtKugypBTgu8yy8NOHQOMk1R
	BYrU+P9yTs/ij0fzbFxuNsMQoO4LUCD7f6JlDV3VBYa30x981bf0l1JspKKeG9QJ4u9xySWHSWB
	+pXiP82qhs4cTayfdUEpVyuKLK+HIaUKGoxyyVCvV10MuhfkQ35PSO1QkFAb8FSEsLUwdVso6fH
	jEj17+0SkT+nbGqoggJsgGDI+CRfWbvAD7oR24UaXxB+49hYjW6t4uB2YzD0ocnRyMG+S9+UJOk
	PoulDdExZvKrq7yILsVhgMTc9MRw4S/M7Khhg8ZIfc/qojE2hMgOH1qoqqMB4x3SDEL6H+1ae3U
	S8e4DXUJw8VmL7RSXKc+WPWwJdUlybR6WlrjtQBnpjMnv2TyQo0EzkjxFVcA=
X-Received: by 2002:a17:90b:2642:b0:3b0:9a1b:b708 with SMTP id 98e67ed59e1d1-3b3d07da3cbmr2529004a91.62.1795005618178;
        Wed, 18 Nov 2026 04:40:18 -0800 (PST)
Received: from localhost.localdomain ([2406:5900:1044:110c:e78e:f7f0:2120:34e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6e18sm4257980a91.10.2026.11.18.04.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:40:17 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com
Subject: [PATCH v8 0/4] usb: gadget: f_tcm: fix infoleaks, sleep, and UAF in the BOT path
Date: Wed, 18 Nov 2026 21:40:01 +0900
Message-ID: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
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

v7 was three patches, posted 2026-10-13 and not applied:
https://lore.kernel.org/all/20261013073328.2936318-1-yhlee@isslab.korea.ac.kr/

Changes since v7: a new 2/4 for a second infoleak in the same BOT status
path, a measurement added to 3/4, and the recipient list corrected - v7
left out the gadget maintainer.  The other three are unchanged, on
7.4-rc3, where the file is byte for byte what v7 was written against.

1/4 queues the two BOT status requests that run from endpoint completion
callbacks with GFP_ATOMIC instead of GFP_KERNEL.

2/4 allocates the CBW buffer with kzalloc().  Only the 31-byte CBW is
ever written into it, and when a command is rejected before its data
stage the status path sends that buffer to the host for as long a
transfer as the host asked for.

3/4 fails a write whose data stage delivered less than the CBW declared,
instead of committing the untouched tail of the bounce buffer.  4/4
clears req->sg and req->num_sgs when the BOT status request is reused, so
an sg-capable controller is not handed a freed scatter list.

Measured on a dummy_hcd gadget with KASAN, one fresh boot per cell, two
cells per arm, speaking BOT over usbfs so a CBW can declare one length
and the data stage deliver another.

  WRITE(10) declaring 8192, 4000 delivered on a short packet
    7.4-rc3   CSW status 0, and 4192 bytes the host never sent are
              committed and read back
    this set  CSW status 1, nothing committed
  a rejected IN command declaring 4096 bytes
    both      4096 bytes returned, 72 of them non-zero and the rest
              zero, starting with the previous CBW.  What 2/4 removes
              is the part of the buffer no CBW ever writes, and that
              part read back zero on this allocator too, so the patch
              does not change what this test sees.
  login, read, write, readback controls   pass on both, KASAN 0

1/4 and 4/4 are not exercised there: dummy_hcd ignores the gfp flags in
its queue callback and never sets sg_supported.  4/4's evidence is a test
module standing in for an sg-capable controller; 1/4's is the code.

Yehyeong Lee (4):
  usb: gadget: f_tcm: queue the BOT status requests with GFP_ATOMIC
  usb: gadget: f_tcm: zero the CBW buffer the status path sends
  usb: gadget: f_tcm: reject a short write data-out transfer
  usb: gadget: f_tcm: clear the scatter list when reusing the BOT status
    request

 drivers/usb/gadget/function/f_tcm.c | 23 +++++++++++++++++------
 drivers/usb/gadget/function/tcm.h   |  1 +
 2 files changed, 18 insertions(+), 6 deletions(-)

-- 
2.43.0

