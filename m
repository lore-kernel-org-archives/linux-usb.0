Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7E33B6379
	for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 12:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786796571; cv=none; b=kITCvOPZt9BAwNuj7uH8v95PQhIAxil+1U+dERyurtFIHEP7O/wVay8K0kr6jGPfAyr68fdG639kWIisxG4TgIPMPRvG7fHeYsG48J4DeIJ7MTn2+PlLfITfSG7CelHLamlcOA3ie0+xq/I7DbkREkJ8onoCXx5AwVj5Mgo+9uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786796571; c=relaxed/simple;
	bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=coX6JySYzYY1QWshM7LOLqlFsHSfdPo8ESTrsCZ9U81rWptubrwQsYitHEncxSh4E+ucTcMC8ji2i1WV9/yBj8RnlXZeu0wDzfB8SodaBcrjofwD0NW1FBuBUrrovp57Iv631lj0UVQS4RbUkAJCjnEbqzNRKyl0A3ZuFLUfOLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKIg3rtr; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKIg3rtr"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47df6a5655aso201856f8f.1
        for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 05:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786796568; x=1787401368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=gKIg3rtrZWW5ZRoDWz9ne4k5fxGJ9fn7NG48Kgsr9gWTuirbthIQd5aPR6+g7QkVsp
         R2GN0gCbJi0gg0kB/NSh7l35pdF38Gj9nmL1gQx+Nx7r2p2VuRf3cHFTQSyb5AAXc3uI
         Dx3J06vq6jSo58vyzao1ysbZ39C8uxIQAYhCTZx/SuXXUaqoaeOLD0GpYZlb56fT1/EM
         KkyYKGxconcfOL5wxL61ngWZlTMxznY5HVwVR1th6yKxMlCctS8acprTPCvyWyg4cjHr
         ZOvkDOGDEZXeviix4rn9iPItX1iZOv9Ssci9AUcavEoCcPs8fzz/E8I9Dx7lb15h+7mn
         NZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786796568; x=1787401368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=GyJL/DqB9ZRLjOHVYF7oqoO/ePlCazQtUdkuClFXfBanJno8hn5kog2q8P53R2Tnxf
         FNSOWTnTe0mK3Hy8W1VX5bRyigvIjLEo8IC/fV/6kElaS9meqZ6nvVFsAQaz8Auk2vfU
         xuKXcnf9MKJMrI1WK6fyrJD0KMbu8b4gnHL9EX/pQAbXmKPuC2nfCaDoI5JyXyLqbQL7
         PmeSoSQTN5cA7muTdKXm9EijoWYJHXH2FfGqBs7KPafVF4Z8kJFx5j5Z9EIV0XSMXNLO
         HcdPSlYTcs1yEo1lrCwaxCjh+yX8VqjiZVfoT04A/uP6bq5X7yyuHaSmlEFu7LQyT5qU
         W1Pw==
X-Forwarded-Encrypted: i=1; AHgh+RqgU+OE80u7ByySK1UjYpsLkprXN4ktvQ7Fr+cd1pGttRBJjvvw79CudfFLBFfnBZQen09Hk+ZvoBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHsYW4WaJnBGgHsfFuiPTiiJI6ytZXg1xzExVK5gkZJAlkmuHk
	0/TyiZW/mEfnK8P7AAyUCp/803AgtNvLFCMZcb/6T2/aws9dlHV6P6Ir
X-Gm-Gg: AR+sD13QWwHVVVBK3Ve7U68Rdp/mTVdDQ5sCT4J2eyApFz0u9Oy0AbzV2DZXhCQiyj+
	gNheVcTZea4UbqBIR8EQMif8g885mFr7xGnA/daRXQ23J6Mvb7QEI01PEAoo1Ekr26l1xpeoL7O
	yTP1+YFYtW6sZUhiika5bX+kVSdC3kcnkt6xNhiEqNNlvnftGqd2OFaq4/EkayHTiuI4zIsbr3u
	7y0Oedu+qiCHi6Ks5TJCLblXdmd56ja2e8KbjaWb5GFXgDtiAdg4opOP83zjQmDrZkeCecJXA/C
	rHvNFGSsP831DH8LXuFNaA2AiSHloiol//ene04N2EBtKhgyLFvq0qPzc0iP7u04JiX4ddT/4G3
	ax0KnGx7EiP15X6AfYOWtsWqtuMcew8oNqAWw7VEH//1e4DbW8OfPXT/fp9aMAqjMR5P28ZHK8Y
	EGVMjw55KDlHzbnPTbGUCGWNvNE1i6o4SdM+d3dZ8HFcYFvVOrBUM3XRVWed36TRF0iwXaoDimS
	HUtYFZydHkGyGN9eP4cwozEFEXZJQ4XWJkaHnRXZkv14+IGA6FwHjvzeFwCQqCzTTsm
X-Received: by 2002:a05:6000:2603:b0:47f:9256:52c0 with SMTP id ffacd0b85a97d-4816075e57emr8437144f8f.3.1786796568008;
        Sat, 15 Aug 2026 05:22:48 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B932600BF05B505F15B0ECC.dsl.pool.telekom.hu. [2001:4c4e:1b93:2600:bf05:b505:f15b:ecc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f1fff25sm26930649f8f.3.2026.08.15.05.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 05:22:47 -0700 (PDT)
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
Subject: Re: [PATCH v14 28/38] phy: core: add notifier infrastructure
Date: Sat, 15 Aug 2026 14:22:31 +0200
Message-ID: <20260815122239.65405-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-28-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com> <20260813-rockchip-usbdp-cleanup-v14-28-b5ad9c68fa11@collabora.com>
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
