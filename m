Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272451EF39E;
	Tue, 14 Jul 2026 11:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030266; cv=none; b=g6jojjA4qTsActZRJu7iyhl/VNOZHL86jbkxP+wvaquJdgS14o3yYTdWSZxnNriP+kNCX5lUl7/Gi2Z+5tMmhYVBc6Al8Ec58+mJdfRgI0tWFHjLu72eO7tOKweFlsMv2GiTE7Ut3c/H0kcYqRvNBfb4zZkTATjFmbx8tLs6p9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030266; c=relaxed/simple;
	bh=qnuUnTGdyyejc0tCAdMu4ab57+eN9+FO5VeVRco6fMI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=S6mEIepei3EVOUNpiYUzKQ4kTfG5y0j+TX3zTImjarVHuPuvZN3Bc3UPJtnkmzIZvfc2Slu7HFq0RKpKZpbRRQJrjVBiDMM9pv9qGPAD30VySduiwlRtzXFpwX9Lw3rvZ2OCPreE9pzOglN3MrQwBnY9kYXmX32OreKfXpOYEOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=RcfLaKvj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=awuMQmG2; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="RcfLaKvj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="awuMQmG2"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 041207A00CC;
	Tue, 14 Jul 2026 07:57:43 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 14 Jul 2026 07:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784030263;
	 x=1784116663; bh=qnuUnTGdyyejc0tCAdMu4ab57+eN9+FO5VeVRco6fMI=; b=
	RcfLaKvjUkC511Fv2011LEbSW2Ux8qU5QOBDRq8lb31BQjBT74DcaD368pqhtc0b
	fMeY+q0QTHJ4gOQ76+xt8xKv+ZwACjKVW9dqG5RMPfRbz3OS9Fp1EzAZcPspsuuF
	b1+jiznoSMnZ7mktRF9DH7jlmHtTdkmFJ65G6lDC4+pR86SjBzZVhfSZqYWiaKbY
	yA0p4/9aeaBh2nufWVL5AnexqtVhXnqqX4NoJaf0K/lbbugZm8oCJuxIZqDtJVze
	ELF/LgZw8Cr3tbI0oxDplLIf9qMP9btZ8vs7GO6N+MyPGYkXtDBRJAQeoY8LVK+2
	eIcxClywAz+ZTZejH/KjGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784030263; x=
	1784116663; bh=qnuUnTGdyyejc0tCAdMu4ab57+eN9+FO5VeVRco6fMI=; b=a
	wuMQmG2nF8IU+0aKgBb5G8StWiFdb+bxXLy87b/wU6aKbppG+yhBd/kPTWkpccVh
	NKBe16GpU+0QxZSsEXEul4u/B7fpsbNYSfcCncO0zS+X16YcYr6J7QdRfcy0cn8K
	d7FavoFZ7CUzfkL+DH7vSpkQcL5ppPZlq+6FiWeVoF8RAdu7I2zIByIv8cxWLQKd
	+gCWIn8WYcPaEADwsrGuD3orcE2dmkchdQRIiij7VM1z7ti+cV3iq7Ru0N9WuCe7
	XWt4ua4wBXJFci262vmJBhw5KY0QyG7pKC81qaVjGirV8W0EAYg4Hmgy/9s4Kzh1
	d5m15gebrRzShEQdLBxwA==
X-ME-Sender: <xms:NiRWas66x8RwI1OET4IE6XoCKvIkPfdjV5okRbURUy3Bi3wt-uW0uA>
    <xme:NiRWaotxVvAEOEZhaHroKsZ0LOvc0hr5zlXuIDkpcwtFwpgKTjiGj5kKZoEP5H2QM
    oArLFStmVLC1OizKHcdUeLqhRUAUfgahOpO8NyUBjqaFsSA4Gsf4rE>
