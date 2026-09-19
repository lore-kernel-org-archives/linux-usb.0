Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8086E36F433
	for <linux-usb@vger.kernel.org>; Sat, 19 Sep 2026 05:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795700; cv=none; b=iKy87JTfeSeCVs40Z9m1sLKlHnS11pTnweEe80Wf7FOGJLn494h9lo4hFPmSSYUordRk91LF2tZJfSaDrGph+Z4PKGNARwLOarvPaqBC+gSWdcziRr9xMiqyOwXhT6mU23pOc/tJdZeE+o8d/yTFLI3znSUYanbtumHKyU3oo2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795700; c=relaxed/simple;
	bh=XGSV+AS7zo+eJ8siol0hx4qHIx/7630SuzlQSpM+jTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D74/B1sInG5KGb05wrjf2Jv4arh0MtfOtoB4aW+fjfPPBM7jk7aktF4CJaYadBWMDKy0ctOKzoB6oEdct7168Zph4GPeydPvNEGblltLdwKhdbZT7edg0nHTqaToN/rBhD+7p0j8RXU+qDD5ZODLTeBBvTuMDScSDGB0PavI4LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNz0F4LA; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNz0F4LA"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd88a115ebso12254155ad.2
        for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 22:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789795699; x=1790400499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGSV+AS7zo+eJ8siol0hx4qHIx/7630SuzlQSpM+jTw=;
        b=FNz0F4LAv8/Otzb4JIJWhwJWjSADMcM/P3aCbQ0hMeXa98oRqpPFDg5e9pHCi3Re2l
         bp/63VvKDeEiv29uwP6yXnjlPGmYvlf6TPqbYXc7faCcLo9ZM1jtFPC8RaMMNGQ8FTFt
         kddKklIXO+AmobnlvzJPkzhc4I8xwRvRlwgOk/1M+N3YzH5mVD0sJQBQ4LQ/5fI9Tu+N
         NlD8k3McR02W6icyCrSAe46fd2+7QRfsa1wy2Tj24B9emGAfqsaoNLRo3uDlg9kYFs0l
         AzC8/S+7uhUN4yqy8zOKLIWtJO1cd91mo/877LbIHpbcVjM4ABI4VX8Y984U/Jcqc1kZ
         Nlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789795699; x=1790400499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XGSV+AS7zo+eJ8siol0hx4qHIx/7630SuzlQSpM+jTw=;
        b=wykik893b/9Pc9RgpYeEvwu+ewr6q3F0sQNfLAIT/Rn14IABPeskiH1sa1eeLE8SBS
         ycY0gbftayEgEcn90Dv1pdB8KOZmm1ozdSj3H7ROOVBIlpnsn85+2vTg3jrCb5ALSA/q
         ahGo1o7ahDB31OL6BA/YQpj5wfvV5LfQegg9mAXgGfQCJY7s8HsPbQw+wFDvGcMAeTkG
         0Mk+X2FPtCJ/sEbskgTM5LahqYfKYcN4+RdZs6e5veepx4ciS7H5aufiUzqdh97z/ns+
         e/PR3bUz91fw9SJlyxlXiMYfkq9Tf/z4l3Y2ehyCiSnLo10NFApHS72d+OZz9jL2SX0m
         +fBg==
X-Forwarded-Encrypted: i=1; AKwUvBzKnlIFQes1xNXvFiVvSkhL8bKVnVEdJlCifmG8tdyMMSL53cDieO12ALQDF5M1M1nI30c3ltiS3cA=@vger.kernel.org
X-Gm-Message-State: AFuF++mK+BfOBK7azZuPedSyx6gyV0ndSgTOaVRsDQahBVwZ8bxNqELf
	xJnOysCrLLYxvZYJrWt88F4eDw8iS7HfqKFADo9flVswFPQKA/lyThKa
