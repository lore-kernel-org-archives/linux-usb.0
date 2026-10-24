Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792850497;
	b=ThVze2omblQBIda6k5U+pQ9PrBFP/cjoDqZr4nlNLh7QdIT8NDG+DU67yBsgLfAhw1Oi
	 ak9oEiMZ7ZJrr74cLeWZZlaJp8RW4TzDraPXIQ/GTTPf5gTDfa6lCMCFhxE4g5RcauZxI
	 z1TEmogsS/4m+Qdrzq2Sa9dTWysx5JsL+Um08dOnEed/W9gpYWH5H7cImLgAsFGVGh82u
	 cFAObmAJ9Sv2pkzQPCGmM8Nxrl+Hc4x1tKCP8E3ls5DmMlQ9Eov/ZQeR6DA82pmKy2GUp
	 X/bH1vQhG2aFyXPJRPCF6NfO27gdNFgLAhJESQNIi/Wk7zlUr56jAxaEifKCHWwSQVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792850497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Hs2l2qy8RZsJLMHRlnYs8TNlHuEDUdu45KHJmPnrBpM=;
	b=s0LLmGEGKUsZCFsFLp9J0UfSXdhWExdck57I5Uc8MIizfJX0avL3BUsclyAY82McUxwy
	 g24lxOAvQ8AW1vRXXz4E26DCID12mVZB/Xj5i7nhayCx7o0AVWFGSpZt0dJNC7gYw/VCx
	 yaljuuH0ZgXy3qPZcW0wNnMPzGSu/MZ1d4XhavSlGw+DpdIxNQZ1Psi8T/+gpRsuRa3g4
	 sXk7+BiJ/DLQZzCTwE06EJaDSYNQ5nZqd45/eN/YygvzKtlxZIJVbD+TgqCD71B4dmhw2
	 dZ/GfEPlvXOPrMADCSHk4IXhxNfw90mlBZfuzo0pgMwt5W81LRFJ1A6G52+vqgKTj7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RIy57taI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E13606A31B
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 14:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62E13606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RIy57taI
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso1625529e87.0
        for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 07:01:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792850495; cv=none;
        d=google.com; s=arc-20260327;
        b=VyfKHdmA83l/CRK24aMqladZUbjOZDxn9OTIEgbDnsuvwYpP2eMWbMM2kPP8WY1eIc
         PA/3m0IxrOq4Ar9mPkEwZg+YuDdIYcDD1z9R4W9utU9iuUsm7wo2Y65daGuUL91fcl4n
         MXihb+SSydG2nTh02QnYWyFnROK/4fsLvF0DqeveivuxFAIvyNRIF8BEV43R3dJ1lMFb
         39sqAEvXo//+NFbt6DKPDd9APp5RIT1NDxCvXR9f6qzEkYwUHPJshBd3kmoJfO5UNwDe
         O6U62oB7ZjxhgqOCVEje0DvPuBsLFYuDNWGUYM32YtekKms7ZKka5bhA1arWNrflgJ3h
         uM6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Hs2l2qy8RZsJLMHRlnYs8TNlHuEDUdu45KHJmPnrBpM=;
        fh=ye5p3Kx23kxH5yz5TsfxiOuITeZi86VJ+KZjNuVySyY=;
        b=pEb1cVMknQIz+KpkUvYDJNCEFxSSYggUHKPG7yIwOg3nY4lpzzSBuuOyTikMqd74XA
         LyEZw676BS69/stHcu4wBr0Q2cYq25zL3ZwMgsS0i1LS1FA8TMBJ7rOe1pbZ/sEHYe51
         4ftBWMw9+A8HI6EbFJNvREgIHSc9OqetzwptEhjccVcZFXTr1fY4tKv2ey0os/ry9jGO
         HMOIJFvHthSBq2wMTnfHADhP4pX+VTxBaOUspSF0vdAoioD+pWASLJA89kTIVpxnN2Kc
         IP26v5H88JKI5YXyPRT/8VnSsGw+uNYTFFvhkpXYa8zdsIix3gftNpNvXRGTvtXycz+N
         WqVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792850495; x=1793455295; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hs2l2qy8RZsJLMHRlnYs8TNlHuEDUdu45KHJmPnrBpM=;
        b=RIy57taIvA7vatJdScZJFnzWwk720Ygb4ewOH/fBbPbMLo4CmW4cHf6uEI4BNoQSge
         ihiWSpeanpYw10ZEjoH0PmC3W7j1YZxEyUmGoDBb7yMXEXPbGMy4/j4GBBEl0tmGtIko
         f3amjkzsWV8Ire6s9F0/0j4bg3yUuMz7ijiMxDnexnp0iwt/e7w4YrvzJ3svK/xHTqJj
         Nd1+YAdwxsZvbUFUGxcSws7WenrswcH8wBkrGzI3u0cNSHbQFQfb+JjEYo7GXxowtzz8
         3gcv+FrfbcX7VjeaZwdNCjtO0NLfMTxlNdqVq9ILg2gJ5F3yWLNyX645k490Jbo1bjUC
         5kQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792850495; x=1793455295;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hs2l2qy8RZsJLMHRlnYs8TNlHuEDUdu45KHJmPnrBpM=;
        b=q0rdXQehkOvlTWUTnX47yc87TIaSvXFogneOxoYwgT+dY1tG49FE9r6QNYDlb1op/s
         qmJAPR6pqdEdwo+QIOUMoNHrBZx2rPPSCbbm/ESNOdeDmyby0TiQ1CJIixj4CoC25my/
         9aQTjHm8sosktsoXi+/wVhPjZD5HwXaqZQZilwp9oBWRj2WJdELfZY87Ir3b1/iY+m1/
         Go/UPj+91bCcGE4cHwAflB70ye64wIlpmEYezU7rBPhDZ69r8FuaRsEHSghz7ZwnI65A
         YoPWNQav8HhUq4RCf4FZ6WpswFq8gug+5CwNId8WTcIXiPHb7lwf3qo3cy2bbfFfGwnY
         Wktw==
