Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553D549362B
	for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 07:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787383548; cv=none; b=p4TCI5A+ArkkC+0nyY+/KWiIwKgX5dWFWhbtgSGcgSswXhc74PCjIOyy01TQdRkpFgpjELIJk0UZFLb4+jUZ+KIHN6XVjU0AzR1m2JzsnQvBA8p+fmzUQ5xUtlM45nHos4Y5whqJDkdV9uY4twlOjz/FaPPJrC2cEnFAhKZ1CvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787383548; c=relaxed/simple;
	bh=hyxZhfDeVcalwy27wsRwyBVA5Q7pX9rRDd5SmhuLmb0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KArSUeb9p3c6/wjTfRl0zwAajYssKsljnUrJcUGNfSvZnHt/bZ1fY92R7omll2P+TPqKfSo5tzj7eYpyQyxbKf+ZvCYlI8eDb1cHqKosY/tS467Bfgc5Ec6ezVWapYcLFszlROCEUuNgSf51hog2v6wZGfR+IG5H2aOrWkUOZ+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IV4FxCom; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IV4FxCom"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a17211b9ecso4898587a12.2
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 00:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787383545; x=1787988345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oIRcL9S/iutKspX/CdL15orPpbTC4tSNioHS0WckQzA=;
        b=IV4FxComoe6quoAOMZPb16rtDj734oMmj4lV42i6LTTt1VVmL7OKtZeuFDJGZN0yVC
         OPbXxf2oxAWTXsrMEqQ2VtM1Nnwmpxji0dmYbd9ZO0ukxL4XrTWXYIM0IoSYZjB9z6W3
         NHUxwUGdJ/h8MWJ0OBwsoSekb5swIsGURusxEjujpViGt0DtvqPZ8uCrZKhutvmK5etF
         1opUCSurbAbeoGSvjEeDjOCgB7seylIT+PkmljnztjLbdmIiP4fIiYSQ2s/9D8b3ClLT
         WJSsGX1B9SUZz1W4Pex1A3F9o4RSjY42Bbt32jwAuOOwfodWuNGLk3aGJqcc3OO5hKC+
         U4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787383545; x=1787988345;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oIRcL9S/iutKspX/CdL15orPpbTC4tSNioHS0WckQzA=;
        b=Kd/pKIZBy6Lc4J54xm9NEhbpDhftIBIQ8s2Xhq1UJ4qBDH/wklMRZWxJmMcB80Fkmi
         GmXVNKtDSWsegcCDcEliu1/8lvTySFn9UteQH/TSPhCr5zg8gqpC2oW4K3GISJ5WDfAN
         Jo7ZgB1Pg3BNBA08WINiDpWY26kWOtt/t5gV2OWuT6l2KVGs3LPsDl9/PIJbcbEnjk/4
         ogs8q0nWdHtFguqaYfkI7uoXxsopgwnXkhtnddG1YAwBYS9ifrODZ808mXTr5lUBBPPC
         spMHkEYbieuxF05EXufYkNY+ni9HrJo2lxfFQ3trOS5SHcizdVKQea4cqzvEVkaLeVm4
         RUbg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2lkSsa6oL+vsqy5Fa/0IYiR18Z+q7zoipwBPtswLSRCtkK5GXxy1euTVZZFS/Xkkx66KqYowDN18=@vger.kernel.org
X-Gm-Message-State: AFuF++kgVUebLFN6A/R0WBzmm1WfE4Nnn5PLnGYVBttoIzyvN0uAyPQF
	p7v+ujvm+rXmvrh0/K7oWWwlG4dAFaaht3f4yGyaJcscdML7DoK0TqlBTJhQ4g==
X-Gm-Gg: AR+sD10flRPpEn1kPze2fxN5PIO/7S3LT3A80oT7cLA3hPZxSjV5p5LFo6CvUs27geR
	tY9GuXhJBPBtLcIeUUDwghqnE7g/1w88PAEhco+zlykyLrQ9sa9C41V3kzmPPaSuLQShn54qRVR
	Gzook1VNOgVQij6siuwT3m1LYDMlbzU3c83cP5hHeXwDPHHVubvvxQQqIj41TV3Nk6U8Z7I84Aj
	+GNJWpa7+MDKRiGO8sGz8TWOJuQ8CYOds8DQpHP9uZb+ggu9uVvQCrv/quiKmbovs+Z08iDVW+n
	1BPMXRJzA+KL8N1tRK261yjfNuq4EfajM+o8cuB4ubjOwZXPqEX1Y3XrdFwc4M8/MIoDAOoBstO
	iaXy+4Jeepq25ucPfknLhuYbjVkF6ViyqtmWGPVox8isWg6Kw3lTBYYVMXlgNOfg7ep01UfspAK
	+n33W9vhTYzGdM87Tq6KP2DAecyF2z7qSjAoBi/MG6nuM1xRnKmEllP7QSpxSmqv1zenQ=
