Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497563EA97B
	for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 12:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786796575; cv=none; b=dcREH2VUh+e/qkrHlD14qDnjxguG8f0x4vxn6pEdcCLV8ZIqkcIN2oCSML37XLz+YqQtvw0XZ+IMf7phVxmt5EpsMTiSw6Dwoj2nDut1bcriuat4LoWlwPRKH8TMp95USGIvN0xukUN8IyMbegTzsT3nybgQ/BhtJdjffc9TB1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786796575; c=relaxed/simple;
	bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QqBOiOuaxgd9vbDY1PW+JS1zeeXFExHreRtICfIr4gH9QqjDHkUSDnd5pm602gl8uEWdeKPtdpn3PVkufmRpKEbYSlBH8F4cQFUUkVc3ehXCAnGaIBFF3a6lfZpL6jlNyvIEwirc3/IYL+ugXI5/oEEXZQdS3S3zfZBLTeeYdH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cspVOTfc; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cspVOTfc"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f611b3af9so206868f8f.3
        for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 05:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786796571; x=1787401371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=cspVOTfcgmpQHXEP8L81v2osYM4eZ+6IdnP7Z/4z3Jd1j6KzSfG85mD+IA9N+dLS/3
         LxH4UlKGnbdIJFgZFenoXX0N8PkNKUfVKpmpbB9HH0cqCYkRDeYaxjoFyKEd5IL8AccF
         vtABO2rZ7uHdQyaaE8dtNYdF4ffaQUdG9jYuaV+qaEHL8TMDg6CQc1irdsENA207h0VQ
         WbLfOxsSm9dqmeJcSg/28nwyzX/BFaFzysM4hW6rA/xZB7QJm7iyc7Eiy7+Q5XyPraUK
         k1+BQuCOWrNmfYfnsxnvAyhulTef2OY6lXFx1qEPqiU4b35X/LLg3VW6G5oMtKTZfUSn
         pGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786796571; x=1787401371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=EP2QefV816HZHPtRz7P9yQk0+5t/1v9+ijjmMSzaWt66EvbNRCIuzXHeOPyk+fPWwA
         sTqGrRNg907kT7UsNo0HZyZ9Eb1ikcIfl5mcLod7eB2XHT0FwQPpfK+knyJlo2HlzqGZ
         1PcvhtZaFf2QzxO41YTZ5k+xYSe3hxd2yF10VrCJTIIBnvto8CggMsyUcIm9ntFiSBvI
         Of0L5XHt3IwmXBf5wXnLo0PE8AH+pqKsJWbwF4wfXaehGebo5cE05l+SGXMRj4bnUA2+
         ZwW351uGPedkQkjTNr/F8OZ9BKQl/U8HHZjIblSDMCB2nsKXiPW3dzaut4FJfgiTUt+w
         nOmg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8qTFEpLzWhEqfxgenRWg4FxAil6iwcmOWPl97RVq0Ou2sWwBkDzCALp5tZEGO7C/WZ8zDrH4+KEE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya1bXuxKI/3AkIS/lcRE2KvOZPg9naO1pOUgQTtKI5zALBdMaH
	NBCZyLRYLMoYecCNOVXFBPt4iLvgpqe+yvMoW7TPVcS2ZEcKBCak6xa6
X-Gm-Gg: AR+sD11vF/ph9tx7h64Uf/mjAs5j1A+7vGbv4ndCkkDPsS/gNFKGpmaUs9NfVqcIf1l
	aJcBxXlFlCPXqLh5wQKKWno+XHBh2JbnS63RO6abedDkmFtghhtALgf+b97OXyR9emce2QJznfK
	DJOW3BMm25xsaK/pig3G/tOM4pNFgmYH4/oqWopiNDPAqF/TowACfKov1nBGxgmttg6MUqnEl1z
	iAXFMPn1rgl1zGbWGpFpYkdPj+EBj2x3jTDI1e34k2pQ8+ovPK0W1KR15jA1yxIrehrwNf0GIM5
	cd87cJWfTk1B6vantr5xUAd9YMUdMlINPs3sa5IpeCcMrGJEackMfeUdJjYUUmj5NcyWa745Wr3
	ug5Tm20MFOiIvRzSAW+z07MEC55J2aCqQc/qfYzhCV/MUVtmhgO9PmQ135Cr6BDTjxoLrYzn3Ch
	YseHDgmPDZwH+M4SFBgT3IKPPUaAc2gAgUOgDz828BkJSktt+c5MBPiUGFHfeKx1rIitsLMDXv9
	KmCPPhKHVb22z2fG/PkfsYdHDoqIhap+d+ZoRMyz5PiOD6AH/6BERLgfe6WpdITD9dO
X-Received: by 2002:a05:6000:1446:b0:47f:959f:d5e with SMTP id ffacd0b85a97d-481606984d0mr9483486f8f.0.1786796571543;
        Sat, 15 Aug 2026 05:22:51 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B932600BF05B505F15B0ECC.dsl.pool.telekom.hu. [2001:4c4e:1b93:2600:bf05:b505:f15b:ecc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f1fff25sm26930649f8f.3.2026.08.15.05.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 05:22:51 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v14 30/38] usb: dwc3: core: add post PHY registration hook for platform glue
Date: Sat, 15 Aug 2026 14:22:33 +0200
Message-ID: <20260815122239.65405-3-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-30-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com> <20260813-rockchip-usbdp-cleanup-v14-30-b5ad9c68fa11@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on Orange Pi 5 Plus (RK3588), 7.2.0-rc7 from rockchip-devel at
ea51774c5c42; details in my reply to the cover letter.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
