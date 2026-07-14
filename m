Received: from smtp2.iinet.com (smtp2.iinet.com [52.129.46.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B742E3ED5DC
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 20:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.129.46.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784061015; cv=none; b=fJ7Etx8s+vwhqUbww8t1fJ/PUR60Bmgb87ngtJgBWLaVu2IUhkSiqpWO2sUSCFqphb1YAUF4I0lKlBedG/Eabu4JipDlCpsmUxGysLu2l2mnrP/f68wSeYm9+ecsogCti3fEQWNfAYselERuQH/aBO1Z9+LZoBlFI6mxGan0AKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784061015; c=relaxed/simple;
	bh=SeIKLhrCH4OS2uDNBtbPSp+8XnZiuY8vKRFfxi5b+nM=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type; b=i2SeIKLYSJw2wKUjjz6ONG0nX7w6gckrYLsAgxjaZdA6FSGf+R8nnh9PIfVpDj0mR404VXq0/Hz3qHeFAdCtal+TP+WWOdDIIM5dMKaBn4Q+zdc3ejzBIP0mRKDzoApF1aPVBo430IWrtBfdkrmz8spXOV+rWuQWRQGbf48avvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com; spf=pass smtp.mailfrom=nwlink.com; dkim=pass (2048-bit key) header.d=nwlink.com header.i=@nwlink.com header.b=pxF0A/U4; arc=none smtp.client-ip=52.129.46.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nwlink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nwlink.com header.i=@nwlink.com header.b="pxF0A/U4"
Received: from webmail.iinet.com (web1.iinet.com [52.129.46.51])
	(Authenticated sender: kaf@nwlink.com)
	by smtp2.iinet.com (Postfix) with ESMTPA id EFDB3B41981;
	Tue, 14 Jul 2026 13:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nwlink.com; s=mail;
	t=1784059479; bh=qk97xfp+3B0enD/79s6r+wJ9rQtojzSustAQG9CPwwo=;
	h=Date:From:To:Cc:Subject:From;
	b=pxF0A/U4cKYO2QUKlBkEbfg8OaakO6aIVxGxAEUNvGetzguBYxIIAwCuDgVJWr1ce
	 fMhrfONro+vITCVpfp24CTSUyKz7IGXwVu7vLCRJ6xWT1Bh7eK98OGVNoCv2dNrT3N
	 0SM8yGotojMZcIhZBskxVJh36RhaYbIcNyyI3j3kXpc0xxfPrWzwZh93avdACN7CAE
	 cRYcHDm/wEHS0JCS3vOPBs8csE81+leh/W67J2xtqzlckP6kNqjYDilcMOX1jrL8fi
	 2mQXnlVYell2JBTqc6X83z1VeE2/OnrI0eNnHzeT+xgHonV4GxWFfvqpAihs5AzGkJ
	 xPQsTNRcFZ6Xw==
Received: from c-98-203-133-45.hsd1.wa.comcast.net ([98.203.133.45])
 by webmail.iinet.com
 with HTTP (HTTP/1.1 POST); Tue, 14 Jul 2026 13:04:36 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 14 Jul 2026 13:04:36 -0700
From: kaf@nwlink.com
To: linux-usb@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com
Subject: [GADGET] f_uac2: decoupling bNrChannels from bmChannelConfig?
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <02061d9d4262f4466f2e69a1c5d657da@nwlink.com>
X-Sender: kaf@nwlink.com
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

I've been looking at how f_uac2 determines bNrChannels. The current 
implementation derives the channel count from the population count of 
bmChannelConfig. Since the UAC2 channel location bitmap has only 27 
assignable speaker-position bits (bits 27–30 are reserved, and bit 31 
indicates raw data), this limits the advertised channel count to 27.

While investigating this, I noticed that commercial UAC2 devices (for 
example, the Allen & Heath Qu-5 mixer) advertise bNrChannels=32 while 
leaving bmChannelConfig=0. Linux enumerates that device as a 32-channel 
UAC2 interface.  This also appears to be consistent with the UAC2 
specification.  My use case is generic multichannel data transport 
rather than spatial audio, so a zero bmChannelConfig appears 
semantically appropriate.

To test this approach, I modified f_uac2 to advertise an explicit 
bNrChannels independent of bmChannelConfig, with bmChannelConfig=0. I 
also updated the gadget-side ALSA runtime accordingly.  Linux and macOS 
both enumerated the modified gadget correctly, and end-to-end streaming 
worked successfully via alsaloop.  I repeated the experiment with up to 
96 channels, and both hosts continued to enumerate and stream correctly.

Before investing additional effort, I'd like to understand whether this 
direction is consistent with the intent of the UAC2 gadget 
implementation.  Is the coupling from bmChannelConfig to bNrChannels an 
intentional design decision, or simply a convenient implementation given 
the existing ConfigFS interface?  Are there compatibility concerns that 
motivated coupling bNrChannels to the channel bitmap?

Thanks,
Kyle
