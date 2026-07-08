Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621C94611C4
	for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2026 12:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515466; cv=none; b=U0jio7OEUT8u5qtPkXIsRzx+FobSVqnEMEGWgPFFfqbVEgusaeheZLluvbjW+uwi6OWEEQEJEeNQk2g50kEUZWQjeIDmeLegssXuW201IEtamMPtZfWUfTkWOrtdf/KFcvbeR5+UAJ1CJbYAdIwKvb2dF0MSFoqaO02S2qrgqrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515466; c=relaxed/simple;
	bh=p2sBG0EfGLaH6Y35Jnfm7LcczjHmXVGXkFdF7AVbxLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMSEec8yorUPNx0dNgNtKcXEe/rtiMeyZc96SZ45pxpOi8QtA6ysrNnrMQx+J/z/0iqJMoXzbgQmonwpfS80UcsNnwbSEPzQTU1snBOQIBWpxtlVZKZ+ufQKaw+hPtLCFQUjki8vit5HOecZSfXhTj5K1VmpWH/GAN9Nld4Supc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Xb3DIokC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Xb3DIokC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b779003fso2997715e9.3
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2026 05:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783515464; x=1784120264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbuub7RzesYOSTnZvhaXlscpLtvQ6nHc+kPlYrOavVg=;
        b=Xb3DIokCVEoZjy106BwrJ3Z5yfUa2cIug9ZiCqG94L3m8f7q2TrHicUCO7NDxs9aCq
         mvxewvrBWJ4jMBELHJ7HIURK+jUnLsq9W/TN/Auat3HiII7R117KprUi5MUOJQeJEJEh
         LPeHTfjOeYljyZ70NMHAsyN7o8GQiAjVysZn1YgjoWkm7cdXkBwQuKAo7pXC609etF3a
         iqprVQzj/rPZXGLoaFzvTRPttUWEvl0sSsEaQVEFt4U+63hkeaADz01w7OidQqk0fUOF
         Z3GYO2kPeP41kdo4OgM03+Wkid20p1ERnc+URU3bDy1OBAPHI/jh/+jBGCTA9P2lBfnB
         QfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515464; x=1784120264;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbuub7RzesYOSTnZvhaXlscpLtvQ6nHc+kPlYrOavVg=;
        b=HfYBQOhGGKvJLcVA4wtPTmATRrbrSRBT01dZtWfuMuaQv8ptvGob5pqjXisFSZ2917
         fIV7PlViA+IXIG9Adnpa+JTxzla0rj1SyBw573mWx39QiflaYuO0zfFhDAkZgu35wBZg
         W2G/n4K02N+fejtIneRU7h2c8jjwWo8VCdoVQ/DnCKo1buRTze0hc7W6kvhuj0j7xH9E
         KEctzr7LuL5ZYVcyzj+1YIr5Vx+tKla9Bigy9a35XTYWFX2iwYXOa5zrpbhAxGmCVhWc
         k/sDPUMutAF+tpqxFHOfBth6KIzz4+3AS9iHx3v6HU8RsULqHkCa3NU4I6lZ+mlpJN/p
         KcAQ==
X-Forwarded-Encrypted: i=1; AHgh+RqN2oLzgpBln5sBq3O2ixBLsiv4+QAK3G9oxrmZpTxMLXS/8Uxg9Kvd0Mf+h7b61k8wF81Ief9n6UY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQDeb95XQEopZcBR5ytSQXDRHiDy44w9Cn6Z4i7NIg0dxsebVX
	NY9qayYuP7OVgy7x6IbGC04lqfOA9MCLcJvSzlyNjAe0umcdW1kwGdqJNHmfZH7uzzc=
X-Gm-Gg: AfdE7cmoyJa+WPuaBz1nJvyQTInmpMdQLbY/9GNStZP9ex9LnZKBnqTTeBFayCuJcXo
	xDcOPJAHcJqSxdjYsdgnuCI6dN5cpFQc6Vlu0cdRlfbJNzT5NC+gUNrMeO5yQMz7sQnlJSgtYcM
	2ftW5sE0G2RG7gP1UZm+rZgeWb2Msa1umGU401Wk0JBcI0wuAnV9AjgEFNE/CIoP1e20B8iGNdD
	ROtNpr5meQDS9RNWlNbaImHgMPftLtgNHXMJE5rHQz3/CIoW5GwnsvfUY52dfPpVpgMwPA3EnM1
	Mr3QMvRrG38+2BUhMoSVVxklxwWvrciagCpVNrWOwiziYYv7ROz0gbC62PTerNRXPGK4pegQyOU
	+jJ0JoxvBhhNk3NJVFrfdF4FwiF/C8dBgzA0zjH3GQth//WSenDUSD5cxHEpArPNa2AMfQNMcVr
	zX4+dcca83KS66xFQIj2UXN8Pt9369IlgaWBPBEG0hKj/RpXr9Zjknrso0
X-Received: by 2002:a05:600c:34ce:b0:492:4911:8a with SMTP id 5b1f17b1804b1-493e68bfa4emr25852455e9.12.1783515463922;
        Wed, 08 Jul 2026 05:57:43 -0700 (PDT)
Received: from ?IPV6:2001:a61:1384:9d01:1a30:62e0:878c:ea70? ([2001:a61:1384:9d01:1a30:62e0:878c:ea70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e544837dsm51934925e9.0.2026.07.08.05.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 05:57:43 -0700 (PDT)
Message-ID: <2a0bacab-951a-48b2-8263-bad3088a29b7@suse.com>
Date: Wed, 8 Jul 2026 14:57:42 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 04/12] net: mctp: usb: Improve IN endpoint
 status handling
To: Jeremy Kerr <jk@codeconstruct.com.au>,
 Matt Johnston <matt@codeconstruct.com.au>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260708-dev-mctp-usb-1-1-v3-0-9e710155cdbf@codeconstruct.com.au>
 <20260708-dev-mctp-usb-1-1-v3-4-9e710155cdbf@codeconstruct.com.au>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260708-dev-mctp-usb-1-1-v3-4-9e710155cdbf@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.07.26 11:58, Jeremy Kerr wrote:

Hi,

> @@ -198,6 +254,8 @@ static int mctp_usb_open(struct net_device *dev)
>   	struct mctp_usb *mctp_usb = netdev_priv(dev);
>   
>   	WRITE_ONCE(mctp_usb->rx_stopped, false);
> +	mctp_usb->clear_halt = false;
> +	mctp_usb->in_err_count = 0;

What allows the assumption that mctp_usb_open() does not race
with error handling? What happens if the device is still stalled?
It seems to me that you need to wait for the halt to be cleared.

	Regards
		Oliver

