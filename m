Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDD239A4C5
	for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 20:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783715383; cv=pass; b=YgUBvPpnD/X5481zeJR2vgv/9gpCdsk3QymU8Ni2pMj0AVq4l55X8sPddLQda19GDKmWVYLDS+hQPoeaC3gPRZuPFXF12bdVk49edvZAFWzIbWMaZF0L6HE8cDAY7ZFmOwNKIp3T8PSLeFnFdRKM2SD122qkwES9g0kK1a7bhPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783715383; c=relaxed/simple;
	bh=62Bm9YjofJTGddqOjbliCRYAY2n5cp2ws5Ezo0lKCwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c4Ysi03s6kcT9FOR+dCG0z/GENZYRaD88Gsr0DzXjPHQiL8GI6bOSBSDhWOBoEbKw8jFqiEDpd+4XvkDr8i7pUBRRautX9Fg4Rj/CmZdK+ZeZRBaTSBlBugXZdPcwrpkxDEjpXXNvewY8Kg5669w517PSJ02r2kEDLD/y7WmjNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMtpdlzL; arc=pass smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMtpdlzL"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-736eec08c43so1127443137.1
        for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 13:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783715381; cv=none;
        d=google.com; s=arc-20260327;
        b=oPKK6UueqxVOiz1voNq2y+g3P3ZrYCO5OIVzypHThgrJG2oUThYw35VXC/545UHi1L
         NIhCkOc3xCNHLns7iG62zzzSQ/jFBUgFf+Z4aZ1yDNVDcPgfatSyutRjAzJg+trSIg/p
         bsPdh9PQl4wLAPfFqEcijdmy27ru6DHkm/hCn5a96x0gNGIDgAMQWLoM/Pb8zjKxsVXh
         /sAvA8oeyjqgvy8eP90qdKw89H+29gkFpt4Q5JdaBvSU8EvTRk9ycuwuSiTzSZvYemR3
         5vS+W7ccTvKRFvdX2+o/W3qfmpPphRpBBrikFAvGGKEkXNN0IKiNwExYmmpABF1VxMwg
         ungg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=62Bm9YjofJTGddqOjbliCRYAY2n5cp2ws5Ezo0lKCwA=;
        fh=t/bwV4yiK4Icmsv1/wjyZDqfbkhaVr6/nma6ev4v7dU=;
        b=Q0Ej4Z0nBQjqddjbiYNQc4P91Xi/VLB9tSx+itiqEQlilGn3vwTxGHw7ucGCy76ttr
         Vutt/Y+Le1/9vXvamaXCOhHbikbtJCWo/VkRnJ92EI/Vya+BGrDLT7ykOKrJyMllnyDf
         VrFuYvG9qrnvf2//cY/gs2cWiYuv6PsChUXIcgPm8dRqPFsliyWDBTmiJrwo/oHm5P60
         f2n2uHEGLU608mAd90pTEsunawTOzuKaA8V/R+e7uSfGNYM0juITto49tXTP50akKF36
         2ZCCrziFnXXJHgHSDJy49pAueJo7G3WZA/6zLoE1vsEl/HycdkGWEJlWyg1PNb0RqDfk
         480w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783715381; x=1784320181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=62Bm9YjofJTGddqOjbliCRYAY2n5cp2ws5Ezo0lKCwA=;
        b=lMtpdlzL+hFTrijUxadQ6r1f0Oo9ujt4dKAYS7/GgVuLobgFRtm3f8SjV4SPLzYtdM
         FhBbdaWTS5xjquXewfChJbKmhY9oRr1+VKb/w+WCLu5bYJhmOoaAT6TgdbJUzCzmeHpx
         ka0lWW4FjHPineSO8J26sdgaojAAPQCrGCNRrDp28kVMwBPUWZ7KNNQQ3RPkYzwOsgqA
         AB0jEkGzHulGIpo1YD0dU7Xx/bx2VNigpY688kCdSvZa3kLnSI1p4DqcJYVBNTWcZlrP
         j6z5SZ3iECJPGPrZoBhb0ESbLUNU2FXwBsLXqGIhdTfa/up3y9Pxje7aFVzdYxuTXi2m
         DJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783715381; x=1784320181;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62Bm9YjofJTGddqOjbliCRYAY2n5cp2ws5Ezo0lKCwA=;
        b=tVLmBaqn5A9KiUEbW9trTveudfFXm+Lm3APjwFxScJawFMjpJWx4Uc215xhawEmrwK
         I3jEVoqVsiOPbPm/hmRM2X5Tp9uii8zF0ltsyUdn6mGJRPBtyVx2dpb+3VWnKIA33zbl
         FDKFHV+Tyq+SudMqoGgkc2SuBlDT6FcGKd8AlYh0i2hEleKdAF6VZpof9yEo9jC9fgpv
         kqfKizHkWdD3FObhtyvGLpZrj8ygepmXsE/tmNbugd5gkHVx27Aw/T40OnzuAjJu59xV
         hINi3PKwD//QbY+GZSg8/Jk3ACWvlJpZtgzIKGa0zs6fLfKK+o9d6PCCVLzPYnMhqNqn
         AG6w==
