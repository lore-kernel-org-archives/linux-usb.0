Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795545765;
	b=GAtohZVGkB+0lu5GCTv9ZPrYAXGoxLqVmkMsxOiSzadaEFEU1QpvsRMv4ec0pYIVO/Gw
	 nRZfNBku+ZceI5mPk7f2WBoNe0Hs00pt6twYM0/8AJOyOUW5qv1GKHoZzQARd2xTZfoCx
	 XB297tLiADedt1uVU5aubq7iLlmVUT9ThXTfiCIdMcpwx6MWGUSyx5VKKq6gn1/2ZzUm0
	 d+MoNPg5WD3QUFpIFBgILo7uoniOHg+lpk28BzcWZ620oCgcJzm8ei6WCoYL08CI/r8Ql
	 VSGRIgT9obRd0mkJvBXY6qfO5WCqi6dbLXwtfbl9CwkkgjIwboEvar8sz4BW4VpRzPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:In-Reply-To:References:Reply-To:
	 User-Agent:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wcdBoCxwIu2pbM5ZNkd9oLklfMFSSp7JBfVhltAPzPA=;
	b=zHP60W5uvd3ZTXLaVa/PPTpl7Y1tprKYdTug52CeAu1GwjQPxDWIWOCe8Q6A52JDow2w
	 dZu5ZiC6ixXeAsA3tQpWgNVlRPvXD2Akpmnl9ZHD311VSW9IWlyiooOFqTGuyK98qJLuv
	 bVWVRnJrN9/dxY320ojQutbCV27by33UBTloNeO3q43JU+OWTULDWyd8tBezAZEUW2ygb
	 q+mKQPF6+Gjdkp7LVsFhcRJ/9S1rG1Bg6Eq3DZPaNg6Rpsli/y9czEWKiUAO5m3RvFHf9
	 iX/TJT7BXk0H93HDAaj2owlguX7f6KCx3Ay58uDeGJ6OfQvO/TlyqjmdOd7NipOepEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BK2G0s5B;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51556606A323
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 18:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51556606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BK2G0s5B
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so43650105e9.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 10:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795545764; x=1796150564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :reply-to:references:in-reply-to:message-id:date:subject:to:from
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wcdBoCxwIu2pbM5ZNkd9oLklfMFSSp7JBfVhltAPzPA=;
        b=BK2G0s5BZNXtFradKC3WI0WdFFDRKlzyHOsr2K3m0jAi/mSGIdeiE71Fclje/shE8j
         MVkNx7N6TI17WAKmYCHlM3Dg86Lo8b8EpQfr3G5TABqArtCbvJDj7At1fCEBG4rrmeNw
         X5zejkvvAHleosXuel/WFFNQj+XG78xUcTl1eI6b42uBzgIIRbCcunyXZujUsSu+JYlL
         ShCdzO8W7X9ztZfkj9lOS8ELgVgcpGm6J2fbUXRijrgKtm0gfYdYf7iq8cJYSzdbQUPW
         91u8XgTKoEQtj5PWDoXI8ed5QVmd50bXV2EivOqcrDAPevMS+64z3z5CBtsFn82bIht8
         iCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795545764; x=1796150564;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :reply-to:references:in-reply-to:message-id:date:subject:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wcdBoCxwIu2pbM5ZNkd9oLklfMFSSp7JBfVhltAPzPA=;
        b=KdX061WdnEcZA7vCbbXDM12i/S8TCBn2RClUFjF78ndh4iGK8l4EXlEGH3P0HDMP/E
         fzQn4eHsAvk24TainEstl1j1ZogYppY4aAxJidrL8ZzE/wdoOoCzh32n7x6mSaNDDM8S
         qfluMkFTYJnO3f9QcTK4LVetrlmnUlTQrR6QYXZO7ZtXIRzIRUtMTHG6vOjDtOvGuC9x
         lV59yRD2/YQ6JaG1FkqM+oFwMM8l1zjUdq04d8JibiRw+WbLO/CU6vvFAPwUEbB+0A5w
         ihTFlOLcozvIABS9/DWPNyDB78Ftfa+V/z3GFu3b8KKQKwZ0HKCknoyESai2rO564pJo
         uorQ==
X-Forwarded-Encrypted: i=1; AL+hErHL6yjoPs4IERJowPLYogWXDsTOBwpbZM3c2viH1q4UOczSTYDU4s4IRlnyfLjUWG1Y9B089B5KblM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Bb0Snj8ksfaGC4ed8t8igzuGUVCQCg8JQgh7AuYksQxMt1675
	8r8LpP3Gq/voxY/abErMqAnlKLk5BuPlpIxB+YX9XOxJrsL8Tp9JU9IibcM09Q==
X-Gm-Gg: AZFdTZcFWrCT+TnCEJl3a1x5lxB4f/RIQjuX9uz+Gzgv+dcECeEws/fRAIaieUpmpPm
	0+hSeTe1Cj4+IbwobRYjvoSAFFyF1tfMty9JWkT/7DD88bnOLf65oaYoyij/mf9RmMhJjNPT8iU
	ZTuUbBR6Ndmp0U3WLxXWtVDDPhizQ4FH4b+GPfj0ba2jfMExJ5ig5ZsVo0dWU9sY6QiFmpw3A7E
	/MwtGGMNsDt8k0Sw6cD5/SzcRGbG3i2eWHXeoVpFquwiYzwWUEK7/l0M+5soilsQ5LnXem/1RSI
	BGXqz97xlluPuHX4x1MWgpd6QMxh5P8leBqC/y/qnjzgQc0lOH6rFuaB7bIVqaa5DqeQ3EfKkC7
	muUpbKjco8ZiKhyIbL6tfc+OAc/ZopOTkKiufM8O9s8k+aNS/K8arb6+bZE3qy0AAI8D8EKTc/W
	GQNXrFZByFWFRieCZwHB/+2MIVYduWrtZjS+HFALfe7tSW52Oj/foEPymZH14TmpZ6Q36PBQM50
	xgPQb7sdjWKe5KSsqXe561x2eucpGWEEhZPeOx/L4VZwq3RIFmko9te4FJXtJL0+EY99cWWyp9+
	JCV3KANrzKP0kvEMmUMXsMFq8fP5LKOcUxBGjT1u5MzMhMuuesUV2rUUlup5f9zoaZMsFN+50aD
	NDoDm8QHd6FpGs0AG7RK9PZp3J5v2fFCV1obb9dDmDcGheVJa/biq
