Received: from mail-wr2-f16.google.com (mail-wr2-f16.google.com [74.125.225.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AD53C061F
	for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 12:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790510561; cv=none; b=PaSMDsnf2e3AehKHy696y8UxIHE+Z35j9UM/7rovXGAbe0KkLVyifHeMX1ewzanFUMCkLQO40slx0I7o3cNPykH4dN/Wjs3aqmPOJ3g+156t2VWFOTet5vl1DBr2T+zkr3hq/m9m9H7GZNVZb9GagT3YQr9Q8o02VEZnbWaU99Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790510561; c=relaxed/simple;
	bh=Z9paiwYidXUiqezPHTXQfCz85MHxLktOuWNdhVGUFAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ND1A3UwiKqST5KqrT0wal9Ia43xfzpWKil0sBy3esE/9BFnPQWLA7gszJmHh30Srcxw9AlJerGiiVCB63MXBVrHxdVvjKh9Fv6sXvlORHuFBE9sf/uCaM8UvjSUZkfDBQmojRXiOALEq/cQAUwUxfnJwqnyQFQZ5YZ4oN5Ztk70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPg4cJSF; arc=none smtp.client-ip=74.125.225.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPg4cJSF"
Received: by mail-wr2-f16.google.com with SMTP id ffacd0b85a97d-4843af75de5so209776f8f.3
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 05:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790510558; x=1791115358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=01429hMeoTXrkDg6gix/EcLJWWvM5W0z994eSFJkqXY=;
        b=ZPg4cJSFoAdxoDJNYLMrL5o4NDZGspi31Ah7F4mI1DWPRxj9DEPS9BcZwEXxcClWPc
         2OJ7TjxEORAM2pvsBKC0LrjH1rg4Korl/jhc6CFVRtOA+9wDyd1VvMkfwMr/dvYF4CHc
         hkkGUX0cp5aLdFUXsO5dDNywOQFs7iIQfj7KvqMrSkc7VgKnp+qkJHAIijrQKJVoMYSV
         epVLNsSjq+4pS5CSoEsihfx0Ok4RzluVUpFDDrNtKzmysf2RNHy3bQym8l7tiZuyysFx
         Z+CJNVGgMKkCS5TGuD93CdBg7t2D0qjHgLaHcFrp1jymh1mW6Lt/LOLVYCYbfpw1aLyf
         HsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790510558; x=1791115358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=01429hMeoTXrkDg6gix/EcLJWWvM5W0z994eSFJkqXY=;
        b=PNDGdbdSlk0wJWjw+tNMp+jnb8y9IPBsn/FoYMtIUD3bqIAG5pGXOmMLBOq+tsGqzB
         qQfOVswdTaRKElJvceWeVA5SyW0jIOn6Y1JD/mW6yteRj3x7azYL1Yx/F/n342TPztKf
         cTT85BezC66cTwdtOQQPhvOlKP+jhq7NUzo41JTsOlBpm03+5GK0wUD62eZ6yb05E9Y0
         DGVLtl+l8wVNM1Goi//ks3xXM1nnTQXklwaYea7RHYtBE/BRxEVNB9SImuC8rMXWeD8J
         sJW5uBQbgnTt3BM34K9qw1l+0QiBq3Gz9DA5whZewkcalywycLh8dBsH+fkmze1PG+7X
         UGaA==
X-Forwarded-Encrypted: i=1; AKwUvBwQm6GyNSTeZEV4rV6TySsRIxf+NE2Eeyy0B9Tt4DtzQiZdCk/kOsyUlvw9lnp8k8KlDOtFLDB++Wo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuYoA3z7Jb38SZrs5M438kKwizRiS024w1jD0Hb3o/Wb5YUvbs
	UfcVsPrW2cGhaIaE+Fo19BPbP59lg+TJGOBSRK7EnJGihHU88XgKhBaw
X-Gm-Gg: AYBFou2emoC4T34KSUWtGGukX903gghxMYGFwnBoUsGsdprdXbXhpXJjUK+wfWeOJIw
	A4CiJgW52jdHpguL2vesyDsDdVywLe5KBUqtXAlbKg91mMIVUd9mEPpION1HxyTR80slR/UA8Is
	98av2n9OIt7rhWm3MDN8c0kHJ3SJn93ZiyqBHMUKqLOBdyLm5kVvJi+KT5qjKg5MTH6v0YCP5E2
	lBjVHq8JFRiOTxFMSKdRkxrRMJddj3RHBtp6D4gF9hirzEC57wxP9I/Z0WDcTSTerq3AueiC8ls
	UeFOf2YBazZZXDka4AE73U7NxBY59oeQ7MIPfrI0K0Luybh+t2aYRnU1gmgXJEJzTuDZ8ZtEISt
	9GfgcvdOffSwpMYm00Xn6kIgrPMlcH25JlrlPuiQKI3TcWqfoTFeQ0/WzvW7lKL3lCW83VAg0BZ
	rAqHuBhYzHq8bDAwdW/MIbUo0gOGV3ZO/1xqMUuesyjTcFcuPEqWDhc+VS6rnxcDt78m/J+RA73
	EN+OOXUx5+ysCHCqP5n1d0ObI0Jy6TP/7ywhJNybimUJSScZQBO6H7DkA+pzWINOTJzSSUdU4EE
	dJ4=
X-Received: by 2002:a05:6000:481e:b0:485:8df0:dca with SMTP id ffacd0b85a97d-4887abb09d2mr14521475f8f.3.1790510558071;
        Sun, 27 Sep 2026 05:02:38 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B89A9009A7C72AB6C68D3F9.dsl.pool.telekom.hu. [2001:4c4e:1b89:a900:9a7c:72ab:6c68:d3f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6456f8sm19655495f8f.26.2026.09.27.05.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:02:37 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v16 0/6] usb: dwc3: introduce Rockchip glue driver
Date: Sun, 27 Sep 2026 14:02:29 +0200
Message-ID: <20260927120229.9664-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
References: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sebastian,

My tags on 1/6-4/6 are from v14. Since then 2/6 changed its PM ops
(v15 and v16) and 4/6 gained the two tracepoint exports, so I re-ran
my tests on v16. The tags still stand, and 5/6 plus the Kconfig line
in 6/6 fix the build failure I reported on v15 5/5 (posted as v1)
[1].

I tested on an Orange Pi 5 Plus with the same base and the same
local DT as my v14 report [2] (rockchip-devel at ea51774c5c42,
7.2-rc7). The v14 glue patches were replaced by v16 2/6, 4/6, 5/6
and 6/6; 1/6 and 3/6 have the same patch-id as in v14, so they
stayed. The glue is built in, with PM and USB_GADGET enabled.

The sink is different this time: a Dell 2408WFP at 1920x1200 on a
USB-C to DP cable, not the Epico converter into the Samsung 4K120
from [2]. This cable also has a GsCooLink chip (VID 0x3679), and its
DPCD (1.2, HBR2 x4) is newer than the 2009 monitor, so the link
partner is most likely that chip, not the monitor.

I ran the same test on my daily kernel (v14 glue, plus a locally
patched tcpm module) and on the v16 kernel. Both gave the same
result:
- dwc3-rockchip bound to fc000000.usb and fc400000.usb
- DP alt mode active (svid ff01), link trained at HBR2 x4
- cable unplug/replug, and replug with the connector flipped
  (port0 orientation changed in sysfs): DP-1 connected again about
  2 s after each replug
- the xHCI on fc000000.usb went away on each unplug and came back on
  each replug, and the cable's billboard device enumerated again
- no messages from dwc3, dwc3-rockchip or the usbdp PHY

With this config, none of the v14 to v16 changes alter what runs on
the board. So this run confirms v16 on hardware, but it cannot tell
v16 from v14.

Build test on v7.3-rc1, arm64 allnoconfig plus a fragment, gcc 13.3.
Host-only dwc3 with USB_GADGET unset now builds, with the glue built
in and as a module. USB_GADGET=m with the glue built in can no
longer be selected. Without the two tracepoint exports in 4/6, the
v14 modpost error comes back, so they are still needed. All builds
that passed had no warnings. They all had PM_SLEEP disabled (PM
itself cannot be, ARCH_ROCKCHIP selects it), so they also built the
new PM ops in 2/6 without sleep support.

Gadget mode (6/6) I tested separately; the results and my tag are
in my reply to 6/6. Not tested: system suspend/resume, a 4K/HDR sink
on USB-C this time, and USB devices in host mode on the USB-C port
other than the cable's own billboard. 5/6 was only build-tested. I
am not adding any tags to 1/6-5/6 here.

An LLM assistant built the v16 test kernel (reverting the three
changed v14 glue commits and applying v16), wrote and ran the build
test, wrote the board test script, compared the logs and drafted
this mail. I ran the board test and did the cable pulls and flips.

[1] https://lore.kernel.org/all/20260918091032.15593-1-royalnet026@gmail.com/
[2] https://lore.kernel.org/all/20260815121608.64818-1-royalnet026@gmail.com/

Igor
