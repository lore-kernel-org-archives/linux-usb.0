Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502679;
	b=UwWvTzo1oiOa0BhnVSUDCwS57HRCATDoIsuB3cCAvcBenPSjiqnK1uV6XQWFDHxHSAtW
	 NHnl1qp5cNegeq3g3Eb4YFU5573z46Iqt4r3vZvrMFY6uWELYGv/8qhz9UVnEj8gfGj5h
	 fB7VIm0fD1aG/lu3x0N3ABPlR5215n2ME/3vpmL0bfwb5jt22vtD1/suMcVFT+fTONWEG
	 cwcsQOqRYMsI2XUQVsNsGDfxYyLaMVoRane+mlfYIAx2m72pTX4LAx4D6L4K04TyhUd3z
	 oWXCFUZshJiIhbIVvQX8saVtemSSqgiG4p6wXC1+6jsdB/0JzggrRn5bEkvGSUNHt7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cbkSJksY8o+Ofg/AeXbkqolH52cZOpuyoJMWdVSYS2g=;
	b=xi3axiNSqKdeWlT8gFiMRHmxcmhG7U5HgJX8iNxLfYXV8aGwVEVeRbHmAt6YYsaU2JFV
	 994aJ//AD0cYeIyd9zIuL5JvbPRsi+h5itlQ6fUsyPy5nxrEwXZA0YdGMbYvcFm+NT/K2
	 s3EUerkv8sBT2MhJW7ea8YWOxUJ67aJeRsXdf1EmzOaWxAnL6TrmPud6weX84KyLftxe1
	 04SH0aqXrqPcQQx1ESfNPCLowxepjSff03RcDZahSgPmKo287TNGXg1WsK6kYNg9A57zJ
	 prXKkh3EB9HYvJSKRAoKq8YQEPTRDz9M26M26E0G/ParE4Rhh/S+Vi9U6+QxKZNdC3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LM5bjUL3;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91F560A2600
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 13:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E91F560A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LM5bjUL3
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a070b3f44aso670782b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 06:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792502678; x=1793107478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cbkSJksY8o+Ofg/AeXbkqolH52cZOpuyoJMWdVSYS2g=;
        b=LM5bjUL3+mj3TL6zTzf0NObne+OV9vWzb6zKGJc8M5qxVHNdtxpFDxYVG2tm7XZ0l+
         frrrxmC3qwL/RNgt79tE+upVvNnNly2L/kiG30GEpdYfAVQv8hyyHbtMJC3CwVpQvMmP
         Cf4MTp7HwiMuP2tliuH3qIot5CeowmV8D1foCvDUcAUI/tm39YP9rubXYgwPnos4/odx
         O1C65UUAjcHY+DENihTLTlOEY+TBma6z94QNPmFUaxX87US8lQTidF3yJqrzaPgjHTo4
         6kTj9D/5Q3an7MC9qbBpo8toDPjp1GmQzgkSIXzEyH4j2rIRZ/LUcpsBRtdMVEcZeMcT
         H5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502678; x=1793107478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cbkSJksY8o+Ofg/AeXbkqolH52cZOpuyoJMWdVSYS2g=;
        b=Uko1Jp/OL+5vcN2n1lqaKnDnq4HV1Z33JkoIqyYxl7cIeYK5HOdOOHG4QDdGtJVjjK
         tNy2XeJpi3RFoOQGON8Alh7B8P2qAdFBjXvtYxfHblEKRL/4GqSZd4kfk8bRuKhQY/UR
         jZArPXZWal8IMNpjTGGKQsTADauwOD+3wPBso6HWSzFZxKgPUAGA7phuIrlZxa9XHTT5
         cbBc04810Mf3IO0Eqn+axmdI8PLUnovifg6mlDnCwyOjw6UW5YG03Wt+atHBtyBXstGK
         ULjojorElHNgH8RCGMcRDAy/9ZHQ9FPX0mCz+bACQ92eGxNB9tTJY+UTHS9hGrd8oGpz
         WdHA==
