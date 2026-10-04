Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F71A240611
	for <linux-usb@vger.kernel.org>; Sun,  4 Oct 2026 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791106487; cv=none; b=dpKbznWi5v9n29Ehs7LrXK+AKNdOj07Ko31h5sPTch6aVP3Xi9Rz8fqgtzZXfvLpqrkqIutcKbzthXquDXsBZ19fW1z4r8M0rClqC0a6OeqtJ1tvNp+KH2FBiCiji2cz7ZvrJoVtz6gQoZoqpJ0kqGRNg2Fd7jBPuG6vvmYw09U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791106487; c=relaxed/simple;
	bh=b4ATKoJIx0zDFM+Q2MfhNTQ29nzp8qB2UeEM5HCTfP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QV93nVCU8wt/MPWy1zPyPOhIwsu52CRRBm9UxjfwVZHxTEoOOdd15vng6+PeGzfaiJ/1PC9uAXwiS2OWf+1LXXmaGMEVtn4evAMvEHSK3zv5obGK2nnDHzFo8F5Doese14tLMUm+b67ArDrzHaEVrBlEVVQsfqw7nny+eIapL0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRdeRkFC; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRdeRkFC"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a6f8525bfbso426378a91.0
        for <linux-usb@vger.kernel.org>; Sun, 04 Oct 2026 02:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791106485; x=1791711285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/KrJhVqT2lKVywgTy6x2VTximTEnfp3La/wIY4/WjE=;
        b=iRdeRkFC90q4lcXxyf0PoZc0GtDR75362ES2uuLs7nos/Q0kui9XxwPGVwEgXw5CFa
         L+H3n8lvCEBU0cLYKKkZstDDzrRVshokoLhqarWm6hH0CqAEtdvgi5ZYcTGg8d2A1htb
         ik4M65RUb1krR/07Vgl0Yaw2+UdnQz4SVjaWNni+3Sl5ztvdUpxvMrNRIQlFeGPibjz3
         /WelTxKbS5sn+BXiZ1Auk4jX3qVtqZpINokCLC39Dd9c1gYbdUA0ZvDlTXfuciA6qUQi
         SgOb0YgkFCZNJ4ZEYB4cdeOVOI5ELbQsoyr+h7BOq6bJ/Xg0f3nBmzaJ6Aray3XET1Vr
         Z87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791106485; x=1791711285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V/KrJhVqT2lKVywgTy6x2VTximTEnfp3La/wIY4/WjE=;
        b=eTERM+aH0XHW8Njprpb+RheTD4vi9AxIFeowCzl6UR6giS3QC5fel6Ws8CPynL/xoM
         jqDDuHeN/8bh6hkMNZhHIgqdIa7Fw5D0U0/jA6mFFqjPWKoA1jnjw6NBc6/7gcrgXkAm
         7iXDKvoAaOiTWBJEsSgZ3ltX9Bd1KDjYVEBobNRWq8d85r6dThd6fj0DILW9SkCBwRjs
         zGK669T7JlPZFkC8gc+TEzGnWSN7VbZg6FrDOodq+OMYJkEQ1hceDgXmccEsLS/3AQuj
         OXBfZ9z1hPnttlfP/R/x2CVShiS1mNYbxtUg9rOHTmL5u68cmQC4mWB7iGwUYbLN3BB7
         jKSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOwMApYXX3PqOtoaPulMckyZ74sNRkOrHu3CcLM6hFPIbursYNvVfWp5eF/TdwkXlw51LPxJaL3LI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgUrikaQzXpVgdNwFsm6T2GiZh9lqaMPOp2RuKwrG8KjDyCYjN
	k1w0Zj1U9yOLWLhw/TDLHGx6lGsVmAcs+as2bFYjgvYRO0uYazlMOlat
X-Gm-Gg: AYBFou0ExAwVicRe1EsGpK3gYLQ4R8Htlunznr8Uqu7HWwe22cmOjWooILnP6UhINOF
	60AAkI7FpxnN2ragRzJBy6X2ZWNV5H9dkHsWVBSB+HR7tqKHco3FZSYYyw9WLBMwYtq77K19rxu
	lmWD8A7fao/FS6GaKmJNbYPHWsGsPQaSFQqxWJSN7uolSDl8leIaV70HrsBnfvUWZ6YPi10HcNK
	rpHWnka6cqq3cRGrU0fqQFqcs4J2Q2iT9W9UgeJu9clec5Lf760bI1+6RQMR7Siucx3LYBDo4H0
	X7H13NreZq7tFppRVcbD6uD+y7EdnwGV7i/EvH+Ngf6k9kdIxWI0Om8rL8DFouaIpIE6VqugICs
	0kssBhOUbQ6qv2gV3Wxgu37/9D978ZbFyesICX+r6h/wuomnIbFgr183YcnGC2JtD1dpTV+zmyt
	DJLxeAsvFBslYG6AW6wLgAgisJYLiZnTRniegr89G0wCoXN1OSYHs3vw9GmImJgxCqyOSpPu6OC
	nCv/3GZ4TvA5+/l7pc+zu4v
X-Received: by 2002:a17:90b:134c:b0:3a4:b6c2:b154 with SMTP id 98e67ed59e1d1-3a6ceab2503mr3388577a91.16.1791106485361;
        Sun, 04 Oct 2026 02:34:45 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4262f0sm6589919a91.4.2026.10.04.02.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:34:43 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Joonhoe Kim <26rote@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: Check for L2 only when suspending a host with wakeup
Date: Sun,  4 Oct 2026 18:34:43 +0900
Message-ID: <20261004093444.74223-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
References: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 28, 2026 at 03:16:28PM -0300, Fabricio Akio wrote:
> Host mode is untested, since this board runs the controller in
> peripheral mode.

I tried the host side on a Lenovo Legion Tab Y700 Gen 5 (SM8850,
dwc3-qcom), v7.3-rc4 plus board patches, s2idle with an RTC wakeup:

 - host with wakeup disabled (USB 2.0 hub, USB 3 flash drive behind
   it): "HS-PHY not in L2" on every suspend before, none with the
   patch; the devices are still there after resume
 - host with wakeup enabled: no message, the port does reach L2
 - peripheral (connected to a PC): no message

Tested-by: Joonhoe Kim <26rote@gmail.com>
