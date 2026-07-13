Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB245383304;
	Mon, 13 Jul 2026 06:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924030; cv=none; b=DUjc8jClOAqSsv+M2OwTM8/BCDp4RKCveGVM9//+T5xzPB1I+3nGHJ0d5RJ6cC1zVBw5s38bCOUJQuNTnWN7sMcEDkQP33ZcMn0docOJxsLsecBE1lPIBuzYDxLImXxrz7w4ri3CbdIQkWOEyew3jmbHoofBqHsrzd4TNGKaL0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924030; c=relaxed/simple;
	bh=+RQGLV4zhDuG51vcmZx0FaoywI8PQdG317MUi7dmbRc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=MzQU//ot4kJlXHTilmW4L6acSbFzlyRS1MXLF/f09fn0alBSM2c7dXpQKEV8R+P8KoB0bdD3TPgm/FL9vDKOJXOy9oDs21QcQbc6xD38KKZ7S/kGMhtOmCgzNP919uXWPasc/+jfy34S4C2f0PvXg1LVvukOhwUu8ThNC5s16TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=KWjWy8Va; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TROl/648; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="KWjWy8Va";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TROl/648"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id E179AEC016E;
	Mon, 13 Jul 2026 02:27:07 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 13 Jul 2026 02:27:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783924027;
	 x=1784010427; bh=I6YCZ6vuksZR3ELl0DY6RqLSRhwM4Nalt4vVw4MrW0w=; b=
	KWjWy8Va63NU+mfj4WEy12H5swnMhZ5G0pfOZzk3LlnvegqgGaV+6Vak5LKmLBv6
	D/zVbo145q+DFE6IKQUoIX4R0cs5ITOgfgQuuC4esOeroxKD6mFqiXsq45gYdLwo
	GUuvUnGHvdDMDxNgt0hUyo0gzEDJHP/jQOK8hfmW/L4Fik7sJrO243qA67hZjufL
	ZrmbVBSAjH/JboQfIurK2xOjqzf3hti3CsbBX7RBH1TJ0jROKmaiDlo5kMebeb1+
	eTeym4HuzTivch9PmOMW7zfT/ZLV8nh5nJqavdFkwGco+pm9MA5SgoZBV5oTE3F7
	Zlr8bO4Sf0Uc00I0JH1Quw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783924027; x=
	1784010427; bh=I6YCZ6vuksZR3ELl0DY6RqLSRhwM4Nalt4vVw4MrW0w=; b=T
	ROl/648AUENEBwAU54BIHJlElJYt0kcRRVre1vvXSM3w/24pEPJ4rA+XXOIiCA3o
	JDLghkgEh3bIIotAfY0ScaOc6Y95LnQ9qfhnqqueTSc5QyUWtAGB/qEfJJft8r9q
	aloRKq1eCyAb61GIoi5Uqf6VFJj9AEu/S0OAKZgIoimRN2U3TpP+vvcdIYUovtSv
	txPEACJy6rzjcK8sz07GuwW+kT5GLMQ6ZXEVf7fr1s1HwSgeAMbKH01us4k1js7G
	Kn6P6fB488qKSsCs3a1AYY1xifHjAC89xecx/yV/U5aAtZe7NAHhQFaGEE3D0JHk
	RRNWHlwNGLe363v9YquOQ==
X-ME-Sender: <xms:OoVUaj-vAj-LZB_k7leutDqw70bECF6jBzAhWloupBLuaVdWJIlFjg>
    <xme:OoVUaqgLOkmtCrD2AdESqBUehtD25GxB-nxNICIfCCq5NY-IB1InR9CtJDx7B_cdY
    v0-8Sq3D3kwNwwRLpYMUadT6FLNqUkQHBqVq-ZEdLGXETuCloNcfJA>
