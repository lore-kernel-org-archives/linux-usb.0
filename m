Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA4448F03E
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 13:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135122; cv=pass; b=ACoxOuDzbfOOdgiYXWDyLl2Y46M92LkkYgsVws+IBo0djAiFNCcbB7PlRVk3mJuF/+qAgAIyuFO0QmOWmc1XyEVXEAhEcQzGpNPzlnMOZ2jDcOk3osBjK2l+AUEmI532eQXY7TDlz728Vni1t8Yht5N6LQZHF0MT8KKDffUa90I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135122; c=relaxed/simple;
	bh=xDEHxvbeRV+H+3ZnrTLb1ZOhWNi2risnbOgmdwBS5bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALMUkc5os7eM89SxYX/5I0nKp3E7bF1tK5z8EI8Gi0wF7Ahxoy6F7Q3XE7z43XNAlYB/GIQD9qKm8OY7caddo5Cch8FJeEPvXqpNM/Kpf2hchiGEmw57IZoFNX2JWGGwChaZyiokN67PC29fALQAaUVz/Ep9IXTpqBNxYDVUu6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xc0mAi9M; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xc0mAi9M"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a2e985245eso7752261fa.0
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 06:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789135119; cv=none;
        d=google.com; s=arc-20260327;
        b=WNsVOKFx/Ya5TjrOm9S/LcOyeON+nzoqkDfsPrgcz3v95so4uVeC5HEveiih/rJQYz
         qkI37H729CHGupWkbST6AEOMS2rjxw1QrqhB1WcVpZNMiZDT65Gz4KHgnxlHIZo9SZMa
         EuBVzNoRORWSpAcFVTG2EON96VI1VTycW06eEA2xVTriVFnwJrk3T+MJs+yN4RmisATK
         yknyH4n4PR4UTnoDsvonIA52D4Spv6a8OVladtFZ43pFXSYQakpjDgZ+CYWXp0Yar0Vo
         QeezId78zAqwF96X7lQKHa7sVBZ5uXovwr8T5583kElxHVPJsfioYB4vuahdN0gtMOKk
         popA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qy+0mFYaryQ+eScYF7uiBLvncEmqva9qKNca69Pe4l8=;
        fh=9GKrEXJ0voBtLRTaLgaNEl+d/MMuIV4VzZGcR1CWe7k=;
        b=Fxxvgwh3V0ImkIcfLiXBoVfTS43bMXFzFEnbwKF786iSDR835jKD2aJzGkdzjNeoZF
         UFxaFCUMT2sPeOB3tYW/VBgXHAlSdXWkbux/54Qxoa7Cvbd8OzIlYWd84JaxSmyIrBDc
         vSNKvpQkIQnN/1dbsY5udLnZdgyLhywzPxrFOPbQx52saQIEC5d/whsnCkZ5WGta/z15
         64WT/iIMD9+vsJVwzFpBn9GMFVumuLB1VBYcVh1PBRGk9jeRD+BTeWSYokN96K58vlb2
         PRPi9d9e/PH+Vc3wPi175QSKLmr/zxtu04RtZB5YC41MiTRGgrhIMJlETcQBM3BDi2hS
         OI9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789135119; x=1789739919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qy+0mFYaryQ+eScYF7uiBLvncEmqva9qKNca69Pe4l8=;
        b=Xc0mAi9M7OOJ1D+QjwjD6pnDoHqBQK0299xq6Umf436oZe+bvTEQYAJ0IgK8W7vqgN
         IsPtSdNuvH3Xx2ehVwLola7q7y3wF8pBNnhAMu8Ua/0hgBT8SxIpC1tTHsoyMmB3F1mV
         V45kFYDsmr9Q9wC6KCaKCUhfgTGLCiEXAmZEwRx8Sidp7jVEcvFdlXohWnu03Kg6RGXP
         BcyP2Hsk2saEbASBDep9R9LUwEu+cNr0OMliKKMcjdaAZYF+6qA8NVYHdu2oywrN2jh3
         2k6JnB8G3wkD9qAB09ymXq07ZvVAe4CGL4rbk6za+bEh79rCNzJROzN6USmw+Z/j2Gsh
         7WqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135119; x=1789739919;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qy+0mFYaryQ+eScYF7uiBLvncEmqva9qKNca69Pe4l8=;
        b=lfohb4eyJdvQ4QTqh3oD8goNyNFmbwyVZz5B4Q1MxQ2NOvEaNeQpMizKTOPjwdAkZt
         fmTZHubJnFR2D+6BeHrIt+G6ydyAg/WyHn7tA7q9KdAgQPzjcLAlRFgqOO2KkWp/j9dj
         5oxEYCMkfQQiIk9iKGQaNTeB4M77cZTMRNnbhZfTZoPrSsSu3LFJXAnrGjaimZ867Sel
         gs0GB3KUYEfugaqbYUL5Q7KNlgyAtDs56qmblbAVV/auWupl+NN++5XMv5nhR6eDiTBY
         c11eX2wKBlxl1/RNufPXrR+GY/mLZP4DIHMC9rNwtEjmAPel1jT7CPWnus032SRy5Eqc
         Xh8g==
