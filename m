Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794917322;
	b=tGk/2a8rj8hJTiCZpOEdHVh8AnJhPHesD9pglY9YnVAh1CHSW03A+mgqaGJKPQNnQ/5Q
	 5ES88D0gukAcJMjHeDUyIzxl80zAwsO2NhjzHOGqngpZ6o5Vfu28zS+8Q2mUbwyTpSeTG
	 9PBYGAysx90G9Z0sQiF4WzBa7uxBbQG6vZ7xsREEAvwde5Isw6yMLFNLTQERTdjwBIT8V
	 eObsrVBj72NQUlcG9KZJnfl4i2TfPiGpjJ4goGajkZJ1Z7kpQ7owiX5cq3j8jo8rVvHlW
	 yWhEq44W8PpOIFXQz7H1qtm7mReg7wGaBxOhiD+j5Q/sVsFmLG6QOAoqUeSx57bHe1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=+OHBE2JjZLc89T9aDHp47BWoMn41dvghwLwUUjrkALs=;
	b=lD7tkroeu9yCXjQvy+PPFiSLBTOaOQLY4D+NPXqVd7pOObtd2pyn8K/6y6xN3yz5r6LM
	 wxjDl98uRkMqFy67BoSKrOVUH0BovGWg/Wc7KGLLij+2aO2l2wcEWI9Efufgy+035ErK4
	 YFkLvJPNfhG34AVAJS1OwF2EXUkTUE0TFNKE5kn5itDS2gM8iwp6Vxw4UovgXPBZZfZXZ
	 q+wrPnYHA7vg8acOftI1jVai9YkwitOrk55IH/CCk+eNvMxElMP97y/K80khVgoPzd6TU
	 6sKSY8FYtEFLRp72K8+tb9zSRzWuF/1JbcmquRxu7NaSgzUhE+f90Ms/XtgqVMdYZbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=7dWjX3Go;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19F4606A32F
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F19F4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=7dWjX3Go
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50abd5b4fcso436592866b.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 04:08:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794917320; cv=none;
        d=google.com; s=arc-20260327;
        b=Oux3dEAwK4Cgz2qYOXTu3qXRq4fx6vUSsLqbBrvsl2aJdJeAizEm6HYnGgvp4sT1CW
         KRCxUXqzUIjB8pRZ/KL64Qvyk1Z/zOTB6TwrUqUiMcRYCJO0UQ5ypnX755ldlAFYj3cf
         qes+9OT0ovsZCZ+TWcztT3onB/8fYJEGGn+09bW2Z5EV8/dGqgZNEwLGARX2CDTYwS53
         0X6jhqWgZw1/WdPYQ6mLYbrBubaOKfxcgPlFd5LAbjYliZil0FSmzlxQAFGQdKUYDseW
         ITTJk+vJlb/fps0slHYDRp5n4h8TcV7yiSCddFUl2VWp+7NRgkANKQlrbGExPRtDWFN/
         GZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+OHBE2JjZLc89T9aDHp47BWoMn41dvghwLwUUjrkALs=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=lAOxF/fgOmGxHfFfTlokurcqS6tzeEEVQ1y2ZWpXe20YS7mga98q1c9eLwiP2Wg2sL
         sTyTLTSZ4Zux45/7z1CTNZb8gxu0+uAuuHwjjOy5A4DH5cfKn1nH4YCtbCRATqo0PWpA
         MXhDqzR6Vm6Z3UZgzewUu90h++X9dC9jsgpG0e5KGrVgsm1rXssOLCFqv79EuFZzDMqA
         7ZgL9I3Zr8ErllnuucclvJQcsgoFeFhX7suWlsP2mpC92IIES8HjlBAhRTchA/xeQS/g
         9atSJUhw9jIKxxSkdEuUDVclMbcl6VvToLrN44PuEWC2K0PzZ1iQ/9zJu3wGo5GVqaGX
         +k9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794917320; x=1795522120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+OHBE2JjZLc89T9aDHp47BWoMn41dvghwLwUUjrkALs=;
        b=7dWjX3Go4YGvAlz+owTk5nY1bu616/uejcY7i9Z1XVax/bFf9SueTuGp3jXe8kbwep
         pzg47GcK9UndpmO2rkOG3bnbJTu8inZbAcoALf5iWgUkAYV1fclwtJ5jjOlAEoik79rD
         m7CessPwWuuBxJuUee101Ko/1gco6bhv7qjq+BDqLyecyUc2T+z/lkCrXpjkkYBpIMCX
         kdgnYpJpzahqN91tl8TrfXK3+84AHLLVRIGGFfJwil3KMfAJIfuBUPqj31hrRxRDTgin
         innKqDXrLgtqUq1FHoBiFJo5XUrqsbF0pGgsv907WwD892Px4nBjit+xxy4xAMrEMMKD
         uL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917320; x=1795522120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OHBE2JjZLc89T9aDHp47BWoMn41dvghwLwUUjrkALs=;
        b=Cl3pETzhAshmjMVq4FtZncqure50W3VVCspNVAyax898DMMEZrgqs1sP1rf1pH3DiG
         MwGsKfca4NjiQY30il4IxjcPhfIG8uShWFcOnY1vnb7PvrPjFuIWKQQ7/Ikkzt2DGa7D
         aYtUhxrpaRpLB16WVFv2YJsY1KVIL6AS+VWYgSmMl3W4lwV1uX1yE+uCdgWA46gc4nDW
         dgCG3zLlS7DY/YrxWDBs3usDZ6FSypDQPuapqoFrryIUyZSCPZdAEQCFIifTVfNaG/D8
         oDPRSXQRsmnU9hZwqHVZOqCiELnjjEIPuAme2O6FesmQskf5gY46ybY95SdYC401arZh
         Wb/A==
