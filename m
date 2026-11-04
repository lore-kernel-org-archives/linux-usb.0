Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825827;
	b=NJbh/ls4HEFSk6xTZ7hDXBFVaTd9hOUv0U+CPwgBeeCUSJWYQqvUvVvlsrBto92gcGfg
	 W0aPwb5rZfciS2XvDukp1A0Mt8N26hl+SmDvsJ88xWob8+quNscgRSSLmnXwLUULCOGWg
	 39mKwJAiJI8yu+vzwLrVsQDVWQ1uj8i2pwCC/95WrWFdRst8mHGUkp7TwWdfiFRGy3mLu
	 uWDe8OHlR/x9NMM1lpMYDs5hooTp4ffBN4e6mT256jWnGo2yeE+DXKCHGOj+mDxqqv3h5
	 n/2HRXUaTSYCMdgHgUeelRq8BfFNsTNoWRWjtEQuz0LvCVZG3gms3igs4Xc/OskESNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825827;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=L6s4TTDFhNuhrsnjNiQdR7CRo6Dzt3ANt515Ib4703k=;
	b=K+IyKY3xgI18HJmVHM5onUP/UFvxXAncwb34xyFvmpURHo8Ehuh9DtTOC4K/WX6LOKIZ
	 ViED5spxxqTww9rQcGU76aPPZmL52WyrfrYO8eqzE+6cGLZwMU2j1PB2PTRfv0F9mzSzY
	 yhkVN4WxGCTDMy8z3cGhiqIzwiMcrz0StoMgC/QnWtBP0WW43Q3xmotSO3rRBMcsBAP22
	 y0NNrLqoCDbsZ6i1A67JxkM0REQczKtvChHvvqjQuZRUd4ywVkrr5hIETByIhVYkFlDJt
	 oV3po1aGfMsPv0dO/G+GcaaRhZKOZyRWdykgHgEdsJ7JcYnCbU0jHJrcC8u2EKVi80g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QM2m60v3;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="XSX/+KDj";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FB4609D09A
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 20:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52FB4609D09A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QM2m60v3;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XSX/+KDj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793825826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L6s4TTDFhNuhrsnjNiQdR7CRo6Dzt3ANt515Ib4703k=;
	b=QM2m60v3v84tAHjgjiSjB57A5XyxbZM0xnxFpGHeZeNs82pddhlEriPCx0ky9NVRFN+TgI
	F8hZzIICZZF3XjM5/oIGZ22P5XPl3AlzrPhTfP5CZWa005X2B02t+MYNRleo7meiz+FY2v
	omaKb/mFAKldGWsx4hVb9Jy0vGJdXuY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-pGFptjtJMuij-qUKOLdQWA-1; Wed, 04 Nov 2026 15:57:04 -0500
X-MC-Unique: pGFptjtJMuij-qUKOLdQWA-1
X-Mimecast-MFC-AGG-ID: pGFptjtJMuij-qUKOLdQWA_1793825824
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a4af69e06fso8174195e9.2
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 12:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793825823; x=1794430623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L6s4TTDFhNuhrsnjNiQdR7CRo6Dzt3ANt515Ib4703k=;
        b=XSX/+KDj/myjMKCt2zt9+q5XUkJPNGNbEYPReBac0xi4QN/9krLLkG6WmCr8vG4ul/
         j8HcJRcZkfGP20Y7nxlFEbUQAOpkfzwDNYvkrtjkzdmvcnwPb0i3NCmRN55yE3CPUdqX
         OGvpn9ShgiEuPmfOc7nXiV+YpnVZrmdv04IqqlrU0s4Wxlk3ruUtvCNKgeN0nHZQ94P9
         VIRjdf+2CEheb/ypMc+13Qawscq/kgtL/dwI1Us72aC0BlIgKin+KlFy7T7wi0quhNLW
         zEaL28CtRdFvROdLKe3w+M0JHWUJ5JohBgl23zl92CQOT2xlqm1gtQBnFGUuOi2AYtHd
         IwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825823; x=1794430623;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L6s4TTDFhNuhrsnjNiQdR7CRo6Dzt3ANt515Ib4703k=;
        b=BDMpk0vLJnJBKpZouABrO+PaEAhQ1Oxehd2qenDu3d/yvRG5u22WM/+ewtTnPhQxRR
         2nCKZAAKq1DHbD1BEgnxkcf/3GCg3TGhk63uWPWWODOc8ljKW7NmRRN032qzOSvPUY4X
         cQ1dpruasEpnp+YnYLTcBX+ij19Q3fE7gQvkFBBaxcwt82EIlOul1S6Hb2FkkcRh+ZCB
         ZIAMmMufUbHj0BGTGiAzjK9g91Te79gs+HctcyVgWxR266TGCjZ+BAm/iK/hDAeIzgdc
         Ggp3tFc1a7KgtFzv+OfY0lrjByzEVYn0RMTZCZpL/wrQ3RPn70K0yWNJuhqn+d1tHawO
         OYUQ==
