Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9058B36D9E6
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 07:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781163933; cv=none; b=VNOO5WnwaDx3isfYBuehuWpKR4nxqejAoHCWRV7qa//p6piwc2GPCz1ArN35QVeI+h9Ce0iucEpJNsy0O7PHUJw8IDchfMBIemh0+Xo1QxXGMomy5VPV73A3Fg/dOr63IAsr/HE2Tuk1rjjPHN7E5Sw7BYkSOpYMLBu72HY+yjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781163933; c=relaxed/simple;
	bh=EeqvxCYnw6GV7y+HJKrDtOgUluAvuQPzKioN0/kgh24=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mNpvgghy4km/lhRVFWfGmf2xyzs2kBk4M0r5G17/n8mnIA8DfsG/zU7S5HDZOFV7kViZiCrYrijx+1zOEBxhpaI4sw1/W7Cg6Y+JH2d+EXviHYjBsKi1oIkyzMjEm9g9CAj4ismtAj8GDMdK+99YfK3PFYzwtAdy62iNIFns6LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckvZ1c1A; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckvZ1c1A"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so5985762f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 00:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781163931; x=1781768731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+pdU/2xYGtVNlhmNXrvLedL4csiDA0+5sDvudpgSF0=;
        b=ckvZ1c1A/CVvgsefnx4wGERA7IZ/1WOg3JsTguKdD+GWwmJpoU3F/3s8Wrg6jDn1ts
         YTLJP+zeawOmv7wLW250iIuON/WvRcUG7m9z4iC4roBT8apy0C43ECRVkv+bk204Wc4q
         qBCuU10aWgb7iRcZYik7uzgIMkVPKup6IeOtb2tC3ks795iFjDIjfgQ+iESf3UqmZBID
         9ib7xhgPxtUoHimejQABiRiXiZ2PMfHxA+AviaamI3Oo8W2QJcVbhjlUYfGBULNS2hXD
         sXHuVNl8eVCw7/flywh62/1QPRg/VFCDktPQmMt8BmozBuLT/CsPE4nYTnXAKK0GVQoe
         byrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781163931; x=1781768731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m+pdU/2xYGtVNlhmNXrvLedL4csiDA0+5sDvudpgSF0=;
        b=TWtkyBbn5OeMxv4jXBMhKwNXfj2g2+vCPaPLjIxKTWVb2RCIqxfDInBABbOtOXz/N7
         e51H+EKRIupJ62Ohwkyouzzz4MdLyAN9Mq8qh1hXr5wObB3AxikB+eS44cPur5OgyGn6
         LRitePuG7KhD/pqr8auCOFaStHY3WZXUXHO0jq3I/1U5HzY5P2qp9LcJC+YJaqZ1emKp
         QstWhex+lpw8SJ+MgH8COoHMLUNFAM1mWKMZI5ckQkV9jlNGeiuh68UbaKJGGcocJTLP
         MJBQg12ETwn+Qh6o5m4Szgn9a18Zam958bzBv1z8qCZUA0V2oy5t+qefajEot6qSi1Lz
         qAVg==
X-Forwarded-Encrypted: i=1; AFNElJ9j+OiP5WZNWa/LBiHfLtcmXgEgDupr8bFm7+wyYPpVwxE1OaPHH8CayoEq4G06B0o/ZZ8oyq7U88s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwukzuE1EDmQvWiJPR5g1zh2B8erLVdvv/6+LZawU4veEmHWbd+
	Ue8SyLAl1ugcKh3bGcQTiq3yXnNwjo7bGEM14QK+aQwD6o4YCVi6Lq62otMkt3tG
