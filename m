Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444EE4F798F;
	Thu,  3 Sep 2026 21:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788471092; cv=none; b=Aww0B9Y05VmaSug39yI2p482gPPAsBRgs9S5WGpGItpFIvMzfaMAT1uWCA3wux1sYEoCw3BeJTKihMmwFYvnQpS5gYTsfJfjYJya/Pp641yZQSmjjP+qICghrjJkQYT7GnwBtiWUhGqqWHUnsq/46Y2tIjT1l6k/mD+PcOAz29Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788471092; c=relaxed/simple;
	bh=+OZBtBMkF8BkvUWdC9FB10GhNWpiU18kx0veJkLmG6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TiHqlrEJ5DsXnQ3KtQk5kzwFUTm7+e+sboe0vcUza6Ip8fAKv08stPDPpWkWrP7++E6XcXjUW4lR9XhpcVP2/ZcRqV+ckp7mJ13nYpLKxp0gpbh1ohZvomiG87B8fb0XAbjY6XdvCQYW9NmClg2+YDnik6/qar9KfvcpisrwiN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=JbhJ9gJp; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="JbhJ9gJp"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hbXpf3PhDzKmTW;
	Thu, 03 Sep 2026 23:31:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788471082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+OZBtBMkF8BkvUWdC9FB10GhNWpiU18kx0veJkLmG6Q=;
	b=JbhJ9gJpEQfCpMDhl+hne78uUbSyQsca62Yu1AL8o0Dopi3M3ltR7/KGjk1s4bhPNj64sX
	AH//177zqXhRtV1c7OS3rlpyYNpbEurr/jKaYpATbtLCyNwVGMdtuufREIe4WAaTpxrziH
	lkrjAIoGfXX26xqb16QBzVTb/ImyAkWdcc8qROV7f4xWJogOn/9Fplg2xXBaxU3on9dIF8
	Apptsq07N5L9Wq+jnF2AuiB4K80XpXGOnhgo0DnC7tZAAZFts82yu81LyZOD337lEATec1
	F4ECSyc1iFiOeRlQz2kcNof0PPFngne8/9pbfttA/l9P3Lq4LeVhvI/CiUuPQg==
Message-ID: <f9644352-5a24-46e5-9e77-2642e1f6d5fd@mailbox.org>
Date: Thu, 3 Sep 2026 23:31:20 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
References: <20260828182415.388367-1-marek.vasut+renesas@mailbox.org>
 <20260828182415.388367-2-marek.vasut+renesas@mailbox.org>
 <20260828183046.86F731F000E9@smtp.kernel.org>
 <d7444dd8-c94c-41ef-b5ab-52cb32313df7@mailbox.org> <apIGMJ6wveRRRMCv@vbox>
 <1fa4e305-5717-4a99-9e53-3a7fa1c5df1e@mailbox.org> <apYmMt_vK5fbjBUJ@vbox>
 <2634d23f-42de-48f3-b10b-92158e86fdf7@mailbox.org> <apeGv2_pFzqxP_2j@vbox>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <apeGv2_pFzqxP_2j@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 9608e1a5af5d715923b
X-MBO-RS-META: zaj4dzuse4g8g6qk5zh56yojgp7pfpwc

On 9/2/26 4:29 AM, Thinh Nguyen wrote:

Hello Thinh,

> We don't add sanity check for every possible user input, that's not the
> pattern dwc3 drivers (or others) follow. Otherwise we'd end up with
> endless redundant checks.

Understood, I have now sent a V7 with the WUSB test dropped.

Thank you for your help !
