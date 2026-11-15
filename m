Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753889;
	b=svI0pDcZ0VyD9DLK91JlVj7UVWV9Ky5NYQgsA/b8CuQBJkGu9ojSqtCiyD6b9mo5ppZ+
	 RZNVq3w1UtmN4YjabBEanfkFheN4Ed3lywAjuiUBFFu3XrPAAXagy5LGypferUG/Z+BB5
	 SxPRlcrflRUDl33zJ5s9owaY5uj8f3Z8ObHaSLCartSxV3JpOdmq9TFOVgLgYzwR8X6Ck
	 7pWxrJJPIFailQFJ1718Ua++329wbVTFt/qYEsS5B0d1E9hTgAGQypBgFxtTzflKZjNwv
	 FdMQr7zuXpoLZPsFr0SaLly6NYeoJUQHlTT4FNDoYkupKK8XF86wbzUE4emg4AAzP0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=l7ooCLRATnQW0qioD+obzzYt/lGlivBDn9hxfKtL8W8=;
	b=KVcck3Jo/2jr49+T6ivXCzK9SOO6HQgCPCzGhkB/BOj2162Moj7BdJ9kewloXzv52NDx
	 V5Z617LkB8uM3VAsdLFELQZlfzuEZYjSacVDtRaHnX1klrbZxAFF862TxsAgC9wKfhidz
	 cyZCfXVgGgiFnF6pPa8xCuzCDncnf5X6Of4anTvTRDectcCpwBV8q48iCmP3bgFnJnX+d
	 FEDOfsSFaUk75JetmpnVl+BmjvLDDUoPOtPaY/7ROeu0oymUKFdPOoasIOMtutLfFdvAa
	 Go3DiWqDhLMLFE97UZK01ffVxvAPfbVORolfUl2OtNErvZaPTDjtwErIt6MMHzmGTDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0cPkUmMV;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1639606A31A
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 14:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1639606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0cPkUmMV
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49318428d98so984919f8f.1
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 06:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794753887; x=1795358687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l7ooCLRATnQW0qioD+obzzYt/lGlivBDn9hxfKtL8W8=;
        b=0cPkUmMVgeuAUkMQz2r6UxYLSOyCkdXpi2lBYGbilBUmQEmPMfp7ymQjXwwcnPM7sa
         wt9kivmVn6xGUK4Kvo2YFmeLAQYtoWdbcF2Ccx+88sFDx1ewV1xwMLyT1Kr6b7rTAobw
         PDRlfD1sLBYiSat2fZr0zZGQZHGfm4Il04mftg1HkpjH840M5vYpxQuXdeWdDVM4B9B8
         20fxYbhSIVbnifI0ldCOHUwhTDQriJT4WmYW49yGYPDWYrzWRQl5KH62HxiEV703V9Ok
         b+ISGos1M/xZNKAYRJqBlkRKJPAxWunkR9U1BVvpJV5k688RxZHXJYfVd8HM3BdUqM0P
         kKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794753887; x=1795358687;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7ooCLRATnQW0qioD+obzzYt/lGlivBDn9hxfKtL8W8=;
        b=Kd5wMDdTpWIAxcaBM8duyTH17T+j/NmULJan7oLepJCRZlXRcxaonq7WiRKkuAOyOt
         bkc85rExwasCV/hi466ZP8nPEDuI1MfoSSwARhheC5lujy01koTQ9IHf4zYiTmDep4fs
         ySYEhLR6tfvktwLOcVNCQR/QxWheV/OceX/J20jn4dwD20/VpEKwUXw7FJXL8JwFBRal
         9WF/mxY+MLYtRfd6LaDfLDLNIuNGeFp1PUaXNlm8T8vhsgUiAiHj9+QSubfaM+X0sdz0
         ISoxhuB6vNwBlQn0UC9pBa5AP9Z1Vei8YzaIaMrcXWtJebYKkinJEUvwi/k11IPgetbf
         4NGQ==
X-Gm-Message-State: APuU4Z+KAvbNyN9hmXbmybdr/BuOZVmHGsm5L5oE1wjDoSP7MhzdzEAi
	78tFQc8Fr1amhosEXf16zRtp7bbJjqGMGGZ+AcpLOTQmhE+1UMmdhDeinUN/nQ==
