Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E95A44E643
	for <linux-usb@vger.kernel.org>; Fri,  2 Oct 2026 08:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929780; cv=none; b=ZMRyKFvD0+JKF6xbk84yvxLmaEQglPagNzEVhpVpk7zfqzD/3yqa8/6QO3/KgHUxkHV5+5e2bDzgGzGArwNPqPy6qkceBlmLLpu0hgiW+1xsepokAL9d12MNjUiwD0HkGv/CfAagh835kUu5ZRNEWxyhgWu0A8snLEYZgfve1rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929780; c=relaxed/simple;
	bh=4fs/VQZKtb98+M3k1wMj9HBBcIArXcqoyONJWXODarI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LEMZfyYxd4Z5Yg9D+o1yJmeApl2zMy7Lz4EzTTirnD9t7o8tvZ8iDjBX88QbFGdWxdVqRD/TF934fNfc44KpLlgkgZHrYvTCiB8QSKkk2Lfo7jUQqW3HiCf6kAObhpUSWh2fxKU/7Akx1983wi09knzID4vdIfnfiyDVdHYhptU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p6Gm9VT3; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6Gm9VT3"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso56176605e9.2
        for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2026 01:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929777; x=1791534577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HxFyK1o2cNI+UQbuw/QFce5jwNiOPgdR3iM+OqmqoDs=;
        b=p6Gm9VT3VFUcTbQMFn99A2tQcwrShXNDFqwAHoFUfwZkeIxC37ZcuvuF6brPRC65V3
         vqUW5OXP16Qpl4xjMqpchCGHDLlQgr2OGm4DoiVRelacW3Pg/tXtc5GR71fiqjs1CH+7
         hZqt/ddk9fu++gvBYTC7lhGlWiB4suMZa7lbnI6Gfrl+IoFDQKmJ86W177U/cGHTBGJP
         f+9psgxZBJmjXaBAvXxDC5VQWaWEjTYC9e76EZuhOtaRDx1V1o31RIbNqc8EClbWNlMr
         CST6sx2TsCnXwyylmmtEgv58J2YLxvfKp0Mgm3nQYcDQb2c56QvFHDHQL1WDRqFPCS5/
         T7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929777; x=1791534577;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxFyK1o2cNI+UQbuw/QFce5jwNiOPgdR3iM+OqmqoDs=;
        b=RjPy8qxTzw5ht7suKJYmOOC9OYLYUTVF/fQhWHIfkzykvsOL2KQExv6kmCSdPV51rt
         bmSdHKVCkRrE9AQ92xnwhceIlV1Vg8sk6OM26jzhAdziCVaaa/pHifyZGRvwUw3rqbAw
         P3JnX59alTqBt4w16FSa6h+HSJvjXzUFQqZK7IXV3cSG3Z5/ShQKBZP5UE9i3adC6pSo
         2wQ6c6mToSU/aIOKBi9gzG5XSpSe72qbFAkslyPHwng79+ThVrMPK/Xhh1WSD/qI66cg
         DXONu2zPJADO5PaGOUjNNkbNcNJ87hQ6HPdwDTCo/8IxSFsq4Mz/NnmHbdI4Vig/N0kk
         lUzw==
X-Forwarded-Encrypted: i=1; AKwUvBx6TvgnekVLpgTCXz9BZHp/ojeoruiPRyhbyBmSvSPluisNPXAkyEFhIBUAttB8INuLZ9MeG713zVA=@vger.kernel.org
X-Gm-Message-State: AFuF++nnWUnhbyF8JblNLtyZ8RNSchGNSTNkT+HIfua4vA03nQzEQFAQ
	8DJ6X5BIt+N1SncFhBMDNjXLqUgNO0TiegbBsJ8tybgOOqulp05YMacK
X-Gm-Gg: AYBFou0plHcBX7CbxsjNyTGO/GCpnZanoPW5DN1HVk1Svz+GyiosMjfbXcNG4H8dbyy
	ivR6fGdHLjBcW+LT44VlzLsHeAU6St8fQGTQa1PBO/K0DtqRSkbKh1ANQhZBR+jK7oD26ga4A1l
	HEcyqQorFmvZy5C3+0Oj+//THuxALpfBZH146DxGwXMnoASY56tIpBrT2k6X+qqaMKPKjrpPuh2
	UBreN2WfQNU3kjiiVV4uZcR0oxWfBEjN4nR0jIj9+Q9uh8V4/NHIMfXWWrW6+GorRwX5JzQ2l14
	0uakg9AV0GmwDpGJvMeKj3CjbnzUdkBda5fzgFdrF1qioE6u1ZX8IlGYhyJJ/gJ02KK6b+BJ1/m
	i5F5sc9mje5bxtLEV/JYnFKkHJjhK8ZXU2Xo85m7pgwzTlTyKeV5nkCOLayAr0Kcw0G5WQArDw9
	NDbOohtQo8zKCRE4w7BsVYBIQ17saEyDvz2ab0vaD1wH1ufA9zgqBE9XoIel0dPP/GpYCkbMX+U
	J81eedh9w==
X-Received: by 2002:a05:600c:19cb:b0:4a0:98c:e082 with SMTP id 5b1f17b1804b1-4a02759fc4cmr37942775e9.13.1790929776330;
        Fri, 02 Oct 2026 01:29:36 -0700 (PDT)
Received: from foxbook (bfj133.neoplus.adsl.tpnet.pl. [83.28.47.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm71100105e9.8.2026.10.02.01.29.35
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 02 Oct 2026 01:29:36 -0700 (PDT)
Date: Fri, 2 Oct 2026 10:29:31 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: wenxiong@linux.ibm.com
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, wenxiong@us.ibm.com, Brian King
 <brking@linux.vnet.ibm.com>, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] xhci: Reset controller on xhci shutdown
Message-ID: <20261002102931.3cb06009.michal.pecio@gmail.com>
In-Reply-To: <20261001222527.11742-1-wenxiong@linux.ibm.com>
References: <20261001222527.11742-1-wenxiong@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  1 Oct 2026 18:25:27 -0400, wenxiong@linux.ibm.com wrote:
> From: Wen Xiong <wenxiong@linux.ibm.com>
> 
> Fixes kexec boot. Without a hard reset, some USB chips will fail to
> initialize in a kexec booted kernel.

What exactly happens after kexec?
Why a PCI reset in particular?
Are we sure it's not a bug elsewhere?

Regards,
Michal
