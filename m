Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEE8495537
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 19:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785870057; cv=pass; b=TLI+/qT4af2cLRUUZF7QxnEpV0QEjFp6jjVkOtm6kskVYLyYal8i/QrRJJwFjw6tfNt5JP2WZNE54d8qC6uG93X+b9b6M8ImLH37Y+XwOJ1NbMJI7ZyStuVIyftGmFU6vM4NP4Uf6FVN3UI5DUEP8MSTrIBDOyVNbrnpvV5GS80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785870057; c=relaxed/simple;
	bh=/XFOYEBNoZSJfESMossA4x0IZOYiXot0R5f6spMo1Q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ie9Mixm8mRuK3h7LNfXq7dhkVD2Qd+DKGdNwGwfRvqj2GWit6cWX+Fe+fSERUNtZpwoz8IG2kwBZlJVPN3bFZRqmBDIvy76Mhwa6c2qD60I46QloLNvmCzzvL2w4shi/quyyFRuJodRBD9lCv9GK8RfYcozuJ+xLwD7vfV/W+vI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NefSuPrw; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NefSuPrw"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38f620399a0so134733a91.2
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 12:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785870049; cv=none;
        d=google.com; s=arc-20260327;
        b=NErK4aSjmrud1Q7ecbCiDxxs4qCeNAgGdjsD3zlwtr+L2tnMQIcRl5Q4URTXODvbbg
         bImAbH9tx55S6fokdT46zP4p8rlYrwkUhDoMTwfr165JnEjeKi9sM6UssoETV8wwFi2r
         +USPYpFlPV7PAYbfr1C+wZxoWAGJOeEsYvTZMmpE1/oeFEBP7QqpJkIdZ66l+mLq/oCB
         rWlhecLGUrviyrRSSOXas0CTliaR5sHMiGB6TH82Fn5MCAXN+0qlZwMyLObTfqWNyWtj
         Iqq+BTvY3fBCb6VC7l6i3eLxIzITvPL+pqBROGxXFGLOCF4PRjlViS3nvRP7SCtk4SU5
         oSGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/YyqCD8BW4XPHRakH4x68/qGqs02sJDv65IoJPvWYwQ=;
        fh=KV1jLjHzN6d7UBCTFvHrrScArg6/Td0YZV8lWoB3Fq0=;
        b=bBCzG5xJiKt0ZSXRR19ZvN3YA0Z+pOVC1lQwP3EpXnjz5qfFmHBMcWknXaw5seAMSD
         fjdDdyaycJB4p4pZBrJ7FDNsNyaBPdQVZK6QrSY+JO8BYffwUFTQoaqrWF2wyYZKbB2T
         C194y62E7i1WQN2NX4GJRY3/TQYpG2F3kBuaDqvaN41oW1RbT3Mc8DdztZphgUTxTxm3
         g8jOGuaN9OkBN02vVSrXud4bHfMMmhWFY8kkGbzkjwE0ztIRoedqaVlOvwVOxlEqGY5u
         uBvBB18eI1MmcByN7z0lqTD/ULs1JcB5ENA8OuBDd6mhITNxqnyFUNLWN7rpaFlGjczL
         0odw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785870049; x=1786474849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/YyqCD8BW4XPHRakH4x68/qGqs02sJDv65IoJPvWYwQ=;
        b=NefSuPrwRWmDTb7it8chd9kXRExY/fFvKdKTUFFk4XNM0+J7Xlu6IPpNVv5F3FUUn5
         qmTkE+a9F8774on+c/hl3CuWrVB/yMwiKPGxZDEyX36gdhxXRbri/6S9laQCPM0iD7v8
         yvrhKWMxW2464Ham/Yn95qsKj/IhH/tD7q21PbtMzmctLeVecGkZKsYa/j6FQfPXPyBC
         2HVrbnazF6uOjkftG0JgrXwtg+MgHAhw0v5MN4xo0wM7+Gj+uiu4E4dpsmm+kOCfv7f7
         KidleKwH98refvhS+hfOhVu+tLBSnsVxzG2P+5twSkEsz3RAcImHIcUuUokh9UOc/ajI
         Eh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785870049; x=1786474849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/YyqCD8BW4XPHRakH4x68/qGqs02sJDv65IoJPvWYwQ=;
        b=tIKe9z07dRK7CzeZ3LxD+E1M6Sf+vcNP83UDzM3r5pzdcOdcPd9gws5HcsGc8H/Hhu
         tawHvdB1FlMRzlkB5obw2a4xnC9UYSXbyqzKAeXHBYbSk3QeJ4u9wtBkN8EsKgBmaIIj
         gUQt6XaFZZy6tBwjLFJzSWmP9PWev9bh/em5NDwzfMcVcAKrfbQyw3+YkmRnWqCiv08j
         CP0zKxNDR7tVm+EKaxAlc+PubnS4o7/i7p6mj+RDEKPOQ2EISPaof3t2EG7Mp2bRNtjK
         /jho/ioX2fzRQdxchJGVyz6P04NAuBLDN+vchzZJi9L9QyCDAAtnVQfn54dIxMAPVZ7G
         unzA==
