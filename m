Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645E2249EB
	for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 08:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787388414; cv=none; b=rRkhq7y8Njn47hbNGIBplcW7TNL+CX58JHGRAinF4bzVlXRWmBhJeqAWCW5dGzdMVaVXLw9z52LSqIQt3yTRNLuEuKw58x/XGKfvn5Xsil6JPLi8g1EMT2dsRMfHsCbHBwWZaRhRd7AxZec3vWlOeVRgiQn5MXb4jiUH1KG5NwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787388414; c=relaxed/simple;
	bh=oucLSyqjyBLTHDyUKRCeLeEVN5FplXzD+oFRRHjyuKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LR6M3D89MjZN3Fx0RKNp4v0NlJK5+s44nLcMItWRILXRoJs4+gY5XwWnOdNwhkYJ6P4hlaUzKrys0Z7GrKmf4tL9rmbpv3rd/ItE2OaE21I+DReajder6xazwC7zvb7bHtp5gBV6r/LSQmBDky0dCkOYJ2aNHRZcxfqNzS4DaAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BuhwHW9u; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuhwHW9u"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15e2dab83eso345482366b.1
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 01:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787388411; x=1787993211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oucLSyqjyBLTHDyUKRCeLeEVN5FplXzD+oFRRHjyuKQ=;
        b=BuhwHW9ush+NedJOKHyTcZSOq1CXq2hz+TbA5Bb4aRrfnzl9oQm7JlbphULqbJhQFu
         9Y1PW+D5SjpGqTEnwnKvZzfqWK/M7tjzPLmO4tTbLFWB6IWk+O7rIYbT6lxQBV0FaPT2
         yhQjqebUjuYTqtB+RONvYh0s/ktL9Qv+CoyNtPeHFKiQGRFWRDyZzyzI9FAVU5f4s667
         +nHpi7t/Cx8RLU1KIJgF14lFNFPphAtwxAWxzg9i7LIMlYebsDR2LCDWxjeXnBfrHrqy
         rLR+SkhhsCdopA6RdPs+DvFp+y9a2voWVp3qMJy6AFNI2h+E4PVBD5LEM0fK+VFfhlRx
         mPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787388411; x=1787993211;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oucLSyqjyBLTHDyUKRCeLeEVN5FplXzD+oFRRHjyuKQ=;
        b=BbDd92qUCHwIzmQ89yUCBocLA6mwERWV+yzVHbCukrezE5sEFzkHIZv/ENDsV6NVW/
         4beThujxoMrdRQvgLuFPwYZjflDLIeLc+xJVlrV/8sHlUYDFhAnOKWtB6Lln4B79k9nd
         77FyDYG4YJ7cR4kSEjsGDBk68Tyb/Os3elHi03Qyu8R6EgQCksgu2EWL+bq8emI32aNu
         iXCTjyHsokjLJ7FQ/cehsTDT02elLN4ulWmW/KIMFMpKTQjOkZsHf6g5odD0+4uSzBct
         Womdk0rcmfXfoIdRSrDiQubAgzOmcT6tS7K11uwJ6UXp+QjuCtlQd3TOHAJye5Vouxt+
         OaGw==
X-Forwarded-Encrypted: i=1; AHgh+RqGJdO2RJWFWptacU4AIpYd26/6VlXQdBZ1SuC1fzgP3D0FP5LZjbsMJDtRUb8LGvQgTyP0u13gptg=@vger.kernel.org
X-Gm-Message-State: AFuF++nXsjBMXVarMsZBac5/yEQjMpbxdzCcHFVisC+Y5GBVEHfU9/VU
	m0QgljeXj9qf2kHrfM/P52ltcHuFyPk8DCuWg+1xzB+A8Zj5o2uVGuwX7916tw==
