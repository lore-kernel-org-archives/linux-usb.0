Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=93.77.172.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942498;
	b=fmxYMXh7TxYFFx7h3ld33NN3PT56lCtvqABICw4/t6uZ6xoRFvoIot0cYI3HRy403PAU
	 L/1yNygs1foPNZ7Dc1+2vtcnj69CDYC7YCl2GJ/2LAtyk5C7Bd3pl16TtCcCmG9wm46gG
	 X8WYh+FXh9jwA2s6X8XqrRXSo1HEjwV1MbTrdnjqTSGevkzN6FgJh55v4mReLP9X3xcY4
	 VGXUZXUUDWZtxUcVXPEBvWcTnyh2IcoAi/CkTQsJZb+sogMmiZaYeZJkq3/Y5dgcghZOg
	 lL+NH8aA/XMAF3cbKvcZR92+spSMgriZVy7/uuaYCrq7h/OyBLe75as+HFvk8kgOQNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942498;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4hGoB4QdsLd1gLfshKsnpyFHgopMFrsn8yq+xHciRqY=;
	b=Wa2712N2KwTZMs9ECLF+yOe4AF+FbOdEv3kyxQu73eksqeCdH9wF7And+QcwZUuNAt50
	 L70fsoP2HpriRBrFHjLHkzyDINPGLODyfwalEcS8KAE2eR4wJbfZ3e6kP2xHSfQsAK6mo
	 kC5njWtlhIp2RSCDHHwiZoQ+MHFZ7KxtAe/0eIXDwUV0QvxJtIT7xqzzZJv1vHYCQcutX
	 w1mP6JO0/ZIsw9OZ1+/7bOQUyhM4c4MagfxZPzj4/MZ2zO26SOzDvLvSKaGHhXa7ZourI
	 bU7oy+q/2zbxRtBPVCpRgTgCAtrT+K57RrTFFx5iiKGFlMcM1aeIAgstxT3m6qyGIGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex.ru;
	spf=pass smtp.mailfrom=yandex.ru;
	dkim=pass header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=hEOqLGHI;
	arc=none smtp.remote-ip=93.77.172.89
Received: from forward504e.mail.yandex.net (forward504e.mail.yandex.net [93.77.172.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33285606A32C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 19:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33285606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=hEOqLGHI
Received: from mail-nwsmtp-smtp-production-main-53 (mail-nwsmtp-smtp-production-main-53.yp-c.yandex.net)
	by forward504e.mail.yandex.net (postfix) with ESMTPS id 64C6BC0189;
	Tue, 17 Nov 2026 22:08:06 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-53 with ESMTPSA id 28f35n1gH0U0-xjQ7iKqn;
	Tue, 17 Nov 2026 22:08:05 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1794942485; bh=4hGoB4QdsLd1gLfshKsnpyFHgopMFrsn8yq+xHciRqY=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=hEOqLGHIBKbSnuGsHld/YRG6mEeq+37j5KekywVCcPKt2RnyQJA7EFnYUZBfqX9J2
	 ShuFsTuM94ktrYcNMHgwgtGwkmnPCoVheVrS2sx7RChCSekzvCuo5p1Dr9TuUdsPN1
	 wPDg5iQdGZZ5BT/Hyi1ZculPfw0nDsYvWDj5VCqo=
Authentication-Results: mail-nwsmtp-smtp-production-main-53; dkim=pass header.i=@yandex.ru
Message-ID: <839e190e-6377-4585-b68a-b672e5b4a13e@yandex.ru>
Date: Tue, 17 Nov 2026 22:08:01 +0300
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
Subject: Re: [PATCH] usb: gadget: avoid redundant strlen() in
 make_name_string()
To: Takashi Iwai <tiwai@suse.de>
Cc: Neill Kapron <nkapron@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <20261117170207.642330-1-dmantipov@yandex.ru>
 <87jymbxs8k.wl-tiwai@suse.de> <87fqwzxra7.wl-tiwai@suse.de>
Content-Language: en-US
From: Dmitry Antipov <dmantipov@yandex.ru>
In-Reply-To: <87fqwzxra7.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 9:10 PM, Takashi Iwai wrote:

>> Hmm, does it really result in the same?  Wouldn't you need to
>> decrement p at first before the loop?
> 
> ... and looking again, I think it's a bug in my original code ;)
> 
>> And I guess this can be better replaced with strim().
> 
> ... which can be fixed by replacing with strim() gracefully.
> 
> Care to resubmit as a fix?

strim() implies strlen() which is not actually needed here :-).
So (assuming I've hit an original intention) I'm voting for:

void make_name_string(char *s)
{
	char *p;

	p = strchrnul(s, '\n');
	if (*p)
		*p = 0;

	while (--p > s && isspace(*p))
		*p = 0;
}

Note this trims " \n" to " " (string of the only space character).
If this is not what we want here,

while (--p >= s && isspace(*p))

converts " \n" to an empty string.

Dmitry