X-Forwarded-Encrypted: i=1; AHgh+Rqa6TqlFRzRCw9MUETwC6cwA+BcAiY7hMBhIv6EVlxTvo0z59YHuXVSR+ToGhAMOU5nAnB/0Mz6yjM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTiqaYyM1QV7Q3cr5JSx48dINJ/Ptn1HvbNThmnlqJdaGznfTS
	3WdjIoFoMAZ2cr9jNaSymvy/jQm8cCmzh4vm/OejdkeEk1CJ50QJBnSibWrNguGHoZ+xO4Mr1yA
	bP6hg5i1lr5J3QmRFBUX7YWzXt21jQ4c=
X-Gm-Gg: AR+sD11C/a26vr4KS093w2YgNjU/FpNkU9ctSiHLqnxb0/Gju55JI7ljXlR4d6HpIh/
	2I6fvD0kf+8JkB1IvmIm+6WtX1uUtbmiJJy6kXSlUcAEECObFsoA3vwN6bTnsT79w2GBmSmc4Q0
	0biyoscy4w3qliRHCjQzmrbhbL6+yzXj1IiBxWCRx/CWDwvsq1pysJWgHIqzOwD9H1JAUryj5Gg
	6UHjHP6JRNrdaEFhbcIC7WppAR/39jsdt8HYOal7lZwxvIGWVRD4/Z5rYFub3UrMyviTbgw/6Xa
	p0JSzJinaRX85Qr5+CY930ByuQR0C91wWe3lk1biNmdfXMOkRh3qP0ckJLi64qkGY4XYs+3lVZQ
	OPxqT8QQrtSshGnM9fkZHatKUt00=
X-Received: by 2002:a17:90b:5112:b0:38e:542:6485 with SMTP id
 98e67ed59e1d1-3903c5919c4mr924860a91.12.1785870049156; Tue, 04 Aug 2026
 12:00:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABWMpWQiSEKMkROgKZJ6nV8GXYgr7E=-SmsatQie4eK8b3F9Xw@mail.gmail.com>
 <CABWMpWR7Law_vHdeAMsOcY28VBcvX2jYSqq2SpksJSiLFcXhuw@mail.gmail.com> <anIhyHL4Kl-DX2G_@eggarch>
In-Reply-To: <anIhyHL4Kl-DX2G_@eggarch>
From: Jamie Stephens <jamie.stephens@gmail.com>
Date: Tue, 4 Aug 2026 15:00:37 -0400
X-Gm-Features: AUfX_mzKEFWesy9_PyKm-5nbf0o3VldJqhUPwpqyxb0HY0FLUd51o98kcLYGN30
Message-ID: <CABWMpWT8fGTVABdi6KF42UTmarneeBQgYQfCVj=09jyEtHS=rQ@mail.gmail.com>
Subject: Re: [REGRESSION] CyberPower LE1000DG (0764:0501) USB HID regression
 on x86
To: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, regressions@lists.linux.dev, 
	gregkh@linuxfoundation.org, stern@rowland.harvard.edu, 
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, will set aside some time in the next day or so  to run the
patches and git bisection

On Tue, Aug 4, 2026 at 2:56=E2=80=AFPM Lovekesh Solanki
<lovekeshsolanki00@gmail.com> wrote:
>
> Thanks for the report,
>
> On Thu, Jul 30, 2026 at 03:28:02PM -0400, Jamie Stephens wrote:
> > sudo lsusb -v -d 0764:0501
> >
> > reports:
> >
> > wDescriptorLength     504
> >
> > Warning: can't get report descriptor, LIBUSB_ERROR_PIPE
> >
> > cannot read device status, Resource temporarily unavailable (11)
> >
> > As a result, usbhid-ups is unable to reliably communicate with the
> > device and NUT cannot reliably monitor UPS status.
> The lsusb failure and NUT seem to be seperate, lsusb failure could
> simply be device property.
>
> Few possibilities I can think of worth testing:
> 1) It may be related to LPM, the device may be advertising this but may
> not be handling it properly.
> 2) Commit 8020c41b39f5 (usb: core: allow ACPI-managed hard-wired ports to=
 power off)
> lets acpi managed ports be powered off even if hub does not advertise
> power switching. The UPS may be sitting on such port and its power could
> be cycled out and leave it in a stale state.
>
> I'm attaching two patches to see if they have any effect, please apply
> and test them seperatly and let us know the results.
> And, as per Thorsten's advice above, run git bisection regardless.
>
> Regards,
> Lovekesh
