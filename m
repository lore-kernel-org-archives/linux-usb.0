Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A01B286415
	for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 08:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782464249; cv=none; b=Uyk3n0jQ5UouIbA8UYpVV74FZmPRbAzr+jBMlwyhpiogNJKbHErU4HftaMtkY+M8LNBI+3nDt49fQ9uU4EtFz/3mey5hjDBvbXlu0913iBNEMilJYE0fr7xCjiauwnVNdrk9qYR/O8TUDOOgMVgDIIc+4r9nH1HzH8wgF27UN+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782464249; c=relaxed/simple;
	bh=uQnAjxcKadS4cMxr+8DK6HL9dEP9bGGGvyJSmmUYm84=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gpo1+Pes88iACgWgoTPBasr5lWrmJdtIJdMEH/lTorM5f1UCjxZLEsgVq1ad9lcT1Nx/wK8fgJVODBEF8dJ7+q6cUd8eFwR1iJmz36Jrt3lUROGhUiYS5HOHuD5OIishYASS2gYL+V9ZWQA9KSsSdkKa8Ko19dmgsS6O3/qAOn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sie5z9ks; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sie5z9ks"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-46db3c9a9e0so407360f8f.0
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 01:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782464247; x=1783069047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQnAjxcKadS4cMxr+8DK6HL9dEP9bGGGvyJSmmUYm84=;
        b=sie5z9ksbRq+/pZ+J42JTbXm5K6HLjzlpcbV1rZ9SIQgjTSayW/IG5RslYSbyd01vs
         ZPHr9hbdZVtidMzHtjkOGnwn1kiKLgKLADYWYFegBOGOQ9ZTsfcVHCcpM3MnbZDXHKCN
         y3waFdTExzVuL/oqj/ZWag81m+7G23j0aPU6tMsNM7fIjWBNTP+dcou1TFjpuG8aLim9
         g29M1EqMsRP0YwRZOPZWT9liWUtbBE9YXb+i2S4hVUS8Aef+ZCHa/QLfPqi9/SlV9ACU
         ewNqIRW2eMDiKcT1r+gI/FEAOYsVsFE5tHdb6eUUN+MWS+6Nl2n5UlolPrzhhPcqcXjF
         /NXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782464247; x=1783069047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uQnAjxcKadS4cMxr+8DK6HL9dEP9bGGGvyJSmmUYm84=;
        b=OffH6s7W7ogurkk86iUoGjE2XNMT9zMzAo6VkIaGTNIZyIELETNonpMGmb5v+J9CPf
         qQa4IgVcuZX81D+ijOohkR575tfsEXe+PdKfmkbPSxcKq0pNdTaoHEMEwRRPQlbHpjvS
         Mgz+L4PWDV8s4XduZ+W/8Dma6IQHmMWKia5mKEHl0TQJcHT+H2/LWCv2L5bNcznyNSqA
         DGEn+zNUvAyp0lOQHmndybUF9YDJqfbFyQFwtqcUjVLpUOl7peJgckQcUe93dHzjzfRS
         cgwgqVtwqJeSowfJEz8i1FzDadZaEmxd2GpbevVjVe+eaEFEc0QG1ShTAFS6O1kn8pyH
         S7yA==
X-Forwarded-Encrypted: i=1; AFNElJ+SFNlL6ZlevFBeevPUugpkCEfmgA4/wRn+twEXeqiFoJ2/RjHFFZZTKDbhOJkEFcOdJC4flAuxZ/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFRtpXNVzmHW8KVVlJBSqbH9mTvgO0mlpxGEYJHM4tRD6/15SI
	v++IzLO/CmowExB6QXDbjDaN+BraJNRH5HmLoeB1bir+SoF+xCJ9LTNcAmELag==
X-Gm-Gg: AfdE7ckfVg+nFZSVmMOvyu/sY3kS40DdiI93VKJYFjop4JDJgiPe15UkJN7dX8v0zEb
	hzWZQCm6bXxW6Q11yVnGMqbb9sCRhHOYBXBa3aoA//5kleibW3RbLt37unsp6Oogixw77lUxvM2
	zBtwfQt6+cNlOHFISfGinWTQMJxAusm3+UPRCE3W9yo3BHIBszjqQcbvxsoWzmsB+Lm0MKdIehu
	nqLQhwQkIva/thU5hwYY5/MNOMZSreT+qdP/jTxsG0/7lPZ0Aodiwjv/ztoZl0MJIBzDbkl0B2L
	QJMMX4xsDhlVMQHL0neW16e2SCaIOvRwzdTL8AOlSF4gvQbmjZQ6CDle8tJLuhkvdOF7PE1on5E
	cXteCxyuGJfbcai86iZJw7c8r5vIYBUMrGp/9/RsFBcCyCkfJS+60QXr5NDfkjvNpgufCZw6gwJ
	nsVC1flDdRcaj/auLQioC36Q==
X-Received: by 2002:a05:600c:6b70:b0:490:b06a:649e with SMTP id 5b1f17b1804b1-49266893253mr59786115e9.25.1782464246700;
        Fri, 26 Jun 2026 01:57:26 -0700 (PDT)
Received: from foxbook (bfg19.neoplus.adsl.tpnet.pl. [83.28.44.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fd9e77sm58423035e9.4.2026.06.26.01.57.25
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jun 2026 01:57:26 -0700 (PDT)
Date: Fri, 26 Jun 2026 10:57:23 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Xincheng Zhang <zhangxincheng@ultrarisc.com>, cyrozap@gmail.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: [PATCH] usb: xhci-pci: Disable 64-bit DMA for VIA VL805
Message-ID: <20260626105723.42972329.michal.pecio@gmail.com>
In-Reply-To: <20260626090615.616666b4@pumpkin>
References: <20260623121847.53749028.michal.pecio@gmail.com>
	<20260624070612.337013-1-zhangxincheng@ultrarisc.com>
	<20260625020421.2e577a94.michal.pecio@gmail.com>
	<178235378952.3114334.15752812276771065417.b4-reply@b4>
	<20260625191852.0a8d511c.michal.pecio@gmail.com>
	<20260626090615.616666b4@pumpkin>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 26 Jun 2026 09:06:15 +0100, David Laight wrote:
> Can you do a read-back of one of the control registers that contains
> an address - if you are lucky the high bits will return zero.
> That might let the generic code enforce a limit.

Interesting idea, but nope. My VL805 with 36 bit 013600 firmware
is set up with 37 bit DMA mask right now. MMIO registers read:

DCBAAP_LOW = 0xffffe000
DCBAAP_HIGH = 0x0000001f
IR0_ERSTBA_LOW = 0xfffee000
IR0_ERSTBA_HIGH = 0x0000001f
IR0_ERDP_LOW = 0xffff4018
IR0_ERDP_HIGH = 0x0000001f

Nothing hints that the chip will truncate this to 36 bits when
DMA-ing. We learn about it when it happens.

Regards,
Michal
