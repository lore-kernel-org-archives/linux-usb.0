Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795089376;
	b=RAWzhgiolcMJGughGtKXo9BmWG3L1NaKoEz1OlfD7siyhNPQaibqAkZo+SzQupl0aIaL
	 u7TSEGf+Zpa+6qjSgizqN85NGFSHp4NoCqIRgXpLl+9Kfv8ZliGLJbTF3RDQUfU93uzDK
	 qy0hh0IGnDA7D0PE1nFbRqet431MNye+MhDQl7Rq6UyZ/qH7vBVTWsv3Pa0da33aVy4ir
	 /fW/tOAoFec/eYwdDie/BEhYSm1S9r8LZbqQSZ3Y8xyQB3Ey3uq4aHirw+T05ZH0s98P/
	 mQLqQw65UoL6PWFnXGwk/SbJQzx4ELnvpnarbbcAfA4j3y6fq950ilWFFLK1FXhwzbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RSQlhZLcdrbQFLEEra+ei00sOkbYZJ9sKIwJK+CMs6Y=;
	b=1SDOkDhhMEzYI1kpaute6huu4ZSiakzLIqXKpZuV8PVJ6B07zKupLYCPpGS1PraBAWDj
	 8rtbt7HVCDu5v5+P25fcOFJ7mvrsiyDu5pzwhuBv+KgkOZa7CrTe4M0gpzHk9VyiiBcHe
	 89+hSSjyD068adBMCLfToy03tOImCNSoVBJ7OGs8wRs7VrYU44TG+KjQ+Q36epIORwYXC
	 /HpiTfEkj1laR30EL8HgiAZXXOScPR3TfIsGA1Thnp+d3T2h6NPFdwQVKCNEPWdEwWMXt
	 rORYznoXyLxkoLxc7k2Cgck9MvAd9Ny0HTbEb5uj8MWO8sT8Aio9Im8pXb1OK2Eh6SQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+6GSTEr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71E3606A325
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 11:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E71E3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+6GSTEr
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c1ad0d0b72so135842e87.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 03:56:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795089374; cv=none;
        d=google.com; s=arc-20260327;
        b=Frwhodjc8XGnIOrrJYVAtimWwzqoFzdCu8bEvYNfQEB72egPeB0e7AmBoRB0RGBvwb
         nQ2bGLs1sENvXEezOtO6VXFCiQP5RKkoNnCrgdYWJvBygU2y5/dx/XpkJ3b3Cx+wOo3W
         yHtr08UePV4DBEGjGaSSlaAIq/gztfv80yPu8rclUDXX48HHOuqPXCGpAiCCEbjXTMY+
         bAxQng4QK4VM3IpWUgOt1Z9W5uLn4DlzN5KIFvErpjuxoxtD1k+xDUtoo0o3CHOtMILV
         1M3EdXfUAWn0SBVT2hHNIScObJeu1wTjNgfE0MQVjAFCd2XUbmyZgzJYHW07FKcb5ZWc
         S+XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RSQlhZLcdrbQFLEEra+ei00sOkbYZJ9sKIwJK+CMs6Y=;
        fh=x19ZLxwCwv5C8JsCEoVeS0RNqSXXfDTPazmSxnHIvSY=;
        b=kc3366JEJP80/zf8bLhYd4XPH7jMBqHnrHK47PcB64DHToSYOAtvY/BUedhUtKswyp
         vm2IjXdZEezqD8XKRwZEsQdt7y+FlbsnaGIFWCRrV+cPReEdM/g9ynZeXvP9GVhWCmaI
         SqHIMoSmA0t8K7KpZAlPxd5EA3xAIrXruGHS4QQ86qDcLYt0Gg5jWrts8IsqMKJhZQfc
         c661TyhAS6UuO8v4gdI9gXVADj4ExXdT37BR572GanwJ2xiFtqiJgovkLAEo5HGiQNIJ
         rXogIbgjwi46cK2/bxRljD5hym49+7rDU9OnAW8g11sV0n069sSz5VsYkRWa3BFey1ig
         6uMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795089374; x=1795694174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RSQlhZLcdrbQFLEEra+ei00sOkbYZJ9sKIwJK+CMs6Y=;
        b=g+6GSTEr+iJNFmOLmfk7uLS37/b86Gu7Z5ix7ooEzeRSuoviZQITI3D0TtSiWFjooc
         3TC3gbtkPWsqbKm0dKyR8j5CblzmHyBXImHc1Y42ptIjNiM40XZr1v0ZEf2yIUzBo8P5
         rLgIYhjSpmkce3RtxFezrBEYrRaYGTFeVXBNugML+pEOaXMK5qnUFZICqMq67TCgZrbH
         uOmUue1J0ll4sCPyxDMxgrGnfsbsY6M48mlGNUtu2lgw7vfRWpJsIQB7yrR5O/A+Mb1K
         G0aS5Q6u/+v9trWYqyPWVLnHkSvqTOGNJVqDpD9LU0vO4WASRQwhVgwZi1DSYpZZl6qn
         4Erg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089374; x=1795694174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RSQlhZLcdrbQFLEEra+ei00sOkbYZJ9sKIwJK+CMs6Y=;
        b=z/G549LfU8QmZTP0eiYk6SMFPZyeDAK3R7f5g8KZdRfPrd5nCX26udyn/tzLJnDes+
         d79aGeEaoWL5YkV6jdJmpyO1V1EK1OEiKyHfnNOGKlDxq/auamfJXFnu1gdWeGamFACP
         MjdXWfPtAelwNhAgCDxHQaD933Gxzbd0/E+plRIBMHLKsmDNVKxWRRcGEG2ya004Yvwb
         +OWyty2h1dNI4f9HRPZ8BSS1gjAN+S/jMd/0y49QJCmd/uH1q4QhmRNK6a2aypmqQ5KF
         brU2avwIbiG4KEbWrm0jo2Af0R8bVuo6+fr8unx4cA7M8m6PNHvNRHKRo3hR71lr3UIM
         9tVw==
