Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434070;
	b=iyKvGRe2ke24/pZuvm9XLKSIxeymmYpzKKJ1wF50m0HzPjQoYVzzjz6f0uWm2Li5ABcQ
	 SF0+svgL7GC6TuDb3wFICe73ysZfwgzuFgDup2YR6enpU90KA/demWLQHSquYG2wV6Qna
	 hOTH5cFgcByRDOrHIMFq4CTjn5JDLvyDKu3ePTmVCpNCschTgAYxYmCsBFmwrDIK2exEL
	 0EdfBDvvaDTHtb/1odsxONCgOvXlqwxpek7Lnukc/GX0A7GnhNvRCzEJKu1HaTryXmFHH
	 FnbJ0S+st1SErFSgOJHuPTjm8WTQrO+/2lKkCfc6V1FeUdqa1QlJDylnIc/h0YzJxFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=F8UfxySGOv1BnhxOIHb7TZOrVtDzm4+SYsgNqgsm3UU=;
	b=YThFpL+6NlO/FEbrLXVqRzDNqmkEy0ye3tj5XPLqIjIv1qUQ/L1N+Ljs/8aSho5qQtoX
	 yXM/Kl7QL/B3ylZryQxE9IG9vdPO7TQK0EXIIdFxNH/IvJf/H/4+kRZ+DTmsSO9rj9qyS
	 w6OT3sJoUdIABJvxqQDHzQWTW9qtnhj1eTnglFEjjd27QxDwT+q+shMrYoTgE/UvQzHkt
	 dyEFx0FCBqsVqdhvU5F7Ba5znzPFDATVOCJHIPQyWC59VlxEEIYsH0zI8EWmVcql0zlZ8
	 UVZQx3dopADD+Ckx9Al2jJM7B2sF/oKz0+JZ5E7wY3NwLpmIDuRj9fFIkAb1EXA2xEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=J08bLTro;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E899606A327
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 11:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E899606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=J08bLTro
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so19872445e9.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 03:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795434068; x=1796038868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8UfxySGOv1BnhxOIHb7TZOrVtDzm4+SYsgNqgsm3UU=;
        b=J08bLTrowdgJPgjhkkBH+cXrotJoMXPemIQ4IlNLhjvUsvEXaRek0D+f3nVkoBcNkh
         4tYINQfWwWQYjZJIlLQN7nHRU5q0XXX7krCcQyjlax7TWO7IePBcmfPUf+Mr6jhXfDCk
         H3bhw/sV2MAVi+2jL0qxEeFIoxAWTK29mrR0a67pf0Ds86fuCZPFR+XxshrI8rgaivJB
         x/xrLo5p9ErhpMb6qjIVcyaFLdwNrebz2W33vCrRZSQqllNBEcP7PTqtwNRxdu4XzMWy
         b5ahG1Oh+3zy2Vlxntkrt2K0Xb9n5G26GmZlA7sg3+MVUM6Ss/I7lxY1+LPE8HHVQ6sv
         k6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434068; x=1796038868;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8UfxySGOv1BnhxOIHb7TZOrVtDzm4+SYsgNqgsm3UU=;
        b=BwmezY8V74VHPl36KdfM6ezJF2U5Z7Dbr1Qjj49I62uftPqrgGAFDAOYmkm0EXL7Sc
         tUTyPuYVoWkXFXlOZ6PAxEkAthUpmuWn8kIh44Y2iJrDgJIkGPb1nTMiCWBfWiS0oZ3a
         LE77coTU0ilvl6W6ewh3I8av/JMnxIcrjh0ynD0s6Qe+AvEZ2RI4WdICp2T2QxIX9CUR
         CfTOIN/2p9eUKbwAweulVQiS2QTQ3UPQXDkVP6Enhzp9o6tmcnGxP+JMIgK6E4p1YJ/E
         MYw8c4HpVkiPVyuIK3aTrxnuYl+3WE4EBQIAu67avjTCGzkaKfYARTb8OIy0v48YHQau
         iI+Q==
