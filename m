Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1D646EF84
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 11:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805937; cv=none; b=I6UQwElJwRtn+RkEfdN4gWcCJ2icg+VLQHARbgxM+i2CFmH+KGQSF3XYdJsp9EsTEV0Y1UbBJvyYwI+PeRS1NKpbctxA8Dp6bSpNWpNc8V/1c2rRMFfRO8plyLr98wVdj/ULTe+Dq6o5qp+44z62xETa6Ju0ZVsoJGM3JlpTf3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805937; c=relaxed/simple;
	bh=ZcmnhOKniZwc527ZELr7zQizE70j/om2eAuHBgP8cGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hhr1PXsKYfJzrMDVBRR020zsRsrJjmJGmQfHbn4x2aKmzkdfjAehZ73uuKMZ2j86pHM4bGbMROoa8WuU3ia8VECSCkIUmoYARUF0pxUCkO5UYBBWtj2zjo3V0K16cGQC9qZ1YHAVkDHY8mE3TN/K0p9fTbMq6PrBnYrxjkVK2dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=djapgpWb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lNSEyNxn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="djapgpWb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lNSEyNxn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784805933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXrbOpC3YLfit5aNhXIcynE5RNffOo5pmBqtQCb+v8s=;
	b=djapgpWb0EDcJnka15F53dIj0jpdc+/Fv/PxQIRi8Mp5P715nFCzJUCFQD4GWn+meekFzU
	RRbtZPq5AB5rHYb9FIxWCm/OTgTx67XEoqp+uiUXwhkyyH1NpPBi4Y3KBIylRC3Wkev9Yt
	8AWhkCursEgtiYEqcdFL2ql2mpcZXXY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-0Sseu3cZNQ6HzE5T82ldOQ-1; Thu, 23 Jul 2026 07:25:31 -0400
X-MC-Unique: 0Sseu3cZNQ6HzE5T82ldOQ-1
X-Mimecast-MFC-AGG-ID: 0Sseu3cZNQ6HzE5T82ldOQ_1784805930
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4955e865174so3628635e9.3
        for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 04:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784805930; x=1785410730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PXrbOpC3YLfit5aNhXIcynE5RNffOo5pmBqtQCb+v8s=;
        b=lNSEyNxn8dIAYew2D1OLsGUys/smRq3kgV+9lmb1OyQ+Uim12baYkJue2dtO0/TkqQ
         eY5ijtHIJk/4VEjHgEE+tEGJIH/DxRRppx8PDOAJO4PIFPmIuZL5gozRJxpTWR9KpO97
         ecQUOsPBFGxdjOapLm3f6JVVyzru0zDYP/mDTBc0yIn6JSh341Ao4sj53xg1hzDYRJD1
         KRDgveWs4JO+9rOaVw9gJHbBIYZeh3ZiWCweyEjz8KKNt/ESyDA866W/aIhjJVu7oRuE
         W3FarVvVltEis8TbJicAc4lV0xrfPvvsc4DwwlRSErbFNTHdTMVT6i6sEI//ECLAbMfb
         QvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784805930; x=1785410730;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PXrbOpC3YLfit5aNhXIcynE5RNffOo5pmBqtQCb+v8s=;
        b=j1VAcYfzxlBr26S+Z4hDlY4ZivaNi2ctFgSLo+4nN35oLFSlr8YLrYSEzBOc8Jt27A
         LR8DsBN5VxnSiV17tiZWah055+spEwwcY/3JWBZm8xjAi8vkAiAKPK58/6oOmOjvll+V
         wxsFnUe9sE1maOraoJM6XY1tlSAEKzXsOssGH3d1qUyxZIUCZ1TUeiGbmbCSkljqSG6/
         BwjTJDJrTqEed67Wc4PtdXUmzWIkCuH5HQGNOuKP4THouvjL8vYOGCR8D+QxgtS+vwqH
         G6XySz0U5lPRyYcNkwhPbYqRMQi+Azqmru96FYdn76A22RC6pM7z9aT4h/eSBkx0OTxZ
         Cmlg==
