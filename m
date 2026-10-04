Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCD6416115
	for <linux-usb@vger.kernel.org>; Sun,  4 Oct 2026 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791106497; cv=none; b=P6+cJV8HBdG2PghMn/MIaoQenmTxn25/Wrt6gZK1xSuioWO+HzpIJ5zz6ppsA99Fs1KPy+abyhYPIrv3adO1tP3/Sias8hTHOElvKBktNjoz2t6wVV6oAik+eUTAD523oteUiOGD0R8EWEJicn9Vnm4W/FkVhYskSm8b0YSNyOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791106497; c=relaxed/simple;
	bh=WGiqPu03Hx9bYtodW4R+dJT8EyhvwKq/2ya9h1+2Mt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aY19L7pWt0vN21Ajn2bC64mgCkxm3BcaYecZ+jI1zpvUDv+Hg37bX5lLyCn7naAVW8mCotuObyu0W4lCiA28LJ/1oYocHnOE3GGQyHm4vCueR+2bzeqZWLpUEEJ47r7hYpwqUBoeTOnLCp5B72tx0jtEWW5+cf64d3GoLHUgcFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nd3XCK01; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nd3XCK01"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-86aecf49833so101508b3a.0
        for <linux-usb@vger.kernel.org>; Sun, 04 Oct 2026 02:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791106492; x=1791711292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xMFsAlTkgLQleDkb6BgHggPAQsd5lT/CEjafnTCRCdw=;
        b=nd3XCK01dCMPey50rbwtI+hfsRKQWrAmJLFbL+YCGlh9J4LvT1xLjAefoNbN81Yhjs
         5kyxhh+GS8gOijFjCa1/HyAtWT+fnf6lb7VveTGyTT1CkAsHzmX6fCowEuK1a89BPoaX
         aTA9o3yFwdWTlIttPZZ2XM/IOsSrvYRlVRbO+vcxjXH2rHqhZ2q1sL25f5U+iRyfLtoe
         ZLsyQ/PSy/MS0deM2orWCsuNhJTa1yMDhkzCzOIIpiJoSdcsAzbR2zhj6FABW5XOKmd9
         Mr/gFTSKPMMDd11rHm3V/K37qBZBy0i3xD6BKVuEvUYwwg9/NJUHMrk99sjI/pXdLdI8
         7uVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791106492; x=1791711292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xMFsAlTkgLQleDkb6BgHggPAQsd5lT/CEjafnTCRCdw=;
        b=o7DHfKl0k3alDCJqYUHvWSeiwa1pxGmmEKgn+sphqqj3eFD9hlNWvf/eAcDPE3/+oI
         ATF26QFdPKVhpphRl5WZnbBvTYouKL9nlT8KRD5r2isueM9LZqjtCKBygQWrlUkefdVD
         BzXvgf1vb6byR7+6EdgxbO0t/PQBqg9aRS55uun5VIywmK2tnFeE1PTz9Honm2Fkm9AC
         KP1WLuSDKJ2GO9UMvnftg2paqdugGxSoyK6Ee0iYV0zsSwNHKmPc7z5rb2NSfvOI3etR
         XZrwjeE2915Pw31dm0Nrdxpx0OWEEWQI/GOKmJtIYuKpca+qjFP0L4H010QBDiuxu+xo
         fgCg==
X-Forwarded-Encrypted: i=1; AKwUvBw8y6+OX4YGOt2Mbm9GeQdW2gXgYn2efIAADD55hJoey7ij6p57IDR8plcH0Kw552fYcNzbGP5iq4U=@vger.kernel.org
X-Gm-Message-State: AFuF++l9SSsH0O/igdqopbm4i9aE7lAM7DcSqJB6CkYxdosVz3mfpJ8s
	9mfgllQghaJz3ruKfB221uslNqmakRPyfm7m5HhckpOPl0ED58A2cz21
X-Gm-Gg: AYBFou0QN58U9urdQbgeekYC4KtfLi5EPWjg3O/wV/iYioIwLI2k7KTBm+4fvb/GVDG
	GS1KMaFP/cTycUQkt7m5MkT6TZ/psUsupiMvT0pePA9YuxgY51eViMDbGpz12qwWE/kbfd7xR8U
	cAfVwlC3LoCmuB/PuP+KFvItK1/Q3vsFcnWPoTntW+Jx9071TBkKMUI7f3d8+m2uUUafWP6WUUX
	2TfaVKM2/fq4KYFPJUhI9hLuTD842g7m+zzn2DYvt4oEtO8BNSWo3EEbtqASuH+GNkYWWpit5rq
	J82dmqP55A3i2SHU+ArjYFA/cmMk2d7mLKgTiZh/yW902xbGtnz6HYv7E5McNtZvz2OVPGldNU5
	kfUm18AUF8WT6y3twzbTNXSlv9jcUym8irQDH+xQgcFrnJqwZmibrl1JJGhilM0J07uNHaOCEMP
	jrh7cKpmxiV7xhHG99pbdlURrm0ShyMjH/H22A5VsntuJOtZvoBjDsvPcmNASHFGPQ4ix7vKkRf
	ON+R4VAZJwltg==
X-Received: by 2002:a05:6a00:2d92:b0:882:4cdd:140e with SMTP id d2e1a72fcca58-887fd634a7fmr6960101b3a.15.1791106491984;
        Sun, 04 Oct 2026 02:34:51 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88d62aaf2f8sm620337b3a.10.2026.10.04.02.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:34:51 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Joonhoe Kim <26rote@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/5] Modify interrupt handling for eUSB2 Phy targets
Date: Sun,  4 Oct 2026 18:34:49 +0900
Message-ID: <20261004093449.74244-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Sep 13, 2026 at 08:10:43PM +0530, Krishna Kurapati wrote:
> Changes pushed on top of usb-next branch. And v8 is only compile tested.

I ran v8 on a Lenovo Legion Tab Y700 Gen 5 (Kaanapali, M31 eUSB2 PHY),
v7.3-rc4 plus board patches. Host mode, wakeup enabled, s2idle:

 - hub with a FS keyboard behind it: no early wakeup in 10 RTC-timed
   cycles, and a key press wakes the system (dm_hs_phy_irq). Without
   the series it woke up right after entering suspend (dp_hs_phy_irq).
 - FS keyboard directly on the port: a key press wakes the system.
 - unplugging the hub during suspend wakes the system.
 - wakeup disabled: no change from before.
 - low speed: not tested, I have no LS device.

Only the m31 and dwc3-qcom parts were exercised; the snps-eusb2 change
was only built.

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Legion Tab Y700 Gen 5 (Kaanapali, M31 eUSB2 PHY)
