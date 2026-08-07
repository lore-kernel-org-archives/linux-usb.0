Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E31444238E
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 10:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097924; cv=none; b=gAdeYNmU9Kqhh2Ic1Ph0IAEABgY6OIUmoVgzJGaS/y3BVclb0T8Cq0+beR31c2JyJ17MdbIHhBVG0uzBH/A8AS0mIVztplJ/Waq/emypPRVHYv+OFu8x5T9znJpy117ZOOMhPuwJYHte1a28CS8Mpu2qOt6xZrvnmeEP0NscQ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097924; c=relaxed/simple;
	bh=swwNdyNOuG+rrh+9ckbxfLqbEyJWb9xoCLIj70Qh4Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GwNu2yb90O88KwIm/ZZV/ajRiCZSv1SjiM3eUTrf956gaIJaQ/HE+Ot4KXkHG9vfZgb/xPu+EFsWznIn33ZKu0UgHExMticcMaqnDodXj/sCHJpye95E/5Ir1r6VjadW4+xnkupOabn0MwtxX9LBBrgO79AZBOayjuvxuXSPZM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qs21Oy+C; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qs21Oy+C"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9e7391839cso3008445a12.0
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 03:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786097920; x=1786702720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26aOYNU8cqzDph/sVqTC2GyHiGPyVoWWt2+tiQQ8zSE=;
        b=qs21Oy+Cssj5h4Ya5X36B885jXv8pT6XjNwCv+kiEPcjjRu4HApoK7zuY+CiaOLUkQ
         Jh/j9aOB505xqkzGHDFOlXrtNTLb5O+61joDh2dO5AXcikV1dzvinHgU+hWmRgGv9Lqv
         C8shT8wbnpJJEbmKsGB7+iQhi419BYfz1d9PWjJqtPTY/2mzKKicAKkvnfWY3zHzEjnG
         uNANOKELlt70El/jfp5zaNaBG1Sg5Z79ZVcYzM8VJzL16bleYlTq//2NKOe2nmZu6H1v
         YN6OONaqlqiMvB6m5p8xSmFnFO6yx/TryUV1UsFAQgjsxdhJX+AGLeiyCqV4lnFxmovr
         uSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786097920; x=1786702720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=26aOYNU8cqzDph/sVqTC2GyHiGPyVoWWt2+tiQQ8zSE=;
        b=K2nwlcsC1BP25omPFYwetRN8JWgvDPKWMJ9jW4lY+ydEKJHIVL02dQgPTJQLO+cgTF
         pNGiI0UtYtYzH+o9EYpS+1NxKyAimDDTCfMo3tJnfBK0llttQviUfSmvb1uKjMjmLZip
         lGwjmHOXMWda3BE0t9HTlC9hSZPUQ7XpcU+uyVGlQ0U9Y4WcQS0dNcmCKc/AsrWmVzDP
         NhKqB5TvioouIYPDTqajPijCMvxrceomgNjIRy+543t29rhT8Cw0zk2LeT1O4pvcYypv
         B3ktNjbz5o656uXJDoLpj42h7b7KlZfqW+r6qZ1G5azPXjJ7gpy3g+fkZdxUo0PJAepY
         Ah/Q==
X-Forwarded-Encrypted: i=1; AHgh+RodAJkyC4e+fWpvIWr0jVqdXbLL9s8cogdhUn/13R5WkhG7YOMI4Y6R0DILJTOPmam1pmVF9g5JYTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaZ+E/JyeS3zHeu+6G6ArtrPIyn6f42jCD+QoAoz0SFjNJz5sy
	w2FAtvYcWHB0CN7BLupM8lxl76A0p8ozJ6aeve4hG/XICfnLY2UKMccW
