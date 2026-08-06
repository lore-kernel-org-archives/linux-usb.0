Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C7C3DB633
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 07:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786001473; cv=pass; b=WTYOh74/s5+ANxZxVAN4BoKmc6RkAxk6hV24t9KTpRM0iEr39yjP2jlVpKdERGqM/4FTasAgMhx26r2MJCTmWdJo+6aNTT235pmXyAz0JIYGrWevPnbz+BWVR0Y5qOS0IPkGxaQTCgpu7RpdhkOiRmE3kcnQalmYXBwZnI5dlsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786001473; c=relaxed/simple;
	bh=cCy8hNBytO7JCihs71pSJO8ASKujFEFLUhGTIu5VSac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xxwa21YspIXFVGBWe1Nv00RxJREb7yhBLD+PBhxLvTTlgvVlgDFqTPHSmLbO/TdYcKUyn9S1GYIVagPWLoqZmS3pTeA130U101drkPu/ALjuEuYNCwNgVfSkOl1H8HfIUN3de5r/KJEMOpgMVKm83qVmcZCWK3Fzokdb1vqkWdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoMB823g; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoMB823g"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so1739512b3a.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 00:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786001461; cv=none;
        d=google.com; s=arc-20260327;
        b=ogfwOFfqcm/HNUV+pq0f4wyEOCNyf0iaH01XRxHLL/+zRroBjEFnN0VxYOgnrXCZ1B
         hhG2vQdWwk1gCVeW3O2jp53XBxvsRq5+A6xaYFwsyKI7tgv2cuemm3OEh9QvfSMRJ/tI
         kZ4UonBSEfNem5g8r4ALbiwZyjuUvk5GlnYcl3mFJWSXvw1dGuGFG60jfUyZOvDdBNBm
         REzqAyk5goruDHsHHph0qhN8bCyEiDFuJAILb+MzFdpSW3Q6o0dFtFRkTLl6Yop+xAl9
         bErNPm9KivuEaIaYgIUV1MnuFHbX0UFGML7O9CkleAU2oNHCFNa3+cIVIjsGIM+3xvqa
         Fs0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cCy8hNBytO7JCihs71pSJO8ASKujFEFLUhGTIu5VSac=;
        fh=bQSUoYtpzDDDUEUq5bh2Pe2RMxjgjAkjynbQSncxlvQ=;
        b=VZbuAGosIZh4u7420nwOBFH+0PPVs+zNFF4UMVeZ2N03tL7aIpfzijUqTaEluQzEg4
         8+EfaKSERb5mswQ7FB4C4G6Z90eiHu2JUmVI26Nl9AGm7lCUpn7M2q9lec7oisUGCsIy
         5bVab4xyTU9RRIjj0pQwEuXk7GvvfEikly64PYIxQ5lf3quhJMSzYqnlduNIyJxrnNhf
         0eo6NXsOPkwWV6mT42jvG3efR1ry3n7sq22lT7FvKhw9EsIF0EluaXfAyi2pjWKDAjh9
         Jo2KTotyQ6g9S5ToCO4EJXR3dZ+vH9a0rqxLHD9CaHJpqH6twQtTtvp+ygAA74RsRbvn
         5ptA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786001461; x=1786606261; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cCy8hNBytO7JCihs71pSJO8ASKujFEFLUhGTIu5VSac=;
        b=SoMB823gkJhh+OfcBaYymZmx6Dbb6UwyzCs2TfcHoQYe1SXaO3XvR8MrkQx4qWGLI9
         AL5tDcRGFFgVkIVBSYinB/WRKVOJtXYE+inAFxDHwOyEC+mKRR+CLl8RxmNPCts9C6kQ
         V91MwnvXe3i4OG5ha8yVHvj6oIwjCfOKFrxJZ5xI9VIOSdkvrtbpuFyDYJODZYgmJQPI
         NF3qk4w8RHwgvMpRF2cT/t9Ojj6DKWy8rHOOc1tB2EdaEb0MSnR+AFxVktGEVgeKUtZP
         OjMgfX3zy4CLDJFwrdHFK2HqIc/B5FauRzz2gc4iZKcX4nYFYvboDfyv40PTxJWiZr3/
         TnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786001461; x=1786606261;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cCy8hNBytO7JCihs71pSJO8ASKujFEFLUhGTIu5VSac=;
        b=bNWQg9RNsqS20ZbZwrZ6octcZmfkCEAYIq0aZgkbEiAhdSzH0+ZZbHRUjm9F4aUDVJ
         6woUZky09WqI/Nnh/3J2NLPEHzi4vZbH9m9G9yArghpPlL1aJW+/PZefbXwwuijSdACO
         kqY8lpc1Yg3DxtO5mmUtfTmSjQmURhlAdEfU9N5Ay4OPw7HbDVehKW5MZZ0OWsfZmCuS
         AmPS7ICrwhNGI/z/WOY3EWuPE3OZiIRhrnNxotrvQmWfYGD0zyMUUKUJvCP23jAUliFo
         hVsTiv/q2hwyATdm17IK1G4fHDCDUCpVVDTyxlPFv7Xdm9WionPwUff+lRiEYLRdGRv0
         cyzA==
