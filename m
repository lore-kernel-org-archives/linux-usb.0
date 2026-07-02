Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4D62737F8;
	Thu,  2 Jul 2026 09:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984487; cv=none; b=GCpoym5oLes8qDtnqHMsWFqecju7HJh1rhg3MDjqvEP4XCpbho8aXvfMH0v9Du1etAIym/nk02RnzSyjEctPu73b+w/abZLFSuV3C9arzBSAjqm0rjJ/bQGwYrkskVewJ08l8RMPq7SNAGzt0Xs8pBMS3euudFs++xJIZYgT56E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984487; c=relaxed/simple;
	bh=WZ4FnI6rB+PEPX80hcIQgq8LEwzKxoIHgPeP8bBqrX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kqW4mSjWsg9VQdAiYa0Dl+6rkzd9di0KgLd4YFiRkv927U1XwR2MmBmjzvt0dnvkwi7n/faG5bGPr+utQNJIRHWWJ0XgtrVdjNMPLH/hdHIj/i7DoY1SPwNK/3EFTNCYtWCe3zhNaAlmDQghWmlF2cGCHJmfVWSSPAoM4+b2f3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=MkIZMkfg; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="MkIZMkfg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782984436;
	bh=6PVVs7q/6LjZiQMv0Fmpds8wmrrXj8NKL95WX27ZBMs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=MkIZMkfgZO+X+z2zJwaK3gOd6fSeQmIzrCsqnzA9g1JP55cpA1W3fbIe+9wLSm4MB
	 BPY3DRGh7+7c0yHBxeJOSkyMaUHCBX1PdXDidfEDu/zdpb9uPJdFsSXwfTriH3/hj3
	 CY7TE8tyuk1BqnNV8plt67OXqxqNMpUyewwhmFI8=
X-QQ-mid: esmtpsz19t1782984418t839b2531
X-QQ-Originating-IP: 2LM791t6VA+OqMOuglqt863OvcFgkOBHMFWQzzjT0vw=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 02 Jul 2026 17:26:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6041187957953166708
EX-QQ-RecipientCnt: 10
From: raoxu <raoxu@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: dengjie03@kylinos.cn,
	johannes.bruederl@gmail.com,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	michal.pecio@gmail.com,
	raoxu@uniontech.com,
	sakari.ailus@linux.intel.com
Subject: Re: [RESEND PATCH] USB: core: report interrupt endpoint correctly in companion descriptor diagnostic
Date: Thu,  2 Jul 2026 17:26:55 +0800
Message-ID: <221217D28C1D901C+20260702092655.2567041-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <2026070248-fleshy-activity-1a33@gregkh>
References: <2026070248-fleshy-activity-1a33@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MT9zUyrbrlbB3B5tFHz9v5qgDRlgjdpSGy0ZxV54KJQ6E8bdPcZNUSHi
	1HSz8h8j2YnWteuu95yOBF4ocFqD4klZlEYfRyvxDfMztu6NrgGvc2YVmL21CSHnoUVqZXu
	NmOy47i8Wd3EBWN6ojOdxTxmNuyZfB1NiRs+qLl/aUq6Js+75NbcAztyt7tunecH6sUWYn6
	SjplNgLS6fhjVlTXmXWi059dEuJr/7ATD866Qb9f2cWFPs3rb27sD8uLyIQPQYkonn9h5k6
	+vzoqF79VdJVl4P4B8FSdTFmYah2iq8wfP62Kj52DDewLOilPANoyYLKTmPc7ai742qVEha
	uq6pDMJTXqrLrl7IsXEixAP3qOqba9h6hJfXYno8aeVhpBnYq1VGxtLqd4pPFxLyWb0gZ+V
	n/HqzDw14fdr+pxIzcSC7l2p/xBmxHE4EsppA60X90hyNJHVP77L8mhSYKNGI/n8/x5TeEb
	j4l07iZalbbPBGZZEHH4OYR/TImg/MF41lQixHL+C3ni9TRKRSooUPto3y6BwE6M5UdX9AI
	9WyqVNAWVDKUL8cxyM+wcZ7SpEZsd/Scu/zsW9RUfUMeLDKE+KIjAVllpgKGvS9PJ7uGJgS
	Xy09UsciWrxOtGfO1VBZewZ52Q4FGQzBOSRqVE/5uKvHSkaLqNRJ0t9HQW6nnT5tzsTIik2
	hrV/K/HmCkftdCUPNfDQa6LWTM0f3xJ3MGHB0AjjCkytQzVh2dhn4W6c21DjZOZnSA3EFjC
	DCkK3GNHYabRsLOFFk7+79bUgIeYIbci7WEofwMWISvqD8Tz5s/EIyD9A2BW9bRFu2q3iXM
	vuh9p8FE/N1y/lVtycMq6YpZDW4dA3sMp1MGHwa02F6k22AwnsJo5y0dmAi/bdhxH5HHscD
	kBJK9P0mH+XNSgK7CgbwnHepmSJpVTitdxxSz9t3ReE52tZ8Ra15/NAGd4sv3uYyOs3xnQK
	lXsUhjES9yCPStZas5Gz+Z49x9iuY/f5HaSlJnGmjJt9JYj7E25KYElDyAL6FQqZj7YVtGC
	jySIsP9+WY9DmJvht1/kbR98x0HvmOr1LwSuo6t20oQpyLKPOSB3fG0lTa7wNYB3de3GLdE
	JSOCBhWiGPF0XU4gaabCcEEcixK1jZO39EHwQUJB13EnXok5EqkDCuWMsEpEFg+xQ==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

Hi Greg,

> > interrupt endpoint because bulk endpoints are handled by the following
> > else-if branch.
> >
> > Report the endpoint type as Interrupt instead of Bulk to avoid
> > misleading descriptor diagnostics.
> >
> > Signed-off-by: Xu Rao <raoxu@uniontech.com>
> > ---
> >  drivers/usb/core/config.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Why is this RESEND?  Always say so below the --- line.

The original submission received an Acked-by, but it was not picked up.
I resent the unchanged patch to bring it back to attention.

Sorry, I should have stated the reason below the --- line.

Ack reply:
https://lore.kernel.org/linux-usb/077ba20b-9677-4812-a083-b5216281611e@linux.intel.com/

Thanks,
Xu Rao
