Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2300421F10
	for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 12:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684936; cv=pass; b=IDyg7FhdelmtLl2efPyCfa4Xyh2YFBkNpMhSwD3Ch3hMkbQoQJnjDFNRTC9Q7FlY2QaS7/HAPYl9SVO2zM8f8Uc8oNKOCsb4TFoTXIGnP+iGPhwcvHimRZWOAc4NteSqANxqACDEEcpJHVjjlNQvDChTb+CFJRxg+ifs24XvD7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684936; c=relaxed/simple;
	bh=kW8Id59AtpT9gYNWPIUk8gXDu990khtKyU3W1BFuHs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B6XXhHtjPqYQu3iQa8g7M4v/t4NZItdeJQ3kTCVc3lgi3HTafjmSkFMjylhGVumnFq7ocjtA8O3+Zx5/Ox17XaT506FiFpL3XmFaWEIA6uoG2/MDwdIram7VPDpChaFH7KvjAWMb5ss+uKg1ln8GuFAFo6lqcmroNb4yBqwJJIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pLm9ugT6; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pLm9ugT6"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-517dc520840so5401521cf.3
        for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 05:02:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783684932; cv=none;
        d=google.com; s=arc-20260327;
        b=iD51Oyxt0dC3ppsH3O83oix/hF78+uNXzWZ1GivP9a9x3kLQVD2j5P+jsUDLiKSfm4
         6t++/pqWMpBvahNZkViybUtCFRgxgwJ3q8uretJeXdFEjGF1tUvlNZUOPls2mZ2nm+XD
         cTGuYMqeEQkEJKhleFKlDJNTH7fIdq7e27hwKv9eYirEficPNEYR3CvLpZPhqOcNqQZk
         OEb1xs7fGp0eV6lF6NCQAmRNq/L/4Gw/nJNrpOPNDtnl/7S84UKizj2UJ3DCTD11LOfe
         vSapXfeYQkva6iF9JYUBDAjyJmuKR75+QESa6Se37u743nCGittP+Dw6Wc3mfPKz/ODL
         PSng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fFIz1xBidwnJcSE41lYPQIq3QSSH+csRPRI4WbZdWNs=;
        fh=1He9ZUm8PcCLDHmoqAelDDE9JPPEH5owzBl/CQA+PPg=;
        b=oh7Sku0AkG+cq18UjBSOKp5OuVd78HagegaPNnMynABWxYP77UfFQZUDbVSZ8iVnaX
         lgGifQL6uRMAGUls2L8MuaK9V3guNlgb9CeWRmrQVuU4/mGi3ggzLfkddGqKkVztNVOf
         S+d6KzBL7DCzDgFTGstklsJt5i5mcIiwFbLDIpvk6GsLzxD8b0hUVU76iMiwX3QIzoML
         MQvZeiK6EQOkb0JQo4bCEuPQbrRro647IgMIT5uhxqbNOi03mtphXBOb/DPApJNWjIpP
         ecAP3jTdfyHN10341XKpGEvWWQyRGgEn7ZNpPo/ApN4Bz9FQhooUzY0q8plCaRPfIPEw
         sxKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783684932; x=1784289732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fFIz1xBidwnJcSE41lYPQIq3QSSH+csRPRI4WbZdWNs=;
        b=pLm9ugT6HMbQ9KtsTLwqbwgiV0al3F176ETH5kdcRSxoOYPrnMpdRRPelP4RJSdm1W
         Nb0LEc7M5ZAAYyFr7mTkpRvnoGDIlJ3SK2RE0Fq+bj0MIcCDb0cBD+qixku4eXmCVN22
         QcJFkb+1QdHV1R+JeYIZFxk8Se1/gDOLW14B8CTL0VoXKAG5WXK14jlE2Z9XUc9+Ckxl
         lQDw+sdk9/a/Ed5g92xeMBQdC/2c2qzGEDFXRlc1kSyyrSW0srKzmtOOPHS5jeRR+qn4
         aCepf/NZqnTnYR+CM+D1U7J5yhctU5+b5nz5yzDwG6jb84KNXC/c7CU0FPc8jJI2sTxS
         t88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783684932; x=1784289732;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fFIz1xBidwnJcSE41lYPQIq3QSSH+csRPRI4WbZdWNs=;
        b=nEcUKJ9YXy0NJy9S2pdU/QVzIhbOpdrstd5nRw3+IZ9KfTEx5C435ALi0HK/Pitg+C
         ic/nONPoQs9qjU3AqKKw8r19iJHYATT2/nD9+AWjNfCXaHkI7ip4N4RRgIvv2kEnBKFC
         weYOe6/HdlR6aySVmCkn1APUS1bhgQgP6O01+0KoUPhER25bzLkPildl9/8fxxGWZ9PV
         7JppiPxqegESCGubEBl5VVHnOORHnFRoujQ34iwFwR2VVwXjNwcwg4C36lF2jp9414vk
         9UWzQmGrEeRZ0yOWaPzGTtdxi8fXFeBR+J9HiH1g9CXyM7v3EtgY63tZtR+7L+P/bwMD
         OL/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrQ6bLDIqhKuzCMwz9xCJSf93/0GYG12LdCxOZyRDK8Uv58KlCMgN4z1ZpXX0jTxYlBLsXAfZC0uKU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvj/BeNgjCs6CHmenqnzcr0Qg5sxFvE6Gz+b8eGFH5Ri0DkCTx
	XaGvFtUY8JwtmDE6ndYE1ATZWudi2QfFgasOU68fYx4UAZ5hdd81+DuIJMCOFND4Cb5smMvMJ2r
	cknX0h1jq6vba8MwseNLAdOU1SkZ4vToQ9s4EXqPJvw==