X-Forwarded-Encrypted: i=1; AKwUvBxhogdHqqEBZ0tzjjwRuwjuxe9gM8J3NkA8frjzpWx4KFuGCVc/GV6G4Mri3noKsPwhFnlzrlGly8Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJN9KEB8/uoVrNNV2+BKh1FKzsBK7xrjHbirldLEgnxAzI45LBK
	k2hhWaLdb4zIvR8GS4eAjqACrm2Qo/SlGyogooy5A/QgQ7QuYkeALGJef+tq65CxKVeRFVkhUGB
	MUzwux1ZQHn0kEEadLjiXzKL0k0493QE=
X-Gm-Gg: AYBFou2VovJp3FDAZZqwI/1YDkVwH3C3BkCD1XCJfcObibyo7JIQ6no8XL3CpS9iUt4
	q3VKPHvjJukaYT1wuyQZvbfQ+M+KtGfTOcoJEzwdOvDhGZ2/48ftkNWkawfH5bvOI9URuffaYKC
	SiM8+QYGSARpiQTEh8j8XowhIJRsW6y1P3ZnBr869AaCwUeRreJyJfideWWGEjfLWeDa5qAFlip
	cd2wcCiqHKsp1KtOtnSvfCdrj4epteh9aCDy4eEGXlk/Bpn6y/twLgv3BCQwDH6CO9VVes3u71v
	eBLEawpsU6ZTI1+czAlhs6pt21EsmRv2WSdykubHW1tpaXFO/G3sy53Ka9QL876esmnKDKd7h9A
	eGwQwmLBIG535AUHAIZCEF4plVroS2WOxMtEVX8jxgjqujIDH3ysGOpgZmoGHLxFLEEqYjVHcKU
	kd+vXjfOZRaR3eiOWuKx2qa2Ob0eVyKCSlAM+bGcBT5Fv06Jvg532z
X-Received: by 2002:a05:6512:398e:b0:5bf:b144:fd00 with SMTP id
 2adb3069b0e04-5bfb71c809dmr779570e87.13.1792850495146; Sat, 24 Oct 2026
 07:01:35 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260829145516.13500-3-edward.blair@gmail.com>
 <20261002082552.7084-1-ite_pd@ite.com.tw> <CAJDQNghzjreMHXTVEWTZ-Oyo1cCpzLyDUyt68EZvPD30Wp0txQ@mail.gmail.com>
