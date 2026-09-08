Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F5527A462
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 05:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845154; cv=none; b=R31/0x/lShGaMAMaNgbLiWYDdG/FiHTjtBSKWnbP4R/H/giGmRIOUWeURp6A+5vUD5IQ71DWoYBX8nKP/d1x22m1LHb3oztMe/REmuPG9iEJLZ6LrUID0rc4c5DipVFiIvi8Q4637ROpqB+BgzsKO9I6gn+iF6JXwtwVyURGywY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845154; c=relaxed/simple;
	bh=x8m6O+VGBf2mh+d9UTHXImpGsH4/EOQxuIFX8xSzjGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4p1pdeNzj3I/foDJJStLSRtFfVwRLVdcuO+ZIXkwaKp28GCPDz8oHPaY+4enPEGXGZfEZ0ExooMUo3ke/ho24DCTHNGWJMuLN06t4ny3kbmMEx9tR7baYXu65KqMjNIq9Z6eQjhQxYZL0LDXo3TnSa6g7O4u93qCMTdFLW9AYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nz5k+qoD; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nz5k+qoD"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38511175ad3so3583581a91.2
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 22:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845152; x=1789449952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cAp8mTkH9nPCXUPKfddbuA6JymE/Gu0j627y3YqdlVI=;
        b=nz5k+qoDxmhy+uL4z07k6tY8ULwpn0SIVgQGuoqotUPz7lNawW65mqwBEEY5RTwky9
         x38XVYDHA6B/k6ElAZEGnyiVsRV9y5KTiQ1QqiNVUVVDpnZj1vrBQ+C5FVv5a9kwOS63
         Z4uXouxjPeOeYZq1+pIhFkjmhRPa2mRgju92tFU0uJs7LfC4kJQTR9k76w3SM0W0Bojm
         Ta2VcSKObXzeOXsf1SkondzhEWfiUr5Rm+EeJRYtY52eA8SiXJgck6uYWVTQumhrmAS4
         9V7nbWV3ZkTvYDLN3R5KsIcd31vpdZJSe7QowHbmj948xmuxQ6M7oFwREPtzor/bSQdy
         l6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845152; x=1789449952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cAp8mTkH9nPCXUPKfddbuA6JymE/Gu0j627y3YqdlVI=;
        b=GkAiHqzqtvytHY3jE5RlpyCK0SPhD4EiXc7da365qQnKJm0j4ttrC/vKLygphAHcwJ
         XRlsNqaYnE1V4XGeY+vkKz+eqQPaC2uvfXZeWerkKZdCsAZe8xMtJSh0+VNGhyK0soMR
         y14dJ+YR8u7Sfjp/C1RJrC/g97V3IZ3q+tUNzzdg1Exx2OfudPNF00xf5lXfYQ8mKyA4
         rVGoI2isjPitPx0WRPv4GwGquY/X1TT6+XSd0LoaNlYq6est5zPG8PEK8merYj1JAT1b
         IPg05StV7ym1dE1OKdmhAWx/72+Xc0pH9WSWmw9cyxhTC7Zx81q209Pnc9hzmvXSbePf
         gb6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwCWtOX4Vehi3Ot0sWdCJSnk3yCrxDysnB9QpXc7m4iSujjp+MmlG3e8AgBBe1RwwLRoIsnPNXdGBI=@vger.kernel.org
X-Gm-Message-State: AFuF++mwV5HPLHks0GnsbFhWWQMO7tPqVF73i2bQYp3mLk9/wj9Ca7DL
	1HdqcpK2jRZMC7unp35MS5Dm2U24FaKr41FRWxv7SOoRNux48cMH/7kE
X-Gm-Gg: AYBFou3JkOpO+eTpr7UW8khY6fPydKmxrdw+3NojaavcsADOX6OPzPA+9VTcjc+7BWm
	1Au6w31H2eHp/pU3/4kw7xe1mzPqP8yvpkwa+Zre3V9/hPb9oAIDaVs3gIgnmyn0WoF+V/Plp61
	Z0i2dm7nw3FyTJgQ9HTv34hyHUM8znFlA0dAYcaxqtXVy5HA5rLUYUPN9/DGSpcKSq5IwAD7Rto
	Z4ZONUW57+DCw0TyA7TzdCasozMbnH4D6p+4ZfIkmQJSCoAXBUAA/5DxJ0QwEon2awdrglPfZAW
	+ScaN1AxFMZ39jnPAY9+HRjcEHDBemLERhMI1uYKr55ssoFGLB3hKlUrpC4fwW2vpdFp/DiglyM
	+bTVSBBGl6luE6ddsBOIjF0WhM98vaaGZNpuv40Le98yjeeffvjP3di2NV7Gnwd35xnGpptAO9T
	F4sfjY+ok2vWEuEJSP1mnMTml5ThrAdBsYxpATF2aWvQPaGq47XtULE94CPRmQiPvYW7CuVw8ND
	SBCbAeJ35qPzFLqdEIEGjH4
X-Received: by 2002:a17:90b:1b44:b0:398:ba96:1afd with SMTP id 98e67ed59e1d1-39b2613249fmr36702489a91.8.1788845152391;
        Mon, 07 Sep 2026 22:25:52 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm30022861c88.14.2026.09.07.22.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:25:51 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Edward Cree <ecree.xilinx@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-net-drivers@amd.com,
	linux-kselftest@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 6/6] net: usb: fix repeated words in log messages
Date: Tue,  8 Sep 2026 10:55:44 +0530
Message-ID: <20260908052544.27165-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <7c8cb3f3-8eab-494b-9f97-b30693a361eb@lunn.ch>
References: <7c8cb3f3-8eab-494b-9f97-b30693a361eb@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026 at 02:49:32PM +0200, Andrew Lunn wrote:
> The same thing twice. Same capitalisation. Is one could actually be
> correct. Please see if you can find the data sheet for this device and
> see if it gives any clues.

I could not get hold of the ASIX data sheet itself, so this is from the
register definitions in the driver rather than from the vendor document.

The register is named in asix.h:

  /* AX88772 & AX88178 Medium Mode Register */

and it is written by AX_CMD_WRITE_MEDIUM_MODE (0x1b).  So the register
is the "Medium Mode" register, and neither word is a stray duplicate of
the other: the message is naming the register and then repeating "mode"
for it.

The sibling read function words it the way I would expect:

  netdev_err(dev->net, "Error reading Medium Status register: %02x\n", ret);

which names the register and stops there.

The other thing that pushed me towards it being redundant is what the
value actually is:

  int asix_write_medium_mode(struct usbnet *dev, u16 mode, int in_pm)
  ...
  netdev_err(dev->net, "Failed to write Medium Mode mode to 0x%04x: %02x\n",
             mode, ret);

The 0x%04x is 'mode', the value being written, not an address.  So the
sentence is "failed to write the Medium Mode to <value>", and the second
"mode" has nothing left to refer to.

The same string is in u-boot's copy of the driver, but that was copied
from Linux, so it is not independent confirmation.

If you would rather not take my reading of it without the data sheet, I
am happy to just drop this one.  Otherwise I will resend it as-is in a
later batch of the split series; it is not in the batch I am sending
now.

Thanks,
Hemanth
