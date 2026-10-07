Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE033B42FA
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 13:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791378986; cv=none; b=TSQYladbdhdZpEULahSQfLFiyFklGQBprFnK6h2jjIJTPB4apRXt/Z6KPJqJanS98oO056DoWfs9yTid+5LpCtoLBz8r0zEtTkyxZuhUykQRcZdaYr2mYfo9OzG54ezZIjeEXpkO/3maO+K9Cy1w67d4jQpT8KJqCb+vC4vOo5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791378986; c=relaxed/simple;
	bh=TXXW5n3a0Ki9BYV30DPXfzeFhBoYd+H9eTT70dASRRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UPHxm3T/b8EYNvMQmOCyDcaNXcyjB+8yoelwBcWww0P8bvtyXZK2um7S44IQoE0EijcMSmQ/hGgN/XAppy5vDOXlfGAXfnnrWmHFY822oLYEDEOpPcYuSu/IpxMnICg+Cmj3OUurFfXhW0Mv3M2UCiQ/miWdt0XdzRcgeX57ih8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cz0meRht; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cz0meRht"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-892be220682so1241b3a.2
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2026 06:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791378977; x=1791983777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/dj6Lb2IvVTeq+ptx1rfH6bD+cptgUsmqXSt2Gyxeg=;
        b=Cz0meRhtEhojw5viwOezkSaV86kQz9M0J04sfvk5RAM9VYoVsKAkyEBTHx7B3l8yc/
         xVF5X5g35VeE5WinuVcPhGNdemupZ96cBhmEmTUNVI25QBcEbWim0lLjbdpiWKaJXrk8
         ECLwNIAqY3C2sP9LwaVE41UJVqfiJ9wvdvqWnqOfi5fJsZT0p/lC8jh1SrQ5e21S0W6k
         zrSIncOTkhsiIBeKrCZfLp+/4lW9eicyMSUNjblQ8Z3rvRclBAf759eGOXtGyUFlHJ10
         5atpIKF4DXUoZJZUeKw1jy9KLb+clVuAa6A9mmDogZ9gSorIrxA8VcIJ7mA3ZA9FN+k4
         03mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791378977; x=1791983777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/dj6Lb2IvVTeq+ptx1rfH6bD+cptgUsmqXSt2Gyxeg=;
        b=aEI2WJ8M9utiQfY1OdZOcndvyTNTG6AJpmy+Bb3T/LshMzLKFKvTaezeo3+8SSdAlz
         DfPckrtNVlAru/8yXZE7l3Wx9+RW2AWV8qjF2Ezpt+w2dLmrYCQ6fOlr964bx6DHv/BX
         aei5uhT0A9Vd7EgDXksZ+r0rRo60Z/IAg/taeAq2xE2vFj/9fj4UZnQJGYSk8EiI+yfm
         DiFIYIi35SY6kUnkx4W9+UAAzrKMHgBpFe+OmT62MmsNqf9qks2zDNssD+ZAsLbX+OGu
         7g4/h/2HB9IyDBK7F6rJc5nP5kbQTu0oglKLrvJh/OlH4zxtKE02Yr7BTHnpHccU2JI5
         F6DQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJGWNI1gbalHY0VJSH0zkqQThn/kwGuSVDn0VH538t4qUaCUetVNkv2UzV16EOILBH7sBQDSIeuUQ=@vger.kernel.org
X-Gm-Message-State: AFuF++msE6hpYONQG71tzGhLfeYABBANF9Q7mYVEX+/s2EcZrUWTmttQ
	9525kKNmgExagvFTrexGVPdsQ+N2qKuJSAExTUDRv4DEr03IxYYyCzHb
