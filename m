Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF0233689D
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 15:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791734110; cv=none; b=iNiUCW9es7SIl5f9jKIgK748G9TvQA/0jG/keTpIeeAmq6bLIGDLodtveFAiGKZZlTERRJ/bn7rKDMwbiF6A6drENUBBiV/EGPkP1YzGItsfsa+7YKY9hDwWgJ26YZyGbJaUSecD6Sg5eEZv92MzSmYPOBMUSy/XUFo04GEpqCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791734110; c=relaxed/simple;
	bh=wht2xhdursra1DqKCuzlOsUUwuTyyTmE9hTf79owqPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F6K7C3klTAMbeL+0ULW1EBZj9Zi8jlGuxkz8NA/cm1cqNuPkpdfrS4ZtY7ttm2mfQx1fHMq0LAYRzDs3VP/e4Lsekn3GDiFGKSnYJA6k+ny3nLflpz9B+uDvELRkVGzzI6tyjOD+yh+w7KHcPKp03TAtCoHdvyeGAuFyzQRVSZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oMMew5rK; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oMMew5rK"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5e9405fbc33so311310e0c.3
        for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 08:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791734107; x=1792338907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wht2xhdursra1DqKCuzlOsUUwuTyyTmE9hTf79owqPA=;
        b=oMMew5rK84YNXcyWFdANcltK5g/jvkpetqBkO85YunfyfUa3aRwXg3Lu+VkBE7TA4G
         1DmaFSHxzc0sFWNSPRmKYWgmRmGq7PFOlTYQLQpmA7qKXUu6Mj51QQKQdtqMob4wSnZJ
         eJaEtmmX35Cf512KAEbEkR0wQEhouW5FsCF1zUq9U9Q0L/LlQpm2BCuMkLiw2we0pTMC
         KbHAmfDKtsIi+iw4L4jDbp6fkNiOpJwEDDB7w8e9ObgVnw9tWPn10ATZ040HW7ZrcDE/
         Hq2zmaSgItbu0LTn1MDMfE2Wvrh5+g2zfZY9IVAR2IDbtnstYbMOOlRdZEOy9vEYhrnZ
         il8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791734107; x=1792338907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wht2xhdursra1DqKCuzlOsUUwuTyyTmE9hTf79owqPA=;
        b=KksUovAGywPxCOPv+Bxj+WcVmmQL+xXJ8u1uWDMZhAZ7nvFP77tXyCkPNjsOlCS16j
         CCShMPhH9umPteQluijV3Ky2+LyDWsRgi1XAPAX9FKL73AiJGfY/mjBL3/sw2oLrIyaL
         ksXq8kOkBAIiuvckmumPu2/JGbWXouVhHB8T3XWkV7KS+lwrvF0WL8P1t3b551r/IHxG
         VY7m26TCVAHYhrUXI/bANSdxzZvc1LsamMrbtxRq4sHfnqSeABVF1FWds1ZX8cB0avt2
         PdQ5WdnYdhUfcUhBYrzIwlcZcv9gDHM7pjYN5JE+d2bBumU1cXCLm3gaTw8I/yrIGC6f
         RmLw==
X-Forwarded-Encrypted: i=1; AKwUvBw5xRdkLmhgxI7QqbsgYATMpFEpA7GgJGVFu39Jq6O+jN/BdQVgHazdzA92ifjzt5e0+VxbmqmOwus=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkiTZnVGWC8MZqxGajfT5FKTxPwb9Nr6E5Hljb8lfuaKiLed1/
	C1GeQofnMygCtHw2A56hsmrBA31oPCeQD55BgVF0Vq0c43PwdbFRlT5D
X-Gm-Gg: AYBFou0BFd5FoU/wY8zx9mt44qoc5RY1JiYJLxliJzQTnOAay02qOFzYf38t8rH3Z1W
	m60tctT46P620k+sK3g5kbp1r9k3LANQ2dfuzJH5ByWmH3YqWHgkG3B6diQRU/skm5bxTjDcnsX
	7qKSnwRNLz1ppvWMsm5h6P0TXp0T+3CLTa08w4WGq/S8uZGWpT0mo4pVIZKXUa7MdSXEueZszma
	CiRAkeZqemxQsufPq0xjU3uawb0suVY5DQ4/To5CxT19Hhcjkrj30tmhlxLPCe3aF9AEWUsj2Me
	mhuYI4xEU92dCF9QkssjBFaYXTYaiNJbdcXs8rvUUYn5gQvibcnAYRp7OjpegYpo3eCPpthFqlD
	YYTNA0ZY5BHojT/ztjkbT6l6OwRMNEhOh8BrtkEyOedkcF+0FF1+O1cu8e4P9QHEaT4NreumAM2
	6nhUSBmeKNcMuWEeVEr4SLeS4kcF2xf00jx3nsLKgsGVOlprRLvX2aT3Q2NkPYiLk=
X-Received: by 2002:a05:6102:4bca:b0:7c3:fcb7:8c8c with SMTP id ada2fe7eead31-7cb3738b509mr1700102137.29.1791734107383;
        Sun, 11 Oct 2026 08:55:07 -0700 (PDT)
Received: from beelink.. ([187.13.210.57])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003ae1577sm5130367241.0.2026.10.11.08.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 08:55:06 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: gregkh@linuxfoundation.org
Cc: khtsai@google.com,
	ivo.g.dimitrov.75@gmail.com,
	faqiang.zhu@nxp.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: gadget: u_ether: Fix NULL pointer deref in debug logging
Date: Sun, 11 Oct 2026 12:54:59 -0300
Message-ID: <20261011155459.1196100-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026101116-shortlist-trend-5e9d@gregkh>
References: <2026101116-shortlist-trend-5e9d@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

You're right. I spent a good while checking macro call sites,
tracing dev->net lifetime, and verifying scope, then used an
LLM to help draft the writeup. Clearly I'm better at reading
code than writing about it :) I'll keep it shorter next time.

The patch looks correct to me as-is.

Thanks,
Aldo