X-Received: by 2002:a05:600c:8b11:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4bb8881c630mr330027895e9.27.1795545763519;
        Tue, 24 Nov 2026 10:42:43 -0800 (PST)
Received: from ?IPv6:2a01:5a8:303:cbe0:3c17:6ca5:5236:b25a? ([2a01:5a8:303:cbe0:3c17:6ca5:5236:b25a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm263108825e9.2.2026.11.24.10.42.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:42:42 -0800 (PST)
From: "Andrei Schapov" <andrei.schapov@gmail.com>
To: "James R Taylor" <jrtaylor11@gmail.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>
Subject: Re[2]: thunderbolt: AMD Phoenix USB4 host advertises Gen3 Support=0 in SB
 LINK_CONF with TB5 device, link stuck at Gen2
Date: Tue, 24 Nov 2026 18:42:41 +0000
Message-Id: <em10dd53bb-042d-44b5-a41a-d803eebee6e3@gmail.com>
In-Reply-To: <1794753796.37750.resend.hermes@gmail.com>
References: <1794143745.17311.hermes@gmail.com>
 <20261109111852.GQ176724@black.igk.intel.com>
 <1794223545.366398.reply.hermes@gmail.com>
 <20261109142041.GS176724@black.igk.intel.com>
 <1794235167.3657.reply.hermes@gmail.com>
 <20261109153955.GU176724@black.igk.intel.com>
 <6af1e999.9efe04cf.8f35d.ae23@mx.google.com>
 <20261109155007.GV176724@black.igk.intel.com>
 <dcc400cf-809e-4b7e-a14c-e4b2f469909d@amd.com>
 <1794753796.37750.resend.hermes@gmail.com>
Reply-To: "Andrei Schapov" <andrei.schapov@gmail.com>
User-Agent: eMClient/11.0.0.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable



Hi James, Mario,

Update: on my SER8 (Hawk Point) the 20G link turned out to depend on the=20
cable.

- DEG2 (JHL9480, fw 62.62) + its bundled Thunderbolt 5 cable: 20 Gb/s (2=20
x 10G), as reported before.
- Same dock + Intel-certified Thunderbolt 4 40G passive cable (Acasis,=20
0.5 m): 40 Gb/s ("Gen 3, dual lane" in Windows), and host-to-device=20
bandwidth roughly doubled ([before] -> [after]).

No BIOS or firmware changes in between, just the cable swap.

The bundled cable's e-marker (read on a Mac) reports cable VDO speed=20
100b =3D USB4 Gen4 (80G), passive, 5A, EPR. The same dock and cable link=20
at 40G USB4 on a MacBook Air M1.

So my guess is that the PD firmware on some Phoenix/Hawk Point boards=20
doesn't handle the Gen4 cable speed code and falls back to 10G/lane,=20
instead of capping at Gen3. That fits Mario's PD firmware explanation. I=20
can't capture the PD traffic myself (no UCSI on this board).

James: if you have a certified TB4 / USB4 40G cable, it would be=20
interesting to know whether the UM890 Pro behaves the same.

Thanks,
Andrei

------ Original Message ------
From "James R Taylor" <jrtaylor11@gmail.com>
To linux-usb@vger.kernel.org
Date 15.11.2026 16:43:16
Subject Re: thunderbolt: AMD Phoenix USB4 host advertises Gen3 Support=3D0=
=20
in SB LINK_CONF with TB5 device, link stuck at Gen2

>(Resending to the list in plain text: my first copy was rejected for
>containing HTML. Sorry for the noise.)
>
>Hi Mario,
>
>On Sun, Nov 15, 2026 at 02:13:37PM +0000, Mario Limonciello wrote:
>>  I'd lean on more likely a PD controller issue. Did you already look for
>>  a BIOS update? Most vendors distribute PD updates with BIOS/EC.
>
>Thank you for looking at this. I'm on BIOS 1.06. Minisforum have a 1.07
>image for the UM890 Pro with no release notes; its AGESA (PhoenixPI
>1.2.0.0a) is the same as 1.06, and I couldn't tell from the image
>whether it carries a PD or EC update, so I haven't flashed it yet.
>
>>  If there is no update available; can you start with reporting to your
>>  vendor and let them reproduce and get some PD traces to confirm?
>
>I reported it to Minisforum on 8 November and it is with their firmware
>team now. I'll pass on your PD controller suggestion and ask whether
>1.07 or a separate EC/PD update changes anything.
>
>Andrei, thank you for testing your SER8 and for laying the values out
>side by side. The host-side values are identical on both machines,
>including the retimer ID, PORT_CS_18 and the SB LINK_CONFIGURATION
>03 d3 03, and your MacBook result rules out the cable and the DEG2. One
>difference from Framework #56: the StarTech TBLT5MM50CM240W I have been
>using is an active cable and it still trains TBT3, 2 x 10 Gb/s; the
>DEG2's bundled cable gives the same result. Like your SER8, the UM890
>Pro exposes no UCSI device, so I can't see the PD side from Linux
>either.
>
>Thanks,
>James
>
>