X-ME-Proxy-Cause: dmFkZTGEorj3kLX+ESWdgTZ+4cvZ8dknoR5VnTO3QmaIDjJU4OiuUNm+ZEn5mflW8AzpyM
    eREjlj19XdPcBsirJxBoL13Wx3QiAWftesRUpm//vBoN68+rxop4Xsq3z3u7Bx/NqKToFj
    2pwAgEtvbcoXSGHdI1Btrk+yA4rUCLOmqJW46GO9uMp+ppTTJcQcGh6Frr8u/mEc/x9ncN
    BaZzghQi7MY0gTzvbT1CcZ9GQtnCwUkSL9j5qA2tvySuUR+Nfj8QRIkXRU4gNnMZ7e6CyK
    fHLJH8ixVQX/2SVRPH9mKuA/SNDKKyIz9+Q+5fwKWhf70h2pGqXhqxFaoiwrTVb833OJjz
    jsk97cZQvQczJVkfCVOSaflPMlZ58eaS27uNp0NMfj8OfYFYvXhEUIrW+1qaqRVuvlXJCi
    oY/hDRKcziWqAr6Jq2xLwnpShgKFkMHqBv3DKR4aykMPKlbRxYrypR+6q4f6z0yH9Oy2kr
    qypnlXBueKh6oGN4HfOOyThBmxHWYxQ8fNfjm9XsDJyscFToopx/rE3Ku6NRg9+qoriRMf
    vPdYoi2V6hO4Wh2UYs1DVQG9bSNUGNRWl1RIXV1ylFeDSBznmjb1H734a5VimKFZwYN7ZX
    3oefPM4IdHPmJRf4avoLbuGiYkKCg1TC4fJsuIA1Jd9d2VEJUqd3McT4tBVQ
X-ME-Proxy: <xmx:OoVUahhpaS6gom3m--_RetmOd_Ng8aNqSFSTY-zyiECp8LbvtrRVTg>
    <xmx:OoVUauzqlcYNNCymnBlsHKCoQ4DhMkrvUplVMkuJfikV2z7SgFPNvw>
    <xmx:OoVUavwtFMO_46NWD0kYTiOTj-rldHmwBKLVjoc3iYJ1jqW-YzVE3w>
    <xmx:OoVUaoqTUn-Um1-sMEJSEH28oF25muMEwrDhaElRluQTsFIMyE2v4Q>
    <xmx:O4VUauBvCuBpV-voH_xYTksPueHGTmV_YLMfWyxlibb9Tt_y9rQjUWOH>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 90EF31820082; Mon, 13 Jul 2026 02:27:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AwADi15u6ulk
Date: Mon, 13 Jul 2026 08:26:46 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor Dooley" <conor@kernel.org>, "Julian Braha" <julianbraha@gmail.com>
Cc: "Bin Liu" <b-liu@ti.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Conor.Dooley" <conor.dooley@microchip.com>,
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
Message-Id: <e771f4d0-a442-4a02-9ea8-4d6078d74bd8@app.fastmail.com>
In-Reply-To: <20260712-parole-stoning-d7e66a0961a8@spud>
References: <20260711130349.592545-1-julianbraha@gmail.com>
 <f4ef4d30-51de-4b58-807a-0fed243b2fe4@app.fastmail.com>
 <1705e4f2-a0a3-4be0-a033-eacc1d54fcc7@gmail.com>
 <20260712-parole-stoning-d7e66a0961a8@spud>
Subject: Re: [PATCH] usb: musb: fix dead select of USB_MUSB_DUAL_ROLE
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Jul 12, 2026, at 23:56, Conor Dooley wrote:
> On Sat, Jul 11, 2026 at 04:09:58PM +0100, Julian Braha wrote:
>> On 7/11/26 15:39, Arnd Bergmann wrote:
>> > Good catch, but I wonder if this is actually a real dependency
>> > at all. What would happen if you just remove the 'select' line
>> > here and build a polarfire kernel that only supports
>> > host or gadget mode but not dual-role?
>> 
>> The kernel builds just fine for me with USB_MUSB_POLARFIRE_SOC=y and
>> USB_MUSB_DUAL_ROLE=n
>> 
> This is the setup I've been using in my development environment for
> (probably) years.
>
> Probably the select should just be deleted.

Ok, so it was probably just a misguided attempt to pick the most
useful configuration by default.

Julian, can you send a new patch to just drop the line?

        Arnd
