Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E9C3DFC6D;
	Thu,  2 Apr 2026 15:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775143340; cv=none; b=TFsC/2d9idCVK9VBvCdlmBPM3/yb8/FrU6gkpM4IYoZgivYurUPQiPABMgLgac4CpyUQu2pDnPneSX7hmwnKdAa02SEmSXQR2dX21sBVoaM5/6AN1A4gOkXNlDf10FioIWb2bpW9i/e645SZ/nunWmcFG6Uz8lO6z5Lk9psLCPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775143340; c=relaxed/simple;
	bh=vViaRwMIy+zQ38DQvrNANrTGu4nkWjiU06UEQCeC2+g=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=g+bX8AUeBuCN+HYupX4UmeCkURJ8l2ilKLtbVREVx6rpxQAKp66vcpIhhLKlguznYmbAU7+Ms4mO+sDSmWCU6wreHUQt6bv1Ea8UGz0vC9IcdRSmarRmwG1Nqy6j3Zqt2C047U1AHwvc4ygTojzmvIhOYyOIFzW7HHgBj/lj31E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=HlhMtc/A; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RWxhmtCC; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="HlhMtc/A";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RWxhmtCC"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D20657A00E6;
	Thu,  2 Apr 2026 11:22:17 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 02 Apr 2026 11:22:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775143337;
	 x=1775229737; bh=62I21+lfKD/IPS7+DTNXmDafPJJisJ7slIGurDIGSEA=; b=
	HlhMtc/A4W5iZYQh6R16gpsb7ceP7Or0+prvY29/5Vd0t9CQP6IqW8F9eBds+3Ax
	ZfwRk3JrFYlMjOytbEd+iiSqz1XY3rCQu36iTMRvGhIl/3yxEPgpJISiGdd5Y38O
	cMXX/XR8rdJVFeRf1QFy7PRGGrPx4SojwkOew8FqkxZ/CegSu6AqQ3ojFWHuQEpd
	46pt05sOyTwBR2OZChLKjhFcql+SVTJ3taYMRjSsvh0LC9huzRZSBLkgme3ndS2Z
	zJDB9A9neu9Zo5Xycs0QJcLdXrTdXNH2RpMAhLYrpF0lbFJ/wEZ1WrbduU5LF0WI
	Jdwy9RDjG0MhuO7SK3f0Eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775143337; x=
	1775229737; bh=62I21+lfKD/IPS7+DTNXmDafPJJisJ7slIGurDIGSEA=; b=R
	WxhmtCC/96QurjvkiTfU2/jeq7OUMeNH6wJ/PYKFP0YAhKmPtJpkTHYa2yJJ+1EM
	OnEzyir/D9pW8/TcydaZNXkBNuEwY4VNFGQSBgqofS+CU5ctS2IMPEclmKZ7p5dT
	KX+8qXL8C1aDijy9dJ+DPQYWzZosqCmtfQY/3y9dtnYZ3kLoNPyY3wJisZKrK5fU
	//2C2r5BEIYWtpV8p50Tbk1SzDRbNva2mhWTK2pq6qd87gDCA2olGh9UulDwbdOE
	r4iohnpATnI8P6g8zMpXILUrBs3dS7xxSS9EE3H8C4MEQaLNiSbIjAAaV68fnK9U
	2xW3AmCvkCVPC/VnEId/g==
X-ME-Sender: <xms:qYnOaVnBK6jeiPJ5V4tUTi5PiRv5ppm6BfLUldi_YGoPM0XiOg2PVQ>
    <xme:qYnOaboc8jEAudNvs2n_V9DPGeBlQD-mcp4BpaQfD6IYRh8Qr0YBqHpShPXTJZS6u
    VbDIgPmlh3VHrAFG6oPYP0E0qTLQlL70FF7jt9umZHxb46ezvqLMWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeifeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    ephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepphgrfigvlhhlsegtrgguvghntggvrdgtohhmpdhrtghpthhtoheprghrnh
    gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtvghrrdgthhgvnheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:qYnOaXNMQIIencc9pJQb3urvMV8nqVkOyfB6uELjcBuDocwJ58jVxA>
    <xmx:qYnOacA-YcBs_ypWoGsbyEyjK65vt22cOLtxBnmVwhLvDnGXFQGQpw>
    <xmx:qYnOaWKTohScRTB9DrCig9P5I96A6fOi6XoXuXAnEZhdO8pk34u5kw>
    <xmx:qYnOadPHY0Kijd0Hon2G3r7Vpnexapp97QkVTg_f20_igre5k7Di1w>
    <xmx:qYnOaaEC__NUorAOo7t2TK7x5vdGMvvIru4K7D7j0PZ1kw_fZVJSw6xH>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5ACD4700065; Thu,  2 Apr 2026 11:22:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AlVvYKQckCPF
Date: Thu, 02 Apr 2026 17:21:56 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Arnd Bergmann" <arnd@kernel.org>, "Peter Chen" <peter.chen@kernel.org>,
 "Pawel Laszczak" <pawell@cadence.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Roger Quadros" <rogerq@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <6befd046-271e-49b4-b49c-9cc13237c5b1@app.fastmail.com>
In-Reply-To: <20260402141008.2691819-1-arnd@kernel.org>
References: <20260402141008.2691819-1-arnd@kernel.org>
Subject: Re: [PATCH] usb: cdns3: attempt to fix Kconfig dependencies
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Apr 2, 2026, at 16:09, Arnd Bergmann wrote:
>
> My patch has seen some fairly light build testing at this point and
> is clearly an improvement over what is in linux-next, but there is
> still a risk that I missed some other corner cases.

This is one change I missed:

diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
index 07ed694e10b8..ea87ac22f7cf 100644
--- a/drivers/usb/cdns3/Kconfig
+++ b/drivers/usb/cdns3/Kconfig
@@ -118,7 +118,7 @@ config USB_CDNSP
 if USB_CDNSP
 
 config USB_CDNSP_GADGET
-       bool "Cadence USBSSP device controller"
+       tristate "Cadence USBSSP device controller"
        depends on USB_GADGET=y || USB_GADGET=USB_CDNSP
        help
          Say Y here to enable device controller functionality of the

I'll wait for other comments or build failures before resending
the updated patch.

     Arnd
