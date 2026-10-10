Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F2C3DDAE6
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 06:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791613257; cv=none; b=qQRTI2ejaCE5eBUaBJsb3B4Z6pwxBoB0E/EkqDtEVkFCvlA+MXPdYnE1DUk4vJ/eUOse+00djxMX8TOAbEVLXbSXEgrPYeRYIIi/gvYLwODxQnP00VjT5ShDvuwwlWMgvG7Fz5/5UcUz5MbJuNGuvtkQTO6BY7ZfZ3TpkH4pDQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791613257; c=relaxed/simple;
	bh=tF57zidWZwWz8hIOotoZx9jwOMzu5EtZU1vKiJE6pKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avuICXgdLIFgbhX85yuIvxmJPoYHv773Don2UcbBHbC1SYumuHwa9S4A5qAhuLitwpPMEdhj5kTNtVnhwsIcK03FQk9DZVn6kulQujuzhQ+yU/+ki68mJW3/2YJJcrfOkyHpDPPn3sTq0tY1Z38zczNAQ8tIkOtv3JQsIGczUlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ip0UGn9w; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ip0UGn9w"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso98199a12.2
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2026 23:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791613256; x=1792218056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tF57zidWZwWz8hIOotoZx9jwOMzu5EtZU1vKiJE6pKY=;
        b=ip0UGn9wZfNJ0oel9b9UB18IJILq2ODa5gcehD9jE4ZEYAdW5Cf+HKemijYyuOjhuw
         wbf5T1snBXusb7qSdM4+jxAZgztX4vBVd6pRmLKFZzQMuN73p8cNN+NWAMGp9XNoH+2d
         oCkx6sG1yvVafLgl/eAbFFQWBl+lXDARS8rw3dSMlTESZjgXTghAru7q3ooXnVCkGv4l
         traJZMzH/BipOYHBSH2SNY7EX00e2dimvoLU7op4ejaRBPZoOalpxY6v0FUSiPxIAdT7
         f5FMr9Z9RRYKPJBQSaHWRyqO65zkqgszvNQdZKS6tdHvIfh8hmJJQwBi4z4MY5QWHycU
         pQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791613256; x=1792218056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tF57zidWZwWz8hIOotoZx9jwOMzu5EtZU1vKiJE6pKY=;
        b=B4ybILWtxiufXc8l2aOKtl3clFbvvaYLN+8MWottNRHzfpVdbk3kmzHcJGimFwZ+l/
         P+Afme/UPVpPzKcc+iLNgKfmVvHnMcnVcwwmRCtYq9gPjrRx6JmtByRaZ773RV+C9W2u
         1F8hkCiLRy/P7k/UpM1wPm2cWrsylY6V5fy00wqFsAErG3xbyHLZV1p45Tpf1eSS3mNg
         PqUJ3OOb8QIPcAXnST/YapOmr7o+uILK9IeW+o1R7EjvqMoZ/ziVNgn2F9gRsSYBudTr
         Wi5UsUiqAV+fpF20SdBieQ4nzuU0VHPEoP1J1edELG0pNTR84h2ocYWDdAzU1ba7sxFq
         9AiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQ3p7nIdIjyZuU1JdsdOnEuuAsY9zYUqKY+DEANnNl/NVAWDXGwEELw/PVSD5YSqA9naPlp+5Wj6o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJMPWwq1SNMl+uWxDXpw2xP8/3KC5jWC8q60FPE17harGNxJYE
	ZbSnGPh2b213WPWrCDz/ID+PZcEyBXqdttTSd1hPMauUXOGFNW85HpYd
X-Gm-Gg: AYBFou0Gc2iUyAuEr43sDS2870CT0LuPRJPW/bbOHq7pv2Rc4Vl0Qnj5C7iQbZFX9T1
	gGzFnUPdWY6VyyhQLFrzULfR4swx60juMhBQsXeLBCoO1SB4NCmJypid6scN+AwQpxzncdMEq2I
	EKyApS9HpWdwi7sO5py4mAej68jhhYYaAM0brYBfxjpRAIrRg56lJXmpNxkZVRn2Wq1MhJ8UpIr
	a3pa/q1MgUfIB2hX4McA2kLij+FqYjpTwQTY9+uAvjgCQz+mxm0/2TjmZRgXKHawAfedeUAisym
	w1j57xRK3UVJBYONb1p9/c0dW9eaRPVWPXBnEsS2rpB0gF0g6KdVHPQwxvJsd5z756mifZD+iBn
	aj5h5yLKyOKcKBflfVuAxwu2YJ4LE0RYNv1AqYx7rUmB3R2Mzmy2FcNbMO7GYsTcDYqSeDTTtY9
	j+G7+Ne6PueKKvH7FpO0FfCEY6oqt+UQs7Ump7XvpDyo+GeWa5WSMLVZ086zq3sJfsd3o/qr6kH
	2Xyrc5lBp7bcuXAUHqMfY9QCthuC4KARR4kA7tW/hG5wl0Si+W1FNXYO0HO9Yp0/gCmR8kh7Pdk
	8eP6oB9T5kMWcm5UUA7Y00Y=
X-Received: by 2002:a17:90b:4a90:b0:3a0:d79d:b6bf with SMTP id 98e67ed59e1d1-3ab3a90e590mr2805853a91.20.1791613256121;
        Fri, 09 Oct 2026 23:20:56 -0700 (PDT)
Received: from Inspiron5409 (61-228-80-139.dynamic-ip.hinet.net. [61.228.80.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38ddac6dsm6418243a91.7.2026.10.09.23.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 23:20:55 -0700 (PDT)
From: Jianhui Xu <neuromoments@gmail.com>
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch,
	andrew@lunn.ch,
	chenhuacai@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	hkallweit1@gmail.com,
	kernel@xen0n.name,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux@armlinux.org.uk,
	loongarch@lists.linux.dev,
	nb@tipi-net.de,
	netdev@vger.kernel.org,
	neuromoments@gmail.com,
	pabeni@redhat.com
Subject: Re: [PATCH v19 0/13] ax88179_178a: Add support for AX88179A-based chips
Date: Sat, 10 Oct 2026 14:20:47 +0800
Message-ID: <20261010062047.399148-1-neuromoments@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
References: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Birger,

I tested the v19 series on my AX88179B adapter, rerunning all the
previously described tests.

The previously observed VLAN-filter failure did not reproduce, and no
carrier or RX failures were observed in the test. No confirmed driver
regressions were found in the tested scenarios.

Tested-by: Jianhui Xu <neuromoments@gmail.com>

Thanks,
Jianhui
