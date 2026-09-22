Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097833A8722
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 02:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045306; cv=none; b=MVI8VV3FEEJh/cjOBl2QYT8kAnwcaTVWw6HC+1iAX9O2nBiFGsxoSWaNhxNNDnlSokGKmMHse9XHm79eq0Q2/WyjoPAemKZEHjmKGLrRAkquq06WJVsA0DkDRv50unLadNS5ogi/SZxPdMFhoKF6OzA3p+m5V0ez9oA+0RX9lRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045306; c=relaxed/simple;
	bh=EJ2P31Mop4LFkYlYUXipIp6N57OpGRj1yqrRk3odRS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sibl6NXdlbGHa8QJUiZeV6xEiGiJruQ183bL270f2d/iXEby51ksFVZdXO951Cb7q0uRELy5PRdkf2/BMvnNubhUmsNFE0coJTfkbt681sMLvlSK9JC5tGzDSMMPZivkMPuLZ8oOZxM+TvxFKpW5l8evOmy2ymOGcPKy9mul9ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYRFahFj; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYRFahFj"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469f20513so3025405b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 19:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790045303; x=1790650103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2fqnxRDPGydfMihJ2OX+RSCvcoKZzlenNPZIcztBjRk=;
        b=MYRFahFjRk2z1BdH+H+7bCuD5vDdbX6PgGIYL91N+Xog3LidK6VUQ29WTKXcc7ozp2
         IyzaozvRbzggCl9LSSgzRwd4jiXn77c1DZKNNGeJ7m+pIpdodl7I86KCGrurBEzm5Snq
         Nx01W8xdOgmJcXOa6UawI+x5quwF82dLUTZkNnbOaepXVJ8j3255B7OrGAj+6H3W0HHr
         vGaR3CtCxUxA4Dc/BSL4RnXLuiR2qf0ZkQxqAAirphsCSFThxysF587kNHdJUmpEJOGa
         hfeCRlEJAdWc4oY3FGtMia1k/8YxZEBKrZfCkT7JmVQpVKOk1o5WXwFIJWeucdLZwJ13
         cFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045303; x=1790650103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2fqnxRDPGydfMihJ2OX+RSCvcoKZzlenNPZIcztBjRk=;
        b=JfFHd03izwCjLcWafP6e1BG+Hb6uGmk2L/KbUu/03RccPXRNmzcOPmi/cjPiK70HtV
         lIwyA+YIq6ZYUrWzalrkV3fVFqxPhUSanNakzD2tpDEmOK1sy6SaLX7twhY6Lsv4cpfB
         S0zdc9pdBSDeqYFowqpXVys9++o8ancIYy+VYHiB3GsE3b8PP6wehcGBlwG09DtHvYg5
         BptKgrZCwe01NUR01nsO5uca5MHREY+/NFPlZDQZlwGC/gxZ9kJ7QQk18UB46rI+6GGQ
         pS80SfF7OOEMm85QKkXbkwSCrXUU+8Z9NL2AA2Lwf6tR8nSPFjloJ8o4OjAnGk+piNZN
         pEGw==
X-Forwarded-Encrypted: i=1; AKwUvBy0CSWoQbkardJukQcNF8neBDll+h6jFLNINuOfsOsMcB/LghBxPANMTbyhpwMl5+CO8TvP8/fUpdw=@vger.kernel.org
X-Gm-Message-State: AFuF++m5VuZHFJShnc9lwrep5VX+QxfxCIuVCfzWHX2jHuV0XgUV3luw
	ptNX9/mR8cGh9QTV2f+QYhSMyMJPpsEDHua1Hea/9dR5Cotc+Khjpqa6
X-Gm-Gg: AYBFou2qm3YgKR9jxUMLYadFZTZTV1sO9EHEIOMp4Z34d/7vDn+3QnWpl+UNj+lQidl
	4H9YCBgW05CMdQz6gjOwFsmVEFmQFXP5m3TZOr8dIHWm4mXczwRb3GBqv+YUwEAC1VE+xz6kSiU
	JV1sL1Wzt7cCBiiq5aQsA8wWc0yfi/sZLIEAcJThjIBQdezxPT490hazvkwDTMANcoMBeq6dFB0
	x/oNQMw/MT64fdtOYBOQDaPvxsWUu3vQaiJLtYxiHECPe4lQ1AdJf8vg7Ln3RVXixhJhc0yR4nk
	fu2h0AQAkpKSMNLSQ8Si7xjaNggAH5JWFAdDfx67kTXmr7RxNgHU4fo8Ass+MA0cUhPms3kDSkg
	LSyA01o8B1/BOgqYXx3P/85xkyfUfjq97h9PJOgxSvzBkrowOHkuLmhfCpzlQBDAwC2rVu1M2LM
	4R0qFXlYp11VXmPUH1/23CDX9dGjI1TG8eVUHcx4bPxNFtEXC5w4cYiGskqir4COGgaw1hdn/1p
	ABz/CY=
X-Received: by 2002:a05:6a21:6282:b0:3dd:a197:7362 with SMTP id adf61e73a8af0-3dda1977457mr14288897637.59.1790045302885;
        Mon, 21 Sep 2026 19:48:22 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc756a18d4fsm115091a12.11.2026.09.21.19.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:48:22 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Damon Ding <damon.ding@rock-chips.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [RFC PATCH 0/5] phy: core: Use EOPNOTSUPP for disabled blob return value
Date: Tue, 22 Sep 2026 10:47:15 +0800
Message-ID: <20260922024724.191412-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the phy subsystem uses ENOSYS for dummy blob functions,
it does not reflect the function state correctly. As kernel already
has EOPNOTSUPP for disabled blob function, replace ENOSYS with
EOPNOTSUPP for a clear return value.

Inochi Amaoto (5):
  phy: core: Use EOPNOTSUPP for disabled blob return value
  ata: libahci_platform: Adapt the return value changed for disabled
    blob
  usb: dwc2: Adapt the return value changed for disabled blob
  usb: dwc3: core: Adapt the return value changed for disabled blob
  drm: bridge: analogix/dp: Adapt the return value changed for disabled
    blob

 drivers/ata/libahci_platform.c                |  4 +-
 .../drm/bridge/analogix/analogix_dp_core.c    |  2 +-
 drivers/usb/dwc2/platform.c                   |  2 +-
 drivers/usb/dwc3/core.c                       |  4 +-
 include/linux/phy/phy.h                       | 52 +++++++++----------
 5 files changed, 32 insertions(+), 32 deletions(-)

--
2.55.0