X-Gm-Gg: AR+sD128eMlxL8HWfEln1BRK35ypgQFEZD3aluzJcR+tn9fsXJtsBSKw2euH3FwlvyI
	cAo+2x3sMPpcW9Wx3nGuyO6y+R+9vrk6XccDYMAgvPLb2BFcgfo3jAXuHRcintlAqjGGejFLmT8
	05Tv0QhuCaC6auYZZ1rJ0kS4L7UreAzzrA/q3NTrdQBm/3nUi38nWvqqd1+xXUsLg9K3a2gus6V
	GaPxiQWvxWVJO3y6ilPnX4rj3L/iUegHPEAm1+thV50IGYgEKL0D7CsrOntGqcUpnA0DVH7ixT6
	ZiME7REkwwrXyo/ZX5U9iT8Ko1c0RT246lTFKqWU06MmK0xGT2VHp2bic3DdaUm6+8SjbBbby5z
	JNJmPoVOMJF0MzHehoYVmNPlVPy2NSPhEAmHmyFVo48Q9YpUphbQGNnT3y2DVUg6IScOpv9onGj
	aCJYvJ2JiTwfQWRzROv/Ghf0VYfEN6N+jMvl5VKDtiNRk1B7WZIC87MsI9T/Zss08JB0Y=
X-Received: by 2002:a17:906:9f8b:b0:c1f:c061:569a with SMTP id a640c23a62f3a-c246a4c6d63mr1121774866b.7.1787388411067;
        Sat, 22 Aug 2026 01:46:51 -0700 (PDT)
Received: from foxbook (bfg7.neoplus.adsl.tpnet.pl. [83.28.44.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606a905sm242270966b.13.2026.08.22.01.46.50
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 22 Aug 2026 01:46:50 -0700 (PDT)
Date: Sat, 22 Aug 2026 10:46:47 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: =?UTF-8?B?0JTQvNC40YLRgNC40Lk=?= <senior.joker2009@yandex.ru>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [BUG] xhci: repeated URB cancel on UVC status interrupt EP
 (0x83) loops for ~15s, stalls camera - Intel Cannon Point-LP [8086:9ded]
Message-ID: <20260822104435.1061f367.michal.pecio@gmail.com>
In-Reply-To: <0ea518e1-8f64-4b35-8e0f-fc8ec0463491@yandex.ru>
References: <1551785954451@mail.yandex.ru>
	<20260815215259.014cc324.michal.pecio@gmail.com>
	<fa17985f-fe64-4f23-9b71-9a244db2f64c@yandex.ru>
	<20260818000909.31af0ae3.michal.pecio@gmail.com>
	<358afe43-5f0f-41f6-89cc-129b20ef7641@yandex.ru>
	<20260818232945.2c67b15b.michal.pecio@gmail.com>
	<f4eb5fa3-3c91-4c7c-b709-b493a0563e66@linux.intel.com>
	<cd7e86de-f7e6-4cff-b171-24891ef30bd3@yandex.ru>
	<20260822092541.1bcc6dae.michal.pecio@gmail.com>
	<0ea518e1-8f64-4b35-8e0f-fc8ec0463491@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 22 Aug 2026 10:41:27 +0300, =D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=B8=D0=
=B9 wrote:
> The Windows comparison makes the control interesting, but does not
> establish the Linux xHCI mechanism: under the same bright lighting,
> Windows delivered 6.95 fps with Low Light Compensation enabled and
> 29.88 fps with it disabled, followed by 40 successful stream restarts.

I suppose this setting just affects exposure time. Since frame period
can't be shorter than exposure, frame rate sometimes slows down.

At any rate, Windows appears to have no problem with data loss.

> I repeated the 320x240 YUYV, 30 fps test with
> exposure_dynamic_framerate=3D0 and successfully captured the uvcvideo
> trace=3D0x400 output this time.
>=20
> The run completed with rc=3D0 and delivered 300 buffers in 31.065
> seconds, corresponding to an effective delivered rate of 9.66 fps.
> There were 620 reported sequence gaps, so only 32.61% of the observed
> sequence positions were delivered.
>=20
> Despite the lower resolution, the camera selected exactly the same USB
> streaming configuration as at 640x480:
>=20
> Device requested 3072 B/frame bandwidth
> Selecting alternate setting 7 (3072 B/frame bandwidth)
> Allocated 5 URB buffers of 32x3072 bytes each

Try

rmmod uvcvideo
modprobe uvcvideo trace=3D0x400 quirks=3D0x80

and then experiment with various video modes.

Regards,
Michal
