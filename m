Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32354403123
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 20:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812595; cv=none; b=BQ2fSIjDepy0SJCPV8G4tVzGZEj9tUN6vl5yD/XpZC5JR0c5O6njXInoneW9FSOgj6wdOIalVjbr9W2wROSfrxEXekH5nsurvRqHDILLDVLWx6ZLZsq6dMyo8/7zqHQ78MU/sIpRglSKYcPvepl5tGT09wxhEdOM/m49pIoxbkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812595; c=relaxed/simple;
	bh=KPw6gb/96YeepZzTPNIKg3NI+vpV38RDv8bf79QxgNA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CoyC8dEo+MroMIo8YimvzZLPJ7tzqe4MXDQ/6ScqDJS88qNyvxNFwZNxVhxD5325WpaMReouXjFAs1bwjd2p0/QiTAa1OxsukTRfpZHKXDGGfLzh3BRuJFuKTLkJ57zBWlCfYIJiQ+kjLGhHSMqlKFOf8sXfRMmu+t8e3UVUrMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cG0cLO8A; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cG0cLO8A"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4843f205a5bso2307185f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 13:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788812590; x=1789417390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EjCQrrE9B9KBQqXREGY9lzYvxyk/ghYu/8nD5ptROuc=;
        b=cG0cLO8AdyS5YgJPW+oqxMbM0+BVxThRpuYbSbCYQ7BQ8SKzYYPM91VRHtpe1FY5XL
         32P5Kf642/TWzE5IffYTJYeQ3oDQMW8d7bI+xIHuXmoP9PTPQmkVm8mvfPYDUQeBtT9c
         xtd4gWoYvflQbVGhPTvGSAVgwLnfs9fo1STM2kJQa80l2xBWzc7LtJF0fNNq2AoyGG/k
         m0xxqEQ8TidUsXjBTURFA2UZqthJV8BFiRz5CuD4eBJ8crJzODSCZNl3IHS/pGVCgabi
         Eb5sCCw5UF94ZBN9X7l5kPhCLWCU/1w9QzVEEJRNSDQR6dkkgepOx5Bt1YqNrtp2dlzF
         3Ydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812590; x=1789417390;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjCQrrE9B9KBQqXREGY9lzYvxyk/ghYu/8nD5ptROuc=;
        b=DtBUgqrjo3GVPSXY7v8m0jLmZAJibEqJoNjV8HvZbYKYhmH/ACaOiqYjOobY9Vtgm2
         84JCkiu25enc4jD/Gyv1PUexLZcOej5IUGE21MlUwQIsCV47mWdYoCdM5fOuq++nH8gJ
         NbYQHPKr5OZg8mojLCFiWroVPIDylvp1xCY7W58s0BI+ImmtOJmqAaTpYmBk5pUm8ndf
         ZHwJpJZzI0pfzchy/BxTpWXQeHD21KEgeYP7ePZM46yiQfHx4HwIilo+Vjc4P/v9n2Us
         dHtPFIba6ih62ON+kIwo2O8tvf1IN71e4DVy6iUyY2waVuKwblKEQ8b5/UDE2TzksVSZ
         1p4A==
X-Forwarded-Encrypted: i=1; AKwUvBxuAauSne3NTTZ8rNNNu/NRZGDWBjIDt+naFULRhByQwbG5FuPGou3wJs3KKyTWA+wuL5qpO7DubyE=@vger.kernel.org
X-Gm-Message-State: AFuF++mIesjoGnmkG3f0QI6KtKvNOY1jlij93/8rOzbnLWbGR0956uwX
	Zsn+vjJ9kSUAVLTmGZ2GMceMuGTbjD4qt0pDwF67DJn8GVPk15jiUYk8
X-Gm-Gg: AYBFou3V2qYi7IQfxqJekGVVUnfzHPQTSZyN639LgnMnIYKm8mOy7vznF+0rez+V7l0
	FnjS608bj7sKi8MiR97e2MYOmLjP5WY/mLlhNi8FlPvFL1or7ZPP+WSbchpCVHYOG42Aca15ju1
	7YEQ+nqv8DSyTthQYWjpIUYD4xPTqPl0CYR1C2N7k0m9NhaqWIpH/RVjB2XrvpY10ToJFTBL38P
	a5bb5udj9WVJarvTZIHeuq4+IsUR6QusMjs3FuE74vlNhpYCDjiOL24n/wq+s1duPZZT1W+pO4L
	MaKUHjrq9J0a23B/mNreuMTufAyf2zV3H9+VKVqRIISH9SNdB4+6jgv0PObaK06b+wpWPCKs5BE
	g1pnaPq5e64BsmaPLX2BKxSq2x0hq1cxYwGgswW7e8mDGfVMjCCNLQDMHFgNh4tWdXIeI2e3YGg
	s+hXs06/phTQ0WOVZ4dcsN4dAwGlTbm/1sj/2cO+5uzmcKrxiXxF4UtHjF90fGzy8cdzVN+uIi7
	3XS3zqc+sNYht9nqagTLs9lew==
X-Received: by 2002:adf:e014:0:20b0:485:8e4b:3d36 with SMTP id ffacd0b85a97d-4858e4b3f7bmr13906187f8f.10.1788812589672;
        Mon, 07 Sep 2026 13:23:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859207c28fsm24763666f8f.5.2026.09.07.13.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:23:09 -0700 (PDT)
Date: Mon, 7 Sep 2026 21:23:08 +0100
From: David Laight <david.laight.linux@gmail.com>
To: =?UTF-8?B?w5ZtZXI=?= Mete Kaya <omermetekaya0@gmail.com>
Cc: oneukum@suse.com, netdev@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH net v2] usbnet: fix smp_processor_id() use in
 preemptible context
Message-ID: <20260907212308.420701cf@pumpkin>
In-Reply-To: <20260907185408.660755-1-omermetekaya0@gmail.com>
References: <6e0dbfed-cadd-4274-8165-886725413d0f@suse.com>
	<20260907185408.660755-1-omermetekaya0@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon,  7 Sep 2026 21:52:20 +0300
=C3=96mer Mete Kaya <omermetekaya0@gmail.com> wrote:

> Hi Oliver,
>=20
> Thank you for the review. You are right.
>=20
> I used local_irq_save()/restore() thinking that softirq writers could
> race on tstats. After checking the tstats update paths, I agreed that
> preemption protection is sufficient for these accesses.
>=20
>=20
> I will send v3 using preempt_disable()/preempt_enable() as suggested.

Shouldn't you use get_cpu_ptr() and put_cpu_ptr() ?

David

>=20
> Best regards,
>=20
> =C3=96mer Mete Kaya
>=20

