Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084D9233149
	for <linux-usb@vger.kernel.org>; Sun,  4 Oct 2026 09:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791106296; cv=none; b=rbYI8uqWYy2mkpKS2lwkNaiusM+xocaWMvvY6Ai3zFT3SinZL19XVLVufZMH0eBIqTFBLR9wJ+gwwk0eMl2J1WUviC0c3Q8vDJOil9DMZ5KqeQh+OB507rtZuUcV0A++JSKDldby3LrpvniWPR05TdxBzr8mzoEn9AUd2bxbN+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791106296; c=relaxed/simple;
	bh=b4ATKoJIx0zDFM+Q2MfhNTQ29nzp8qB2UeEM5HCTfP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TCtmckCWL5tHPgxoGHBtpsvN5BHpHj5LDOQa9fnSYY/l2EyMYUj8ZKvoP3Ugtclg5/8sQPTnwaVjKDlNxLZjTFTC9WUVacfUbvMW4TZie1qsWgvb/JzxTo8pnLUHIJAlza18m4D99Hk9K3+e5Lo5VJ0y4j1s8XN4keZHrWkA+nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUuYRfBN; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUuYRfBN"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc502d509c0so197214a12.2
        for <linux-usb@vger.kernel.org>; Sun, 04 Oct 2026 02:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791106294; x=1791711094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/KrJhVqT2lKVywgTy6x2VTximTEnfp3La/wIY4/WjE=;
        b=UUuYRfBN0gzIEAZJayiWhdApmPzGtB+g6TMQmhdoHFTkgzgFOBkIOOQnQWDQuZJpFW
         w2voewsFt0kW8lH+hVTRqbkjj+E0LxwvXFxOBkXY8PQ9duhIj/HbXSTkCW8G2lXqLfBN
         fbLBUqaIU7M8ElgR70L84u/hnr5cOIHB/KXGrAaH7+gWY8EZl+4zdlPCcGZf+ULHztHu
         mMUc2vHwIXgNf7nV3Dp8sPuH4NGDb8oIa5jOel0o28Hnej8J5Gy5c9uA1EetrerWys+v
         nGjlFiLUNybRltilOBkvZZ2jo3+FjG7fOttp2X8Dk1R7FFT+ndrgOob7HCVX64NxYmxU
         lOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791106294; x=1791711094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V/KrJhVqT2lKVywgTy6x2VTximTEnfp3La/wIY4/WjE=;
        b=kqTg3jkoKi6+bwLu3+mrsS7s6w+8Oa8/jLYOKkwg04bn0gOqCeN3x++PRPi0DZFwiA
         ZWkOhdzqhoaPvh3dy6vv93Ejb08ZEUAgZX/+Suuqnz8mCKEOJrE40E8A351en2yl/iI6
         hwzbIxjSpse0YItD66B8WPF8kSWrowbRwFRSTM8yuGmODpIaMN60bRlugvu1sz6Sc6KM
         wM9bGr+XwVLHGJem/dJ1yvuTLHL8EyW7zQFsFoTBtydE71QVJMpTmE0g5SBZNYP+YY/k
         n98Zc9JTx9HjIADPN2cmstr7KnnKV82oPO8A68V3OqDNao9Y2KFB/GnRk+6e+KxJPobb
         CblA==
X-Forwarded-Encrypted: i=1; AKwUvBwRoDYl0Lm6OQkGNd3HlRUl6dKt5qhRHunRNw4XcYPYGoeBT9HekhHiL2a201Tjh+HZ6TcCYvBAibc=@vger.kernel.org
X-Gm-Message-State: AFuF++n8rWVFnNLJHdFacDnqXd58Dsvc+0y/K68PFakLjUM7Igt2Jq5Z
	Rwl2t+Wbd0xK9uOx+GZCsbcNVZjFYZlaEG+clKsYFWBgPbPMN5yyAn2D
X-Gm-Gg: AYBFou0eTsdbitQF/jZwBy8c33//b4iDG4Uh7cSywAnO3eD5RJ5SrGJKZyo+ioPNp//
	i3NMkOzOjDrwc8OLWqJumUtm8Q8ihAmlZBCVgdat4pWMpni8+kO5z+3IySFCuPUY7yLNqc8Fo5O
	B51SzNINZVRP3lcrc3dttXoNR+2JiYvg8jaMX3kLkdYRa6yk6xJwK+U5UhdI6ZrLifn9UcjMe6x
	yNwFhJPdmPgz4E/gAvpqZSWn2GV9PBL84vyNczq2YtPc2ZzbD61H3EL/1Rz+l+EyoQUOJVgzl7g
	8TGn8odGzLb7xRUBIl+Tr6Ltejj+eCQ6GyRwTggjygSdkV1nZnMN4jluTEGEAVLrIaQCg06hgqg
	M+xFYCX6b7NMlo92FcqJPjyn0oO2FMw56UyimsNg1LqbDbQoikl3uJOiMYouW1tn9El73xeN1IL
	SQ+Imp0RfpPiRFGpw9E61Vw1c+M2u0EDFRhF1qqoknwkls6aqhMNkD7HCT5320ijMTV4umKNkjE
	45Yq1PbC8b7yo71Rzxt4bOc
X-Received: by 2002:a05:6a20:9c15:b0:3dd:a009:3186 with SMTP id adf61e73a8af0-3e0d6cddee7mr3901067637.46.1791106294105;
        Sun, 04 Oct 2026 02:31:34 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f737a231sm2758121a12.18.2026.10.04.02.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:31:32 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Joonhoe Kim <26rote@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: Check for L2 only when suspending a host with wakeup
Date: Sun,  4 Oct 2026 18:31:32 +0900
Message-ID: <20261004093132.74059-1-26rote@gmail.com>
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
