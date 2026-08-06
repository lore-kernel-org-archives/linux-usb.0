Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE64F41F379
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 08:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006070; cv=none; b=JsaMnxxdhbLhUv5z1Nr+wf8NPXNv2TaIOzh7H/X7KMp1aCFlgiYYAsE+8M45SHVG4W37p23byyjcCIgmU6vtBf2RRYiqkcwzvmQM3eABeZ7znSUabWXtlBYile5hZELt11VzEDXdLBN5CWCVN7Qd8cYmN2DTQcucBAsvXwjMKZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006070; c=relaxed/simple;
	bh=kknfDQ4pitkJ30M49Sy3UZXiAMl9glBAeo021hmHPoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GsohN2f7tToV10kUt/KtK7rlk1wVeNtnrEszoDrUAdMlJCki7gJ9ad0FY7m+DgksJvOQK71wOsPBfSh9ymWQccdVWCFFDhgVLTZSOZWdkyyDbFgdx2OXf5zlcfjq2K5k5ss9yn5DSuCWNf9xPu5Q1u8HgxHrZ+FuMPFQwWEkqKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bisbIWNb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bisbIWNb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4994c49f588so6944535e9.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 01:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786006067; x=1786610867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uk5Y/4KscmkrloiyTPciPvjAiimxl9gE9X0jhvaQx60=;
        b=bisbIWNbFTO/emeUATYEFYnMyFDMT9MndK8Uenfl7PCW+uGAfXMjXP6txYf8t1XP0l
         GLkK/R3GlLw1bX+rmmRwqxcWzWxhxxFZza5YtcBG29ZxLZ3j9O4h5+UGrbGZ8DC9cyTv
         gJXOecMyLL2eqBEsWfgJdz0wcBM+GoeTSsuKQyoqmLhoWyixS3iEC4cdfqJSVNHkhb0Q
         nk/OhPhDoUcp5nS20IQkAS6AiZ4w4B+8Z+awsl5v/Oyp4BGzpQiI2e2PxdBWl6fvmrGE
         QT0r1CJcV+ouoyD+20zCiVn6CtSQT7kwypSuC+WUdoWOK9cB3+yG5+3epJvtogOxy4mR
         6uHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006067; x=1786610867;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uk5Y/4KscmkrloiyTPciPvjAiimxl9gE9X0jhvaQx60=;
        b=kdsfH4H9ThVEbZpDSTLkmFhMzcnqdAyigxVV5Ak2fRGbLXtwH51ElOXop+T4RnZ3JL
         7LN2X477JBJ5tPeGuJgUycEruFsBbsOhLfbRO61Cc3SHyzo53QR4hJnP46mtbNDSRICt
         V2lQcXUJFAaNBtPSRg6an7lQx+qIxMeofM7KENX3tAFnV6+4HoYLvWF95264Yp0nc3F5
         Zhcz7h/r/pDxgvfyzT74K4JmTSPua8bhZtvlStKF1nsDYeBn4sFE09bx12DH/G6IhOt3
         Ilp3R3Bm3Ji+RYs1mXPKbQiMbmWQnSDaLyK00GxfQMx2+1M6j3FGKS/BS3+kGNE+7N6F
         V1aw==
X-Forwarded-Encrypted: i=1; AHgh+RqkRArLYjVldK+vcHhXONOAebLRxRPNRtYGABhtLxTz9jNpmxW0b3Xns0T+1iTUZU6RqvrW5WYG7Is=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZVBXcKGpIv7qEUnIZpvfhwWsJkq/tANzSgDy1G/Ax5m7qWvd9
	fKWp+LSw+Et34af/35IYQTzQGAFrqz+CTIcSixVCgJEuV4/8FITl6yYC
X-Gm-Gg: AR+sD133mc7Ggx8nc+ewSkw72GH3hhdgAxLMYAJisoEsKlv2H8zKIgB5timQ1liK+uk
	adyvdO0GI787YmuJk612KU04N0NoUrCNyTvkAH5+H/Kb0IXJTZ4S8ZWlROyjagIkCfy5JS2CS8o
	mDeaXfhQV+Xz6uh74agIgqsu0RshQH1e4ChEt6enIR9zRQTN82YG1PbWzE8rvODZi3Kg0UgwhYs
	RXMPjSKNhgLSRFf2S2r4LP3fxl/gczLa/3Ey9d3c9NhmuOoT/CqUjUXI08rSlqK2e0bU4oWIcVn
	7J+TDycOvR5xmacaJAQftWOtEjYn6aF5nxtKz+d1eqYSEMrSOKzuk0xfkvPbQ4xX+SwAHkLG0M6
	rZzA5TvowjcX2CTNt61K9YTc1xeIScDRMxieJ47IdJPifXP+c3jddZ/3epk/p4qSyg6dQaz/T1R
	/bMCIL9yh3vVpObbyEIsVOPqb8pGxEa1Os2txaVTSDXSBoNK0lCiaZSUnzpwIoxL7RrkECupIHK
	PmynBE23gwW51Euxdmtw1zR0B70PwhglbX/M71PDx6ElANIe8lyxsusJxj+qKAAJ5jaZ/TTkAmC
	xdRO8GdctgAFsCCH7ffz2UvlPvyqCYR8N4PPia96MZhc6dWbokWQ+UZLuEGEQgTUvDgb01pAE9z
	B3HRVwxHgds3iIx3m1ADFd0DLo4HevwkwJgHj+LdCH+AEZ35OnxZLQUOIpaJ5W2IfmkWJMXc=
X-Received: by 2002:a05:600c:c173:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-499553e1c83mr39539235e9.6.1786006066784;
        Thu, 06 Aug 2026 01:47:46 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49954228a47sm67970545e9.12.2026.08.06.01.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:47:46 -0700 (PDT)
Date: Thu, 6 Aug 2026 10:47:45 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+6c7e68b141ebd3a2cadf@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: typec: stusb160x: add missing NULL check for
 i2c_get_match_data()
Message-ID: <20260806104745.00007baa@gmail.com>
In-Reply-To: <20260806084301.1340-1-joshua.crofts1@gmail.com>
References: <20260806084301.1340-1-joshua.crofts1@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  6 Aug 2026 08:43:01 +0000
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> In stusb160x_probe(), the return value of i2c_get_match_data() is not
> checked, causing a null pointer dereference later on if the device was
> registered manually (without devicetree or ACPI).
> 
> Fix this by adding a NULL check for the return value of
> i2c_get_match_data().
> 
> Reported-by: syzbot+6c7e68b141ebd3a2cadf@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=6c7e68b141ebd3a2cadf
> Fixes: 823754697556 ("usb: typec: stusb160x: Make use of i2c_get_match_data()")
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---

Ugh, forgot to Cc stable.

-- 
Kind regards,
Joshua Crofts
