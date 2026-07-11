Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2E42BE05F;
	Sat, 11 Jul 2026 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783780770; cv=none; b=aYY1z//0ABL1x4ELnp6+Rh0WD8+BCbYwQlsPD8hAabMaBHoF3s73uwNRW2tRXjYV58KVTGvDqGsAlskbZLtro9dwnxaBFAUBabzo7eOHD1T4sD/DDwMPuI9ChwhvgfcBOjsczhrF0f0ujiZwi7bsisE1mJ4B5P30s8STgbuG/as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783780770; c=relaxed/simple;
	bh=ilPmCKDTUcZxbogoVV2UU/6asgN4r7GOD14bfOZLv88=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Ro/csX/C+NT4vUrN8YVmfrq5VA9SPvwKSSvvjgOSPggp35zuwXjDFlCC80JOHX3l/ka4nyzMMWf7EA751J6r4YDUT0mh6Upw9YerQHjfYgbWewsHST8gJRG5pYixAeYMxLKOkuaqUSkbkBqzys+YTIlLG68M78TbbNq41YKon9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=vgWITvVh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IUXewhj0; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="vgWITvVh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IUXewhj0"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C033C1400030;
	Sat, 11 Jul 2026 10:39:26 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Sat, 11 Jul 2026 10:39:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783780766;
	 x=1783867166; bh=ky8qW+hLoeZ9cI8DeJN3EDp8eqxkzhlbtFcvP/2ZPF8=; b=
	vgWITvVhFc1X9J1X78+xA8Byyo8x15sPT4wKktAErFMxLhdOeQmRxRAviaMWvGBi
	p2ShZHNwQNVCMb7PiPywYnVFhc2+Kie8ge55if/dm/vU70XvQWuUS+gaLV2JU7tX
	5e0LabejM7Q3OCSzG8ABQaeotPzs/oy+LO++gMDZJS3vwbJ3DzkhOH28ASzUR3Pk
	wGkKu4W7dbasB3DEWrBkqKwtXPzCCIkQlXgzryvz9/LDdmQkXs6cr/IGvaidS+RJ
	ppZCJ43GUQTnA8y+B/uVVIzZV2gD8ero94bSBqvSJ1pzGaQ2VbpANIND9xtZ0p5K
	u8Wma2BrddR8jmzX0778Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783780766; x=
	1783867166; bh=ky8qW+hLoeZ9cI8DeJN3EDp8eqxkzhlbtFcvP/2ZPF8=; b=I
	UXewhj0csBZp9uXn3pD7hso9smBKvsXzHWUDP+S7ryLGWah6DNQtRNHldrY+lkE9
	czEHD5J0sihmt62CM9La3PokMlEo9tbg1G6bBfG7kM/3szCJmjaQZYK7MdJf6HLQ
	ZXDyc1fudDbK+WmwtFKUifutexouiVBhBY7ZAY1YoTg0XFFmElsYLmm9dSdG3w7R
	sIct9As8Agnqf8ZD5JlwtFaT3vVNkSS5wMBU9Dbo2a6MyZWhWCG/n430LHHsBSWF
	gH4XjLXUIJzWmJuaqxS1VgdU+fwFeK9dRaif7tMD2KUfXib1Vp4R+Or/M1XDfomi
	Zxnf00jbBB1YiekU8+ZLw==
X-ME-Sender: <xms:nlVSah5mCSbVfdwjmGmcjeyPOaVb8ZLHY9RelTuQA578zZv1rb02Iw>
    <xme:nlVSaptC9qZzaZJYXOIR3POzkVGIFJ6C1XMQHozZp7x928bkOGMSDmfHFSXkvFOoQ
    opBLnqcNrmWjX6ZJJ1PraMHQ4SSe32CRzNmMjY_pB_KTSufOfpy4Tvs>
X-ME-Proxy-Cause: dmFkZTESKCmw373Ae9w1+rJxOZLVun0ym3HHpsVI2zWOZe9tELpunBcjBFlbwX0YkFCK+w
    lNNlu43SGTVhc09GiWE3BJLbfYVYAmZUQC2ak0ZtpCaoiXAo0if4AyRDb3larBf+PfMT5w
    X7VoShf5jSqMqvteKwYlTTm/QQjvYqhGkXCM0yAK42mOFkRdmkP4ECPCeM7WUkvs5dGJUA
    WEdAwa8I5To+MsoOJVg3VcWryvZ7MkmHwA5RDc5fckacZe/Rjo6g21mH0IJOmFG8cVEj/B
    48hzk0LrliwzvtUnbrg4p9+Eawgv3JmxBpMOeb2aLR7aRwos1GeDKl3FgbRlyimvnHmWfH
    b8ihh0oDmtt1YF2O9E7GitpefVH9rgHp5LO3RicRfwiT4BR1DyBCylDaHlCJFPfxfg8U8A
    ikNfPxsioGvSxxL9rgQGTECa65hYvimnsZ9NG/vWwwhBtYhiT/jG94D8vCmR7tbgSbChoV
    zYBOpF5Rj/YUqLV9bOHY9Mnif5L3xPbBdkcAlkGr7L3qKxHSKroOYKHETruwkhApJB7/cw
    aAeY7XmCnH5r1komkXWL79ifR8iUx8ZbbZ7KWW1kmDJJhk879dkqJOqDKh8HtMPqGDcuPi
    AseTcCDinOBmsICu5So27C3o1kS+o9lrVsaoJ1ThmVTcSMQxgx6YIf4aaqnA
X-ME-Proxy: <xmx:nlVSanEiCJ4Kmi7K-k_ykGripOnd5_3eVfqljcm75YUrT46NEKrwMg>
    <xmx:nlVSatSJkFpvvfsU9VnAkphllnX-YtRKiLAHjXC0J9t-hwAIGLAeoQ>
    <xmx:nlVSaktvCKn-7FM95d9ACfZVIk6MFdughkEFqDiJcuCVlQdtguREYw>
    <xmx:nlVSalIGKid_jgkdU7uAEdKWSTidcyTTSGUvgvpLucmSiPWXeQARHg>
    <xmx:nlVSalQ59AxyivyYfy2oZ6HzVVCJ57gnZSg0-TbYGc0wdh8DOBwwqoez>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5D6B01820082; Sat, 11 Jul 2026 10:39:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AwADi15u6ulk
Date: Sat, 11 Jul 2026 16:39:06 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Braha" <julianbraha@gmail.com>, "Bin Liu" <b-liu@ti.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <f4ef4d30-51de-4b58-807a-0fed243b2fe4@app.fastmail.com>
In-Reply-To: <20260711130349.592545-1-julianbraha@gmail.com>
References: <20260711130349.592545-1-julianbraha@gmail.com>
Subject: Re: [PATCH] usb: musb: fix dead select of USB_MUSB_DUAL_ROLE
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Jul 11, 2026, at 15:03, Julian Braha wrote:
> 'select' does not work on config options in a 'choice', so currently it is
> possible to enable USB_MUSB_POLARFIRE_SOC without USB_MUSB_DUAL_ROLE.
>
> Replace 'select' with 'depends on'.
>
> This dead select was found by kconfirm, a static analysis tool for Kconfig.
>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>


Good catch, but I wonder if this is actually a real dependency
at all. What would happen if you just remove the 'select' line
here and build a polarfire kernel that only supports
host or gadget mode but not dual-role?

       Arnd
