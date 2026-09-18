Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E88133D506
	for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 02:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789699064; cv=none; b=jsEMPfZS5ArrZCKg9kn2tc4wOQ838Qb47k4Vb9RgggFiHcEanez7MlEpPjgRgJbCn6YXPyg+SSJU1Z17fNlGst6KWkZY1+yeV7eJjGH7PeysnaeBF53dgzEVmK6pSUEoQ1mDP0ZwgHLAZSLkbWfCOz4bSC9N2Lm70batHAtchtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789699064; c=relaxed/simple;
	bh=Xp96osNKNV73rMrH2Cx3GnQRPM4ktS3CCX6WmIYhStg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XqQOeRsf/oks6wts6IaqwwBoc0RFoiHPaKPOik1Sf1wUnFWga3xZKfQL6eETf2YGzxWA1SM1uXPSSmDAHQ+2lVktVEuvEAEMAj22efd6la1vSEB9DEmbEtvpmiXEx7kLi8sLT3qhmy9s5O4yBlIO+RKFCNf5nc9Rs8wkwZoaz54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyZuyCN/; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyZuyCN/"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b35601so158493b3a.3
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 19:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789699060; x=1790303860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xp96osNKNV73rMrH2Cx3GnQRPM4ktS3CCX6WmIYhStg=;
        b=EyZuyCN/syvco3JhnB2GfxTcORb7BNAMn1ycHBVGDA+XFfz0jZtTFt3p3y+VbhqTUe
         V14jR4X37jc3sS8Pyj3SbcWjXSiLjt/weWWvAQiy2wGWPFkVV8wQ8M7eoZL3/+3i+HVV
         kENsJIlV0HbFwZVZJ3qehnwecztKvzrulHyBIhelGVfqynMKHzfqJBvZu5fsiX/iB9T8
         nQWT8CywZCgCj133xgjlGHJ/0ttIAiykJ9hZgeIOgkyqgeOoG7Fss31kl5MuVrTF4dAJ
         8fHHhR0wD3eYg44zY/N6txioltVk/BPYrp0Zt4AAfHyfIAfmAMxchO4TZfMFl6pkQ4u2
         MVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789699060; x=1790303860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xp96osNKNV73rMrH2Cx3GnQRPM4ktS3CCX6WmIYhStg=;
        b=cuxE5+8dArVjXTpr62ivYHNeZ2Psg4rIfU8L5NGaq2xuckb5xtVid45t09+ma/C6No
         L85WbMzgsfv8LrxCmiOsIvXvZ7n5ztMUp0GYDWLZNZ1HM5rhA5R2rZ0tLStOMo8/INWs
         J9Z+FKmC4ebT405FMjHeRrsYhU6Eh4K8D2/XCSAhevu5i10D30J9frl30grIxhwwnQou
         0H2XJEmwletIoBSVFsI8ENr7H9r1u43ToLKneLHDSY0jhYsMEC9KcQp2bWJRcSfcit6d
         jykq1Qe7p6fus8FAedWrASX/ddRlwmCTgH5AshDDiTCvRbnNjSwL8TlZyvgdxCY4QrM3
         Vbvw==
X-Forwarded-Encrypted: i=1; AKwUvBwJl8r0IpAix6E3AttZ6uzqoZTwWSME3yCL7eoqpNtaoBaMIBTq3LJQKxF3hC65xZB1aRgRCp2SMYE=@vger.kernel.org
X-Gm-Message-State: AFuF++ltoYgqfobu3e7FPC0SzN+77XE4PXSHmTrgPv4G16ooZ6AhoYA2
	76Am8RIkykL5qM91SAigXEqtbvAsZQZy5iArsb1rx/NerjGqZAcg6gyW
X-Gm-Gg: AYBFou1+BJkaZ61MpCeugOGOPno9CrOYWOQW0Q/OrtEdDcJOy3k4TlqKstV4G1tLh1M
	ME4rVG0JuG4ujBRbZfgT+J3emtDbIfOoIUDpPZBpAdj+aLtd0fVik87VACp20qER3D3KVkfU0dU
	mdRduPNmKlmxFUvIqK9PTbqdVRqfaO3XdNI+I2W2JvmD1SXWAFfM34Y16ogHkEynIvqAaH8xftq
	90LC6xGHFQ+oAA2Lb+6m36FqcLIvnyiebg0vS2S7GDZmBbABqCDb3JzhJbMYUp7lMTptosDyO2i
	j6oFsvhr8V/6eJBIfgOecStsVO296UsEWCuDgO80+A3DhUxrTNiO/BZEASuHJJDcp/hRPgWQ9xr
	ZMNZpecgP8Rc1P+cvqyzxZRl4o1FywpWUdPXJZLnToqf/+xqDoJAUrCpes6UJ2VB/Tf9I3F9D+t
	B5AT3C+wzfPdP56jwKMwS3sawlL/YulixXu/AZ+/auI2e2ko/TQBiO4PKxF325MEzl
X-Received: by 2002:a05:6a00:4185:b0:86d:3958:6b13 with SMTP id d2e1a72fcca58-874dd5f0ecfmr1988918b3a.19.1789699059693;
        Thu, 17 Sep 2026 19:37:39 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::c570])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dd3ed2f5sm76564b3a.40.2026.09.17.19.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 19:37:39 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: gregkh@linuxfoundation.org
Cc: rosenp@gmail.com,
	kees@kernel.org,
	balbi@ti.com,
	tomoya.rohm@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: Re: [PATCH] usb: gadget: pch_udc: Disable VBUS work before removing the gadget
Date: Thu, 17 Sep 2026 20:37:24 -0600
Message-ID: <20260918023724.10584-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAGEsz8GQR2vJ8ddedaLg=Yq_RoeTxgoXTQ4-QS8mJpDXNn36qA@mail.gmail.com>
References: <CAGEsz8GQR2vJ8ddedaLg=Yq_RoeTxgoXTQ4-QS8mJpDXNn36qA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Ivy Lopez <skunkolee@gmail.com>
