Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF699448394
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 11:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766364; cv=pass; b=KCKNwC34LIittOBjqujF2+sPAiXak+e2LUUnMR+1kFGbBXldOU8/aA+SGTBWy5hGDGaB87zJqu3v2pJAg7C2qh+kXaGkwBXbd0RhkFyQCpzSmda33UpDwtbYs+vEkTFCBYz6JvlnaSLFRXz4wSrHjj1shPjJWguCzZcA9o9iJy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766364; c=relaxed/simple;
	bh=EiPEneRnI9r7Jp86ZD1oK9EFwlun/kDwKJ7gdkGXih0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0B07iAKqtwlySkEBCDFUJs1tPPb5Rxu761zUjpQND0ING1uC5ZS6UWrKFc4dF+0f3WBWQ7iDU5/+tf60g2EAOmzyMDvML23efqvSheeX7dSoyzp/yqcZwwZ6QQZjSSmv3bJuXmv4SwBMu35HdWb62tKj5/4gZSH1AYZX+1Iug8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lz/PBTXD; arc=pass smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lz/PBTXD"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-7beb81b2834so78111137.2
        for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 04:05:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790766351; cv=none;
        d=google.com; s=arc-20260327;
        b=lC3Ssj3Jd0G9utexX3Kd8ehHfkbGi96kpSQGTPkqdnv6B3Qx/GmIvo4454Rg8XFo5Y
         aYceJpCDJknAJgXal0/8kazEAVypQffh1qkBrqx4/eTaaRZMFHjFZgDDAMoAo6vOQxde
         maNr6PBcneBp03QdGVH8ujCymhBIWWHcPAt/VXtaAQGktptNuIkE+2h0Tc1mP4i75l8Y
         UeAQTi3vKcS6UQDnpFGOs8kFYl5BILRtDFFr2K+zYx0DjmY+azZ0FgdSLJOzOMM2w0tS
         y3go4J6Hm75D4aCFp09tER4kLkMSxgT7xtjRUD/qjSYwEJ0yJ+BDW2oJYzAsK4kFnux1
         /TNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=OTCXCo5OR+c8Iv1GP8nUq4PH5B2NnHbbWepDU2k+v5I=;
        fh=5BLZ/cNOQuUOipr2nouLHHOKLWtyCQH/gm+XM3mlOtQ=;
        b=Z9eQk/eBF1MT0g5OsZX1/UMwMCTFFoDSn4RXWFyGJ/x+J/XppGvegyZS+f6O2l3UH6
         4U7xbwmmv7iZsEwPbWEm/4zrUizRuNLTvIMOM8u4YPIV7ZgGQZImznSj+N0eiJ3mtSal
         jQ7UNYYEOwbr9nsjSDQylc6SMhE6TYiQKll7yvFudDqV4eXVJ1ZZX4NN2EEaER0r1Fat
         E4EWPnd54AeBicfAPpoFeePvHf9KK/p3AlxIesfeu6N7HiVS4oeQ/8oFK1xl+tI5MCnT
         FepV0cRpXa98xAdXVQJCkDDIXyxh4tbBlP6DdFjKxz5YTOcI0AR+G0rfwlUiJJzGNFxk
         vtKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790766351; x=1791371151; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTCXCo5OR+c8Iv1GP8nUq4PH5B2NnHbbWepDU2k+v5I=;
        b=Lz/PBTXDt4buNSHeUAH7sbB9dIFtyyeGZjLl7ajcbW4EPwTGfuidxR0hKIvhJXvA3R
         TF0voH8Nn0MWCl0B9Sh0cDWiFp81caTUbxmzsQmn5Nq+bMTOojPkFMpX36uxo6KrqDP/
         H5PU6XFJfBXTa65id2t1B0VOUcpIfnhusX2YBgBmMiC4RvLVcbbEXgtqx6SRRAciP91J
         EPfgyLle2M0maSbnDfNLPqaysiTg28YWgAhfm+tB4s4X7t/UT3eXmzD6zmv3VkU5sKBY
         fJpHNMI/c73Y5ZwpykTDr/o45fpGo6RdvE73rBs37/Fa4dtPtLPy7tMXqWF4DeYv1s1b
         Ukig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766351; x=1791371151;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTCXCo5OR+c8Iv1GP8nUq4PH5B2NnHbbWepDU2k+v5I=;
        b=mWg5Ql2fpEBsdj6Sxer61h9/KCIX8Jbnj3MV/7xulOcdM0oIVlNX/m4MT64ORFWGOC
         AHB6Ldqdb2wBqqREJvIGEnp7EIxs0XBJnw+CWxp1ZMwOaFMu7NV65yuNhGEDKKFtbLoM
         7k6FpXi8ghil2i5wQwGYlqdVkkVetGu1q0zJpLbFkJ1VYOGNK1AS7d6rLGS3IU/I4Ssf
         +mEHSIkhCFebaZ8Gc1t1ArT2SzR+sreZXMxodOgnIDV7Y5gBiz9swfEUtGs58Xys43Qg
         dsk+xIxFo7E3tUL5s8wWytRJrasK6NBPIwMGOKcsZt1MOzPTAmcF3D0m0eNcEZyrbcfS
         D+Iw==