X-Gm-Message-State: APuU4Z+V434i0ltlD6b21tNdUVyZ+GvIs0HBiERHLDXDBNMQfX8BNgl4
	vCaTiRNW7FEhsJBUUxPcDOp3UDqeIycVBxz57sDuVYoluW5o0oZYW4Fd/NvGafAfLlPMUZCK/+G
	/dCC7KMWN1Ve86j2a3/i5ff7gZryWTXBM6QO9m7pTudh8Z3iofgxSLmA=
X-Gm-Gg: AYBFou0rwYg2njAdVf4kRG8wJRgs7zgK9HEDtOgJsbls+bspvI/Lp75/XZKi1RptsZR
	etewcKbb/GA+IGFh7U5izYcljG/rFhVuUL04UDNuJe7fGs9sN+kOtM/VyCPWQtBjRNrJRQ3sJrc
	1swiZ7DxzpOEON3WgFcFfeOxxj9cHDCmz20gJfPB0oRPbmDKDiWOKCDW+jEnH93TksbXPRmwsPd
	WhDkUYnfS3kOWxRPc9xnwogxt7HZXu7Xus7azoL6dbZafULjGIxq8DPfyDz4laIM9wpwacZJNhm
	pmGWsa/dpAO1umvMp3O+nFJMB2bLGjMhGlLpj0TNdj833rAiyFhLWow78JYGoS2LPbtwP/KLtPJ
	EBn4RHN+jYDJSeODS6h44t9lSlsD56iJUjRaI2P+KohTW8v4iOYSuSZRjE292fo2ECYdotg==
X-Received: by 2002:a17:907:9816:b0:c4d:4e5f:b138 with SMTP id
 a640c23a62f3a-c5096369186mr1083292466b.20.1794917320250; Tue, 17 Nov 2026
 04:08:40 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-tcpm-soft-reset-sop-v1-0-c7e1543828c0@flipper.net>
 <20261117-tcpm-soft-reset-sop-v1-3-c7e1543828c0@flipper.net> <sashiko-outbox-218719@kernel.org>
In-Reply-To: <sashiko-outbox-218719@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Nov 2026 16:08:28 +0400
X-Gm-Features: AclHuK9PeAuyPN_pcoVBmzh2_P9HC6pBnS8MlP8LThdzwdwiJeca3XY6jANi_vw
Message-ID: <CAKTNdwGqonU2w7UhFSzoGZCXORgg41iMnefDs16rFgiCUdKGUA@mail.gmail.com>
Subject: Re: [PATCH 3/3] usb: typec: tcpm: Keep cable plug messages away from
 the port partner
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 3:42=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] usb: typec: tcpm: SOP' VDMs in tcpm_pd_cable_msg_request()
>   affect partner
> - [Medium] usb: typec: tcpm: SOP' PD_CTRL_REJECT in
>   tcpm_pd_ctrl_request() resets partner

These look valid, I'll see how to address them in v2.

> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [High] usb: typec: tcpm: infinite discovery retry loop in
>   tcpm_pd_ctrl_request() [1]

This was addressed separately by Xu ([1], to be applied), and I've got
another small patch on top to go in once Xu's patch is in the tree.

[1] https://lore.kernel.org/all/eqdhulaftczpqnhu37rmf3ajdpntjnlz53tx2q7ugab=
zkrqfe2@amdz7hafys4w/

Best regards,
Alexey