X-Gm-Gg: AYBFou17J1R5gcXxO//pTp+qwTADeECqdM1KbFc0gYA3zdh1eL0Tbllt0T7ocYR9DrE
	0KwlTDD62iiGQXlFGn9Aq5qAHdGWdVPB0OLp7rvOMsfW6qgU4RAr0gG2sJr9FOAkVwV3Dg3O/SO
	kbcGCB3pmHSf5xg1Qr+0hT3ewqkJpYrtAcfrfmCG8NaJWFtVeR9PMqoUn28dZwGTUulCKUiw1pr
	8W0DyQSVo61aPcz1uLW0tleuvdwffuGO1/e0uSwy1CNX5Ev1nAVYWUFvzpt6Lpy9vshTbeS+znd
	YMVrVIMKh1leKSsvB8tDnMyeG1U8cUAQlRZt4ZhfXVQFitWx2Yj+Rm9Dddg0Gqea/ZEisKT/6AG
	nxcGTjLTdXbti76CJ1Odx4oR91yhJ3VF5ylkI/GnF4kH8lm6qr0Yd7GsgGyZaSb35l07XJspvdw
	PW3Amr4CgJSq2mOtZ2fOPY/VrlZXMCPkFMO7LU2YYBVTK6Q2tNxIp5RxGXkfuZzpqE5VyJewuW+
	mbU0/02eoSXf33Quz4GV5hAM3H4y9SVh4hRaRBfrA1YkjgjoJo=
X-Received: by 2002:a17:903:2f8c:b0:2dd:c100:4250 with SMTP id d9443c01a7336-2ddc10044ccmr24575385ad.52.1789795698846;
        Fri, 18 Sep 2026 22:28:18 -0700 (PDT)
Received: from Inspiron5409 ([2a09:bac5:4437:2791::3f1:16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc179dc83sm5367555ad.33.2026.09.18.22.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 22:28:17 -0700 (PDT)
From: Jianhui Xu <neuromoments@gmail.com>
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch,
	andrew@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	hkallweit1@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux@armlinux.org.uk,
	nb@tipi-net.de,
	netdev@vger.kernel.org,
	neuromoments@gmail.com,
	pabeni@redhat.com
Subject: Re: [PATCH v12 0/15] ax88179_178a: Add support for AX88179A-based chips
Date: Sat, 19 Sep 2026 13:28:11 +0800
Message-ID: <20260919052811.2059672-1-neuromoments@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916-ax88179a-v12-0-60c04c9924a2@birger-koblitz.de>
References: <20260916-ax88179a-v12-0-60c04c9924a2@birger-koblitz.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Birger,

I tested v12 on the same ASIX AX88179B adapter. All 15 patches applied to
the declared base 1bb784eb6e38fd73143f021608e4ef3095d0c0d7. The full
kernel/modules build and focused W=1 builds for phylink.o, phy.o,
ax88179.o, and ax88796b.o passed.

For QEMU runtime testing I again applied Chen-Yu Tsai's `usb: xhci: Fix
HCS_ERST_MAX conversion` patch. Without it, this base cannot initialize
QEMU's xHCI controller. No AX88179 or PHY source was changed.

The fresh functional run completed cold DHCP at 1000baseT/Full without
a reload and passed the 1000/100/10/1000 Mbit/s matrix, EEE
disable/restore, pause enable/restore, EEPROM read, module reload, and QEMU
USB detach/reattach. Ten additional 100/full-to-1000/full cycles passed
both endpoints with bound traffic and RX growth; I did not reproduce the
earlier carrier-loss or carrier-without-RX failures.

I also directly exercised the new phylink MII ioctl path. Read-only
SIOCGMIIPHY and SIOCGMIIREG requests both succeeded and returned PHY
address 3 and register 0 value 0x1040.

One fresh `wol d` and three independent fresh `wol g` QEMU deep-S3 cycles
all passed. Every cycle was monitor-confirmed suspended, resumed at
1000baseT/Full, and passed immediate, +10-second, and +20-second traffic/RX
checks.

Tested-by: Jianhui Xu <neuromoments@gmail.com>

Thanks,
Jianhui
