Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6972A4BEE36
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 01:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435227; cv=none; b=dJyVl4rLb+DTDgzNHd9VWUlOjks1y+/xG5xvM22Q2XHQ1P+qUXaWn9C8BIy+IUzb5R+faLFBmVv154RLtrK/w27GeCXzoIlvlCOqvhGQcWtOy01y23VgLUnwlw17Ql9Cl+F1AqfnubK0d4aFijSpceJdHRIoAPJPS3eubRwkW7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435227; c=relaxed/simple;
	bh=zLBagadYIkgHnlxLvmsxj4cwyFqnUnBYuMtGNS57J5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q8THgr7lx40DMGHKbOq2J4JsEtnRxkKy4gyvfAL6CApjtVMSQsM7WKBjCK+vLQ/+76JWW3X6of/ZcnLqbR/xcaC1LfSNZfQsIaTtuIiiwiS3kDmJ1GWCwsqxRWfhlB3oIgV01RnsC3bMqi2KmovKEDxd1NC1JTZIH3XGvhpADrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRwU3e2l; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRwU3e2l"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530de452c33so35992051cf.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 18:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435224; x=1790040024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HicEH3nO+EqTxA/vkVDZn60ZwfdK+A3BWy3aE6/nD5g=;
        b=KRwU3e2lJzL9bN3kEEQJUTJr4GgPM7IrPwwDPdOjhocptk3gvGY9kIJB8so/YHEuzp
         CEtbSw19rJO+Yv88kbXpFJr6VaJDe0s/4zImniUjnSueh2UvYlvt7jtsL1OISb6/0cQi
         BaMjMgsfm4s5lkhpyqXj201Hb4AqLIXNLPCg7fHD1QLwRHMmPdTGhrFSwEKHNxci1wiY
         otECcYsoKcS/tLKCUmQwmZZoqf697lYYOkQcjhRUYAMJWFIj3GxX2pOSxFiehJ2vtKdq
         GZgYQuRWut0cAQve2uFIAb6MlwYBta9lXS3+eQ/Iy+6ROXn0pB2KaDkNoeE/2JA+prn3
         9hQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435224; x=1790040024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HicEH3nO+EqTxA/vkVDZn60ZwfdK+A3BWy3aE6/nD5g=;
        b=dOfMbiInNpiNhO70FQ60hW9ksxzqSJM0TSiaM+jPbnOia4DsHXZh4vD++9HEnSw/Ab
         GjBJc6P9Xt0CjIMFmBJUwuMSi5bVJYT5L1vLekpZbjl17yPueNzkkcVtzyVkZH+od1DI
         /OhwgyEphZBHPZL/vQ/feS2fhFQvqsAQoeNmQEe50CZh+vI5+Wil1r/Ssc4dfZVxIhbN
         EHoDAijG804ZxgdEXULFUapqAGOg9P4rCJhQjbxEwBqiZ5k3pIpY+N2DxPjflzbMAgi3
         Ko3USREl9PgK9bQXuS2y1NSHyof3CcsaWDjtHfg8m96yX/qekY399VbmJmzfbXtXVRoe
         yVTg==
X-Forwarded-Encrypted: i=1; AKwUvBxnN7tzeWBDWn1OneKIEBPRQrpMGSYYkjrU0dv9CMYtdBaHtGnHONMMlTt338bW5qSCR3Y8DftQN+I=@vger.kernel.org
X-Gm-Message-State: AFuF++klUBYs+LO2jeZEMFjGlj7YfN9os/kJ7zfU1VXYcsywGK6Dkt2f
	iRpKaXmmf6m1gI7AJQ2Jke/lpu3gmz3G28MRNcLQyrhFnjROaUobB/k=
X-Gm-Gg: AYBFou0mch29aya0hLk+rB45r7bROf2MiSGww4J2O2w1Xf8kfi25sVCLI/+x9Gfzm/b
	SfNqqTaEo2PhE2MhiouI4wLAILL9wBs3FyGLLr70V7XgZ/Phv0/CGXWCi7OMMdEIQ6M0EmcndMe
	3nVuSKhOT4Op3ttSPUkm2nSqGND3rCNfc6ARGlhgYqLtWDoerUYlJ0bZ61YJOCUtxLsKRk/+CBf
	Qs2HSII7ElsfCvLmjhfQO9oHcL5XLAEu7W6lRv4t/U3kc8pd0Ekpu4Vfpyvz7qirGl+Wn2+iOwf
	foZVCJRDCs/HehCtoaYqV0Ldjxxhg3/HiifzzecyjxIL9pL3ekzr20BO580gjpOHT6wZYf9caPC
	UMIcAnXbfEKHmpESuFgWMBcJvyvuLiSObjF3GZpukqiUvr6Nd61h3XoLkE1Q3kI0xkevCZujD4v
	6xBVUv5k2rFFnrsLaMDuSdmXBezzKiiO2NXc4aFOjUModL3OtjfkJm8IY73oyyTUHDFIMVSFqWX
	K7i/FF71G/NeBm7hkbJCo9pTsrgu4LulF/2e2QQOnrBNzq3yPgQlzWEfWgSdGV/48aPkudzdUtE
	Jkvu1rl5WuGDDxoxUGsft2ilkpUOhj3f4nYxXVBlxX/vBJpLjTA5CZGYQgvf3q3n3KLrOA==
X-Received: by 2002:a05:622a:4c8:b0:530:1613:e09e with SMTP id d75a77b69052e-5310cf14c2cmr70974781cf.1.1789435220207;
        Mon, 14 Sep 2026 18:20:20 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a62b783sm91141946d6.23.2026.09.14.18.20.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:20:18 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 0/4] usb: ohci: Balance controller wakeup on cleanup
Date: Mon, 14 Sep 2026 21:20:07 -0400
Message-ID: <20260915012011.61874-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These four independent fixes disable controller wakeup after HCD removal
in the DA8xx, S3C2410, SPEAr and ST drivers. DA8xx also needs the same
cleanup when notifier registration fails after the HCD is added.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Assisted-by: LLM

Myeonghun Pak (4):
  usb: ohci-da8xx: disable controller wakeup on cleanup
  usb: ohci-s3c2410: disable controller wakeup on removal
  usb: ohci-spear: disable controller wakeup on removal
  usb: ohci-st: disable controller wakeup on removal
