Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990C237F741
	for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 12:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786796572; cv=none; b=faPqir2797cdXnXAcO+9d3wyUYgV+6BkB3rYYtiqZ79v8HKiv4dp79qWPc9oEtHwyhtYSLRjrjIyaSEyNhsXVDqOy+SMHHe2m1epa4CLcR09KKHRsnv7cnPaZcHDRVThPzbEh54VL5oWeRss3p8berwBpYvM6i9gjrLtN5ddbGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786796572; c=relaxed/simple;
	bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gYr5EvL4O0EOlYKdv9l49kE5A1LDvxerLcvZAE7uW8abZ8I8h45S4iPRImvjkMNbtcZmNivIELmmY9FSmnmr1vd1vhgpb1va+HFTm/NU+9i0isyvfOmNnCouTsQ0ZEcmDGgZ2HHCBoef5kIWolm9fcpxpYfbpTqgEVdaHLFungk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZK/bNBpO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZK/bNBpO"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4955c545a94so2305585e9.3
        for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 05:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786796570; x=1787401370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=ZK/bNBpON2DsRhhbvo+q9r5zq3x9GSkd+xOYIK7Nzd+HIBqleJ0F3LA746nGZiDmdR
         riBq6wzP94hrto4sB2sbWmvLVj/mUVHKHyeqj4K1dj+omCM3e1xhnhdH9GNOm8yh/P71
         N4lJ77Zu8xbqtzj1liwY0MHXyRisMmbEfp1dXOqQOKpGuaHQLrMoOjVyB83z/ZAEwaVO
         ra18YqPf3syfGeHaoaEQjsNWb5D9U++QbJlkjtRnyWqKJab9LikeSNoZRJ+nMhjA/xs2
         zmjm8i9F+/alG1+UHQc5ov8JMrojwtX3vkz58mYHP+RWYD7tf2nAfq27lm4ER/ch4Wso
         oZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786796570; x=1787401370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=YU7id8QrhyrRZ+hCjy20UEEL7JgITz1h3h0api8Cylxb8ia7PlVMakQS+HVhMOsMbQ
         C1ucFYYeWF3t7mg3El2Vuu9LB57eFeO13/Hz6+Ku0KnSCx8wUIt6z45k5APiJyK1XbLl
         TMEpu5//PMSS/IZY4TaJ9Mi6I4v5SwXxcKKuihKMAT+KQJC5aVusLbDXmn1G0Adu2XrN
         vfVibcvho9zKWr4CYPIeiFJl0PNBR4h1apf+T4XRZhxC2Q0IWzUCZh2bmILjj+1f2VA9
         0o9Cosx6LSI4T/dwfhnb78gwX6ROK3lyX+kuyrqqFJkGVfjczuY/4r+EujmDS1GhGEa7
         ncrA==
X-Forwarded-Encrypted: i=1; AHgh+RrLBNIdWx8kU+fYNpWWXGExEydokHH5/9/BUbuMwA5iLIbe2sHMdM+DAuF2rfXBYTKY/U7mNZsJAAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW10JFAJFloAefxARHGRhAdUCCFPCVyNkrJd8LH2d5ckngQ8xS
	tZMzsEfTHrResjvn57qkuMm7spDJoiEMvJfjG/rw0g0vX173yakXovdm
X-Gm-Gg: AR+sD100MzectrcgGH8l/+SX9wAUcRziuMIceuC4s9QdWQkWKgIGrAczuBZHFmCVRwD
	isoTOtCUKbZ43n7Ta2sJDtj8VqKwmtD8AJgjx4YQBZwS7sxt6LHRsHEQZtxvo2IVh9N+5NIwru8
	I+J0uBospTDPJ0NaXhCtLGGgQ2BNp9JkxnVnKG69ycZiOOPR2aNSGs6UbTJQZi9zvcRwsOTQfX1
	VyUTcU00CQz5wc9bxrxrmpLHGaprGIlb/ncLDfDoyOLtIDb1shEj36+BBHMxm6QTaUXTRuwd4zI
	+UPkg5if23axSNBKZu8yygeQSOsyxU3cA8r6wHKPeXWrw95G+Kw13oV1An1oI9Is88QUGmS0D2h
	+VJk8zpNSclIJEu1gdA7OJhCq8SbbRfDv+qC4a6/Oi7NrFNtH+TGvXF0ZxVHy5dsgf35moqmrqC
	YwJiqSAPVfxxuyHAABb7dk6ftoG0EJ2Bk3uzXRLiHZvFDvpgDnbTzY9lO4+YOLkJc1Orz3OZsNR
	1flVRxkyFjlX0n34UhZSUSuROUqF8wz+W1X3qSG6aXKbSS527lLsFxFwnJvtw4OglRT8g==
X-Received: by 2002:a05:600c:a47:b0:496:bbce:ef with SMTP id 5b1f17b1804b1-4998796ca48mr90983305e9.3.1786796569782;
        Sat, 15 Aug 2026 05:22:49 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B932600BF05B505F15B0ECC.dsl.pool.telekom.hu. [2001:4c4e:1b93:2600:bf05:b505:f15b:ecc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f1fff25sm26930649f8f.3.2026.08.15.05.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 05:22:49 -0700 (PDT)
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
Subject: Re: [PATCH v14 29/38] usb: dwc3: rockchip: introduce glue driver
Date: Sat, 15 Aug 2026 14:22:32 +0200
Message-ID: <20260815122239.65405-2-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-29-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com> <20260813-rockchip-usbdp-cleanup-v14-29-b5ad9c68fa11@collabora.com>
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
