Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E0D30C345
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 11:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248930; cv=none; b=pPE9w50nvK7pzBwzAqqPIc6Rw30d9qkHE5Igo1vvWgUSpxR4zxHUV2Hb/cofVgmaKx4kviVyZiDAAPm40O49AMikLuy6Z028r9HbPk0MM3flQ8b9gzbg4ZezwNOpht0JhJ+97Kt62B7PQIjS0hDK09w9Ae/w12Mcuk12+g6yK9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248930; c=relaxed/simple;
	bh=uiFHvkhXOb6IMewLT/2B7q8vIi57Er7K+/2dk+J48r0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M0HSkpHJbeyAfeobR3RbFre68W0taTqJaiPcBwQSFOBJ1Xamuq4Y0VjaHsfYtgohMGFeCf2cBjAfWGs1osvYSP9OWZ3zBDjc3V5fQn5ld1iOuCN5mgL5QczqQTuSUKa3Z3AA1NBF5r/o82ndYkD6iiKa0Q0bMRNUUj0S7SoUH+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4/SyL+H; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4/SyL+H"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4c79fso603248a12.0
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 04:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790248927; x=1790853727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lySLNT3l55Z/38cmHGiYCffXCvb6f9Aj/HKyCCwn2OY=;
        b=m4/SyL+H+Qe3Fui8bli4I8ePGVGrkjk8bpcmmQGiFUqw+dQLk2XcGyVt+tZnlrtKjE
         3/79OZLIVFmPtCbRP56ossOhU+lJCmElnUTHGFpip9Eu9il+kqBovpDCm159AyLfy/ri
         9LtGWRO0kGHMbucbfOB8PhoRoJyJT5BQNRpTZa93/sJcFz5xB5AdKoylP4OoazPiSK/g
         4H1T6O5pfMNzj0VrJ8xMcAxIHo3H775GCZjfsr9E8LYenzTcs8ukhmpS7Q2jrnhiYPNM
         PSVQhxgYApqq2I8At1BmPY+ob/r8sKN11Vmdcl8RjovLBoMSHdAcMh9e6KI0VGW9/76X
         D+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248927; x=1790853727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lySLNT3l55Z/38cmHGiYCffXCvb6f9Aj/HKyCCwn2OY=;
        b=sSkywYiiRRMQOIonS5NJa4cmuo9V7HnhGPJ817vTsqrduVuw5PsYr4gg72xg37BB8M
         TcIhupKvXdIHN2IFG7t5zMGV29YhMMNFbSgFwPuf7qCiaAmgUwesefpBvnVKFepnUAyn
         rmKm+3eLGicMn5zEmfTIRuPa+PBImR7FhMqvgOJfs1cKhbmE0wUPDOVclJOm+fLjSEqy
         dWK22+WZK97fyKwNRko0YwgM37KxgntzqH6xF6TqKP/vV5HnRF4tlr1kYJnWzLEE12dH
         zvU3AXzG71OtvIubW12Q7mOnYf/KfPO/IkrvEBJ9bnzguz0zNCaZezDs/rwitbyoOGkf
         9SZA==
X-Gm-Message-State: AFuF++mVi8l4npJvzDkl0+MJccncRLBt42HKg97BjGzbkj8d0f6dCVD6
	CnvM2OvsvFTzrTwU06coUnfWOyMKd/lN/xvuISkgh/i8R+9B29CLYtp2
X-Gm-Gg: AYBFou3jKask8TEzeNEyx78AJwVBznm3HwDnBC5s+TCFDUWA+dREKxaJ3UP+7FfSmN9
	KSbNBLQM8t3568bE59USaq+1R2v+/I5muwCweQ6j9SPum0GUtMRCyEP2ASpXZUqwmBMvsdZygEQ
	Y1H4O7r8lM/qnRPUbDHha6K/eTr1a0wx55Kv2j5DiR6tiIXJk9OLhQOyALJM1teQy5w78qFy/Kh
	55U94ZX04Sp3AabJTQd6i3XrrqzZwNQ3id+pnn8WNS7FyVdzB5jDgPjAasaV4HuZCWF0Nl+IOoP
	jB32OH+pCBoF3t1xutu86l37drm2ceUisr7mVkL46u10TEwR+7zIL1P5m0VLP7hYSnEdMb7U+jq
	tGqedJnfAub0OuOz9Yw/UyoC8PJ1GltLle6SbUzZFeXNuirEe2Oqx5EWZ5JkuYTf9T/abRoYdfG
	s9j+Ic5cJ8cTA7zkBBuH5RuyV0/J3V3zQS5vR9NYj4P7vx374VhndvDA==
X-Received: by 2002:a17:90b:2748:b0:3a0:7dea:6dd4 with SMTP id 98e67ed59e1d1-3a098570051mr1788571a91.7.1790248926599;
        Thu, 24 Sep 2026 04:22:06 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3b82aasm2569713a12.9.2026.09.24.04.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:22:06 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: gregkh@linuxfoundation.org,
	mathias.nyman@intel.com,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rosenp@gmail.com,
	kees@kernel.org,
	lgs201920130244@gmail.com,
	avorontsov@ru.mvista.com,
	linux-tegra@vger.kernel.org,
	jckuo@nvidia.com,
	eeodqql09@gmail.com,
	stern@rowland.harvard.edu,
	davidm@egauge.net
Subject: [PATCH 0/3] usb: host: balance resource lifetimes in host drivers
Date: Thu, 24 Sep 2026 19:21:53 +0800
Message-ID: <20260924112156.1564208-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several USB host drivers leave resources or references acquired in probe
unbalanced after the successful path.

Add the missing IRQ/MMIO, device-node, and buffer releases at the
corresponding lifetime endpoints, using existing probe cleanup as the
reference.

Guangshuo Li (3):
  usb: fhci: release IRQ and MMIO mappings on remove
  usb: xhci: tegra: release padctl node reference after probe
  usb: max3421: Free transfer buffers on remove

 drivers/usb/host/fhci-hcd.c    | 2 ++
 drivers/usb/host/max3421-hcd.c | 2 ++
 drivers/usb/host/xhci-tegra.c  | 1 +
 3 files changed, 5 insertions(+)


base-commit: f03c39de3a1307371a4032757cd1732e91087c7d
-- 
2.43.0

