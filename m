Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743906;
	b=wxgV82Qt6xA8SeU3UDNhWHwtJkhGtloNvrOA5rBRhrJvh4an3DcvtcETyi7/iwKc3DOB
	 1ekeLcrNxLs4t/O5tOxRA2FTXr4PwpxKnodw0ZNnCfFbiacgBEZghqyFhClrd70dmYnve
	 FAL1CWBgL2OZ5DlgaqB+aaKUeDNuxfKQUTi63n1ksnQHl0wr1E93JV02VPXtqosJ9PD5W
	 p3dokYkV+JXM0CPVR1MTObhjiA86pYwkdWB4tBDr79ocbZNjsdy1d81rpiylKSCf/fIww
	 Y6nJh3roMo4oV83yPrhTCdkRlVS5pS5CzCwRN2fKxgR26D4b94z3xliZmtiD51/4M6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743906;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=efZn9kKyzFvhmLe5ocXri9GXnWcCja1K7/RMaA6AzAU=;
	b=O2MQUpYeizHF+YFhQssUbtlmfAelqJdLsNSqYj0QZmM4+16WuIKhjzXCZVULaDE2xhXr
	 IA0ZAZO144hg/HuW+tki5IbcL/d1kKwC5QomlOmcJrRxtQXnQkDgVdYFRY+TLMW96UKv+
	 i00aGdPulkm2i+bg9Y/d1enwsOpHq9avIATKGCxA4n3CgtjaDDncQA1jPqlMV+nm2uDBQ
	 s1QL4sA3c7hOU85PtXwdiblm5zPekajMOYC05HPHyIYEcWBCTFQCZKZxRPFOlX71E2SOU
	 FZeccLxW6U+VceCggkVrIHWcyk/USDeyr33dtq3KoRToy1iX4OuRuJK4vH4OAgYIkuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FgV99FjL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DB1606A31F
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 11:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FgV99FjL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302EE1F000C4;
	Sun, 15 Nov 2026 11:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794743906;
	bh=efZn9kKyzFvhmLe5ocXri9GXnWcCja1K7/RMaA6AzAU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FgV99FjLW0CmiKU3EhXECXQdKBe0pMJan9oRdYIiTz76RRS0vR4j6HjQZCBkkMAcU
	 fWgdQF6ca/q9Qrzb+XGGkYGx0yH+M6XKJ2sox+kyHt5U16TIHQCx6Ug381NXBB/S0r
	 5URcoEiVxOmxZx3xdn7s365Y1w96C8oDQhB9QAfNTOay1itIpIf4iw7tqNmUThVKLt
	 GAXFIrnrKsCatNhMuDbtxaRu0vmGRcphx42Vr1ET57r+ol8Ur8+Y1uXvHxCwuX2II7
	 7DV1UuJ58ViZr+Skic/5AihR8IfIkeBFp84mVAWaqpnI7vQY2flSuZxZ+xHVbPERkU
	 fUyeywfeyGoeg==
Message-ID: <sashiko-outbox-215468@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: host: ehci-atmel: stop clocks before releasing
 HCD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyan Xu" <getshell@seu.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <179474328429.103840.11561415733183356947@seu.edu.cn>
References: <179474328429.103840.11561415733183356947@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 11:58:25 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] usb: ehci-atmel: Fixes tag cites 501c9c0802d9 instead of
  7baddacbe1bc
--

commit 01c8113ae4f3e9e4bce884feb37af84c2ce05255
Author: Hongyan Xu <getshell@seu.edu.cn>

> usb: host: ehci-atmel: stop clocks before releasing HCD
>
> usb_put_hcd() can release the HCD and its private data. Calling
> atmel_stop_ehci() afterwards retrieves that HCD from platform data
> and accesses its private clock state.
>
> Stop the controller clocks after usb_remove_hcd() has quiesced the
> host, but before dropping the driver's HCD reference. This matches
> the probe error unwind, which already stops the clocks before
> usb_put_hcd().
>
> Found by the author's in-house static analysis tool.
>
> Fixes: 501c9c0802d9 ("USB: at91: Add USB EHCI driver for at91sam9g45 seri=
es")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/all/20260806060557.1747-1-getshell@seu.edu.=
cn/
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
> Signed-off-by: Zehao Gao <gaozehao@iie.ac.cn>

[Severity: Low]
In 501c9c0802d9 ("USB: at91: Add USB EHCI driver for at91sam9g45 series"),
the clock state was stored in file-scope static variables and
atmel_stop_ehci() did not access hcd or its private data.  The clocks were
moved into struct atmel_ehci_priv inside hcd->hcd_priv and dereferenced in
atmel_stop_ehci() by 7baddacbe1bc ("USB: host: ehci-atmel: Move global
variables to private struct").

Should the Fixes tag be:

  Fixes: 7baddacbe1bc ("USB: host: ehci-atmel: Move global variables to pri=
vate struct")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179474328429.103840=
.11561415733183356947@seu.edu.cn?part=3D1