X-Forwarded-Encrypted: i=1; AHgh+RovCw4wLlA9VOMQF67t8QvMRPvH9p7MHrvGIZKM0Myhx2otc2oKDD4QxW8ZG3y6Yt6Qo5NgHi10+nI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWBHJ2vdqxufL+a9T1TPCsFyVKT5JKDr59z5dI/PSCf4k67xSb
	XhOC7CLvnAQtVvHPkSZcjE6DsvgocN2c0VNLCOPuJCVtmwtSJZceIjeyN3azippLjtee1iM/TaT
	k/338v+hhWA5Q1Y3uhvBM1I3wF+c/22he1diQ
X-Gm-Gg: AR+sD12C6kAYMiIXY5lOJRWUsxFpdCcRQzyxhUU1Xnz3VbcHrHcIEquYoIyv/Wibsuf
	okCaDfjMOwi4sbD9IS/q+lZTl+7LtbW4FGGKerr4nQeu1vl0gzVpVuyyihs/6tJ2SmL0/4J4tTv
	T4QOd2Nsk5uruZNFTCUn0jUcMx/Lf03tCk+io5QeBWVdvB4Rw+/CLRgxlZHOCux02Rps77ShJSP
	2BwSmNA9PF/dgNMvThBE/C9oc063LqYVnPpoXl9k27YMmA3Df2OUxQnbR6Xeb9xSmsm9wY+468G
	3Rjj1/H52xiEx07P88F0hNqRJoIiMT+QRQ0ZQ3Ugx+8781aLbN7G6sQhbWY/26Li4a4Sh5c0zFa
	+FM3sPNTeWyhaQ4PV/hfbfCjlAIWfpW8Lh4aCw3avntjDcuuNRsyut8mV
X-Received: by 2002:a05:6a00:10d3:b0:845:36a0:9eb2 with SMTP id
 d2e1a72fcca58-84f2e13a5ecmr13832406b3a.34.1786001461253; Thu, 06 Aug 2026
 00:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806063933.27331-1-phucduc.bui@gmail.com> <2026080654-glass-swiftness-7068@gregkh>
In-Reply-To: <2026080654-glass-swiftness-7068@gregkh>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 6 Aug 2026 14:30:48 +0700
X-Gm-Features: AUfX_mxyG0a57Dzpk39ihaHkRqHzR600KbxPXBwJyNP8FCTm6REQEj8d067Yt1o
Message-ID: <CAABR9nGBLoRdHUp_a35E-ASa6RzMu=z8GXDjPYw-ptAPfZ94kg@mail.gmail.com>
Subject: Re: [PATCH] usb: xhci: tegra: Propagate -EPROBE_DEFER from IRQ lookup
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Thank you for your feedback.

>
> As before, how was this found and tested?
>

I found this during code inspection while cleaning up probe functions in
the Rockchip ASoC drivers.

https://lore.kernel.org/all/20260806052136.21034-1-phucduc.bui@gmail.com/

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure, including -EPROBE_DEFER. The driver
handled positive IRQ numbers but ignored -EPROBE_DEFER, continuing
probe without an IRQ instead of deferring.

I only compile-tested the change. I don't have the hardware to test this
path at runtime.

Best regards,
Phuc
