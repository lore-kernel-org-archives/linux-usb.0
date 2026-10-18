Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160543FD960
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 06:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304109; cv=none; b=TDJv3cyeRznyyVCW/S5KGEvUfNJqX34afjziaHCvp9936q5zHRZcn+JQphpCGocaDVzckHRz1x71ol4HWqfYlpCZbA32rT0tEMfMxwwK+6cpiTGarHq17TgFLaEZdtq8fJTt8bBS1M7na/mK6kCEce8CHvS9p3G2XihUWq5m93E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304109; c=relaxed/simple;
	bh=dFRO/d/6Wl1NjIou5Sj9HlQFKiI/UvFn2/HqnF5nYY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ol2lxzOHGaWwGIEIGzQRB6Vu90ES6UwguRcgSlmudeBDDk4T1/OjTN5D9NC3gTXZtTwUtZOmIGu+B0GbomEgEr15dJPr/ggsFOoVEowBtV4sqEGSvnVg5c3c3sOWskZNtY2I3t1HWSBafIgLVzv3N5u0gALgNJV1rZRlwmrTg8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=h3PwPNQe; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="h3PwPNQe"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e95bd1c14cso9242375ad.2
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 23:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792304107; x=1792908907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRH5Jy551mYfc/WkSOrU9rJBVCAUTwu41wYys1NmakA=;
        b=h3PwPNQe7KKjKgZVpIK7synCo/UDTN54hSCWKXRywMpEsFftUOAPh0x+9S8iso4LlP
         rAitp2FcPWnRQWCA1pS7oJuxHgLQGLFxvvEVluYZ8SBu6nz9R2rfsAS/hzlqujcpPxT9
         VmCbtYMuMEzzFmbRkR3b0DiLsgpoP35MuS0ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792304107; x=1792908907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oRH5Jy551mYfc/WkSOrU9rJBVCAUTwu41wYys1NmakA=;
        b=CBcCQrdTg57hXuF/8jfGUUL8BOyijdKT5pLDqg1D1GV1foRy8fWzBSy0gACnSZPY7l
         Mm0scHhrct7/I+wCbo5HirTCTeawn/aymzPc2F1BkiYePzzCa3llktw//bX+FobqLduI
         vhkpFY6ksRP00ValmQhnzGAk2MtZexlSnsIIaNdEZJECi1kz6lCOgduanotNb49nQbe3
         LzQP5vabi9qBmDsTIrZemT10NeWJS+gC/C+HybmpGMoi4JdPjdF4Oi/dG0gWCR7U/z+a
         UvaLxkwQ48Bay+fKGVqSdtn+m8sqnGJ4ffMQH+d+DfIbzubD756eleNTTU65Xvzv10lB
         8lPA==
X-Forwarded-Encrypted: i=1; AKwUvBxCPPTPos/GwiQBpLDEI/7U/MzOttSjnIghKZNqixS4JftL4AkDaRgklnuPH0Bk2V2+j8/E/LXSHbA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIJ0Ie/xXDLDA/E5Uy/PM7HQst5oDoE3ZmrLpuzTd54B+1lJ/5
	M+gqOQuBGW5GVD44QkLatwJ7RzVJDAYSEgT1HZ9wEDm1ucRBzvXVgwlAXLET1j3afoA=
X-Gm-Gg: AYBFou2yGaOAleIm4l55fbviiMBTZyU8j5ygz9p+9nMt5/tne/WxcfOlGZeJwCuLrxG
	gssvxwUM6Zofn/5Gt9LzR5xgQVOI3Ml2Gkf9MZv8k4u8KiLUpDjP6+xjBscc9Mfr8R0nO6VZT6E
	k7MndPo0GjHjfEcNpdgVNEgAkLBlv2vgfzxO9neft6KmyCHjJqkT3gtU3sdVmWmTdkj/R5T28fz
	/PGdrW0j32RrNc1nL4aCdtl/yGL0dJNDpC5NsYpTA8aM55LIfCvbHaTxQOro1JPImFF2FUhbasl
	ikKrPXaGwIURBSqpB++bmdxWPDVAY0fi9gsgEjaxysZgfBPDwZu2cZ4wK47NK65lMzaUqcsJ1la
	rLZ4j3bNDk8I/52JoPCRybgc8+olA2yRrFuxZmSn/jYrDsEirMlFKLurQE8YWEiQYBvqCec6kB2
	BRt2MmSvJklf4pzYO8stVpBiivCZkgS1R2sUUyR5vNwJepuZtqknQEbL/2CN1lHZZCLOSpFM5SK
	zORR0Yjomv4L3M9jqalJSj0/ErdmvlcCHcuH6zrmSiIGhWMjYziwg8=
X-Received: by 2002:a17:903:2f87:b0:2e9:4175:3079 with SMTP id d9443c01a7336-2e9a69e4360mr42362815ad.21.1792304107338;
        Sat, 17 Oct 2026 23:15:07 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e833f1asm26464945ad.43.2026.10.17.23.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:15:06 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: netdev-bot+sashiko@kernel.org
Cc: 98lawweijie@gmail.com,
	Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	law.wei.jie@gt.tech.gov.sg,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	stable@vger.kernel.org,
	woojung.huh@microchip.com
Subject: Re: [PATCH net 2/2] net: usb: lan78xx: reject short register and statistics reads
Date: Sun, 18 Oct 2026 14:14:56 +0800
Message-ID: <20261018061456.18648-1-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179229346399.3135.12116533277810426921@kernel.org>
References: <179229346399.3135.12116533277810426921@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko is correct. Will be submitting v2 with commit messages changed:
- with patch 1 a zero-length stats reply is already harmless; the remaining
  leak is a 1 to 187 byte reply (the counter block is 188 bytes). The message
  now says so and no longer claims the counters "stay zero" because of 2/2.
- it says that 2/2 depends on 1/2 (otherwise the leak moves to the stack) and
  that both should be backported together.
- RX_ADDRL/RX_ADDRH are only written back for an invalid address; the heap
  derived address is written to MAF_LO(0)/MAF_HI(0) and set as the netdev address.

pw-bot: cr