X-Gm-Gg: AYBFou01/ATXyH2wOJj+JLm0LILds6ZPbKAcj8zHq3qSgLpAHRBzZH6rKLWDNnxZohn
	aAZT0KYw80wqeKuE9jWrAaSKlNlDL7b5k6okrH91E4cku6GJSeEJ2DoZuKotMkvlT5OqZ40Q91N
	p8ZIPNHlurGMdhDZXPTJwbTkiZ+hCcK1K33YLRV9xDmchUdM+WwfZiETyG4/IlRDjBVK5/QGMxH
	9NmiW+iLpYJwBnCr1Sep/CfKs/6QCWFODAedgAUfXQqrHjQGL4AXlFqRfn36k1E0Av3jki9o/KD
	WIhA/c61S/XG2vyWjcocNJYi2Pf/wbv8dhE6AZuOBn037Kq8iNbt2VH7K0UgB26JPueBNj2rI9J
	1BtpYO5Qn7f+LA9OwMPuMlHMcnkMXA6j3uWA1qliYxytb89xrYOcA0EFWU1CUql7+YwtgmTA50N
	FTRNeV10PzylnT+DRG/wV/Wzr7RU4KvP56m9NBLL+pe0K/u1Ad5uTvwdzjKJCaDcSYPpZbcdMlL
	Aa5Pwlzhu6jdu809a7sqGkfCV3OyIAf8VkgBfVPtTE2ve2T9fQo3lK7UE7o3YWGn4uNxWqOwnaT
	z/4r6DlNHg8ZMdElJOu1oa0Pk2FLm4KyMoVDBsHMZ/PVqZddUQlIe1eq79xvmPJw8wzGys4SZP4
	/Vsqb5LsoqzM7io7fgz5Pt5YbQKpLhoH03jlRyRP1b21/F6UABxEz2jQ=
X-Received: by 2002:a05:6000:25f9:b0:48e:c0:9441 with SMTP id ffacd0b85a97d-49c71a66e00mr16928146f8f.29.1794753886950;
        Sun, 15 Nov 2026 06:44:46 -0800 (PST)
Received: from resend-list-plain-20261115.eml (host86-185-73-183.range86-185.btcentralplus.com. [86.185.73.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e4a2asm16585194f8f.39.2026.11.15.06.44.45
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:44:46 -0800 (PST)
From: James R Taylor <jrtaylor11@gmail.com>
To: linux-usb@vger.kernel.org
Subject: Re: thunderbolt: AMD Phoenix USB4 host advertises Gen3 Support=0 in SB LINK_CONF with TB5 device, link stuck at Gen2
Date: Sun, 15 Nov 2026 14:43:16 +0000
Message-ID: <1794753796.37750.resend.hermes@gmail.com>
In-Reply-To: <dcc400cf-809e-4b7e-a14c-e4b2f469909d@amd.com>
References: <1794143745.17311.hermes@gmail.com>  <20261109111852.GQ176724@black.igk.intel.com>  <1794223545.366398.reply.hermes@gmail.com>  <20261109142041.GS176724@black.igk.intel.com>  <1794235167.3657.reply.hermes@gmail.com>  <20261109153955.GU176724@black.igk.intel.com>  <6af1e999.9efe04cf.8f35d.ae23@mx.google.com>  <20261109155007.GV176724@black.igk.intel.com> <dcc400cf-809e-4b7e-a14c-e4b2f469909d@amd.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

(Resending to the list in plain text: my first copy was rejected for
containing HTML. Sorry for the noise.)

Hi Mario,

On Sun, Nov 15, 2026 at 02:13:37PM +0000, Mario Limonciello wrote:
> I'd lean on more likely a PD controller issue. Did you already look for
> a BIOS update? Most vendors distribute PD updates with BIOS/EC.

Thank you for looking at this. I'm on BIOS 1.06. Minisforum have a 1.07
image for the UM890 Pro with no release notes; its AGESA (PhoenixPI
1.2.0.0a) is the same as 1.06, and I couldn't tell from the image
whether it carries a PD or EC update, so I haven't flashed it yet.

> If there is no update available; can you start with reporting to your
> vendor and let them reproduce and get some PD traces to confirm?

I reported it to Minisforum on 8 November and it is with their firmware
team now. I'll pass on your PD controller suggestion and ask whether
1.07 or a separate EC/PD update changes anything.

Andrei, thank you for testing your SER8 and for laying the values out
side by side. The host-side values are identical on both machines,
including the retimer ID, PORT_CS_18 and the SB LINK_CONFIGURATION
03 d3 03, and your MacBook result rules out the cable and the DEG2. One
difference from Framework #56: the StarTech TBLT5MM50CM240W I have been
using is an active cable and it still trains TBT3, 2 x 10 Gb/s; the
DEG2's bundled cable gives the same result. Like your SER8, the UM890
Pro exposes no UCSI device, so I can't see the PD side from Linux
either.

Thanks,
James

