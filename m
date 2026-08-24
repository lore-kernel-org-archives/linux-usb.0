Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32788346E67
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 07:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787557627; cv=none; b=MZ3GH/CLmR/ZsxQw/7BsDCQVusOR6Vvb6Scpm/R0JSDvbVBV8+iONdlT0t170w95sr3078frtDi2lT56+F5vs97JyHxg1Sr5UhqpBnarfpv3X+CEWefgaBQw0uG8HM28ioKfGyP9SEHhjIBbWorq9k7rDyDkT3Ztgkr6xcLqkUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787557627; c=relaxed/simple;
	bh=o7Ey87ju4LDetm2YcfYnI4gNiACJzvnjsA0ht6b+JOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ml3pYnBjzvAu/JfaQkMCwLmI0OQ9OKgA/B305nIvmPefLz8247rU7rnYnUSShgWql3LdRBerLi2rgdCimMOwc6a3UoVZuJbg4X6Y3iE/eKrH2vU5/+XzY9vB5eRXv5L3dn9ZkrFhT7KE10tuggr9mmzrPEoPxpo8iJJxorFXShE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxAD6GO3; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxAD6GO3"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so5549729a12.1
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 00:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787557624; x=1788162424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o7Ey87ju4LDetm2YcfYnI4gNiACJzvnjsA0ht6b+JOY=;
        b=cxAD6GO3sjOB7VLp8y+U9dcSofBzChL4V9w5xOVowcZmQnc6tJ2wWA7cAfX8vTH8DJ
         HUzUJJvZEfcAPRd2rAIGl9WOdScZgTLfyNCK80NQUs38ta5DyuNhgBhazjyGA8KXVKdZ
         ABU0Lt7zTDTZkBGXSWksLF8UZxyzfWLU9IzrFQTcVwQ4c3b7tFJ2FaHGonSIo3lkxKkY
         A/N+apTOGF4mNOMJSahm/8EvrSk19BGN7/qTmWJQlXjLdPwkXCsobZd3exKfqhwKj1Tk
         ZxBodgfWoLfl6HsD6hv4IaqMI27yaqUPOzqQtzwEC60nXddnt+urSUgvEWiqvuIvLmZH
         NHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557624; x=1788162424;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7Ey87ju4LDetm2YcfYnI4gNiACJzvnjsA0ht6b+JOY=;
        b=DuMUvP045BgZ5K+qLGYIrWP0kSzLxaVNSYEUc/FGJnrp/fME4K1bqyQ/cgmapo83h7
         68Ocay88myNhaRF6PaNDNaDx632aKB3YCcp3ZNTW4ZykrJGdl63Gk+e8qr4/k5Xm4CKZ
         A7VFiBpu1v+UFKRbfPcHqlmIrtC4DTF1zEImUzQP4JHoMZmZQFqr/UtlD+hxFHceu6GQ
         J32oGSRse8MjWceYVcSO3wDHck4XYP4BO3b6pCsxyj/3yoNn9roVWdQhku/lrZoZRby6
         F3T9EJ8tej5mhmSxYMKxbmmQqlBX7z9Ry2e0Tj+Bv2Hc4WYwbze8/TvDQlWxkJ5PdF7+
         1HKA==
X-Forwarded-Encrypted: i=1; AHgh+RqdiVULJQZkyK1oSLrAptJmkQPSWnfhXwWlAbQeEXgvNcsIgv9MbVSITCEyase/sE8hH+RD+qb0IZk=@vger.kernel.org
X-Gm-Message-State: AFuF++mxhnZInQxhA2Yu7y9T2sBK7Vmq5f+kvi6JyQFsaFaXMdkQmc4O
	Tm6hmMwdH9414EOE3sb7FCF4MKHYdRlSYmIHc9NUokJOh/DExcB17wsz
X-Gm-Gg: AR+sD10fUogPqYDZEwwZJdvSIralpTvvx4mA1S+HZPBf21dk/9UYd1RuV4bO4oi4gi6
	kCHDwRbIcIKuPxnWUXVPo3YV5CngA7d5h4B2v+zF7vg5QawQmn+P9f8HP73vgrqxEw8GktIoYT/
	1V+BZ0ww8lnH1vGHeg7HQDUFbcoMNCm+wJYRKhKevYQbwwsUm3UyihRK2QGXwV3+JqjihrlCKDG
	d6mQpUtgV9seQNbSxsydTFldtpAQkRsMXVD/6UpAJP5HiGvxUZQRjLgroqw02yZh1Pza7tzj2Dn
	9CT6CwK58w7+e/qYLRCBuR3c0p61jjGWAAipoAOH3tKZfZILHUa+JDBPfA4VmPuwD6s0x72PF7V
	q5sP13PKcD7dDZM4AJj79BJVMBiqaLpuCJJdZDPI5hYuj4aJ2AuFMsklwnD10Bx3I/kjdWlYqvc
	hS/RHc/Hfgdcho5JWScYqb1Um4HtoBdj1010KJ8XUmuDa5LtrNHd/ROqNv6pUDcj8IZu3aiwUSt
	tLxmQcvcw+lzcG35UHMGBtfS5os1VhJ+m8k/teSeDVW5Qo7B4pru68Op4PK
X-Received: by 2002:a05:6402:27c6:b0:6a3:f34d:8f67 with SMTP id 4fb4d7f45d1cf-6a42f19fca6mr26412323a12.5.1787557624189;
        Mon, 24 Aug 2026 00:47:04 -0700 (PDT)
Received: from [192.168.1.187] ([188.192.159.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5b93f3acdsm726997a12.19.2026.08.24.00.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 00:47:03 -0700 (PDT)
Message-ID: <26b990b8-51ce-4303-9dc1-c41bfce69900@gmail.com>
Date: Mon, 24 Aug 2026 09:47:02 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: f_ncm: Restart timer when eth_start_xmit()
 fails
To: Francesco Lavra <flavra@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kuen-Han Tsai <khtsai@google.com>, Kees Cook <kees@kernel.org>,
 raub camaioni <raubcameo@gmail.com>,
 Sonali Pradhan <sonalipradhan@google.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260727165441.1969927-1-flavra@baylibre.com>
Content-Language: en-US
From: Felix Schladt <felix.schladt@gmail.com>
In-Reply-To: <20260727165441.1969927-1-flavra@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Francesco,

I tested this patch on a Raspberry Pi 4B running Linux 6.12.105 built
with Yocto, using the f_ncm USB gadget.

Without the patch, I can reproducibly observe multi-second TX stalls
under sustained network traffic.
With the patch applied, I can no longer reproduce the issue.

Tested-by: Felix Schladt <felix.schladt@gmail.com>

Thanks,
Felix
