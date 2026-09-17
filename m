Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E448649A3AE
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 10:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640626; cv=none; b=IYqqJ9av0Rc6TJB+XKCwX3Mj609uDkX8wLBAZ5I5wHPNOdJeB8KY7frm3ZvPlQMUmHFNqEQbsfd9qCDAdH43/xr1zMAoTQwf6+ug+wZ127Im3fh7iSWWsMF7p92M4X+MtmXRka+d/+11yWe9UUk0yj7CIoEfOT1SV67GKgXIyvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640626; c=relaxed/simple;
	bh=B79Sq4VTLvR/AcDoKEQY06XTFQE08CROuBY3LjOGCTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CCISrLHCrj0dBBlEQG23YYfX0P3x2XNkkaUYDnFBVwFiazMW5lcQGi/S6cZzlww9G6WkvDrIbNLq2nVYSh3uTTQRJtQJkrLZNTinOiITfVmG7rdadQXUf2G7Z7VzXp272LbDYb47JnrqJUNFz6Fd3Qhg84eSxRwfoJzt1Q278Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=czYboQqC; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="czYboQqC"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so377248f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 03:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789640623; x=1790245423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=smBhTN9/U4mi8V9DsSeIx1UEjzE2dpUakWiDYgy7PQ0=;
        b=czYboQqCi9bvd7UyAHIH6EzpUfxQW5qxFJPMb9ZNgKAH/rDhxLdrWUcgZkPQvj5jsk
         K8+hBIuohT7bDleF8IHeLpzbuMpp4wBtut/3PPyPF1PFM8NV5M7JMia9gr/DWW7NAzVV
         1KhWgYH/ESqm0XqYWj1aUTBD6V0EL+ji9d3mCfBZ/59GA7/LTGhcMglcUjvklYC+NTXC
         6KmJihNDGuHQyYv5kDDsDp/6DYWI2ZsPp2wN8fqxwNaVnRrNqE3Q5+4cDPpFZpgIm3UZ
         xzMNM3lFxD/wiMenQsYG+kxq+1K23xjLKuXFGDngwx198tzE3h8P1CsUmDJ5p4nDjjxF
         y4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789640623; x=1790245423;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=smBhTN9/U4mi8V9DsSeIx1UEjzE2dpUakWiDYgy7PQ0=;
        b=tcO3e50oL1R4EugNS1fmy7u79SGLKVTgZ6eQkOd17o95G51Y+KC0jQYUZYFmpmaZWr
         yhcabo0aqCPtrKBLJnO6+ym13BvRCTookdDE6wzW6d7g1ph9aA62aVQcPdjGKLPjpsh7
         5ILLvsUVOWRwnetmjfGRDrH04q6rlFPzJvc19YAgd42ksJnv1Kn1462Dav5SoR7Zw2i1
         jVIwprWAYnNxHPSuDGUA+fC6aEZYO39YLXDB3H+4w9M657FhmoNeu8Ki8wKOJJgD+I7e
         I41KmQ6uKR1Gw0/+TsTZgqKdM28iw9wg3GStWwQQarzOEQGfMhZNCiilm2ltuYWpuCbE
         4e+g==
X-Forwarded-Encrypted: i=1; AKwUvBzzf8WibeFDsHCY2FRfpr3Xql2hkUGOAoLUqRQHOVWUB1B4E5OtY4A92VY/a1l08CGwRBmOwtw2PB8=@vger.kernel.org
X-Gm-Message-State: AFuF++nrF2aDhVmUuMmOb0x4qd6WEI9Y2i2gu91PapfFDZbNZCZf0aGG
	X9puUqKXBRBy7vDaFGh5L6bbpaTgDvsTLMe2PvNthXQ9uk51Vg3jqtN/r+QQrO1pRy4=
