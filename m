Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099263CF04C
	for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 12:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786796578; cv=none; b=IvQThdNm8Hve/T1XBsaQQkJS3883M6A36XI8js2ZhSXCCKBO6/G9FX0wPS8ACikAlvf/mS5tkn2yfGQXP+TEq6wTHn9vUJqn6nCRayJJbL47pmQofDKyfX7kokRfycNDTQA3iL87lFHdiNKWJjWqT8OJFJH+RgTdg2E1iroyx74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786796578; c=relaxed/simple;
	bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aMQDJTYOhf9mxwT7rzJKbrSUD9HLHHYCwxTZROYQcpaeV0uCEVw4Jk4gJBTFU4fGNufFrEhPehlSh1z/X5nqozcit974A7CYK11jtCa7leKRocsWe9uv3tWFAcNOegWAxDS1CxNNhU16fO4qlBGdJSaA4FTzYfq26GGB12ND2sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q68rHxKx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q68rHxKx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4996c452e95so1814315e9.0
        for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 05:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786796573; x=1787401373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=q68rHxKxtVWzJK5/I7RRg35bWMnrD0/s4kHf8HavyAUF1Umpf8AqjWXLsCjx2ifuwq
         R4eESMysdPpFksQOeFcvePBvHBomU7bQh/D/J7mHyARTpqLqevZjS9vYNs2QJl51VvKq
         2U2vLkmzZVKScTyTaVydaHtjpKOHldpndZHx3Vg9ObkXJfOMeRGhmam0NzpbaGX8g8rH
         97Y+T8Fgmp5/HwCOhZbLBUIUS/JXaOJgGCSbR2P5bEmTLXX9F5rdAfGV3U5iK4+MrxC6
         AbTCEs/zhtuh1oK/H5A5YGPx4CH5yfeYZj2FR0unOQ55U0cryUhsR9yXtSuslHwyIvjV
         EToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786796573; x=1787401373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=OIHp3k0RR/efzm52GeMuV9NWvW1K1p0gL8IkJA07RPS/2sWuip2RoANzV+ep4m+D5u
         JRsDBRZViSuGF68UQtbDfFw6gIbRj3AePRaumCTf5dlZQgwDB+TtMNl6kjGkwEDV7mRY
         fevB04xK5muPspREiF6f5oFBeAsZL5jLHknxvitOp2DJIqrec1c+dxESc29Gx2dkGrfj
         L+OpB2iN/XZOte0YP/p2GKjOQa5bDLu+OFFQX2IfCSgsALAVvAoTe8+Y9Lwv1RPK0XNx
         7pS+Rq4eK44g+7vY7Hc2Djmf37P1swMcfn+8iu/5V7rBmGV+rleVa937elAw12DCHffD
         ryaw==
X-Forwarded-Encrypted: i=1; AHgh+RoSxC/MEe4mllPHybx6WsW94kabT4DNDGhMaWDNrE5Xa7Jm2RuOlNUayE4YdqBqf9e6K1idB+a7ei0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKbgFjQu+YZ/ciwQNEJeuVHFA6tTjemCx+UAYGFfE18q3eGRrt
	z5Vx3vKQAlzBdRIdBueSLErWbwO6BJl6V6p3SJYp6wiWAC1LDH14IUNK
X-Gm-Gg: AR+sD12TRNC68sCJFsJrTAl/jkspf6kG16EhewtCnb5YsBCbEBwNS9TH0T7JgMLtrol
	8w+OkSe5VrZVZf4XP934DrDpF7nZKIhVUvOojO8dYEFthTDh0xRqI3vJXOL92B6HlclJfB4fxmT
	obSOJrcl3Z00O9W/Mnkg8PhLjUcZKep4y/C4ms8Tm48yKLWy0oUZt6FaRPGJycf8ZxRSiYjsP5U
	FsAxqk5oGzAce3KrBxX6RYx08i6vOCe8Sf7DkM2tfwEUTLUD0K47jV0oM4gARSka6BjW1FcN3pl
	4BzSX0nhdOpvT55UUtJ278EYUn7irgAhs790D55qn/Lo66uD32wconS1mEWEeazvctwcg1dI4A0
	D2Bp2MQwpYK01rYP3cwiAsD+7jEuQ+lnbylGLiLYlr30NR822WlscuWHqohPICxIzzQ6XiDhUKb
	MCt6Y0H3t8CLEtPrvEfSEw74pDNopFa+28AsNDZlEfNboWvAXtYePjkbb/m/E3ykwzbpSsW76Bs
	maujP2TY9HJUbRzbqh6gYQnqOpUNhrNiPJTGAYC+iSyUyzNltZzoRI/n8gAK2Q6v8vGJQ==
X-Received: by 2002:a05:6000:2585:b0:46f:7d90:8124 with SMTP id ffacd0b85a97d-481607738d1mr8826047f8f.2.1786796573266;
        Sat, 15 Aug 2026 05:22:53 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B932600BF05B505F15B0ECC.dsl.pool.telekom.hu. [2001:4c4e:1b93:2600:bf05:b505:f15b:ecc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f1fff25sm26930649f8f.3.2026.08.15.05.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 05:22:52 -0700 (PDT)
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
Subject: Re: [PATCH v14 31/38] usb: dwc3: rockchip: support PHY reset notifications
Date: Sat, 15 Aug 2026 14:22:34 +0200
Message-ID: <20260815122239.65405-4-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-31-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com> <20260813-rockchip-usbdp-cleanup-v14-31-b5ad9c68fa11@collabora.com>
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
