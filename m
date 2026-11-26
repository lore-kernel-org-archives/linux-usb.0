Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795664304;
	b=0BXYGZ5JfC5Ry7sdVvGS4JF1R0erPFIB9k0T8YWnvm+Qu/tZAdjdZJP3uj5oJi/6hV6L
	 PAu1EfkfAUJ+MLzsjLTiPuRhuBB8rhId6CWWKXITmnSJh21nSdTQg7ueRHPqPq2yAMMbi
	 EdMxW84xICJbVv2RA33k/oFDIomjf5ZCHJhJCaJVS6f2h1m5USrKWsJ+NXLER8jj7LYeo
	 niMIiwkaCeIzwq7CvH1PuF3/q8RXe4KtxARmFraFvlXpalvGULq5K59PJtx3bwnPPze3V
	 3uFZw07xVmygD7mdDMZtneLHJ1e9gfIzDHFwDlqxaoO6aQQt6AkHjxFDYjXbj7gfnHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795664304;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	b=R5ZeLAPUwkOubZg5aOjDmBgKHvAehhHyJOR3Q2oWLnijYawCI0nznaEnTdTS6aD+JLSB
	 98KiofkAL/8upGdOsgC0mTbXf9z1oSLY/H4Cer5cRXVCzsJvmA+CovFbzjcbD7Ppf76pF
	 Qh4/G239QosiZYcrHjle2vWHhyWfJACOUKQDgKls5JCgMorCD2LbRYH0GjZUELGnPTouF
	 xQA87fnL5gmEISKS1p0aEqAcLsjqHr2hm+A9N/TmvSQdAoYPP55a18nxiH3PtFuxx/w79
	 vNt9w8NmCFLVkw8V71svvLBmLPlcNOpBU9EPn5x+jMlg+iApkRgGbNe3X54UqajBFLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xgw0UsBq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3425606A31E;
	Thu, 26 Nov 2026 03:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xgw0UsBq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279291F000C4;
	Thu, 26 Nov 2026 03:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795664303;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Xgw0UsBqWopkInNmGBBKr8kgI0HGSfjLttiK8e2F9ny4IcPOB6IY/QltGC+MlAF2R
	 LLCtRfIg620vGhJsLBlE4L0BDoYNxmYrsJaI0deEeFWmw05ahU39PO0rCW2g4Qz2Hd
	 xu2Ju2YHbQzg0CiRobI1F/UtNgR11CJiWLu0ysN1bIK/jRAzdEeq0QDqGFwzAv6DMX
	 ZM5II5ksyyIl/qnO8mFvypbBviRdZvwjyKb2IIUjp72MPff2/BH6+cbM6pbA8jxrdp
	 pFqOG4x/TDGSFKYbhEhQvIgtK8fR/uxaDcA2n8nLwRLTTbCJBqf5IisUD2nOO+IIJt
	 J/mUcxRKid87Q==
From: netdev-bot+sinfo@kernel.org
To: Chih Kai Hsu <hsu.chih.kai@realtek.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
 nic_swsd@realtek.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 edumazet@google.com, bjorn@mork.no, pabeni@redhat.com, andrew+netdev@lunn.ch,
 mail@birger-koblitz.de
Subject: 
 Re: [PATCH net-next v9 00/12] r8152: refactor and extend RTL8157/8159 support
Date: Thu, 26 Nov 2026 03:38:22 +0000
Message-ID: <179566430266.3294.10617628941345671445@kernel.org>
In-Reply-To: <20261126033211.51850-1-nic_swsd@realtek.com>
References: <20261126033211.51850-1-nic_swsd@realtek.com>
Auto-Submitted: auto-generated
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

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