X-Forwarded-Encrypted: i=1; AKwUvBzgw6ekWeML5WSmFWod6JS7LKOo6eiP6EkWiAJ9Nn8W0RjF+hHhjksjvv0pELrNpsx1+JywMhyj3KI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJY6ZbtYjKZAzUg4RF4RfR158cB/Q3l3lcrpwL5gS8GAv0ijHeL
	w2NUrw/Y0oAz4On/gzneyPq9ZSrsYwDjynRCUX4+jsAarM7XZctBJDg8MaB91gXgYN2ORLWy3HK
	TcBcmA6X70Qlg1eukNXaIwjGoj/Ujll6WTQVt
X-Gm-Gg: AYBFou26kft2tABPTLz6fG0tAI8caG5Z1J7/XXAcgvqxpKAANSkiPuyyX77lRoVdwsK
	yJcx/0PmWYxNUXUtxzc+0LuaQSt0HvMqcE4z6+LKT1zX+8FRVt22ua0OOaFFEh/uoCwrHgr8s2L
	bh/fl2xZUYDFMrnbLVA54Iq4ctJ5DJNBPU+7QzGUkukfLxVSKZ+VQ+lZccaPO9tBsbQ6oeDAoO5
	bOhHzUmsBN7kAyKrNVGXg+EjXMaz5EwvP8BAOs9MGOp6WPhZwREu1cJDlBuLwytioTD4iRkT1kO
	t0wEa0EDCb7bOjlPIQxeQ945L5NXnBdlWmJQ9CDMq4ZIM/actKXzRcX4M7g9ee0un26KMc924cK
	vXi8tZWJB2HlA2gT/ZAijAMghWwrT3rNioYkkVO0tEsTu0uHsaGs+AmWPO6alTSKbTv9zkAQ=
X-Received: by 2002:a05:6102:5814:b0:7a6:e302:e24f with SMTP id
 ada2fe7eead31-7be7359dfabmr123703137.24.1790766350743; Wed, 30 Sep 2026
 04:05:50 -0700 (PDT)
Received: from 543150747168 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 30 Sep 2026 04:05:49 -0700
Received: from 543150747168 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 30 Sep 2026 04:05:49 -0700
From: David Pieters <davidpieters1978@gmail.com>
In-Reply-To: <2026093012-paralyze-amniotic-65b8@gregkh>
References: <2026093012-paralyze-amniotic-65b8@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 30 Sep 2026 04:05:49 -0700
X-Gm-Features: AclHuK8ZB163fSS2v_LgACHGzyQ2H-jVlcAzug1VJilUJ49c0xY9B0G8Z3BJDds
Message-ID: <CAJ3h-bPBQf20naK5VNOMkTR_5opJO9oKg9QvGMiGDvjOtH55XA@mail.gmail.com>
Subject: [PATCH v2] USB: quirks: add USB_QUIRK_NO_LPM for ELECOM DEFT Pro TrackBall
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The 2.4GHz wireless USB receiver of the ELECOM DEFT Pro TrackBall
(056e:0132) and its wired counterpart (056e:0131) fail to handle USB
Link Power Management (LPM / USB 2.0 L1 sleep states) during initial
enumeration on modern USB host controllers. When LPM negotiation occurs
at boot, the device stalls and fails to register any input events until
it is physically unplugged and replugged.

Applying USB_QUIRK_NO_LPM prevents LPM negotiation and allows the device
to initialize properly at system boot.

Signed-off-by: David Pieters <davidpieters1978@gmail.com>
---
v2:
 - Insert entries in sorted numerical order by Vendor ID / Product ID
   in usb_quirk_list, as requested by Greg Kroah-Hartman.

--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -329,6 +329,10 @@
 	{ USB_DEVICE(0x04f3, 0x21b8), .driver_info =
 			USB_QUIRK_DEVICE_QUALIFIER },

+	/* ELECOM DEFT Pro TrackBall */
+	{ USB_DEVICE(0x056e, 0x0131), .driver_info = USB_QUIRK_NO_LPM },
+	{ USB_DEVICE(0x056e, 0x0132), .driver_info = USB_QUIRK_NO_LPM },
+
 	/* Roland SC-8820 */
 	{ USB_DEVICE(0x0582, 0x0007), .driver_info = USB_QUIRK_RESET_RESUME },