X-Gm-Gg: AYBFou3icOdg/eZjnXQHHffnURSRKVnSPrUGYR22BUP0G6v3uKe2esW2HXzs1i81MwC
	iphiItmpEIUgVzdxR4sDt+Z/yMpejg2luhCzw+RJJCb9RvCoMX0NMTjaEL5xYr/+wQB03RkMYTl
	FYVym6s0BnnRwhcr6YYgWgjJaYM+BaB1fh3BrmVSeLd6Qh0uoP1DZrUM/dJhUj2pQ29P2by56N4
	xYz2qVaLjPTfK1Tln+5qqJ9Kq8+X1ZzTzNnUPNfwVIeNRs57ZPVXD7h644AFP948LKuznQoZjGr
	Dgufz74BXaS5fFG67QomCMCZEEWWsp2+h5Dyfx2l0RB3XkHeYBjK2cNmKCKyo0BGQmc39M3HMZq
	SUm81G8tGLVUzEKBu3lDf/2ObMOx4hX3lLMGY22HhGsKlQ1WPlQxhG4BWjt8C36QondkN04fgwL
	y1bn4RMf6hx6G9QNEujQpR0Fz9DvzrpfWG7Kbk6uRo4pRnEwAkvo/oSfZHNgxihm3gJJ/szJO7L
	izAX7SO3qI7Pw==
X-Received: by 2002:a05:6a00:4803:b0:888:400:7fcf with SMTP id d2e1a72fcca58-891b3b4c652mr1740386b3a.3.1791378977074;
        Wed, 07 Oct 2026 06:16:17 -0700 (PDT)
Received: from jfliu-sfa1411.. ([240e:36d:b09:1810:7fff:6550:13f4:b6f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892bba97a22sm80118b3a.49.2026.10.07.06.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:16:15 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: robin.clark@oss.qualcomm.com
Cc: abelvesa@kernel.org,
	abhinav.kumar@linux.dev,
	acelan.kao@canonical.com,
	airlied@gmail.com,
	akuchynski@chromium.org,
	bleung@chromium.org,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	jesszhan0024@gmail.com,
	johan@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	liujianfeng1994@gmail.com,
	lumag@kernel.org,
	marijn.suijten@somainline.org,
	pooja.katiyar@intel.com,
	sean@poorly.run,
	simona@ffwll.ch,
	yuanhsinte@chromium.org
Subject: Re: [RFT 0/5] drm/msm: DMABUF_DEBUG fixes
Date: Wed,  7 Oct 2026 21:15:43 +0800
Message-ID: <20261007131543.7634-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
References: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rob,

On Tue, Oct 6, 2026 at 6:09 AM Rob Clark wrote:
> With DMABUF_DEBUG=y, the page information is stripped from the sgt that
> we get for an externally allocated buffer that is dma-buf imported (as
> opposed to an exported GEM buffer that is re-imported). [...]

Tested on the machine that originally reported the breakage - this
exercises exactly the externally-allocated-buffer case from your cover
letter:

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer
  SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y

Hardware video decode in chromium (V4L2 decoder capture buffers from
videobuf2-dma-contig imported into msm and rendered by the GPU)
displays correctly, with zero arm-smmu faults and zero io-pgtable
WARNs.  For comparison, on plain v7.3-rc5 with DMABUF_DEBUG=y the
same workload logs UCHE translation faults and a __arm_lpae_unmap()
WARN storm (~470 traces per minute of playback).

This is also much cleaner than the translation-based approach in the
follow-up series I withdrew - mapping from the DMA addresses is where
I should have ended up in the first place.

One small suggestion for __do_map(): panthor treats "map_pages()
mapped nothing" as an error (panthor_mmu.c):

        /* If nothing was mapped, consider it an ENOMEM. */
        if (!ret && !mapped)
                ret = -ENOMEM;

With the DMA fields now populated on both paths this should not
trigger in practice, but it would turn any future regression back
into a loud failure instead of a silent empty mapping - which is
the failure mode this whole series fixes.

Happy to run more (heap-exported dmabuf import test, kmssink scanout
of V4L2 frames) on any revision.

BR,
Jianfeng