X-Forwarded-Encrypted: i=1; AKwUvBynQSoFMojfozUY98QP0+qZ+oOMDPsec+m/qCIaCQtEBbpYUqZxhve9UIHCWGmHA/t7zGJFsnymMIU=@vger.kernel.org
X-Gm-Message-State: AFuF++m8kFqwu4xdkWUY7Bjv1gRq5LbXqCqzHv/UrlHz2ZCnO1+hzFyh
	AWhNtIEdnHo22oeHaVZLy2JDVJ9969iALedl5TpY0EnDgaRZV4ImIrFPcNV7K9W/j9o7YnZr3AC
	kFAxSIn/JGXxKgSCH0+2L8JuV8sSTUqE=
X-Gm-Gg: AYBFou0PUVsC/3angm0TJ08tRVVRxMLCsVtqSkHfffaUeu+Fpi0OzQ6CRqMHlSGTN0K
	Pjkcq/Y2bcEj4F3dVXq8tzCJr4Il8XOyc6Xt7lSCzuAaiixNuLWzO1CcbOw18C2V56GIP+wjKsk
	53k8EDrIHRg01SxK27Q/Ir1e0/muKJUGKp5BDT0quUAXS55H05EGsdjSMlCeW2sLky3BF9CDeI8
	Imk6f0qjECKS+t3YQDpHWS/DK8BHaFC+Y70Pkm91Ghw5eOhgvO+5wvHvt6x2j1+4PvmJ8BXcDdL
	4Y3Ccqt9aagNhOY5REJOPwGf6IsJJCkiJ2JwTvx5ReIcmkAvmu5iQ6K7syQ1jgS9J/3fOEK3rEs
	c++G1+1+6IYiZFvXrypkG0M8scLVxw7tdBcgwenxoLpPn6PjfNguOIR8=
X-Received: by 2002:a2e:a54d:0:b0:3a3:74b9:8a77 with SMTP id
 38308e7fff4ca-3a5a51d1316mr5420091fa.16.1789135118445; Fri, 11 Sep 2026
 06:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909125842.528340-1-festevam@gmail.com> <20260909125842.528340-3-festevam@gmail.com>
 <20260909164339.7252469b.michal.pecio@gmail.com>
In-Reply-To: <20260909164339.7252469b.michal.pecio@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 11 Sep 2026 10:58:27 -0300
X-Gm-Features: AcwNN1Xun7EaOLsaQG84F5_Fc8OiEmhbwXmVCCU5E7N0Id-pN0oZLYQbqB7PQyA
Message-ID: <CAOMZO5DfPToSOqi4CW8ETAVkU0RXTr=eyyOqLwkFC8CjhKkoeA@mail.gmail.com>
Subject: Re: [PATCH 3/3] usb: xhci-pci: Put PWRON_POLARITY on a defined state
To: Michal Pecio <michal.pecio@gmail.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	parth.pancholi@toradex.com, francesco.dolcini@toradex.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Wed, Sep 9, 2026 at 11:43=E2=80=AFAM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Wed,  9 Sep 2026 09:58:42 -0300, Fabio Estevam wrote:
> > Currently, TUSB73X0_PWRON_POLARITY is set when the
> > "ti,pwron-active-high" is present.
> >
> > However, when "ti,pwron-active-high" is absent, its status could have
> > been set previously by a bootloader or by a previous running kernel.
>
> or by EEPROM.
>
> Do they bother to put the chip in a wrong, non-default state at boot?

I was working on a hardware bring-up with the TUSB7320, and I never
saw it happen.

Since this is more theoretical, let's discard patches 2 and 3 for now.

I'll resend only the first patch of this series.