X-Forwarded-Encrypted: i=1; AKwUvBwXraclDsc3Nwi8SO/SRIkjq/ybb/zEI1gthbChgh6/A6HejlAMQREeDSuXUZJTItfELFiAqPimFcg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFzj7LI4GvVHSRhhirxhi2PLkU7k1wQALdrW7gE8rXKMTckRaZ
	iMGbqztfXumFt/MIJStWPzAi+MwM1cf7+bDPxzBUTuyLmsA4XCALlJ1u
X-Gm-Gg: AYBFou39gaCNbSEoAqOr+StQq09qG8fJkF2KtXmXo/brP29ShGBZkxcVdnz57NMHh09
	XyQIhapPlVUZYO7Pr+/IqLjhTC9zEXUsj7yqLAoddLEsFCKVtgD7sJbr4TOWXjg5PrrvkriHTAn
	iZ2cCtz3VWid6e1BZvITZ7Xro1kULjvdlFeQ9p3BnBoNejJF97vGIdGxTaimNuAj+teZvGHpDXz
	ezTdWiI7jKcjXNTQFLwn6F3DT34/cqlEl+FDG2DRmLhG+m0EmA0sg34Cwnabel9Vx6BuAdbHVd8
	osNPEfHqEqb0qE9jtCgfhnfOLMDIfc3LXXaPhCsuEeJpdnz9ZvOPIU/p4yyMlqkJTIU9k0p8GsD
	AF3kuLebPvIDf1/nbDVVDKRvYEUSwnHTAF+QRtudSDIYsD64CGVxcS6Udq12YahdoC6S5a00FHM
	WRLaC9tdUCD4RN6fA9fCBvVVobVP0DAvKYEvKGeeWpO/6ooxAOOy/mtUSEi+bvjYLPcnCePS9VP
	+wlkKTTYedCbm8ZHrGXyfeh
X-Received: by 2002:a05:6a00:a8d:b0:899:53a9:1dd9 with SMTP id d2e1a72fcca58-8a04d34d8b6mr8875311b3a.57.1792502678125;
        Tue, 20 Oct 2026 06:24:38 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f56c8b931sm4779680b3a.9.2026.10.20.06.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:24:36 -0700 (PDT)
From: joonhoekim <26rote@gmail.com>
To: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Joonhoe Kim <26rote@gmail.com>,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	lumag@kernel.org,
	johan@kernel.org,
	neil.armstrong@linaro.org,
	casey.connolly@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] usb: typec: ucsi: Schedule connector worker on freezable workqueue
Date: Tue, 20 Oct 2026 22:24:30 +0900
Message-ID: <20261020132432.998-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261018150136.5896-1-tvlad744@gmail.com>
References: <20250205-ucsi-schedule-conn-worker-on-freezable-wq-v1-1-107d1356b77b@linaro.org> <dp5ohy5piss7osycibuke7kwnfl5elnmc6gfvqgfh6mzzrldla@sru3ylzrtuea> <20261016125044.1085-1-26rote@gmail.com> <20261018150136.5896-1-tvlad744@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joonhoe Kim <26rote@gmail.com>

On Sun, 18 Oct 2026 18:01:36 +0300, Vladyslav Tymoshchuk wrote:
> With the connector work on system_freezable_wq, both unplug runs
> resumed (2 of 2).

Thanks, Vladyslav. So the same connector work runs before the devices
it calls into have resumed, and breaks three different consumers: the
FSA4480 switch here, the PS8830 retimer in Abel's original report, and
the dwc3-qcom role notifier on your board.

Abel, the RFC has not moved since February 2025 and two more boards
now need it. Do you still plan to respin it? On Dmitry's question,
7d0767c5cd87 took the same approach for the altmode worker as a
stop-gap until the PMIC GLINK rework, which may help here too.

For the RFC as posted:

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Legion Tab Y700 Gen 5 (SM8850)

Thanks,
Joonhoe Kim
