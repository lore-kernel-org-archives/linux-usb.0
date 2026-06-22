Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BB525B0A4
	for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 15:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782143339; cv=pass; b=Bzn/Wk7rqrye9ifKpl+1mxD/C9YzOHXC9pzI82kyGfKMUFfYKBs9p68+IG7cCFZZsOoz4URtfX6GxnN9fBGmcAzQatk9SWwppTd+ptxqNizOjfA7pMrQUQtYAo+KYXzU0AH/zVRMlSPLSzN4/1RxzAmkUtMcqpChbPWJa//CBAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782143339; c=relaxed/simple;
	bh=9KXUHzooZ6A4y0KMRUZR+/Wvmg2ePvw6LkNmcJ3n8rM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i09Dibr4yveCOiBhDV5ef631I5gh7USEZ/LYv1Z+FEu4ryCTje6c1RBNk+X+tkADjxekDytp6lyS/37cC3RZ8PjWRmBmMKArRBuL8YRJQMDRxEJYfgeRlzF3W6pp40XriiuJZ+miYrfgXPCbKjjdovI4A6EFwOmJiiptJgnVh7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nx2dxMfI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MRLNOYxY; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nx2dxMfI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MRLNOYxY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782143336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9KXUHzooZ6A4y0KMRUZR+/Wvmg2ePvw6LkNmcJ3n8rM=;
	b=Nx2dxMfIKexh9hoGgYPfnZaNTQ8FFaooFvlAZbk5/ykoUW1o5OhthUJTiCacS+wFsgFyvP
	xQTOgIhcGPnJgTsrVfWWESa8D1O6bJGAAcmj5zkcorB5+ipd69grkCBuqYkxCb+vem4l2x
	Pn/Edt0mpr50DExrA8Pe6Iz5KyEcT3E=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-ZfO58KxzOM-b8iDd4J_wxg-1; Mon, 22 Jun 2026 11:48:55 -0400
X-MC-Unique: ZfO58KxzOM-b8iDd4J_wxg-1
X-Mimecast-MFC-AGG-ID: ZfO58KxzOM-b8iDd4J_wxg_1782143334
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6a0f67475easo2161319eaf.3
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 08:48:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782143334; cv=none;
        d=google.com; s=arc-20240605;
        b=WNQXAg5/cowiHlnqwRWT3PrF0GZBgjlQ4uCrdbBSWXttucCKSa//u+XGJw9J7KyCeQ
         d8qrTuR1tuDvncsOpTFRAYPl5jW/mg/cWtWrOv6KPiJUaUG8E6SLRMEaLS8xczzJ1aVs
         iBj13Wz7D0Rjf9JEwlFgke+ojUVkZ0/SnE9as1fkhia7J6gOg31j2i1Nx0+yXN98Is/Q
         HzZpr2iNBNvwxRdaSyO+4ELGycHulrBZmhmSZCaRLGnH5HCs8u1Lq0SAI9QTRS6/DS2l
         5TE6ps122q1OgiVEIkzPgNcqH+Z46DEFe/qlCN1Wj8HypNGffz+38fLRn5ONa4L/Hc9C
         vyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9KXUHzooZ6A4y0KMRUZR+/Wvmg2ePvw6LkNmcJ3n8rM=;
        fh=j5id39efNRCEFkcCIomfidrZoRfwEiNo0Lporm/hbiQ=;
        b=Fh237u3tOssklK8MoI2oOecDv013PDdKTHohyUTO+wCa/Y525WbqlNNiwAJeswgO2d
         7ofM1p1DD89K6tAO91o6yOkyvYXHpLtn33WuByJZ2COjFNYcSHHHHsbkvfsWefoYyGuq
         0yqqD2eorC4en7fcpjcCrPyiQ72KVWkPg2wa5iXnK8eqSgWO19SPEuDW53qDMUK8vzvd
         PrxerZiMJWI353W1KXLUgOCwNnLvkKXTYZmzyEXNFYh06yE2JXvn/ZR2tgyh96drtZU0
         Nhtt4ItrWv1aGJQeSV1zuUKvffx+nsIOiZcX4lpRkKCylTnj33kmvBtNeyXzOJI5lYw3
         HyPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782143334; x=1782748134; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9KXUHzooZ6A4y0KMRUZR+/Wvmg2ePvw6LkNmcJ3n8rM=;
        b=MRLNOYxYhItLcRFl/tu9QFd0YsFm6fWUgADos1IgY/ciySvjsZxmDxpRMy5zOIBuP0
         3Hg0b9qA23F8Ui/AyAw5OqeKmSgB7shCHj/DNF6uDdqfDhCr8GJIGqJ9HLv/Rs2fk2db
         FZjeBbQtSwFqMPoHA5Z2qAMY3Q8OAkdPSL/T7OhsPQ9M7S/Hj+lV5QUY/1Vz/PRiaIya
         aIu+e5n88jCyrUpAeX5I4EEkYKDRIYfOU5L5QOrv+FGXFdqNkDR6/93Bfa8lscfoY5yf
         70Ps9h3dQ4kgprhwenPgh473OH/x94ehqhmURbSq4sOyr+muhiO/3B0dItgv4mDr5Cel
         +Kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782143334; x=1782748134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KXUHzooZ6A4y0KMRUZR+/Wvmg2ePvw6LkNmcJ3n8rM=;
        b=e4L3ry/w0D0YVoY/RSn8xEEnD4RDbWIHjuvo9rQyseL9A5N5VbawC3ySz0LJKnz8ta
         N8Fas0X3+loQLy1aGrR317rx69E3l6/O+Cu+ycFkhOP+VoYA0G1M3YmooeXKcav36O7q
         BUgBTX6qBt2GmASlHme2FuM8Hu29+Vmau6Auk0cwslGq+nJo/WbyiANgBHlPohOOBTIb
         x6jlyFXOrg5R3uMJBTsJ15CWeMXG4cRHasoGFmRE9fnPz5eVieAVw6od5LUIDyRMdH5D
         KulYOLP80/X7QbNCDvY7i687jynYEERzJKlrZBLIcL5AfbZDjsG78S4xaLGRbRIW5BX2
         WI9Q==
