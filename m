Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873437;
	b=JolEBKKIOSm2FQyUiSE/3AQESdShzuVpGkKFP0ZrteGLtGskevg4WngVS2jy9x/sfL4e
	 xbFO4WlnSwpOwSNEu+FsodlHkj7qaMO2ujxx2CPvdAWn9KD152JhodwDnxJZO61HUFJAn
	 MBqOhfNofEJlq/OaEoDgi2X+WOfHNBwmJQzi8zO4J8ZijKyOk4leB2IwtM1PuDtsM63Hy
	 ArrgE9KLbhlyJWZucZX9Gk9wDGdCOJOHZ6foOiZfdFyt8vjWIwZGEKTZzfUkh1VfoPZP2
	 59dt1/qjjQ0yfsPW1HvLRqXONnFEGHNcPBHftELSrsuTzV7Xc8IS5/T94+Tmb1bvbXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=u6nBBrzH+5QZg/x9FmxPN7BmlpA5oRt3HSD2i+J03io=;
	b=OJtOdxHV84vsa54jtjcdNiaL2MvNGCIaXh6H2e8MNPYg97CP12zqmmvw9HTT5+sQw+fx
	 dvs6fj9PbmZqguOTEAsyG0qBMpkC4wxl7Ly71dKZJB4xc2YswGI6YhoKmNpYVUiCN8bTD
	 V+qsDvhIlpU0xlkpVlTBedxaHWHbkZzZ/69W2pPgYYyeMCw/jTj/3raxk3fwUgnGNvZ4L
	 qH1VCFnofyMUZGI27KTxOFf/ch+1LwRThP3cB9R2CQgZs4w93kFdaQLwOwFfAERvNH80y
	 TPxtkiJy1Lp2cO6hdSmntCOLY7KcyoQ0r0RrcDdwBICKhr87uVnBup85cyGZfJqV3ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J+3YcT2G;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63298606A31B
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 20:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63298606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J+3YcT2G
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so2381615e9.1
        for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 13:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873436; x=1793478236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u6nBBrzH+5QZg/x9FmxPN7BmlpA5oRt3HSD2i+J03io=;
        b=J+3YcT2G0CMbs2UizMx+Tftg1P/7M0ifAtvD9x77/zjipLjxJiNTRt9dPn1mH9W2rX
         BbAM5jOyP2de8EE4Lc7Y4l2giU8Rk3NG5w7AlY9V7GGmrT3RhP/g/xVRUhNFibxY37fA
         pkmUpKFmrUDpBJAi/9q3G5aeKlrxMY1AZ7+tg4mR9EmF3y46Ihs0nnLpsf2q44C1FrPp
         kZ9zRhD9zl6MnHqDTFW+P+3sHbwqDcSQVc7HUQDkWnVpZT+59Y/nkFVp/7SUREustatY
         ngLlnHetj9LXJrqacKwsgvZXisETavzqVjIBVbKWTLGxtT5rAdqOl0WJJmt4XvrNMVaS
         XvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873436; x=1793478236;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6nBBrzH+5QZg/x9FmxPN7BmlpA5oRt3HSD2i+J03io=;
        b=NP6o1Qz0eJgPeYtndlD0qgUfB08tyqkJf3tFNDDruXM4WByJGJCMVnGjnc5VJuoqm+
         EfgPMH0YdaaiRuJj/mGX4zRlHrtkPdUi19+NFrcRatnbkGHLxeo0/+G4QldGhJt23Sup
         1lNpY3sB43qJSoLEJPDlqiUBC1IDVHI1Do33S5Le6veyrx0lYygWR2WlfCdXH8tPaAnO
         3xqOiEPxblNxVEUj5HeHWrPYVWNedTSQyJ6R1DtGaXVCDp28aoEpfdi5hB4tcXyIQjS+
         4P4j+B/1NU3zfyA6T2H5rqLm31hWSdFBsvwFfZppyI783mNDrPC5w9OUedJNDaPyE6Te
         Pn3w==
X-Forwarded-Encrypted: i=1; AKwUvBzck83K64dfqCLpgBy+858lzdf7bS8ZtEtCE8eRnPznLtGXVcuTwNBMUOOvVPa7SzmVNRR+EN+cVM0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaL+2VIyrfCKVcx/G7G3/03qn9ncWb9Hnv3O4VeHyRA1H6YMh3
	qt2icX1nTNdM75/SG5MF+95/WfAW+kYZtrQmBE8CAQyhQoqkrVAjBstE