X-Gm-Gg: AfdE7ckmPT6StraP1+UpU46/EVATq364bbryOGManzSDBBzNqKmKpaIia9He3FidSEn
	54RU1MeiosWKcX0jVrOQ28XuxonccTAJzxDBY7nxquBfl4JrfCN2dW5wm66MTi9ZTePQeCnBTIr
	BU0EKB1eVlDi61037Dt0mThanGNVg1b98EjNA9wceudtItATVxb2MWVTzig4reknMaXjeotz9Lg
	wEtZKJ5li79BjzptbyugumJz39MwD6xFuVBDePNsGCQmsU6YXXAGUPkBOfs+cuUBuYl+OGCbRni
	AvE7aqs3BVUzmB5zksjl7lTdhd84tw==
X-Received: by 2002:ac8:6907:0:b0:51c:8439:14e5 with SMTP id
 d75a77b69052e-51c8b3a0c89mr118028131cf.10.1783684931739; Fri, 10 Jul 2026
 05:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618203053.4725-1-iganschel@gmail.com> <2026070835-thorn-doable-8c28@gregkh>
 <CAPE_3zK0Za9GQaCTX4ZJu4_8Qvq7=c49MXtPduUwHVzQpf1t_w@mail.gmail.com>
 <CAPE_3z+DKGJ6yKGD=E5_T+9HCMeUnFBpWdjnB12Mt8UpU4Kquw@mail.gmail.com> <58b55e55-652a-498a-8f36-145d9ad58e9e@suse.com>
In-Reply-To: <58b55e55-652a-498a-8f36-145d9ad58e9e@suse.com>
From: Keshav Verma <iganschel@gmail.com>
Date: Fri, 10 Jul 2026 17:31:59 +0530
X-Gm-Features: AVVi8CdMFofmfzIKAPKzUn8viWUVO-PCEnuHg7qnuDh9B4SFg8j6j5jipTWEfJg
Message-ID: <CAPE_3zKuZ5kT7G6_k2Oa0tLsxgkHHH081fNkODwOEaZXp2n2jw@mail.gmail.com>
Subject: Re: [PATCH] usb: misc: cypress_cy7c63: check control transfer status
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, johan@kernel.org, kees@kernel.org, 
	o.bock@fh-wolfenbuettel.de, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 3:23=E2=80=AFPM Oliver Neukum <oneukum@suse.com> wr=
ote:

> There is no point in this change. You just allocate yet another
> buffer for no gain.
>
>         Regards
>                 Oliver
>

Hi,

Thanks for the review.

The bug I was trying to address is that read_port() ignores the return
value from vendor_command() and can return stale cached data after a
failed control transfer.

I updated vendor_command() to use usb_control_msg_recv() based on
review feedback on the previous version.

Would you prefer that I keep the existing usb_control_msg()
implementation and resend a v3 containing only the stale data fix?

Thanks,
Keshav Verma
