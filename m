Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1382A3D6692
	for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 08:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782462181; cv=none; b=HTg5ZGxO7GmTTZ3ansmatNBw72A+2ASBsfZL+vRZSle3XdlqigPr8yhysbj93plvaNV7ar/T657Nintt8YUjCzpUVIOCpocOVDpuUj92r2rjBYAGxBew6m2rZMEqDG9a93JIc9ZQToDebieMGa3/Hts1aTz9o6fB4uk2zKOkNGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782462181; c=relaxed/simple;
	bh=OGlsf+7HqBjuGPfFGCf43g/lveRlVL3UB1JBJicsZSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ujMzn81QNoEAAetvTN/oIFbcbDD0mRODlnZq1Kori10cQgdkkVxuyGiY5Wxx+xc4qNECXZQOpUGYxx4NUNZj1vUABn4nOyQGmSYoDuM9qL0SrGJhKh8Et6sUmadx1BEGhlMP03ImUwljyi7gfHHK919BfjvAAvKmAw1LwJhzYXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jdzaD0k7; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jdzaD0k7"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37de961d1bfso663937a91.0
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 01:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782462179; x=1783066979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HzVIQilP3ckL+D+ToPJDoqRVs2r93lzUUB6zieccihg=;
        b=jdzaD0k7oobBZiY993Izdc7oC0hPRnpE1w1kzyF1GLkWpGakZ3EWv7dyp2s+ZFDofK
         WU7MEgrDXTzHtpOgu2Uh8z20Y4cq8TVgpqyRJQn8UfskCdl3IZgtCyvkf9ULcuQ0Vmu2
         qRt5TFO1PoOVII/CP3nDX4AGswuHRhcUIOVy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462179; x=1783066979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzVIQilP3ckL+D+ToPJDoqRVs2r93lzUUB6zieccihg=;
        b=cNo8PPhb0ONNMy9pZ07dZNmtlteO06XLmI+1f32QCsGNHl+42kqOdOIMIw9Dk08idb
         /P6FTurkUk53A7YMkaOaCIgmTRrDGKzk5+IT4xfsyfj3/RVMbxuW3RbEUyth39aHlLhW
         KLTvYxCoCi8p4ieWu1HuHaqKjbk/S3xBQNe2auQ+o2g9iBpAaoXq7tu/7YVG2xh0uL3B
         DBiJIwXdqdUYsvfkGybO+FAetypK9WKHGx2flY8HXHtS4xk8PuGySoCbWeuOkc3UykmU
         8M6AGwy8VNn1uQaclDPzrmP8UBmy8ZJjcI3xdljdynSjJblPjkm1XyMtL927cIhqnTP2
         XPSg==
X-Forwarded-Encrypted: i=1; AHgh+RrJTlhMHcjnsUel5njoFccHgyeyI3SHmKrILhhjfYVl/vaC93Ww7q5DAWM0uIQPilg0Op958B5ET1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOkkJSZWmVyZDLeooq3h3zj6B+y/D7GoV4Ug/sNsNoxf6AsAxQ
	vDuxX5WasgegCS9sgTi6+X9++DEEzQiR9ZXnDalRNq6P79nEILlG2lOrwDUR6b0ic2UbXUVWLAA
	Ewbw=
X-Gm-Gg: AfdE7cnh8fNGoh41N4+qUrf+StePfDEhtt7jhfa1ahPlnoQjJqE/dTjI6QeRejp/A32
	7+CW+lnVXnM5mlauE4mw+2bek1Q69YzjT8zpKxaxIaAEywNcwyrdzG68yc/3HjTvbE9aYOaEqyx
	Klea9aHYb9IYcq7l412zWQcsRFa+NkweybrPe3gjZziFZsP7nVEWFs7ji2aXcbiuPGkbxOC8pn0
	dQtUDZSDYYUbYKIWneOylSiuzIPN2/wBkVmE+K4pP+qTcO4cb9BM/Z1r0elD0rkQrOEpgDAA9+O
	xRYKpUVQkyIJASup8eXeTDVrQXFLFSu5cYrA9kVEtY3AnvmVBaVEHmNuMPtIJTxezwlJxPFeZwb
	ont1WXLwuyaQmRs/AexGO5h/mFx9RotBEtnMOUAqc/jiaVD581TG/H/xPMFR8WUWPGgiyz70LSs
	HywQrqppUXWHgL7hMnZEBPXlvZQQMo+k/4a92tLL8Wy+k3dqbLobyeapfxh8XM2iHMqb6ohwc=
X-Received: by 2002:a17:903:2a8f:b0:2c8:218d:4373 with SMTP id d9443c01a7336-2c8218d4499mr8132345ad.10.1782462179430;
        Fri, 26 Jun 2026 01:22:59 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:201d:8:2593:3e55:e36c:f47d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f64dcc30sm34619185ad.66.2026.06.26.01.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:22:58 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Fei Shao <fshao@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 0/2] usb: mtu3: fix system suspend failure and improve gadget PM
Date: Fri, 26 Jun 2026 16:21:50 +0800
Message-ID: <20260626082218.2750459-1-fshao@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


This series resolves system suspend failures and improves power
management in the MediaTek MTU3 USB driver when operating in gadget
mode:

Patch 1 fixes a system suspend failure when connected to a host by
restricting the active connection -EBUSY check to runtime autosuspend
and performing a soft disconnect.

Patch 2 improves PHY wakeup handling by conditioning setup on
device_may_wakeup() and restricting it to host mode or runtime suspend.

Regards,
Fei


Fei Shao (2):
  usb: mtu3: allow system suspend during active gadget connection
  usb: mtu3: condition PHY wakeup for host mode and runtime suspend

 drivers/usb/mtu3/mtu3_core.c | 11 ++++++++++-
 drivers/usb/mtu3/mtu3_plat.c |  3 ++-
 2 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.55.0.rc0.799.gd6f94ed593-goog