X-Gm-Gg: AYBFou1NRUW1JIYUTwR1E+ala6WzTvNvrOkxaKmTUv49spV2nk9jKymjCbmSr05iOv1
	+XV/s/n7vEUtxv3pbJGvn7/ghnZnf4A1u91BH4Xg0HLKslyPg4ifpGH14nCm7lFSj72XqD0UUFB
	vTTy0Hzq+MUeNK4NEVXTxmlt2I0nBKCzEfNq0z/KsqKbWMnnPF/3npwAadvPfN6Ygg+0n4MEpOb
	a+GaJ17CVhTuzJ6C//OLFoXwoPHOJoBN1uWaGPyODQcHMix8teH2mMSKFHnb+MAZnCmayE39jEL
	E9VXBd2swLXxo3czfUZpx2cC03X3eJUxNMWMQRdK48pcQxxQtK6ZyOmmoQR72ObCsstznWiOLWF
	eXeuqvi2jO2c5grIrKbydBp10K6OXlcvdQmKDwQP8XXSx4rlO5Mn+8ZOhE4xJdxRb7JYNKR0ysO
	6A5T2Oy2WMnOxip35nhtKsH+RlGVnEarB1TbMnMGxBVRrxWWb+B6vArzRi8Vy9SEoOTeI2ev1WT
	Zsfh9GJIdZsAekleT9lainfbyc7PiSiUwAVtt+uj5A=
X-Received: by 2002:a05:6000:2303:b0:487:34a:5a3e with SMTP id ffacd0b85a97d-4870cee0b5cmr14494524f8f.3.1789640623043;
        Thu, 17 Sep 2026 03:23:43 -0700 (PDT)
Received: from ?IPV6:2a02:3035:b78:b364:35d1:1f7e:e764:4faa? ([2a02:3035:b78:b364:35d1:1f7e:e764:4faa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf4161fsm13125381f8f.34.2026.09.17.03.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 03:23:42 -0700 (PDT)
Message-ID: <6041fdad-78b9-4310-a86b-f9931563de19@suse.com>
Date: Thu, 17 Sep 2026 12:23:41 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] uas: JMS578 returns reproducibly incorrect data after host
 reboot
To: Michal Pecio <michal.pecio@gmail.com>, djraszit <djraszit@gmail.com>
Cc: Oliver Neukum <oliver@neukum.org>, Alan Stern
 <stern@rowland.harvard.edu>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAFKhL9eUM91rtywaz_7Mz+4mJH2b2csmOmc3+86ii3a0Ka3Q6g@mail.gmail.com>
 <c335085d-a824-4632-ad3a-c06715258c81@suse.com>
 <CAFKhL9f6aLZgerw_7bohbQWvzMxSfd-m-LFcuNP1_p1vWkN4=Q@mail.gmail.com>
 <1320caa3-85b5-47dc-aa2d-56d3b003c6ef@neukum.org>
 <CAFKhL9eTD7DxtxMSMuUVP9cDG7Nq4jvrkTCjYfwr9puZfuC4Gg@mail.gmail.com>
 <20260915233818.5881ad97.michal.pecio@gmail.com>
 <CAFKhL9fL++S1xh+aUCuYbk6EkLQnfUn95y7TBoWaGnPAVP1gYA@mail.gmail.com>
 <20260916204713.22c4f575.michal.pecio@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260916204713.22c4f575.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16.09.26 20:47, Michal Pecio wrote:
> On Wed, 16 Sep 2026 19:56:25 +0200, djraszit wrote:

> Looks like JMS578 doesn't like being connected to a booting Pi 4.
> 
> Or maybe it's shutdown? What happens if you:
> 
> - disconnect, shutdown, connect, boot
> - shutdown, disconnect, boot, connect

Maybe it would be worthwhile to shut the RPi down the hard
way, that is by suddenly depriving it of power.

> If the problem is boot (second case works, first case fails), then
> I wonder if it's the firmware or the kernel. Maybe you could plug

But then why does it work at all? You'd have to assume that
the second boot crashes the device.

> the disk after the kernel beigns booting, but before xhci_hcd loads?
> You could blacklist it if it's a module, or bind pci-stub to VL805
> to prevent automatic xhci_hcd activation and widen the time window.

	Regards
		Oliver