X-Gm-Message-State: APuU4Z+SMn4qDXweEMzG2DR3QwGlgjjr8fXV9/yBklg2asf7v6FQIidn
	zn552J8oJ0CoOfIx/rPozZscGjV3azMx7U5AGKQAcEEUQFOYv9az0jBZ6MkNjkYyHKzV5nahqDl
	MJ4vMWVAmMtui133Z+uL7Non70M9zCf11qC/yPi+07rFznB1oZmFXejIdiuQtrw==
X-Gm-Gg: AYBFou0WlFRDB8fVIZJxEg/r/aNl/t6Y5t/q4gR2rs9L4yXy6sOfNBGMehX0CgAQBFR
	l2SHWAwVAt8y/dHbrWIwt2zb2JcGDclG5i2aOWjFFYH5fVBxFt/EjvWF4tuse3qGBLEk9fErUD2
	kkRJ9+cCLfu7wgT9dZJGBh36+zIu3GKWWrZYuUkfegeMke5hX1LbiljPw2c/N2nZHX+E0698ZH/
	bQX14MZR5Sual9Ofj/NEd/mZ+4to7i5W0YOHWSpPgHkE2IIkerClbVj+ULbLOoFxgRxAwe7LDpy
	HpGWiL8VU9nYejKY8jFPI4iIy2aqtuQc0knyIIkuj4rIsKwmLveE288EHoTmrHnKb2fdOUs5C4B
	BkSuH3NykJcjeYTcj7pq1ckRI4LmffN4VHJohZ0q7doXv/JAp4Z/KLDa7wnDS4RHdl/eE+MAA31
	graMDkzELlyeZasKSNdKxalREdwYxrh3tjsmV2FWWGMb4=
X-Received: by 2002:a05:600c:8b55:b0:4a1:f736:79f3 with SMTP id 5b1f17b1804b1-4ac17ffb30fmr374653975e9.5.1793825823532;
        Wed, 04 Nov 2026 12:57:03 -0800 (PST)
X-Received: by 2002:a05:600c:8b55:b0:4a1:f736:79f3 with SMTP id 5b1f17b1804b1-4ac17ffb30fmr374653795e9.5.1793825823110;
        Wed, 04 Nov 2026 12:57:03 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56b78d656sm12312525e9.0.2026.11.04.12.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:57:01 -0800 (PST)
Message-ID: <c9ef3133-856f-4554-8c7f-0f49d364c617@redhat.com>
Date: Wed, 4 Nov 2026 21:57:00 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3] net: usb: cdc_ncm: reject short
 GET_NTB_PARAMETERS responses
To: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>, netdev@vger.kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, oliver@neukum.org
References: <20261102001114.38144-1-xinsheng.zhu.ny@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261102001114.38144-1-xinsheng.zhu.ny@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 01:11, Xinsheng Zhu wrote:
> usbnet_read_cmd() returns the actual transfer length, but cdc_ncm_init()
> only checks for negative errors when reading the NTB parameters. A short
> response therefore leaves the missing bytes zero-filled, and
> initialization continues with parameters that were not supplied by the
> device.
> 
> CDC NCM 1.1, section 7.2.1, Table 7-3 defines a 28-byte NTB parameter
> structure. The pre-errata structure also contains 28 bytes: NCM 1.0
> Errata 1, Issue K.
> 
> Require GET_NTB_PARAMETERS to return the complete structure before
> continuing initialization. Return -EIO for short responses, including
> zero-length responses, and preserve negative errors from
> usbnet_read_cmd().
> 
> The issue is theoretical and was found by manual inspection of
> usbnet_read_cmd() callers with LLM assistance.
> 
> Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
Sashiko noted on v2 that this may cause regression:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261011035150.53315-1-xinsheng.zhu.ny@gmail.com

Since thei issue is theoretical I think we are better off without
this change.

/P

