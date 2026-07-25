Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027032571A9
	for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 07:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784964252; cv=pass; b=hMW14hO8IBLVczgkYc+Nr4tbZTB31DTEv2XIl6+9YtLuoDU9N9MdLGQHjR9m4DLI/z53y3Zx4DE/6n9HLPOyGpbqOHZwZZeAfcqkpso+f97/pRExKhlWl2iAv99E//GzlHfbEQGHHYDw8gEDvmeLI4iIJWbbNl7CeLEMCGMzYlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784964252; c=relaxed/simple;
	bh=pmiOeLa6xAV3tz9qYSwcEwzahYnEiatZpm2X4u4QLuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AZtnIANZTzJfx/TMkkp7pXsS36QJY5fUNwPkd4UNFYvfFkM28UNRZGPM8L9PT+/sJtnl75sbn2Pr4LJufnI7//uCSUaVHihh00TpEqfNHkj1njSFfaP6LzrqJA5G9EsYZlAQrVSc1BaBMNuNu8kmsEmDkRxruF5Fe5mwbsMrc6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXy4hm8g; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXy4hm8g"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69f7130b47dso1900136a12.3
        for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 00:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784964249; cv=none;
        d=google.com; s=arc-20260327;
        b=C8JUIdfoSZGC+/vocv4SWBWmUYx7T2DdcxXDtvE85FT5B7Wj32+jMrXbBfFYghcVbO
         T9WgPDRkfw08FGYPYUg1qPTj8IcCJfhLmo0+WituYrJfIBZ/teHn+F2JRPgSk+ScUeuV
         y4ZwgC6BgMYoWRt8X/jKid2H+NyYz3CtH0TAF8IQqXA/LDXEXdv4HPZcW8FSESptLofZ
         a10tJWbfBJvTTyOjgOk7qjaJ0Y/43PW1ctcGo+VeKD7OLYU1NchyinG+LyMoHXBVPtpz
         1GqdFzyxe6ofMG1mFwKbxlq1TocWJJwAVLs5m00YuZcykIS22EDOpdpGNjJd4Gn07XR6
         G7iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pmiOeLa6xAV3tz9qYSwcEwzahYnEiatZpm2X4u4QLuc=;
        fh=gnz72SBVQ6jnPmHdXmu3GigEummNKivgoOimm7phRzk=;
        b=boNS3EwRF2g0Co1HaoxWotQAIsfpta2qx+BeY++N/S16O6BIuj0a+g5odJhdldeU6+
         +eLqWNH3gtmdhC8xh+X299r4/4Cq2PkC1fEuU8KHsMy1DhizZ5NumkmwnTTxOiyqs7++
         U44MuyXfK8FFckAcO1v9v/JPoqNB9GFJS6RcNAjadVwx0ngiGf3daDyBSOb5UucYT1Wd
         YgiL3upN0oFek31f5MhK5Jf8YaXuqb1hw9CxFLUO5AkmGa+0HaAALE2BWmkfEtCGAnIw
         9L2mdj7Gz5j0sMXWWO/qXrZ1DOJa72IKu6p3V13dvLcNiuUcimojFTOYCY1jOZIdyBtU
         N7xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784964249; x=1785569049; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmiOeLa6xAV3tz9qYSwcEwzahYnEiatZpm2X4u4QLuc=;
        b=aXy4hm8gvyTk7NbuWQU37lxdw9a1bOJIdahXjiJAXDibCCMDdSBF/qsFDiPDWFaWWx
         jcjDNBnRgscg8yWHkINTDfgucN8Lr8tVZgYCDVjYPAsEdNFK2hFVlK3w4xg2A0DLFLIY
         OXBWkJiJ33IJlq5ypplSiR2ZMWJSawH5GNvPOgdCyfk6otT4Oz6VAqDhJCLbibSBoCUV
         pp6fKwMNh6hj5i/Kjd2r3Ivz9uolj7IUl9C//ACKJLBnYijJMwf9LIo93DTHp5Uz0djb
         M6oHaJgzuibXWP7KvnVEKWQ2MWafmW5hue0hjKZz3oq6np3xjvXEM1/weLX9EkDtUtt8
         2U3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784964249; x=1785569049;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pmiOeLa6xAV3tz9qYSwcEwzahYnEiatZpm2X4u4QLuc=;
        b=ZxUZ2ugStX8Si4JMyPJy+7u4ElFPJIxyYeWyVYe+OvixJ6DLBoShQwXMtrs00ev5li
         DPKOI0esUmFBh5JvSeWx1+0KUo1gPCYsQf5yPt1DBML0UfLGDAqodaWjzjnq5+jNTCPn
         rZmpmIwwqwpQP1JV8htpUsd+oHav1XgbQZSDDqj5ruYkstSTD/Y+0q8iZ9DbTTPb+cw4
         h5G/aCNqcLkdPmBh/N8R+5CmBI0nlF89lce4SLCnrXPGAtf4NgCns0cQd+5UBvGJQvHy
         4ouqvo//oY6Rj+YvzwbwKKNb+HTYfzvbeTxxl1brnzGAEfR/2A6j+D6S9U6UdJNuRfXX
         6K5w==
