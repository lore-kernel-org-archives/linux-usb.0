Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E46239FCAE
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 10:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073784; cv=none; b=sJwWivV0qBiVQp3L3s8/uYFuE1CAxopjjcQ/MRWyvZ6RTGS9DGyu9VKMgZu3UPfCB4eMRYIgiZ7f8vX1a/P1pQZQgmqsILg6ZHjzWmK+N9yTX64RxRCuDZ4ywj8I8B/W+3DrKYrb/OqdlMoY5FA7cc9K5Zk534a37aYnyuj+Knk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073784; c=relaxed/simple;
	bh=3GRubamd8c/lHAxEWGx9EZ3mJAcdA7pvo8/S2YUqvXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ifmduIsQS5zbyPot3LAPMs2bN9c6vx7kPaProH26pWAaYckIagw7rPeCaPrb0EwyXJRbadfUJ7SmEgAOuYEkfD82wVs4tcLLMXZfqYvmV8ftzPBvxns0A1H9LISvxFrgk+yPjZTqSOP/44mNTy1gjlErt4PSc9UJBjRtWMeaw/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JDTjjL7C; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JDTjjL7C"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4745492ed3aso263038f8f.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2026 03:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783073782; x=1783678582; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgYxzP4S3yg5Ik0kspfuMX+5NxuodFksLhrI6YPSMK8=;
        b=JDTjjL7Cn4wMv/TZpFWGRryM9C/pOLw7DlwEuzVNZuM+EJL1f/UvGAR0CcYKaBxHyN
         csYl+DIE7lXSLQMd3F98LwCKvFI0DXZqf0h2n2ZdLNc92DfThmf86/7Za2Za5ibW7Y4G
         2v2g4WbqiXHf3Zcc346guWeJG4S7I0pbzU5fdnFJ0xK/dlyQKJvnHsLNdGgQwHG8sHaW
         7XRmCmKSyyH7T0os/cQjUn5o4N9oXJB+t+1fo/pcmD42iCKhu+Uqya/ky44SBtgzJCbI
         XN+LkmuUQJbC08JOWv75UUTzkeHrAvaeQGRKiXNRZ65BkPA97aI5nKVMgKaA7CuYrEiq
         gYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073782; x=1783678582;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgYxzP4S3yg5Ik0kspfuMX+5NxuodFksLhrI6YPSMK8=;
        b=bYmn6xRf33E37pXzU/OrTMfs8oJoVesGdsFdPua5mqyozUfPsH3Cp2SlXjGs0pWMmD
         XTA1TYAGDscjCp9g4rjg5LztCD+naJDH+h9c/KjaHS6kBmfutWyC63CUw8qG3Zk1hv8k
         c9IY91uqdD1sFgS+Z4xIWJnRjGhqUp1NyfwXZ1E/YIDyAq6GYGur9ipOzrp2JeW4nP6L
         bGF6n8gcoQAZWXbQmN8VZNxYVQeLr3AKqymGAYxDCnD8X24UoZmyF9/6wrY2zncofaEc
         wwT2ATkK3b7awyTvh+6KI1nj0s8mD29oKfleyIfxOuH21bZMsXt2J9rlHUadas8hDj3w
         KrZg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7VnWCgeyrOV/JAEpFoCRQUUpxJ4KXKWXSmNGGmLBACPZLoLTvBiVD4ASNA6lU8alzg7L5UH9by5E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkdv+gvIkNpHnp1Gs1k/qx0W3hM8RpHpV7z6/bLtyIVAcwJsZr
	gH8ra0vhMJOuMG3+qZbAcLxALm/WrL3wmcsvU7K063rHbTeYc0r/4PHPtbF6DoECaqY=
X-Gm-Gg: AfdE7cn3WGzY2IaQHZ+9Y97ZYk7VXG1F660rhc8XKZXX3aOvlfh1XlOQSq4bN+2uycD
	4vMNkVgI8nZ+Z0mwkMdHkbiB2iiYMIw3FyurgDImNNDIE9EYF2AhOOL02S86W/RC/Iuni6VMKRm
	A+kqUAds8tVZWzTsxaGJmUamNWoH3j3FSEN5yl1TO4GRVDnB2Uj5CUTlosVmI9XZHR7sHfK3+cO
	sxHDnskmgHlwVbqAHceNQ3bDrI0KD5246E3cKRmxl0jBEx8we8mEOsab/lT6zy/Gnwtrpm7AhdS
	l4A3rUx/jNHplvd4/BUfwqEhBbCIoOHJyY1ZBy52dNiM3cewj+tXddUR0QakL7aDkXbL1E+4qdS
	iCi8r9QwHFVEZiDmWov+6hKEPx2dz73qOuX9XwpYfIERq6NGo7n6M9USuXXoaKqp2UwrHNI2wKk
	jsc6H6LD4Csz6+RcEPHrgwcUwvaz24Vmcqanv4iTcCOXzrLlQg1NwQP4vcA4A0bNZ9mA==
X-Received: by 2002:a05:6000:310a:b0:475:5e4b:588c with SMTP id ffacd0b85a97d-477573b7cdcmr14057641f8f.1.1783073781856;
        Fri, 03 Jul 2026 03:16:21 -0700 (PDT)
Received: from ?IPV6:2001:a61:134e:e801:4abc:8076:7fbf:d0bc? ([2001:a61:134e:e801:4abc:8076:7fbf:d0bc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbc75sm17654391f8f.5.2026.07.03.03.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:16:21 -0700 (PDT)
Message-ID: <c3d3c7a0-5d47-4e73-a46b-2fd610f4cd59@suse.com>
Date: Fri, 3 Jul 2026 12:16:20 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/4] net: usb: move exported code to usbnet
To: Andrew Lunn <andrew@lunn.ch>, Oliver Neukum <oneukum@suse.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shaoxul@foxmail.com,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260702143142.890654-1-oneukum@suse.com>
 <ea92d680-39f6-4dde-b558-4008ffbee587@lunn.ch>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ea92d680-39f6-4dde-b558-4008ffbee587@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.07.26 20:15, Andrew Lunn wrote:
> On Thu, Jul 02, 2026 at 04:25:29PM +0200, Oliver Neukum wrote:
>> Some drivers are reusing common code originating in other drivers.
>> This means that two drivers need to be loaded for one device.
> 
> Maybe consider using 'framework' or 'library', rather than driver,
> when referring to the shared code?
> 
> I tend to think of a driver as the leaf node which probes based on
> enumeration of a bus. But usbnet.c itself is never probed.

Yes, I also think of a leaf node when a "driver" is referred to.
That is the very point. Currently you need _two_ drivers and
usbnet for some devices.
Should I reformulate? If so, how exactly?

	Regards
		Oliver