X-Forwarded-Encrypted: i=1; AL+hErEad7LEfc+B4t+fwhQPjP66LKjP9PSsc0Lm5NJ8ihXLdXWoLg/syPzNis5CCCVIemAoY0LgphQJ8oM=@vger.kernel.org
X-Gm-Message-State: APuU4Z97CiTPdU/3Hj4GabXiBrpyg3qbJlu7qnEHBgj6O/jJQDTk7PFf
	Q4lKZFScF3caAGMraeysimddsG86FFF43znxwqah25hF+io3AyEHgi1m0OLuoa00tPo=
X-Gm-Gg: AZFdTZfRILobZtGZCXKXLEOaolRsSBI54xrDCE+mnaPpuwONRF9sqerearsnjPN9IaK
	0GCm4vtZCmo40fGLqXW0x2z2cg+v+TH1+GMSH+VEdqeNyJlR7o9nP9h7vOFgHt3DtO2kJSxoMFa
	zeRNNhwCBgCOhNsCsrRZHsr4UYLHuPpLuKq5mFuNerF7U4Rsc79azIyRO/M6DdO5SO3dKBtlP2V
	C4LcocmwvL0JuxCOfMYic7tobWBUBPKBas7blqNHb/d9IWEW+bfC5gy3/2J43ftu0pWhC4OHl/4
	998TsYp6Y3vCEtVAMfPDMJg9+65SQzBGCBMIofKQT3IwyzIEz7bJvjbxDHDL1O5+vhuPJDBuWIK
	PwUz9YSxg5j4dZZSL85gbLGx9zALqqCVoTbF7pTRekd8udfRhkqNKVZLJSg6dBtmWMVuQPUpzyb
	M5U4/fYyP4jna0U2LHU6fUdva4vVrEuprZtBcu/vJTdeWgKvqeUCoW9J/oCNw+7Thza7bGJHCUZ
	NKWWsCOEwKghlckahvtAy4MoNQ1QN+1sPmblyuDJbt6mqYf1WgeK3n3RtjgoVGMJjwafqoFslxB
	czFRUXoChJ3J/l7M2YH9sjxGRXmko8clnZYW2roawGyzFNqIvVqJ0c+4Lat0VrTN1DVmgYJKbMO
	jpRQL8R1TAaySEkIE
X-Received: by 2002:a05:600c:3547:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb8880b88fmr223796715e9.10.1795434068387;
        Mon, 23 Nov 2026 03:41:08 -0800 (PST)
Received: from ?IPV6:2001:a61:131e:b901:6da9:459e:7c6c:e85e? ([2001:a61:131e:b901:6da9:459e:7c6c:e85e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm305870855e9.12.2026.11.23.03.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:41:08 -0800 (PST)
Message-ID: <cef781a8-45db-4540-981d-b38667dcfbb7@suse.com>
Date: Mon, 23 Nov 2026 12:41:07 +0100
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
Subject: Re: [PATCH 1/2] usb: uas: expose US_FL_NO_ATA_1X in sysfs as
 ata_passthrough_disabled
To: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
 Oliver Neukum <oneukum@suse.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org
References: <20261121155253.4980-1-mat.jonczyk@o2.pl>
 <68f6376d-a0cf-4f87-9cbb-0afb7b8536d4@suse.com>
 <52a233cb-1671-431c-8c14-7757ca947aa5@o2.pl>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <52a233cb-1671-431c-8c14-7757ca947aa5@o2.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23.11.26 11:48, Mateusz Jończyk wrote:
> W dniu 23.11.2026 o 09:27, Oliver Neukum pisze:

>  > thank you for handling this. One thing though. This requires putting
>  > the emit code into every driver. Can we centralize that somehow?
> 
> Not really, short of moving the handling of the ata_passthrough_disabled
> attribute into the middle SCSI layer (which would also likely involve
> moving the whole of US_FL_NO_ATA_1X logic from uas_queuecommand_lck()
> there). Is this what you mean?

Now that you mention it, shouldn't that be where it ought to be anyway?
Usually the SCSI layer generates or filters commands, while the LLDD
determine what command sets a device will accept and reports that.

	Regards
		Oliver