X-Gm-Message-State: AOJu0YyM12CjiAChD2lRR6wHye7MNayqlRclzev0TV14DsSi43+Ubi73
	tFfMJvzA7lcKhsP2ChXqrpQNxNsXyWanJuYNrS765Fy1vzEfrYI2mToLcprMHPbBxNgsWog05CW
	tisE00n8NFJqQf7c0wJ66iF3+7kxrG4GStL+hNCE=
X-Gm-Gg: AR+sD10Dto/8cS0CREHr45IYBwIy4GcGibx2OJXAob/27+B0f4OcfTVxtApLcQrEn2Y
	yEbKgNZVqRdaCzjc3fZv7p4E3Z/HcxFz6YKvhU3/cXKQI+RKVHCCdhyhfjCqPYq29NUy70JWuEW
	ZvxRUtjKpRb85niHAhqyNFUrE/kCVLvKPyeFP2TwjeJYpQPinrorp50WYm6HZGhbE2hl24IyoSL
	VXttjvniSrmrEabRJHI024t4AigxFPyjkd1Q3YRHH2ZfWVVE25OrllhB7Uj2VGah21GPXF4ioIB
	R1XygjlSYWfJ0MH0pMGeTXhqh+MxtbMr8ImvPOkUQWXjMvVqpFvMlf41bTfM4colDvYJ4bdziip
	kM1kdMw==
X-Received: by 2002:a17:907:3e9f:b0:c12:34ed:e100 with SMTP id
 a640c23a62f3a-c1f1f54bedamr62907866b.62.1784964248864; Sat, 25 Jul 2026
 00:24:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG0uPa-gYTMS87gWo2ixigFifAAR8wQ1eJ1iRRTvBgiywvdxYg@mail.gmail.com>
In-Reply-To: <CAG0uPa-gYTMS87gWo2ixigFifAAR8wQ1eJ1iRRTvBgiywvdxYg@mail.gmail.com>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Sat, 25 Jul 2026 12:53:57 +0530
X-Gm-Features: AUfX_myrbahQOcnaspRXJnt-42gL8z5CLALe5zTVCZ_VgeyIqBfDbFdhED1ds7o
Message-ID: <CAFgddhLc5o0_DWqUM7jOOHMDK2200XZnq4F1ZnCeFWo4g1i5eg@mail.gmail.com>
Subject: Re: [PATCH] usb: core: quirks: Add 255-bytes initial config read quirk
To: Ishaan Dandekar <ishaan.dandekar@gmail.com>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ishaan,

Thanks again for testing the patch and providing the additional device ID.

I think you might find this interesting: Someone had opened an issue
regarding this patch and CachyOS has accepted the patch for inclusion
in their 7.2/fixes branch, even before it's merged upstream, so
hopefully users on CachyOS will get the fix sooner.

Once the patch lands in CachyOS (or upstream), users with other
affected devices won't necessarily need to rebuild the kernel. They
can use the usbcore.quirks= kernel command-line parameter to enable
this quirk for VID:PID pairs. Of course, adding the device to the
static quirks table is still worthwhile, especially since Greg
suggested sending a follow-up patch for it.

Thanks again for helping test and improve the patch.

Thanks,
Nikhil Solanke