X-ME-Proxy-Cause: dmFkZTGSf0sWvk6sChcuR57328yIJw+tfEtbdEeMaIpTkiBhT5xW61wTeLuyfkUkDnffbc
    b3PCodZAqr1G1mxu076AOUNSgGQR7RcnvObjFmNhPTBthYR02HaetnGUjIf2WC1cmzFQxt
    8gD5uO5QVBjNafw8qJEpwASNsuhdd9rv7Rf0g8AoUNruMGX9T7rmJ95vG15tX+TFLQdh30
    fqbKo6N6kvpdngu+uc509mEgVxVVRYQIjJ9GkyOBFtPtDh/8sNqM2RUaAbPNsAHDR7pNyN
    lnnbOrU1ubzfQE981kxOGVACORiEg/+J99hE7SwyG6OnCpkFROrFCuKw3Ax0FBPLXrobpw
    /XjBNXyPTYwFsCSO3losTqKo3oB2cUM7vioka9QE48u9+lavQMygCPGrZJiUnLWfz0mYxB
    wLRODtpsVE3ZxDXxxJFm6cLz9biA4Y80QlTi/dowKXj8XbQEcn0RaPmb0ycTSjM5MvYL6G
    niN18huLKC3rwt3/AAHDbpLYDsDcxSARk85RuFlEyEdh+v6m+46CL07sP+BGHsieZCeBM7
    WgTCfQ8vrJz4jbOrscL1glRe19FcXEm6ckCCdGH73FiKIi9IGjZs3HyWZlkGt48NdkhxR2
    3L9AD6VrIc+z8DL41OyF5e23vn0DM/vsRVkl0t8zGsT9dThUVAvNwUhFVTHQ
X-ME-Proxy: <xmx:NiRWao70FOFUvb2_1hL1-DJnGT3LexX6DjrHBAndhMEOytpM7TEdBA>
    <xmx:NiRWamN-De62dPi0xHtxzGnPGc0_WuYXW6Voj24KrLpFxxpZwR_omg>
    <xmx:NiRWapFkhZIXtBg5-zNoly45xPxdpV4UG6XYKRXWd8UEm7WtDzmVCQ>
    <xmx:NiRWaqTWFvh4W5ypUs00COdn8PWu1Y1BF2HREHxq9Rqhp_xT5fHVYQ>
    <xmx:NyRWamMspQ41N5O1ojsbnIFrkYQfCQFbfBjP9exVck_zu_1V7WZ4KysS>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CEA3A182007E; Tue, 14 Jul 2026 07:57:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AraohZGvK8_F
Date: Tue, 14 Jul 2026 13:57:22 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Braha" <julianbraha@gmail.com>, "Bin Liu" <b-liu@ti.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Conor Dooley" <conor@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Daire McNamara" <daire.mcnamara@microchip.com>,
 valentina.fernandezalanis@microchip.com,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>,
 "Claudiu Beznea" <claudiu.beznea@microchip.com>,
 "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Alessandro Zummo" <a.zummo@towertech.it>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Wolfram Sang" <wsa@kernel.org>, "Ben Dooks" <ben.dooks@codethink.co.uk>,
 "Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>
Message-Id: <e40153b0-17ed-4261-9bff-8602902d0c2c@app.fastmail.com>
In-Reply-To: <20260714112047.2304856-1-julianbraha@gmail.com>
References: <20260714112047.2304856-1-julianbraha@gmail.com>
Subject: Re: [PATCH v2] usb: musb: remove dead select of USB_MUSB_DUAL_ROLE
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jul 14, 2026, at 13:20, Julian Braha wrote:
> 'select' does not work on config options in a 'choice', so currently it is
> possible to enable USB_MUSB_POLARFIRE_SOC without USB_MUSB_DUAL_ROLE.
>
> Remove the dead select, as it is unnecessary, from this conversation:
> https://lore.kernel.org/all/20260712-parole-stoning-d7e66a0961a8@spud/
>
> This dead select was found by kconfirm, a static analysis tool for Kconfig.
>
> Suggested-by: Conor Dooley <conor@kernel.org>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---

Acked-by: Arnd Bergmann <arnd@arndb.de>
