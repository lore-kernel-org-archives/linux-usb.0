Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3BF26B2AD
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 17:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786987822; cv=none; b=m3BQgDvQQeSG+AGWFyWXKGxmrOVlFj7V9DCgmORUn98VYQbl1zUvrZEwfc8NWJiAjNox2Vz6Q11f3+KgkttuOjHcgU8EU2lo3VrgL325bJmgLeTvaBxVfbFSryoWQW9VOWkfSZ9E/ygGn8Gnk/05pq4XZDF/Ngj4o/5/tL/hMgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786987822; c=relaxed/simple;
	bh=LRBux2gMcBgg/d1zLQuruBvkNFVU5Gfi+jxuiFrXHXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJxsbMqv/ma3hT2LS77h0tBRu/8DSZjz4KfAajzR2LQOlkn1a+Bu6lzft9VGowzIXzzcxlU3blH7/ozdkTZQ6TC9qkKv0Oss6wrZV11hfKgYMp/BYJwgc2w+SLdWFuMKC8gr59xLmfEh+ybABU1lksp4hfIGLNuP+9xMvJjPyyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EIrMBNx0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIrMBNx0"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47df6a5655aso416706f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 10:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786987819; x=1787592619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ug6Bnzoc9QivZt6Gh/tEHOb+vmUWZqzOUREdpceQcs4=;
        b=EIrMBNx00KSZB13Mc60uYOazXHG3+CRnI2DlgfYfQAwY/4WsRTpJBXyFAtvj5yrvPT
         siNglhrU0bCFD88mok8MNJ9Vq77GZN5+k32wnif6MEFFdezJRab+1OxVQZNouZ0YPAoO
         fvMDaHU2aVXgFOlgtDczbSIw5L4qKEJVF2715pFtZwXfL75krgVukG0hM84/mqBrmleq
         JDMofrTRkj0cOAOsYH5oqZsux+1LUKc0d+L3KSlbSDGaNyn6jIf7fPoR1BoSA3ji7WRU
         mjLZIuezLTyZFllaMWFH9pLVtR7jBwZp3ndSV2GbKNpAtEYz/Ej0xwh8LNnszYQ8SJ8X
         bLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786987819; x=1787592619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ug6Bnzoc9QivZt6Gh/tEHOb+vmUWZqzOUREdpceQcs4=;
        b=Cs4r2yaQsFgpo6wb2yzAGhgYNGIZpBGkQWjZrB3ogn+cTvCXiuRM4uKVJuJZok1a1y
         OCwf5SGJ1mpM+I9+uhiV97+6GusOPO2arCPftn5LD+xJSpmlcEfjkVjE2Vk1hldwWcb1
         HI3bdPNGx0Q1raJQPw10fx8DfmHAVuCtboYCWqXXw6lSXroiR/erUh0/NAD2XvyDKz8u
         BBoZYobz53LcJp+AMq6TZeAL9CefOQzACkMSVZS5Dd0VuulYmFtqkJd4S/FXQ8MJyowv
         eHxkLeiF2F+Jl9LZviwAAlqJhv/HoUR+zeJjnH42Sd+JFSKd/zcoVfU55NvATOPgHHrA
         gmAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpwQTUT3FgWMpU5MjefMrL/a41hBKsEPVymPh2wFZoSNyFH5LyssT6BjlC6znfti/a9VNkBPMfTHrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7J0ymoZQmaKqxDAh90761EqcRLGytggqprBRHvURRHK2hY63e
	8YmfNO31SYVKojxxIHg48DBqIrX4V63o3N8e2AqsW+qgXddjJJHUqZZI
X-Gm-Gg: AR+sD12+nSDlIEqY/zO9YdfimFXcgt6OXwwG2qJtmN6F5Kw3Y+TIS3D010BlamsKI3w
	51Eyx10tRca5TrLWjRDzw6IDUWd7luj8noH6I425A0em3rzx61COnAX0SzBp1fdpBWzU8m/ZM+C
	ghyaltq3tHnnJKeDszMSv14D9kIh/N/HYfZ1wD8Bvhbwi4uo/Zxjv54XiupzWXU8W3ZqnBJpDV2
	U2KJsLnQpSEPPFNutoxPSdJZNquU0NPo2byV/XsjJcZHVtfSco6yvPPdxJ3CowT0T8ERltuPghW
	MOEw+EC4lRJV4xRBjeTfcwcWdkbigyIQVWPxbAZw5NU6fRIlR5snb5Uu47mma55vOKQfNGZ+ZcW
	rm19clO3crq/Jq9zhe2K0tPP9ls7XqxPol48ZSWrCbOFJzpoXylqjgKArziYyNE6pY0cjbkAKML
	jiHRbiZPmqS+5cwmBdzCS0OCVSC/WH5fRX51qAxNT+nyO8oA0qYJ6EoXur5qG4MpBfwYJNU8BOX
	KSxmrirUjzOjzMmfeu8s6D6C99ZDUqGml8kMoy7fxKvjpTb18e+QimEYeFk78WHdvuW0g==
X-Received: by 2002:a05:6000:601:b0:47f:e8af:7687 with SMTP id ffacd0b85a97d-4816070569fmr19813569f8f.1.1786987818793;
        Mon, 17 Aug 2026 10:30:18 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8FC50088291D65FF092D15.dsl.pool.telekom.hu. [2001:4c4e:1b8f:c500:8829:1d65:ff09:2d15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b81748sm5966682f8f.37.2026.08.17.10.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 10:30:18 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Alexey Charkov <alchark@flipper.net>,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v14 00/38] phy: rockchip: usbdp: Clean up the mess
Date: Mon, 17 Aug 2026 19:29:52 +0200
Message-ID: <20260817172955.16305-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aoM5PBrT5pBPS63N@venus>
References: <20260815121608.64818-1-royalnet026@gmail.com> <aoM5PBrT5pBPS63N@venus>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sebastian,

> 30 seconds for PD negotiation is indeed very slow. Usually it's at
> least 10x faster. Have you checked for the root cause via TCPM log?

I have now, and I owe you a correction: the 30 s was my measurement
artifact, not negotiation time.

The journal does not record the replug instant, so the figure I quoted
was deregistration to re-registration - including however long the
cable simply sat unplugged. Today, with the TCPM debugfs log and a
controlled replug:

  [12954.114919] CC1: 0 -> 2, CC2: 0 -> 1   <- replug
  [12955.837527] PD RX, header: 0x2e8f      <- PD exchange running

DRM reports the connector connected 2.1 s after the replug and the
compositor lights the output about 4 s after. The adapter negotiates
at normal speed; nothing to chase. Sorry for the noise, and thanks
for the tcpm devres fix.

Regards,
Igor
