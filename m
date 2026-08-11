Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD243AE19D
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 22:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786488810; cv=none; b=MQ2mk/qlaw3Ni/iPvR+wgC/eAeie3s7B7YVoXo9UkpA4GVCKPAZ90XEklS7SkrAJYQbplM0sjVvMlMD6z0ZhOObd03e0mP62FWhZA62xygJapzQDXp1Z7BUCZsvkORB8jG+kMhUm8Mrq0XbPNbQ6UPdaW0lVl0I1m5YLDidrFRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786488810; c=relaxed/simple;
	bh=YQ4HAHTxj7qU6tYzGeoF602jIIrwnSrAyak9jpfBM0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JkEsNkAwvpHmM26nl96fP6MRLG8dlwS3uRr108Vlfs5nLxQrZfVYM/zBTHl6NTmYErnHkmQogmkOqSphIzs27vApXitRc9fSVTxj1ei3yIyRlLYaoecJrO2dgQTYjAe/i+o/Ch0rGm3z0cPC6reZTlDatFTLmqna9JOMjhwm17I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SyKtZjjz; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SyKtZjjz"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4a427e628a9so186526b6e.0
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 15:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786488807; x=1787093607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QLL9rTiC5SLvih2di+U6KnSJGxV2qGIcYMvCuEbtdHg=;
        b=SyKtZjjzfT2UlxOe835vwY+rL6eDsUyR8ANd6G/i1uEGrDv5BeHPctygbJwdHeJX/x
         f6VQCJOjH0QLKGaux3Vr0W+0rT4g5tCCd+46QXhyir7Yit6CU/oPN40qA9vkQhktjkZ8
         hh03n67fQmJZljWtMBlZIhE9Y24mMctsIEoBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786488807; x=1787093607;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QLL9rTiC5SLvih2di+U6KnSJGxV2qGIcYMvCuEbtdHg=;
        b=hxPZsCzeL/YeRKUiRviLJMNYjma1X31TRX9Tsy7sS/Ph87uhlYt0wzEEAOwKGKHD+Q
         bqPUWczASo6BODu19MwsaMmTneYPw4HVkNitLbUNH43tn1Jgl4PI3MDYJySWM5ecUthQ
         pyOyK0z71hMY4FFxlbn0Q6WSPFI4ynEu7uc2kRWPA+ScqVj+gc+zK/nYVmHNsTrK6vje
         J+v5safrvgIFjURRFSnWzUISpcv9iB5NB/ZgXcPLafyN/CGabkYJ2Q2wM3+pW7BEThiH
         Cbp6ris72saCWYZhI+48Kms5gDOEyHVXFm933IVafRUYHs74qJlHgfwXZHtzAe4P1I17
         u7Pg==
X-Forwarded-Encrypted: i=1; AHgh+Rrgpxehgk3gVeM2uciqNCj6hYEfIDcgdCx1Fek47ikZ+XF4UsHzwkgqlPv2z+0zdmVADUor2KXtI6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAJtFSEb6yK5dUp9hGwGXiZ5VGvkBEhHPh27e2wuJa5/RD7+/o
	OrZAZUhpKsaRSeAYEayWHHXQDVEmuCS+W8LqJwGHaakgPdEkPiQis4ANrXP/DWJpPH8=
X-Gm-Gg: AR+sD10/znfSRrpmGFLd9swHe95D9dLMR4/Dx7oYKEKC4YhzygfSiS2oS4Dg5bzSPr2
	Ab/Vgi8oEZOt195aG2n3+Gq+aOK4EIP55E4FMzyz65GbyC4Ve4nKvtmqlPhUMYzyqQz9cwm3Ad4
	ln9KWVapXHPypBQT9dtOQUTOC1TQrTojpFvh8s3qdm8Z8wij/YaB16S43CNzBzAIxTP+iCFyFzt
	VpLqPMquU43R4wWIpnQEbtBAdUhwu91LwxgEaaYHmKaoHt1ZfKSg7pAipX8UTnPRK8CmTYNOB32
	nlzQpoKgODmvL/7BJUXwSXFpYNPblMP6uOzGUAKF/CGxyYmmgpS8XFt4eoyjnlo2INLHrjPl8W8
	ZDFDpP+/tEDKupjNXmEKMdt6SKUYKzpngCqNkNSUGnUwhYI1q2782BQU7l2fGoRyiuoO8QrI6ap
	sfVdbNp3LTzyJQ4GnOP/hKmEXYWMQvvhHRPsRo751ZAPJeW9z3r70mehKT7TuluaswHzQkVgApT
	4zvRNhh
X-Received: by 2002:a05:6808:1385:b0:492:5684:7ab3 with SMTP id 5614622812f47-4b210c6fe4bmr646183b6e.21.1786488806722;
        Tue, 11 Aug 2026 15:53:26 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b20019e83csm1829535b6e.16.2026.08.11.15.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 15:53:26 -0700 (PDT)
Message-ID: <e3473010-e995-40b6-9040-e38f51d1a6c9@linuxfoundation.org>
Date: Tue, 11 Aug 2026 16:53:23 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] usbip: usbip_host: remove legacy rebind_store in
 favor of drivers_probe
To: Jeffin Philip <jeffinphilip14@gmail.com>, valentina.manea.m@gmail.com,
 shuah@kernel.org, gregkh@linuxfoundation.org
Cc: i@zenithal.me, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260811160541.29461-1-jeffinphilip14@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260811160541.29461-1-jeffinphilip14@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/11/26 10:05, Jeffin Philip wrote:
> do_rebind, which sleeps normally gets a mutex lock. However, it does not
> or should I say, cannot check for null udev between spin lock dropped in
> rebind_store and entering do_rebind. This is a potential race window
> already. So, even if we check for null udev under spinlock, we cannot do
> it outside. Regarding do_rebind, it is called during stub_device_rebind,
> but that function is called during module exit when all files are removed.
> So, do_rebind is not designed to work in a concurrent environment in the
> first place.
> 
> We have a safer function that can already do what do_rebind does,
> drivers_probe. So, we use drivers_probe to rebind the device rather than
> use rebind_store.
> 
> usbip tool references this function immediately after the device is unbound,
> which is safe for the tool itself but since we opted for drivers_probe, fix
> it by using drivers_probe rather than rebind_store after unbinding device
> which is more safer.
> 
> Tested and working in both userspace via the tool and manually echoing
> the busid in the related nodes. rebind node is still left active with a
> warning to use drivers_probe upon encountering rebind_store.
> 
> Thanks,
> Jeffin.
> 
> Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
> ---
> Changes in v3:
>   - Removed rebind_store in favor of drivers_probe to eliminate race
>     condition

How did you find this problem? Is this generated code or did you
write it?

Also, the first patch removes code in rebind_store(), replacing it
with a pr_warn()? The second patch points it driver_probe() - what
happens with just the first patch?

Did you run tests to see if you can bind and unbind devices - does the
driver work correctly?

thanks,
-- Shuah