X-Forwarded-Encrypted: i=1; AFNElJ8/b1dxTTstuORGAPfLSKfSodK4OcmH84x9zJ5Dmi8cwnqZVv6sWbhE4vk5/QyI7LSuj829hkO7Csg=@vger.kernel.org
X-Gm-Message-State: AOJu0YytQk+7K+kqGqQIydSbkBgJd6YI5OT3ORbtbzsnM5OSBg5vSvDV
	sX83ZCD1k1nkmhN9kqrIj1+DJtoQKwKpc5IZFNUD6nFDQPYkaYK0gOfDJLrwYW2b6SMEFRl5csQ
	Z2bX6GRgipdbh2kTzicrTedWYUpb5mmMucQR81hxI9Q/udhUzqYLH2hDLn9xrAQG8GTK8TN4ZiL
	ByeQ2r/OPkSaOo05QUzeffZiYO1+uyM+DS/4Jj
X-Gm-Gg: AfdE7cmZeoD6Aha3PJiAh+kJOkiP4UAav0bJutP6nP8jZsxnoTLTfTnxQpa4PI1+nSY
	vwzHcJPdy1zC8o30wzdhj5EBuuciS87NwDq1weGRtBX+d3lijNmlz3huB6U2Gc4CYWmCdFEs9xD
	Lh3zGVLRa6Ucq9o6l4vPbrpfZooHGVW5wincSAky3zN92akOoU9MXHsvX/xOsbgo+fX5CjtkEXx
	Tf12T1+HbMBl6UANu2KJ32UybsG
X-Received: by 2002:a05:6820:8108:b0:69e:3c79:6e7c with SMTP id 006d021491bc7-6a0d8992909mr12978960eaf.46.1782143334516;
        Mon, 22 Jun 2026 08:48:54 -0700 (PDT)
X-Received: by 2002:a05:6820:8108:b0:69e:3c79:6e7c with SMTP id
 006d021491bc7-6a0d8992909mr12978928eaf.46.1782143334005; Mon, 22 Jun 2026
 08:48:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430014817.2006885-1-desnesn@redhat.com> <20260503071749.6abda137.michal.pecio@gmail.com>
 <CACaw+ew8uV5g1G-6qZGtVBEYZ3k+fvFrOq3XMyq-Nuhbq5mdnA@mail.gmail.com>
 <20260503213111.117db3a1.michal.pecio@gmail.com> <20260504093118.615ff480.michal.pecio@gmail.com>
 <20260518083339.507e24bd.michal.pecio@gmail.com> <CACaw+ewSWTo72fSk2Q7ZzCM8pNuyrX5ua+qA=SZOQuNNMKSA5Q@mail.gmail.com>
 <20260522110328.0d3eecd8.michal.pecio@gmail.com> <CACaw+ezqEO_PgjGeYCLq5hA2eKczFXgmZLa8qjPtVJZCGwsdsg@mail.gmail.com>
 <20260523022944.59799d83.michal.pecio@gmail.com> <CACaw+exPdwXVsJc5Xr=vN1WJt8XR46=X0-8PP=+5dWY5zUrKeQ@mail.gmail.com>
 <20260523102815.5c05c70a.michal.pecio@gmail.com> <CACaw+ezMnQh2_oqbZ0jF99+wOADMU2vSMqxh9BoJoefjAC_ixw@mail.gmail.com>
 <20260527103221.7f8b15b0.michal.pecio@gmail.com> <CACaw+exN3fdzGQE7oK-hRE3KpMrA3ckPDRAcXaFbd=ySXf8E5A@mail.gmail.com>
 <CACaw+ewuPm-eOACKX3Ux0UwJBRSftoBm7H+rxE2Z9E7KzWb5ew@mail.gmail.com> <e9472b38-4a91-44b5-b75e-dc7abd23793d@linux.intel.com>
In-Reply-To: <e9472b38-4a91-44b5-b75e-dc7abd23793d@linux.intel.com>
From: Desnes Nunes <desnesn@redhat.com>
Date: Mon, 22 Jun 2026 12:48:42 -0300
X-Gm-Features: AVVi8CcAlAvfkd2ErCnICSEvqW5Np5KqWlEvhK2rTPgdX5mT-Gkc_TQT0VvBDf8
Message-ID: <CACaw+ewAk_fs7gw83kRJ=Gj9oSPLMru-txtbPohAttZEyn0qvg@mail.gmail.com>
Subject: Re: [PATCH RFT RFC] usb: xhci: Kill hosts with HCE or HSE on command timeout
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, David Woodhouse <dwmw2@infradead.org>, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	gregkh@linuxfoundation.org, mathias.nyman@intel.com, stable@vger.kernel.org, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello Baolu,

> >> To IOMMU maintainers: should I send this patch to the iommu mailing
> >> list and move the discussion there?
>
> Yes, absolutely. The iommu mailing list is the right place to discuss
> bugs and fixes, so please go ahead.
>
> > I meant as a new submission to IOMMU maling list, since this started
> > in xHCI at the usb mailing list.
> > Of course, that is if nobody has any comments or objections to the patch.

Sure, just submitted this RFC as a new submission in the IOMMU mailing list.

Thanks Michal and Baolu,

Desnes