X-Forwarded-Encrypted: i=1; AHgh+Romar5GzXtSECbMWSKSYmAy4crtenoo3WZi8HYMO4t2wEJNAflRkCt8s2zEO5Lgghl2eTXLOvU3q5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeDKbotcAkwRupaokJdfFUjXCGhp6M15EBkg2AI+0q7pax36ac
	WIQRRhkJbhsXQRR0uB+eCHjo5psttjuWjOYOnG2Nxxy8VW7Xug/JLYLLrAeuNXfP3xbr6/y79kr
	7nQzRZSJoAyXVoQJumXW1gdseMnybtJlEqRu/lK6l5CFYgmQtbjZCYcBnTtJEHw==
X-Gm-Gg: AR+sD109j5LxYea2igP0OWRsZ+5446lkga9Z9Uf42B+FXgGjjCAHe0ThI4ri1u1EBpv
	9+NM9ksdZJZGzwmkA2gWDeHc+cc89jlaqWx1c4Ns0V9zxdeRHzKEt1ctHaUeb+8WF0qCVpVQ43X
	IZ2BMGNPQ4OBce84eh7XknZtnprc2OKH2boIz1X3Ldi85SXXNMfU5D7H+0NWT6mJUG4nAiHPHOA
	nS2UgeXY0j2ltUoAOztNt8nlJbaq3eEq5Rxk4wCd+1n1PIfcEWbEBMn9iK7Ff2SXQkUlEv3ev5A
	KZgZtGZedsv2rfuzZOVfNa40dI0ZlaKQmVycnw/IrOIblngcVrA+mjqMEhJxABU/qkUQHcsiYyj
	rQf0j0YcnmrXZKNegSfsE6vCd2Xgp9XdC0/fDY5ibQ/340dqrgPgsdOh7RcPO4xHv2xilBFekVp
	6nMg==
X-Received: by 2002:a05:600c:584e:b0:495:8a1:7670 with SMTP id 5b1f17b1804b1-49573d20739mr20996045e9.35.1784805930476;
        Thu, 23 Jul 2026 04:25:30 -0700 (PDT)
X-Received: by 2002:a05:600c:584e:b0:495:8a1:7670 with SMTP id 5b1f17b1804b1-49573d20739mr20995755e9.35.1784805930014;
        Thu, 23 Jul 2026 04:25:30 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a500dbfsm129233605e9.6.2026.07.23.04.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 04:25:29 -0700 (PDT)
Message-ID: <14455fa9-15b8-424d-aac0-b74d7da35f04@redhat.com>
Date: Thu, 23 Jul 2026 13:25:28 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 11/12] net: mctp: usb: enable v1.1 packet
 spanning
To: Jeremy Kerr <jk@codeconstruct.com.au>,
 Matt Johnston <matt@codeconstruct.com.au>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260713-dev-mctp-usb-1-1-v4-0-4ae8de764a01@codeconstruct.com.au>
 <20260713-dev-mctp-usb-1-1-v4-11-4ae8de764a01@codeconstruct.com.au>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260713-dev-mctp-usb-1-1-v4-11-4ae8de764a01@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/13/26 4:33 PM, Jeremy Kerr wrote:
> @@ -333,17 +345,20 @@ static int mctp_usb_probe(struct usb_interface *intf,
>  
>  	SET_NETDEV_DEV(netdev, &intf->dev);
>  	dev = netdev_priv(netdev);
> +	dev->span = span;
>  	dev->netdev = netdev;
>  	dev->usbdev = interface_to_usbdev(intf);
>  	dev->intf = intf;
>  	spin_lock_init(&dev->rx_lock);
> +	if (dev->span)
> +		netdev->max_mtu = MCTP_USB_1_1_MTU_MAX;
>  	usb_set_intfdata(intf, dev);
>  
>  	rc = mctp_usblib_rx_init(&dev->rx, le16_to_cpu(ep_in->wMaxPacketSize),
> -				 false);
> +				 dev->span);

Sashiko has still something to say:

https://sashiko.dev/#/patchset/20260713-dev-mctp-usb-1-1-v4-0-4ae8de764a01%40codeconstruct.com.au

and the race in look real to me.

Note that you are expected to act on AI review feedback autonomously,
either debating it or addressing. A reply on the ML is expected in
either cases.

/P