In-Reply-To: <CAJDQNghzjreMHXTVEWTZ-Oyo1cCpzLyDUyt68EZvPD30Wp0txQ@mail.gmail.com>
From: Edward Blair <edward.blair@gmail.com>
Date: Sat, 24 Oct 2026 15:01:23 +0100
X-Gm-Features: AclHuK_nB-JD7Ut89NWc6ywX86lVHxDy-fHmXyTJWFi5xeriSZppXukQ1Oo5v_Q
Message-ID: <CAJDQNgiJCqAJQ+7zNLd+UD9vMuzu9e46zG5b5voKD+_gaKJcww@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] usb: typec: ucsi: add ITE885x I2C transport driver
To: Amber Kao <ite_pd@ite.com.tw>
Cc: W_Armin@gmx.de, gregkh@linuxfoundation.org, 
	heikki.krogerus@linux.intel.com, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	mika.westerberg@linux.intel.com, rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Amber,

Thanks for reaching out, and apologies for the slow reply.

I'm happy to drop the separate transport driver in favour of
ucsi_itepd. Would you be willing to take the lead on adding the ACPI
support and any handling needed for these ASUS boards?

Please feel free to reuse anything useful from my patches. I can help
test your changes on my ASUS ROG Strix Z790-E Gaming WiFi with ITE8853
and provide logs or ACPI tables.

The MSFT8000 enumeration fix in patch 1 is separate from the transport
driver and has Armin's Reviewed-by and Rafael's Acked-by. That should
remain part of the solution for these boards.

Thanks,
Edward


On Sat, 24 Oct 2026 at 15:00, Edward Blair <edward.blair@gmail.com> wrote:
>
> Hi Amber,
>
> Thanks for reaching out, and apologies for the slow reply.
>
> I'm happy to drop the separate transport driver in favour of
> ucsi_itepd. Would you be willing to take the lead on adding the ACPI
> support and any handling needed for these ASUS boards?
>
> Please feel free to reuse anything useful from my patches. I can help
> test your changes on my ASUS ROG Strix Z790-E Gaming WiFi with ITE8853
> and provide logs or ACPI tables.
>
> The MSFT8000 enumeration fix in patch 1 is separate from the transport
> driver and has Armin's Reviewed-by and Rafael's Acked-by. That should
> remain part of the solution for these boards.
>
> Thanks,
> Edward
>
> On Fri, 2 Oct 2026 at 09:25, Amber Kao <ite_pd@ite.com.tw> wrote:
>>
>> Hi Edward,
>>
>> On Sat, Aug 29, 2026 at 03:55:16PM +0100, Edward Blair wrote:
>> > Add a UCSI transport driver for ITE8853 and ITE8800 through ITE8805
>> > USB Type-C controllers found on desktop motherboards.
>>
>> Thanks for working on this. I'm from ITE, and I wanted to let you know
>> that we have been upstreaming a UCSI driver for the same controller
>> family. The driver was posted on 7 Aug 2026 and has Heikki's
>> Reviewed-by:
>>
>>   https://lore.kernel.org/linux-usb/20260807-ucsi-itepd-v7-0-998ac11ed0ef@ite.com.tw/
>>
>> A follow-up series extending it to the IT885x and IT527x series has
>> also been acked:
>>
>>   https://lore.kernel.org/r/20260924-ucsi-itepd-it527x-v3-0-a7392aa087f5@ite.com.tw
>>
>> Both drivers target the same register interface (CCI at 0x84,
>> MESSAGE_IN at 0x88, CONTROL at 0x98 and the vendor interrupt registers
>> at 0xbc/0xbd), so it would be better not to have two drivers for the
>> same hardware in drivers/usb/typec/ucsi.
>>
>> Our driver currently only matches through OF and I2C IDs, so it does
>> not yet cover the ACPI-enumerated ITE8853/ITE8800-ITE8805 devices on
>> the ASUS boards you are targeting. Would you be open to adding ACPI
>> support, and any platform-specific handling those boards need, on top
>> of ucsi_itepd instead of as a separate driver? We would be happy to
>> help with review.
>>
>> Heikki, Greg, please let us know how you would prefer to proceed.
>>
>> Thanks,
>> Amber Kao <ite_pd@ite.com.tw>