X-Gm-Gg: AR+sD11pZBBD7TqWafkFVqmgmzE3vWDaRteuM/+jbSpfcNSgbtc8Qv/FgGrOCZCQLSW
	ySloi1ZbNbDVZ92aohoYkYqTBJs4+vN0nw5ocWu65sKY3Ebl9BUWMoM/58eIcoXaUj1nQC8t5aC
	W/EY7bUHcWbZwsMqAhNRgiA+TU9WoOQkJKNgQF8uE5rdb1dGqOTVgdpklDF2/rPvt+vFhvKXw7H
	Y+mtwEBmZz0F1iE25QyZkWFwcTfpLUBSo74tBRTEMjScnNrNsYdljJ0J/dPGiQ7+lv+vxSCIrng
	4zT2IkA1GOUpPJqAnMzf4Vf80+hXYtipVxLq3+lGe7A2BWD7A1AOCoMW5lNDGJrAaD4O8EP29ta
	EQvKJ9iWYA/NroKzmTYwVStdrOTPof8Kja5nCFTkCHKnu68zOa4e/z6cj5axoFVGVNpE2F9Hlhz
	FNwOZAgCO5GoAZaGamzcx7bpcMOXXiI7v2k/52cnUFJO8s/z4QbfLgeXDblgV8/+BUjXmDdBzSH
	+4q
X-Received: by 2002:a05:6a21:50e:b0:3c3:8ead:6df0 with SMTP id adf61e73a8af0-3cbc0431dd0mr3861597637.28.1786097919540;
        Fri, 07 Aug 2026 03:18:39 -0700 (PDT)
Received: from Default ([2409:40f4:1008:2f0f:a99c:b93a:222f:dee9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410199cf49sm5799159c88.3.2026.08.07.03.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:18:38 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: i@zenithal.me,
	jeffinphilip14@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	shuah@kernel.org,
	stable@vger.kernel.org,
	syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com,
	valentina.manea.m@gmail.com
Subject: [PATCH v2] usbip: usbip_host: fix null pointer dereference in
Date: Fri,  7 Aug 2026 15:48:22 +0530
Message-ID: <20260807101822.20922-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026080734-carnage-pointless-9781@gregkh>
References: <2026080734-carnage-pointless-9781@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Aug 07, 2026 at 08:00:31 +0200, Greg KH wrote:
>On Fri, Aug 07, 2026 at 10:07:59AM +0530, Jeffin Philip wrote:
>> rebind_store calls do_rebind which dereferences udev without
>> checking if it is NULL. If busid is registered using match_busid
>> but the device is never bound to the driver or it is never present
>> in the first place, it triggers a null pointer dereference when we
>> attempt to rebind the device. Fix this by checking explicitly for
>> udev first and returning -ENODEV if udev is NULL. Add usb_get_dev
>> in addition to the null check to get a reference to udev to prevent
>> udev from becoming NULL after the check. Drop the reference after
>> using it in do_rebind().
>> 
>> Reported-by: syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=af76b01c9a0f0ab60fb0
>> Fixes: 4bfb141bc013 ("usbip: usbip_host: fix to hold parent lock for device_attach() calls")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
>> ---
>> Changes in v2:
>>  - Addressed concerns raised by the maintainer in v1 discussion
>>    - Added usb_get_dev() to get a reference to udev preventing
>>      it from becoming null after the null check. Drop the reference
>>      after using it in do_rebind()
>> ---
>>  drivers/usb/usbip/stub_main.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>> 
>> diff --git a/drivers/usb/usbip/stub_main.c b/drivers/usb/usbip/stub_main.c
>> index 79110a69d697..c911626427dc 100644
>> --- a/drivers/usb/usbip/stub_main.c
>> +++ b/drivers/usb/usbip/stub_main.c
>> @@ -256,12 +256,21 @@ static ssize_t rebind_store(struct device_driver *dev, const char *buf,
>>  	if (!bid)
>>  		return -ENODEV;
>>  
>> +	if (!bid->udev) {
>> +		put_busid_priv(bid);
>> +		return -ENODEV;
>> +	}
>> +
>> +	/* get a reference to udev to prevent it from becoming NULL */
>> +	usb_get_dev(bid->udev);
>
>So what happens if udev becomes NULL after checking it and before
>grabbing the reference?

I looked through the driver and could not find where udev becomes NULL after
checking and before getting the reference since we do both of those under
busid lock. There is a small window between releasing the lock and
do_rebind, is that what what you are referring to? If so or otherwise, 
could you please advise me on how to move forward in correcting this patch?

Thanks,
Jeffin.
