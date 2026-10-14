Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0904A0EF6
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 22:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017483; cv=none; b=Tx/RIawguO3hg0pPTenODoJfc/HDfZUuw/vNruds1H2C/1T3t3MiNLMq+I5DBFjBdRaLqYLbOHH1GJr+ne4b/fWjG3/QzfNYgkiESs7vUtNPb1WE5JAmSmra7YQDIzWnVXy7S2Xm+x/6ntewigPNpIZNEnwuai5JaeX9atm+suI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017483; c=relaxed/simple;
	bh=+LzHVT0KcK2ydYuviWQiznMUyOcBUDmucDqvY9sHvn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=grBdL+0vIAp2iUA8zfWes36p3KADl8yXUxhKl38MvOrXh17IH19hkj3HIm9NytVdp4+PfrBTnty6GEqf8UR72ci/fGRp8exUeIyP3zTLZ2rHC/sO6RlFdf7aqfW4Zl0koJUKv+6zxnzXQxDamJTN89dgiaQNZ/rMiuqIMSAuyP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSV9VmIv; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSV9VmIv"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-354ba08cfd1so7768039eec.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 15:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792017481; x=1792622281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZfKXK4HA4+8G8WzKFQQ93Ao+jrp5WRHxzlQDtwCO94w=;
        b=FSV9VmIvSHWNLd/U5Bav1/+2Sg7VZu+SVwat+QQ6BiPyHRhd2hA8IM6EbbrvqLRGS6
         HD2McVRnOp8IaAi9e+SsbwguBUBOFjdZhMlMSDJZjSJAlwGGuMFXSX1fREEm2jQl9BWg
         JTuGgk0/NKeQmolIgHPPmaQGthwXHl5MXrCj1iKFbXMf7fjYI30YEDeqWEdtKz1KN9MT
         mk6uQ+8HlGFRZRGpbnDTba1f0uTZZQjRQIOdy0BvnZo/99R4Y3CRHFBkpF7eG9fr3a0O
         5ZRbcTdWEDhEy69cTm6sVZSeKvD9UoDwN1ItzWUScScv3C0slaBdPgD1Ncs36qgiHe4Q
         bR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792017481; x=1792622281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZfKXK4HA4+8G8WzKFQQ93Ao+jrp5WRHxzlQDtwCO94w=;
        b=i963EX1RRCOhtVS3BehbVGweWcAdrzhr1JM/x0AXkIi8l//GCgN1+SCasXaGqInf0g
         dn07UTcd4QePmrYzv12M8DeFBWD9AGX9yRNGy1ChbCp5m7HbhD0U+sPcRqwiti5WIcPj
         DBnEAe8t4+qY5mHRBgDy67DjTl/xKTcXIpNaSlaZTC2YPm1SLvEOT6cuI4yVvRiNmWfP
         1f4vQGcjjGbPpcekjMNjFJ0r7l2hgC3zJWHjhpihw3I8QyMQ+vQgww1dG5GlQukZmTv+
         oRkHxcMWERUO4ZF8OsTUyWR08ODAjVxBlD4Uvj12vN67Kbk/2QmzuFDlTlAewHXNRqkk
         /lKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdZHCcHKGa5jYOfMq0iFRtquj3RTWqFoE4Funfhb7CMCg9gA1VHOQhduqHO7B49mE9DCbnb5jFK/k=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9F0/l6EqG3RzSYpyaw6X/d5jo3TqNseBHHDirN3gBsJtRTmbc
	k3HJRe39Ae63KePq+MvindKnpzs17MbFPWkA63t1u9IZAqGCXIShA5P6
X-Gm-Gg: AYBFou1hhbk5gN2oilUJ/0Ikwa9fGTb8XvacBnoc3KrNAf0ItIMiPDyvTv6cIxs6uqJ
	rTzL/9jBUyh8GQ9G9ongq1ITRtZsMwf721T9ijKg1s65vzrUuE/3PRGW8m7kRYjBZCaTo2cS7Wm
	1HLJjPCv7+ni2CdyWYo5/drgVwm6CNBNw8aRzPKhhSDvZJcufXPEP1VbSFrMyoM1u8xSCxOmQr4
	GHKWDinSu0i8Ca1OfJjppyGF0yB6MqnnPoQ2VjmhHbYxYDWN7yzwWbBCr2snZOfbUSeGcI5MNF0
	E8IzlkO36aQdt6NjHl8ZAVAs77hw9FUnPnIDNvNYM/AFsKO7jRKzfEPM1wcfErzNvjCOUznnVik
	YuOdX67s4pfz97rAeaxfYn0v7sx+ii0Tvw1sDp7MLjxo7ClAJntiwa7HKsn4Fajxhfed/gnqcqQ
	Xub2eSjhpj34vfhcB9KoCmOgPyFyIX5V3NUx9Qt87xrq8Lpburn2UN05ti9K2k
X-Received: by 2002:a05:693c:2a13:b0:35c:99e1:c755 with SMTP id 5a478bee46e88-35c99f11cd8mr7561374eec.38.1792017480840;
        Wed, 14 Oct 2026 15:38:00 -0700 (PDT)
Received: from beelink ([186.22.57.86])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm10489270eec.25.2026.10.14.15.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:38:00 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	luca.cecchi.info@gmail.com
Subject: Re: [PATCH] usb: uas: do not leak error codes from usb_alloc_streams()
Date: Wed, 14 Oct 2026 19:37:47 -0300
Message-ID: <20261014223753.3168866-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008132711.211908-1-oneukum@suse.com>
References: <20261008132711.211908-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 08, 2026 at 03:27:11PM +0200, Oliver Neukum wrote:
> -		devinfo->qdepth = usb_alloc_streams(devinfo->intf, eps + 1,
> +		r = usb_alloc_streams(devinfo->intf, eps + 1,
>  						    3, MAX_CMNDS, GFP_NOIO);

Looks correct to me. Keeping the negative errno out of qdepth by
assigning only on success is the right fix.

Reviewed-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