X-Gm-Gg: Acq92OEwRbDtRu2eA+m2zjVnCz3Dph4AWvC1QHksyQNkv7i2HI4rFTDk36MoPw7SeZY
	YVPyf3qgymnODnaAT6ZlgN50DbgwY4w24clNFB/7YJJRXj20bh4hxrbRTWYSgWCIY7vvvy/poga
	uYibBkaR8ha9+jPSAjRkmVVixFbx60TnF8wIyqu7EyzLeUh1KReEXjNh64eIrzfDzlJnC5TuS9h
	2fE7N0PLpPhV4WEyCgC2yPHxYPbPn6Jylg3hf3oFgtLs6ZnNeMJgHnK0rvIiBeptwrz8HRUqPbl
	RCZq3XM4RPSF1WSLft+dtEX9QM8k7FsmeZ6kM70Mbm/OZYAzRDHwRYQAk9HJFdtQRQHiciq9rfv
	ov+a2RiqN+vd+47Hz/YzMhJx21RZsIcsZ/pojAAQ6TtXL657dXMUtgVC6vZJlcu3u3T7NpgdbsY
	XRX7Ii63VSDBWCBc7yopmSdwWmiNj6CA93L2GBMoSKQDsfrA5aPwXMcA==
X-Received: by 2002:a5d:59af:0:b0:43d:dd:8ca4 with SMTP id ffacd0b85a97d-460675a1335mr2346442f8f.14.1781163930612;
        Thu, 11 Jun 2026 00:45:30 -0700 (PDT)
Received: from foxbook (bgt94.neoplus.adsl.tpnet.pl. [83.28.83.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm66097973f8f.7.2026.06.11.00.45.29
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jun 2026 00:45:30 -0700 (PDT)
Date: Thu, 11 Jun 2026 09:45:26 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "sarah.a.sharp@linux.intel.com"
 <sarah.a.sharp@linux.intel.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: xhci: Fix sleep in atomic context in
 xhci_free_streams()
Message-ID: <20260611094526.2f5ddbba.michal.pecio@gmail.com>
In-Reply-To: <TYUPR06MB6217153FC7FC9757871D501ED21B2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB6217153FC7FC9757871D501ED21B2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Jun 2026 06:44:14 +0000, =E8=83=A1=E8=BF=9E=E5=8B=A4 wrote:
> When a USB device with active stream endpoints is disconnected,
> xhci_free_streams() is called from the hub_event workqueue to
> free the stream resources while holding xhci->lock with irqs
> disabled.=20

Pedantry: it (currently) holds the lock while freeing, but it isn't
called with the lock held, nor for the explicit purpose of freeing
things with the lock held. Not sure how to parse this sentence?

> It calls xhci_free_stream_info(), which invokes
> xhci_free_stream_ctx(), which in turn calls dma_free_coherent()
> for large stream context arrays.
>=20
> dma_free_coherent() can sleep (e.g. via vunmap), triggering
> a BUG when called from atomic context.
>=20
> Call trace:
>  dma_free_attrs+0x174/0x220
>  xhci_free_stream_info+0xd0/0x11c
>  xhci_free_streams+0x278/0x37c
>  usb_free_streams+0x98/0xc0
>  usb_unbind_interface+0x1b8/0x2f8
>  device_release_driver_internal+0x1d4/0x2cc
>  device_release_driver+0x18/0x28
>  bus_remove_device+0x160/0x1a4
>  device_del+0x1ec/0x350
>  usb_disable_device+0x98/0x214
>  usb_disconnect+0xf0/0x35c
>  hub_event+0xab4/0x19ec
>  process_one_work+0x278/0x63c
>=20
> Fix this by saving the stream_info pointers and clearing the
> ep references under the lock, then calling xhci_free_stream_info()
> outside the lock where sleeping is allowed.

I wonder if this copy is necessary or if it would suffice to start with
calling xhci_free_stream_info() unlocked (EP_GETTING_NO_STREAMS should
ensure that nobody submits new URBs and hopefully core won't attempt to
re-enable streams concurrently) and then grab the lock only to update
vdev->eps stream_info and ep_state fields.

Regards,
Michal