X-Forwarded-Encrypted: i=1; AL+hErG2MeyuVxMkrZF0FyIpCiO+PXNX1V0OfLJ1qQinhy8ZZnVSa0vctln/sGXzHu3OZwjdgsh4CDivRew=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8U3DbjzOvN4KJN2NtttPh2QUbhGtz1KDKG3tKmtNRPno/G0dA
	jrRFF7WrBjISdoUolFQNfEtfLcSzjhtawnXTvUWgx0H1hmwdcyucKputkcKMuz+jBeRR3jdKnrm
	hFDmPcxDD7t+jf4luhaO3tS8BSN86tzM23kUfB9Q=
X-Gm-Gg: AYBFou2ZkCtR5hR37B3v69/IB65ZiYw8bo0cC911ice8g0tIA9FDoRJOw5rMwD3f7ty
	UbU9/8ohQF1GqgpArKQYWWFul6XR1EYM7MriVY/c03ny0iGebzy+Iv5vFZnbCPeZF9RHB4ShB0r
	99358w/W5CGLaOwFadIJaQrZBl3/Uks5yHZ+JjYpmQew+G+Kgyo3i16lySFEwXz6BiOAl+kSBi2
	K66xv6Py6kSmsnUv+cZc1+jmUJPrQi3EpUv/lO7F9CH16RjFV4iJSPhnP4uPymPj2V2PBQ9eSrD
	CcCIBw+ilE5fobzLhKKgeRdpM0EglOQBR3sWa028YlyFrUx4PaLfS78B46nbZDnnjtNel/p/vGX
	KJi/3r86PK374uFD0kQMfGGSm85qm+ps8EkXCRQgeVRApDRFGLYrSC+O5rDyUmtCzeubSA/Ez/J
	6ac25LJGhFINv7RseHxw==
X-Received: by 2002:a05:6512:ba9:b0:5bf:e6a1:3115 with SMTP id
 2adb3069b0e04-5c1a9bbdf96mr2564765e87.2.1795089373747; Thu, 19 Nov 2026
 03:56:13 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110070627.217946-1-inochiama@gmail.com> <20261113072305.220610-1-chenyou910331@gmail.com>
 <av2M-6w1u5mOyqDM@inochi.infowork>
In-Reply-To: <av2M-6w1u5mOyqDM@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Thu, 19 Nov 2026 19:56:01 +0800
X-Gm-Features: Aa3M54riNxFLUFg84fAOhmY6bjWZvKgiNBwAs9BSg1G7sMgZ9DPXd0hZVBFcQ9M
Message-ID: <CAKspUh+LLonm90ywMGrRUcsLDE+Axw64qjs0OtDB_ySUsrPPQw@mail.gmail.com>
Subject: Re: [PATCH 0/4] usb: dwc2: Add USB DRD support on CV1800 Series SoC
To: Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	chen.wang@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, hminas@synopsys.com, 
	gregkh@linuxfoundation.org, looong.bin@gmail.com, 
	dinguyen@opensource.altera.com, paulz@synopsys.com, balbi@ti.com, 
	dlan@gentoo.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 07:36:04PM +0800, Inochi Amaoto wrote:
> If there are no other bug in this patch. There should be no new
> version. The device probe problem is not a very big one. And I have
> no idea about these thing. Since my time is tight, you are free to
> send the fix for the device mode.

Thanks, I will work on it.

> It depends, if you accept setting this to host, I can add them
> at once. (Note: once set, no change will be accepted).

I would prefer peripheral as the default. The vendor kernel uses
device mode by default, and the bare Duo 256M is usually connected to
a PC over USB-C (RNDIS); host mode needs the IO board or an OTG
adapter.
If the "host" mode is used, it means that anyone wanting to use the
product would have to purchase an additional I/O board=E2=80=94that doesn't
seem like a very good option, does it?

Since the peripheral default only works once the boot role is fixed,
I will send the fix together with the Duo 256M DTS change (dr_mode =3D
"otg", usb-role-switch, role-switch-default-mode =3D "peripheral") as
one series on top of yours. Is that fine with you?

Regards,
Chen-Yu