X-Gm-Gg: AYBFou3Z4KLQwftD3j0KCfd7vT9hodrW0I4QX2QkmLq2OCLKgddSDVyWf6ljHNGy8Fl
	sEQI/0dWIruPl5bxsv38rnVAU2/M9Y4HJFN8QEXxGO3hEpc2KMj9jWfQ+wgavBfK+pejzRLdz1A
	GDvQxbD/MixG/eLIn9hcfcT4A0B6r7PEBxIjeX+RWRtVv5i8ETwBVuz3rT28Jeaj8jJoegHNLtS
	Z/GWj3tZ82R+5FJJTQm4XNs1/Ne/TpW01VhIZZooQ+I+f8ALH6nnSjRKvMCF9piLJ7a4OTDrBYK
	ahV1pMvH5u0D27+HsjSoXS9gUK6ozVGA0svbanLTn7U2MqeKPnR7Eze65uEzKjh5s+C61MzciAr
	FmF7zR3np1goljGFAQbslOzEdlopnOIP9+niwrJ4ShdtrHWDslpsT9Y4ICdQ8EN+TrK0CO6aY8y
	MpWF+I7NBC5FKXvxYnc+lrqHcqn9egyYhkeZTbAnYWNOSLEyjf+9Xs2hJrhHc08aTtHmEmWZxre
	RaF35hcEVLXZGmdpvhhRdchvIuFSbv/fVfDx8fj6zrOEZNJbx3/Ywr8gjZ+3lI2w/yhcG0jDS58
	KwCGrbsBpA==
X-Received: by 2002:a05:600c:3b96:b0:4a3:5a42:b2a4 with SMTP id 5b1f17b1804b1-4a35ac8dd4fmr54691375e9.12.1792873435759;
        Sat, 24 Oct 2026 13:23:55 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e11bsm93522995e9.1.2026.10.24.13.23.54
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 24 Oct 2026 13:23:55 -0700 (PDT)
Date: Sat, 24 Oct 2026 22:23:51 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Steve Bayless
 <steve_bayless@keysight.com>, Guido Kiener <guido@kiener-muenchen.de>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH 0/4] usb: usbtmc: fix undersized high-speed bulk packets
 on xHCI
Message-ID: <20261024222351.396b0c8c.michal.pecio@gmail.com>
In-Reply-To: <bc5865736052c55683b2d3f2eeca0e01@tipi-net.de>
References: <20261020-fix-usbtmc-short-packets-v1-0-903f4d029193@tipi-net.de>
	<20261020184244.69b78d5e.michal.pecio@gmail.com>
	<a642dbc2e4ba0efc381c69e26821762a@tipi-net.de>
	<20261021005654.23517441.michal.pecio@gmail.com>
	<cae2e837872be0560f7f46e13651059b@tipi-net.de>
	<20261023202645.7bf4827a.michal.pecio@gmail.com>
	<bc5865736052c55683b2d3f2eeca0e01@tipi-net.de>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 24 Oct 2026 13:17:11 +0200, Nicolai Buchwitz wrote:
> On 23.10.2026 20:26, Michal Pecio wrote:
> > I don't have any out of spec device, so I tunned a Cypress FX2 into
> > one - it exactly replays every received packet back to the host. I
> > found that power of two sizes from 1 to 512 work, except on Etron
> > HCs which only take 512. Guess we could have an exception for those.
> > 
> > So this seems very viable. I will turn it into a proper patch and
> > see what the maintainers think. Seems better than patching class
> > drivers.  
> 
> Thanks! If you need something testing with the devices I have at
> hand, please let me know.

Hmm, I blamed existing code and found that it actually solved some
reported compatibility issues. Devices that specify bogus packet size
(that they don't really care about) do exist. Somebody had a problem
similar to what I see with Etron (maybe it was Etron), somebody's AMD
chip didn't like packet size of 4. Using legal sizes helped them.

I think I will restrict this to plausible values and default to 512.

Testing which could help is to check various xHCI controllers if they
support those 64 byte endpoints or not. Just because Microsoft and
Chinese TE vendors do something doesn't necessarily mean it's good ;)

The Etron issue is real and Windows seems to have no solution for it
(instant yellow exclamation mark on connection). Better to avoid such
drama with devices that don't care. Hopefully it's unique to Etron.

Regards,
Michal
