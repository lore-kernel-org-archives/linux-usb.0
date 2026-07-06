Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2BC423769
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 12:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339263; cv=none; b=BttfSD8Brwq4kgqxYDykfI63rJ1GgbWsi9Knkqsd3IBLo/J3mdZa+ShLru68sfzjWquv/LQinNxpU8nR3Q+KEmApVgOx/O2zZ1/pE0+eMLqR5/ATSSC8nXw4uySDGXFQqmdibb25YqIJJA6SAX8ZMctsHG9Z6yszc9MAHGpwTMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339263; c=relaxed/simple;
	bh=EAlHrwhetPy5UUC3W8aIh5wf5YgWxz04Rg10+M4pvug=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hHqXSqNE3+hGjTXdUBFyjQQgSaBLnprRNAKE9i1oOe2OM5VzSPwG4oto35l3nmJWNDQqxTLAYkSYmrNUCrIoNdn5CVOIGbuttFcyTruwHWKxHbdVnK41TPQTBxFLXo700cQOxpDMNi9YAHhj7ALJx3PkJ8ZSQCpz3uTE4+SM0Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Oj1iMQPw; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Oj1iMQPw"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c59f740cso20336145e9.3
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 05:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783339260; x=1783944060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fprC08uNeLBQCAiE9ZHVQcO4Xl64TZSly/5LDUMpKCs=;
        b=Oj1iMQPw7xpYSXItOqRWr/n6qemHggsm13KqJ2SokgtGuiAcpaeyWp7LLQMsBOcbp2
         6PK55C5AAcr0vzLCUt/QoJFj0bMUqyu7KF9jtcf9MHfm3tBBjABTGmN8WQTn9cD+KpdU
         6zTH2D3Nfmg7mvGfDpR/UimTBTufaW7AY0L/OcVXeXbHlszjqVljooKbQMnaTfSwctaC
         1XGcWV6VguhM6XsLNkFJCH4kjZIoRUYsZIMC1A9XWRHgwo2D/AG2knuM5kgdWUl99GIM
         myO0igsRg42UY/nZ53uJI5LY5EM2FPxTzByIl/Ot2wkQYxtDwRnSdHKVxLjKsXAeww9F
         f9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783339260; x=1783944060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fprC08uNeLBQCAiE9ZHVQcO4Xl64TZSly/5LDUMpKCs=;
        b=S2PKyxzO2Q4cQbSLE2SysU79YW609rKg9+VOyTaKuWsd44JjdourSNcZle8EthdW4G
         4deMdunY7k/A+bQwUN5qQ1ho+wzHLuhguD4EKJcZskRmfCv5tmOtGJA+k93eMXYFWCE7
         o9vIrLyokGu6XAfYGDS/AOrOTS1qrmypRk3rR5rmjtoZPxlWd79CqqAId+MOeR6m5J4v
         77fOpdpinmeYfqHB47YnBHxho5qQ4GFkmuhd+htgM8UAX/wDSVHrHJyUKp6gvm1fTBF5
         0GhiY3/Q9BFRrmSkFhw87qAP3CE7shGQ7ZfFLqmlxdNEY78rbY+ePMzivi0Q6nYQLdD0
         I6lg==
X-Forwarded-Encrypted: i=1; AHgh+RpY7VAX6R+0LlniGHzMWp33ju9ZwnzflTWvwyi52La6kHZG1Ji1cLpGlS5HZW8+IY/vItaa/A5JKno=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPVC08zLHX9V2MUVaeS2eCC+aRqMXkqxCDpEcOSzWyUdA0V5DG
	/SjrboV00tlFgVw1vGQWplIFOIWbpG0grtd+QrGw4NuxAEq8o6B/Ko5MCH6jy7ps5VE=
X-Gm-Gg: AfdE7ckhEjMISYHcl3I2lOl4SILfw1hzcs9KKZK71ixeiP12nE4RLwAUMKrUKS/l2ix
	8LA1lk4NU2nM2zKtU9oQKg/K8TwxD9SvJSnP4iWU2v6MwRzaD+1IxOghvAolJzpgZSsovfL6hi5
	vEh0EjmUr3IHEF30HlDAsdbpvLstStcw00pFEhZKON6caElAHv3fYSip4kajx3uD18ENm0vaud+
	d0YwlfkjNoLxItYclKDKruf7c1NrppjpG9HgX1V3bhEwd0Cf5iQJ2x9EJINjfm+VO0UXlvogHYl
	imWrkApBuE+HiDJOgzcJufygXDjD3/ValX+aM/3bV19Mbjk2efPZetFv3l74pGvK2cMs20rSXKJ
	avBSzv21VcFEnIhj4rrrbWiXkN1ZWCS9w3WGbiU7vboUYXF5keS3r3OBtzoGTX7OfvCXyhUAcnH
	AJw151MBFnVZM3m0alDFYb7nxeKgJewAHev/ub26wUkpK3s4aKKsDx1pA=
X-Received: by 2002:a05:600c:540e:b0:492:437a:a653 with SMTP id 5b1f17b1804b1-493df0aea9dmr865725e9.26.1783339260467;
        Mon, 06 Jul 2026 05:01:00 -0700 (PDT)
Received: from ?IPV6:2001:a61:136f:7201:4a82:7cef:c61f:a3f3? ([2001:a61:136f:7201:4a82:7cef:c61f:a3f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f21328sm24625159f8f.32.2026.07.06.05.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:00:59 -0700 (PDT)
Message-ID: <cbb51e43-ad79-4b6f-b38b-3ec2221de814@suse.com>
Date: Mon, 6 Jul 2026 14:00:58 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/4] net: usb: centralize usbnet_cdc_zte_rx_fixup
 in usbnet
To: Manuel Ebner <manuelebner@mailbox.org>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, shaoxul@foxmail.com, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260702143142.890654-1-oneukum@suse.com>
 <20260702143142.890654-3-oneukum@suse.com>
 <ebfe837b7d4ef61442822105c3d71ca306106c14.camel@mailbox.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ebfe837b7d4ef61442822105c3d71ca306106c14.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 02.07.26 20:19, Manuel Ebner wrote:
> On Thu, 2026-07-02 at 16:25 +0200, Oliver Neukum wrote:

>>
>> diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
>> index 5544af1f4aa5..7beea6d0e731 100644
>> --- a/drivers/net/usb/usbnet.c
>> +++ b/drivers/net/usb/usbnet.c
>> @@ -2347,6 +2347,25 @@ void usbnet_cdc_status(struct usbnet *dev, struct urb *urb)
>>   	}
>>   }
>>   EXPORT_SYMBOL_GPL(usbnet_cdc_status);
>> +
>> +/* Make sure packets have correct destination MAC address
>     /*
>      * Make sure packets have the correct destination MAC address

This sort of puts me into a conundrum. Does networking code use
the short style of comments or not? The documentation says that it does.
I am fine either way, but I need a clear rule.

>> + *
>> + * A firmware bug observed on some devices (ZTE MF823/831/910) is that the
>> + * device sends packets with a static, bogus, random MAC address (event if
> 
>   (even if the device ...

Understood

> 
>> + * device MAC address has been updated). Always set MAC address to that of the
>> + * device.
> 
> Always set the MAC address to the one of your device.

Understood

	Regards
		Oliver

