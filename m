Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333142;
	b=TgpsnYTeizMJaYsZydUXt1tgvhvzla1ZuN2ovoWn+s7cBcnmf2jP6TyFm3wUR0tlcw0y
	 EI3DnB+EoRr7rCTETqiA05vlTNA1XMrykkiClp3NArL7CPdCMo+rAUf5p/HuKkU6hNEsl
	 nMFiqdFKKdg0k5IVxqljJWyJsM1TvSo5PTXLazgRyI2lon3OXKPiL4dvGQ2Mqc90X7uqP
	 s6wBFvtwq0HHj1teSVd0fOqqartvpRKfDSLycstbhFM3Z1WrD8kOEa3Ys/IIQExcZ+8x7
	 5T73D1Zzs8RHoV6/Gk+WxFCAsZLZv6Y22ytVnTSmpCv6urdg+Xx1eddHB3BzuuvZGLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333142;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aReP53EBUal8WV9sOYyrgXxClREcMtHpv2c9dy2Igc4=;
	b=Gyw0rVevFW3LgzXc0+zKaUbkxH/gHY65LGX3rPvaIXJprwAy5eFBWKFROiqZiMxnWD38
	 SVuWNx4CmnrowXoUpXjtMB87L2vEBkRoGqfxvDQg0rEWJyIlCoOu645WE1Eg4fxI1aBKF
	 wxhZS731B8qhaiG7XRC8NuHen4EEmuNLxMfu4I0fPJ/b4/fNdKOZ3ChSm+59mNZSV9/oi
	 aJ1hrcuup+8WK1DuVVTBrfOiJSEP1GbFxitM7cu5vv1VYj9QhEEvyx3m0pg6gUmdUIbL8
	 VYKw9aib+AJ0zWaQxsSHIK1c0ZQKzbjokSGmM7X74uK6cpGqqiVHWi0f7+8TeYZCdBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=ADQNUDTd;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=JHRBkRnf;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26FF606A320;
	Sun, 22 Nov 2026 07:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A26FF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=ADQNUDTd;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=JHRBkRnf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1795333133;
	bh=BaHXmPLKnr/q0q0JD2vadlHFH92z5RvlCXaUGhyQsgc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ADQNUDTdn5FzSNNpCFle9JiP/OhzMmeKyOR2caenBlUM82jO1JlJ83VKfnUvddkEf
	 GctU0yHnadtjNEC1U1OzLoEdhq1s5F27BjFmUdD7OFW9r9MOuoVMuVqw9f1OZHCymY
	 uAdqg3K5+l7Bi/261h4y7S2rnohVr80zcOXW5AqOdx/dOqx2r5cmjJJZnP7jqPrp++
	 R08cKC84NR9p1E7y4X1cJ/k8j6IfHxE6HEtXgr2CpU7RLhCL9uNwD06Iy4GeHvKvwj
	 zfmB+SZE+5b3fALqBC3+Yth6bGCcqkVQxi7quRFW0t25P6Nf54+e4en6p9eaMZ/usH
	 OuRZel9jD+qyw==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id D605448E1A; Sun, 22 Nov 2026 07:38:53 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1795333130;
	bh=BaHXmPLKnr/q0q0JD2vadlHFH92z5RvlCXaUGhyQsgc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JHRBkRnfXpOX+mKKiJn1vKfMhJS8T7uo/fW8Gb+4dupyjkwNKjhT1qNM0kpsT+Vhg
	 dJGZ6yaXWR3jt1HaqFosvdc9YKfaI4m6chkK5nsES2aiiyHg7j2Fll1si7bY+VN/te
	 ai9NEllLSh5eszBW5d3VcEOSxrWzFVs7UDrHeD8E1JHvpiW/XEjbkDryE4AUCtteau
	 lE1Lc6JbbRIR5ME3lSliGK4zbTFklR3rBZ20MojdJbh0AsFteUos+ZwxNUghU/VTod
	 kGTxnesrLaFqBqUH1tGs57b39OefrOVGPFW6ccWlYeECvfNuArkY2Pjv04DNetwUvg
	 sTrVM8OTm9JSA==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 15DEB48BB4;
	Sun, 22 Nov 2026 07:38:50 +0000 (UTC)
Message-ID: <407c557f-1d95-4a69-8cf6-4475e769d65f@birger-koblitz.de>
Date: Sun, 22 Nov 2026 08:38:40 +0100
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
Subject: Re: [PATCH net-next] aqc111: Correct endianness handling in
 rx/tx_fixup
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261117-aqc111-v1-1-27a54c4b54ca@birger-koblitz.de>
 <29ba76c6-5feb-4f07-90b6-20468b62d602@lunn.ch>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <29ba76c6-5feb-4f07-90b6-20468b62d602@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

thanks for looking at this!
On 19/11/2026 8:41 pm, Andrew Lunn wrote:
>> -	desc_hdr = le64_to_cpup((u64 *)skb_tail_pointer(skb));
>> +	desc_hdr = get_unaligned_le64((__le64 *)skb_tail_pointer(skb));
> 
> static inline u64 get_unaligned_le64(const void *p)
> {
> 	return le64_to_cpu(__get_unaligned_t(__le64, p));
> }
> 
> You should cast to a void *, not __le64 *. I'm not even sure a cast is
> needed:
> 
> static inline unsigned char *skb_tail_pointer(const struct sk_buff *skb)
> {
> 	return skb->head + skb->tail;
> }
> 
> The compiler should do an implicit cast.
> 
> 	Andrew
Indeed, no cast is needed:
	desc_hdr = get_unaligned_le64(skb_tail_pointer(skb));
compiles and makes sparse happy:
$ make C=1 drivers/net/
   DESCEND objtool
   CC [M]  drivers/net/usb/aqc111.o
   CHECK   drivers/net/usb/aqc111.c

I will re-send, also taking the comments from the LLM into account.

Birger