X-Gm-Message-State: AOJu0YwGKccB/4HHkBil2vOhGjYY5g5Zhov4Rh8daN/wo+et+p4k+bJa
	WV8+Q78hs58NXzkIJVm9aLJtjeC4vD1lTdbjPYsbopb6SnB3Ww/v0s66/+P/S8Ekv363B9RnU4U
	/1xe/KRNXZSXKCEDa835QyLjM6NvxENM=
X-Gm-Gg: AfdE7cnAGKIJaZGwqOJUB7TJyWc8heevvP7yxkCCmJ5v3YfIcV3UyHREcO+dZpgTxOk
	82rXBgtdOreo1WtDDdlzGQlGCgQPdr83E0eOV5dnifCvVGoQWdyBepwrNIJkAA/HcHNvgjD9+V/
	e13MvttltrAYZvTmePorITdxtZfmhs2tD9OLxL5R6kC692Me1hhNRSp4+OnUHer1GYl6Z0R5AsZ
	fSiv+SSznWtqgvVXn9nQOl66zjPfV/XzuIYyCuK6ftpS4qmPcW0aSkm6OWfdssTO2AQeFIl7w==
X-Received: by 2002:a05:6102:1610:b0:738:394e:a595 with SMTP id
 ada2fe7eead31-745368d423cmr152941137.11.1783715380745; Fri, 10 Jul 2026
 13:29:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624023532.63009-1-andrem.33333@gmail.com> <2026071038-magma-joystick-dfef@gregkh>
In-Reply-To: <2026071038-magma-joystick-dfef@gregkh>
From: Andre Moreira <andrem.33333@gmail.com>
Date: Fri, 10 Jul 2026 17:29:27 -0300
X-Gm-Features: AUfX_myYY24jcfbLPzNP8s1-1W1KImigLh7pvPo3xGrLPy-zpP95DaNKE8DHK4Q
Message-ID: <CACO0qFKqLxAi-7qo_hSxk01JJjVoLS73AMO0Eb8yHJ_WG4RaYA@mail.gmail.com>
Subject: Re: [PATCH] usb: core: devio: validate device and interface before
 buffer allocation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Greg! Glad to help.

Em sex., 10 de jul. de 2026 =C3=A0s 10:14, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> escreveu:
>
> On Tue, Jun 23, 2026 at 11:35:31PM -0300, Andr=C3=A9 Moreira wrote:
> > The proc_ioctl() function currently allocates a buffer using kmalloc()
> > before checking the USB device state and resolving the interface number=
.
> > If either validation fails, the function must free the buffer and retur=
n
> > an error.
> >
> > Move these checks to the top of the function to fail early. This avoids
> > unnecessary memory allocation and deallocation on error paths, removes
> > the nested 'else' structure, and eliminates redundant kfree() calls,
> > making the code cleaner and easier to maintain.
>
> Nice find and cleanup, thanks!
>
> greg k-h
