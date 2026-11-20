Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186914;
	b=StRFmH/wjP0I6LEYLyvW7nUTf0LQlpiv4ZhIovik0U4kwmOU9crzVbl5rx9VNSeOh/cp
	 mkyIo8Jvo4p8kgIVqDyl8TAcJTxM4QfXzxKC8MH7sK8KSzqMuMrm1nJ5TGNmfR0TKvWH+
	 7UGqVHLV5HLbwMaIadtrJcPp8F8Q7jNcp3wsvKBPInUYID2WoRmr4H5dLXeCZkL426hbG
	 5Z3xVfKJYZADm0DXM6gO2CP9FLCesNootERNpA2fuXHpm/oBbxZMo8wB015w8DfcVPxL2
	 vaUGBHwcWUIXDO1P9RzfyAEnzAhs53XW8IOdQE10WAxuMVsE1vAYcmq8GbWmdY0o93w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=jJEKPitTmspiZgBtv0fmRLCqGp7B3w2kyTO0lmVWhjs=;
	b=ibg9JaY6zL5SMV38Z1gRS4XCFH46mviA/hoJsPyiNccFujXSUwwIhzLwBVAABAPNiiYL
	 HsU9o5hHSsFPgYb/3e2J5xLfRDXGO8/w0Xa1OgzCcntwVvrfBdki82sMI8U9nTbQmyK1R
	 YwVeLHx+UBGRva2LW7gWhLBCQLfAUvnmy42BJB71LHRUuEFJNBRa5zAmeFljhxXW/dV0I
	 P8LoGvedb8vcvgAYeQeibDg8rrlxkYRrNMFimw/xt4C1KHmNbcb9JWQvPFF/oBW6Cs+EU
	 gIYnQiZSLqU4r0He4LbNdEIrXZv3SiI+46bYRt91tf/jvSOGVpRTn+pOOJRb0x7bB6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=U4s8W1Jm;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC788606A83F
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 15:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC788606A83F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=U4s8W1Jm
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so630959a91.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 07:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186913; x=1795791713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jJEKPitTmspiZgBtv0fmRLCqGp7B3w2kyTO0lmVWhjs=;
        b=U4s8W1Jm3lFPfs5+wrNBLswuiF5CaYpfjnOxkfOInBFakmkhpYm0C9r/dy1VhXq1MO
         wdrWuDs/Mi96lfOYZFvrI4u1zIz5qwvc3TxAqyGS1wMcYe4XMvV4WIi00Z1lW/XLLn0J
         4t53eku5S4V0IDuURxyQofa7YrieQ8NQ+1mX/vKJtkpqaZXM31QTx25qfHENw7SHniuj
         7sUwMxR0LiudslXaIdockcUbtvPmsafW5FTn3C+pOSoPD3OTrZXcg0WQ7SCuPNl0qT7c
         B2Tr9bxR0ui+0N87wRF1bOsGkrYI1orBRgfj11SQX2kbWZsyEOTiTsxA1PogtHPpGBJK
         Uhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186913; x=1795791713;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJEKPitTmspiZgBtv0fmRLCqGp7B3w2kyTO0lmVWhjs=;
        b=uQX35+M5VxaYDmMSniOWx8J+s/ZJKydnHZTt6JkLVjgA4HirdAPWQoQPhMaLukzqUQ
         2z4gevSVcWOLNiSYgPYfty1TvNv8sziquiyjoPhS7jCsYtdl6ID1GGetdm7KvXqDXAJ4
         NzQbS9bbee2IQZKMDbr81iPIWZ88w7xSJ09TOIeYSRmCI3NnESMYK5g1/kT0ln8paLq0
         gyi0LQCTPjWtharrgplmKvXpqAweD0npF52IDxEAzkt8jPckWSpJkXG3MJTRxbsW7vb2
         blZGJ1tC7lqTRkps+r2gE/ImYoJ74NmTt4/cV0dBdY8QNNLCj6SqKy8y5bjNjA+opFMx
         pNuQ==
X-Gm-Message-State: APuU4Z/1GHqkbrCnKQfEts+DPChUGR8bCGDyGI+RpWNdmN4NJG70wYgR
	aNhczSO5YuVZIrRN55gBZhRjrCyrRAF6KknkMf+w23S1g4zh7rT98zyEIX00rUaOpss=
X-Gm-Gg: AZFdTZdRssG7ojFGH0cpIm+rUWXAKxMIUzQMWhk8yBU8gj5D1+8mSPdb4V45L8fSVc4
	aWVBQvnkYfP1rOve1bN8RP/jSg5IBhQf1udcQV88fNelRMU6azHpzQQLE1yYGr9r4KqsfSM4Qj7
	vB9uXniCk0l0astzP31D5lRJ6CY8Fad1nosvkJZ1EfhOacc/haGjRGk1fXQsLkFq8veu19Dr0Rm
	6Ek6EaH0zePWqNVyZzKYlXfmilGMieWXM4KcztNz91KCexrmRCVtzuUUIREEqJtoB7ZN7CaFMgq
	9b8Gdp1a+v6drJW8l2tWpKMQgfsNKwrMITLHMLPoib74X3EZweK6YOCGw6DRkZWqTempge9+eE1
	OOhPwHmh1MsZrpHgNR5cktwnMS1aDIptXOQrTLF9B7tI8jhta7mpKSSvE56Mr6uJaeYsIXq/52Q
	O81AfbNYHJMkmREobg6jsJomI2TbGGFXjyniAytfpkxF2KzI5RhcQA3xmaxnr5IwTp6TZJHPQUg
	AZ3wyKUr1ZzSpEtkSaLk5md65l2rFIQMGXieCdFtHDEIDjzFevnL8VBeaIlWy/j5JmHXcAtJG4Q
	WdWbTMUozyUjO8RJ/kHjHnU9ptqLvB+YcUmWxPif3YyBZPWNdi1K+Um8bh1QAXh01yKIHA0Uu23
	gICaKprVLsLprsrDx3p0xUWxq8ByQlwCpJxNQ
X-Received: by 2002:a17:90b:3d4d:b0:3b4:691:d073 with SMTP id 98e67ed59e1d1-3b41c95b0c2mr3210879a91.55.1795186913056;
        Fri, 20 Nov 2026 07:01:53 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm4733348a91.17.2026.11.20.07.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:01:52 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] usb: gadget: f_tcm: fix a short write infoleak and a completion-path sleep
Date: Sat, 21 Nov 2026 00:01:48 +0900
Message-ID: <20261120150148.3128435-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013062129.2568405-1-yhlee@isslab.korea.ac.kr>
References: <20261013062129.2568405-1-yhlee@isslab.korea.ac.kr>
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

On Tue, Oct 13, 2026 at 03:21:27PM +0900, Yehyeong Lee wrote:
> Two fixes in the f_tcm BOT completion path, both reachable from a remote
> USB host.

This is superseded by v8:
  https://lore.kernel.org/all/20261118124005.2428068-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
