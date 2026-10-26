Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.61.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008222;
	b=4x1DJe4fnc6HwctF0DCRV7b7D0UmDSDy5RkCsBubRFfhHiqiszNErIvkQecc+IgNsnFm
	 ytdlCsXxK1dbsQwdKnpiNmNZfSoDu6W4T+wej8hLDWU1d49aEtSkzs90UCvV4LBtOEO55
	 3MN580pSzOAJN3Rstf+BExId5e4ht+kOJfglV2AEgKGe0GLBkOOx5asYCcPDa2T2C7PRQ
	 b2FR0j0opg/Hu+1ZP8BusFdSa5pbOnid87JtdxKCvAS+3PlYUI1icWPkkCUJ0Kx3IqjJ/
	 tZxTZiPAAUXxSt6nU8Lv3gLpPH4Bji630g+L+z6+mUhHqDMo7bGjY4QGqTwcbw+59Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=5HYhVdbJBMn5WQI7uz8IJgghfczctRWryrCIPZAr+hg=;
	b=G7NMFtiaqpIQJII+xMb6f16becN9pishN3auOJuDQQmRwrRbWMhthfEG38kE5RwnZ0o3
	 DJQm6kO42Yjqxo4Q+0eT3JHfG4jIDGMZAT7CN8Q0lbWww8c8iD5aXJWGw0IwKZ8Ww7Bjo
	 SyotzVrBqURxLWonnpgJNi3iHgTBX+mxYL8jRTguvPGNdjjHbZa5NaKhRm68522E1CW1x
	 UnOErJBos00Ox0bTkU3kN2RpYbOOwvQfI3SquKuqKXft/PaFeNxAb/1LKM/oxNDQNWY5a
	 wCAK5+ig1o5jW8lUVFFha7aclvm/Br9rSuFiKUTtLAAdzS3CrKSeCol/1w9DYBcVsww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=Du9HB+3i;
	arc=none smtp.remote-ip=188.68.61.103
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC0C606A31B
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 09:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FC0C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=Du9HB+3i
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4jCpks3r7Tz89jb;
	Mon, 26 Oct 2026 10:49:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793008197;
	bh=lAUovamFEdKb/bmi0FF05sTH0plr1LxfaJuSpYrqSU8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Du9HB+3iIgepi1caasKLanIM17O3MLzw0Io0xjWZNXY8E9Q9eCx8QNu35cgLHDp4n
	 BaFsibVeYyTuLjxRcf0kk1eIjGkQ17MJ8jLsN+7Sn89NjhLNyoKltIxpM6YdWGbgF6
	 d01RkxLi1bBDucm8JEets4S7RHob5aIwujNHOS38BOMwCQWpQj2u9srC5Q7ENSBMN7
	 VYi88LiXVvbcQ2wSrdHeBrfQljeKRJj6A/x0bQXPQ6nCs1QMbC24+NnR7ZiNAmbnix
	 luA3OKyesoIb2ogkGPbAxV7hl69Nh4C70kQ5ZhqwUGkKSTf67QQbO+P5OzwaLeWt5t
	 Ws0pccJjXhhng==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4jCpks35zBz83JW;
	Mon, 26 Oct 2026 10:49:57 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jCpkq5lYlz8svJ;
	Mon, 26 Oct 2026 10:49:55 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id A28205FA2C;
	Mon, 26 Oct 2026 10:49:50 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <b090ac43-ff7f-481d-b0fc-8739ca1e288b@leemhuis.info>
Date: Mon, 26 Oct 2026 10:49:49 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron M5
 (3434:d068) at boot since v7.3
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
 Dennis Wissel <dennis@dsine.de>, Yiyu Zhou <yiyu@yiyuzhou.io>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 Greg KH <gregkh@linuxfoundation.org>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
 <20261024203558.3181711-1-yiyu@yiyuzhou.io> <SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
 <c8a3ffeb-8737-46d2-b01b-5ed9bc96012f@leemhuis.info>
 <a174538e-7c7f-4905-8aa5-f906e6664f4a@linux.intel.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <a174538e-7c7f-4905-8aa5-f906e6664f4a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <179300819102.1228414.5112879340971481519@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: A28205FA2C
X-NC-CID: Nr72EGjYBT7re2f5pmYTlhxGTuDWsV3N8S+eTOTYW6Po5cue+YQ=

On 10/26/26 10:28, Mathias Nyman wrote:
> On 10/25/26 10:59, Thorsten Leemhuis wrote:
>> On 10/25/26 01:10, Dennis Wissel wrote:
>>> On Sat, 24 Oct 2026 13:34:07 -0700, Yiyu Zhou wrote:
>>>> The fix is queued in Mathias's for-usb-linus branch as 1f36cc9fa949
>>>> ("xhci: give back all TDs when skipping endpoint reset after
>>>> disconnect") and applies cleanly to v7.3:
>>> [...]
>>>> Could you test it?  If it fixes your case, please reply here so that
>>>> Mathias can add your Tested-by.  If it does not, reverting 042aad8d0db6
>>>> and 7e0ef4332ed9 on v7.3 would show whether these commits are involved.
>>>
>>> Thanks, I tested both on top of 7.3.0-4-cachyos, booting with the mouse
>>> plugged in each time.
>>>
>>> 1) With 1f36cc9fa949: much better, but not completely fixed.
>>
>> This btw is the third report about problems that that "xhci: give back
>> all TDs when skipping endpoint reset after disconnect" fixes; the first
>> was what lead to the fix, the second was:
>> https://lore.kernel.org/linux-usb/20261023190104.113331-1-
>> diogochaves@me.com/
>>
>> So it sounds like this is something we should mainline rather sooner
>> than later (ideally with a stable tag to ensure it's backported).
>> Mathias could you make that happen? If you are busy and need help, just
>> say so.
> 
> That fix isn't enough, we need to fix it properly.

Yeah, if there really is a remaining problem usually is the best. But
that proper fix can be "revert and rethink" (see below) -- is that an
option here to resolve the problem quickly?
> 7.3 where the issue exists is already out, so that is too late.
> 
> What is the policy here?
> Should we try to shoehorn regression fixes into rc1 during merge window,
> or wait until rc1 is out?
To quote Linus from Documentation/process/handling-regressions.rst /
https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed

""But a user complaining should basically result in an immediate fix -
possibly a "revert and rethink". [...]""

and

""It's also worth noting that "immediate" obviously doesn't mean "right
this *second* when the problem has been reported".

But if it's a regression with a known commit that caused it, I think
the rule of thumb should generally be "within a week", preferably
before the next rc.""

You'd have to ask Linus to be sure, but I doubt that an ongoing merge
window make a difference from his POV; but at the same time I suspect
some subsystem maintainers will disagree.

Ciao, Thorsten