X-Received: by 2002:a17:907:9495:b0:c1c:3b06:ed1b with SMTP id a640c23a62f3a-c246a6736a2mr1136365966b.22.1787383545332;
        Sat, 22 Aug 2026 00:25:45 -0700 (PDT)
Received: from foxbook (bfg7.neoplus.adsl.tpnet.pl. [83.28.44.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b696sm215784866b.7.2026.08.22.00.25.44
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 22 Aug 2026 00:25:44 -0700 (PDT)
Date: Sat, 22 Aug 2026 09:25:41 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: =?UTF-8?B?0JTQvNC40YLRgNC40Lk=?= <senior.joker2009@yandex.ru>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [BUG] xhci: repeated URB cancel on UVC status interrupt EP
 (0x83) loops for ~15s, stalls camera - Intel Cannon Point-LP [8086:9ded]
Message-ID: <20260822092541.1bcc6dae.michal.pecio@gmail.com>
In-Reply-To: <cd7e86de-f7e6-4cff-b171-24891ef30bd3@yandex.ru>
References: <1551785954451@mail.yandex.ru>
	<20260815215259.014cc324.michal.pecio@gmail.com>
	<fa17985f-fe64-4f23-9b71-9a244db2f64c@yandex.ru>
	<20260818000909.31af0ae3.michal.pecio@gmail.com>
	<358afe43-5f0f-41f6-89cc-129b20ef7641@yandex.ru>
	<20260818232945.2c67b15b.michal.pecio@gmail.com>
	<f4eb5fa3-3c91-4c7c-b709-b493a0563e66@linux.intel.com>
	<cd7e86de-f7e6-4cff-b171-24891ef30bd3@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 22 Aug 2026 02:37:28 +0300, =D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=B8=D0=
=B9 wrote:
> At 640x480 YUYV and a requested 30 fps, with
> exposure_dynamic_framerate=3D1, a normal 120-frame run timed out after
> 45.034 seconds with rc=3D124.
>=20
> With exposure_dynamic_framerate=3D0, the camera is no longer completely
> stuck, but the video is still not usable as a smooth stream:

Not sure what this is, possibly V4L2_CID_EXPOSURE_AUTO_PRIORITY, which
maps to UVC_CT_AE_PRIORITY_CONTROL. From UVC 1.1 spec:

The Auto-Exposure Priority Control is used to specify constraints on
the Exposure Time Control when the Auto-Exposure Mode Control is set to
Auto Mode or Shutter Priority Mode. A value of zero indicates that the
frame rate must remain constant. A value of 1 indicates that the frame
rate may be dynamically varied by the device. The default value is zero
(0).

I have no idea what this means and how the camera is expected to keep
constant framerate if exposure gets longer than frame period, or why
wouldn't it keep constant framerate when exposure time is shorter.

Not sure why this seems to affect isoc endpoint behavior. Maybe it was
just random run-to-run variation? See below:

> * One 120-frame run completed in 15.109 seconds, giving an effective
>  =C2=A0 7.94 delivered fps and 304 skipped sequence numbers.
> * Five consecutive restart runs all completed with rc=3D0, but their
>  =C2=A0 effective delivered rates ranged from 3.71 to 21.08 fps.
=20
> With uvcvideo trace=3D0x400, both values of
> exposure_dynamic_framerate selected the same streaming configuration:
>=20
> Device requested 3072 B/frame bandwidth
> Selecting alternate setting 7 (3072 B/frame bandwidth)
> Allocated 5 URB buffers of 32x3072 bytes each

640x480 YUYV at 30fps is 2.3KB per ESIT. For a smaller altsetting,
you need lower resolution or framerate, or compression like MJPEG.

Regards,
Michal
