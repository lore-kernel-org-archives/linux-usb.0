Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9105C390229
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 15:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165943; cv=pass; b=bDME+B9/fJIU/+makz6H6eYyray2y6lPskq8AI3jxIxDPOTCzHqVMpRv0EjyYhI8pxbvULAjvqHQhE2Mjfk6ZGRXoTR5pm209qVBoifwh6rASfaCdMZsZTTdnje0/RH2BaLvEPPkzYQFLO6RKBEXanrnEgkyK+O1c3YDFkNVk+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165943; c=relaxed/simple;
	bh=uF1fNPxVyFqjEpgw53mbvgBu6WUcDvDr1PA4TgWZFlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lL0kLz+y/5IKN5tPmp15IgOQPndniqs58BftX3XjyJDH1CDFM9QLcyxXWgKWxcak+W7SzjnRY6MS85pAuHJEZDC6qnkpdg+JUui8zoP7BqlGu7Opnn0xMl+OFRW9vizXmUwCo8MpZH/OewnHaobyEZKGQ9e5oede852Ub4iv6VI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnMlg+ZC; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnMlg+ZC"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15dd4b9132so420091866b.1
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 08:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785165940; cv=none;
        d=google.com; s=arc-20260327;
        b=ZtRm0DXLcc4gc4VX4UBCc7NrsyogDNhoB3r4EVyGTGCXWFSgFrvE0+uF+Mn4VLm1gB
         0R+Lf+pHuVL7hTII42uF+PUGWwwJkwtSR1tEfO63H6M3cnWQ70D5bP3AHqbmNDk/Ni47
         kRw1Lm5g919Tt1sMgbN5H6cBFxp0m4z2UGJVX25z+7H1WSMGD7E20yn6JHqyOemyAVw5
         otl6voz/+Eq8bTqJ8ePNEyFanjq2cpa06pqN5dE59hpwMMPjrR0fRETs9CvCkOqrLksP
         rzBab7YBtWpeBgk6p2B/dZ85ZROsNPRtKW9kGAJt1CxUQMgr7VXgzPHJ7VdTcmuhNy30
         mNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZyQ5PZuTPEONWfNnvhVP4hsLVBIUJquX0mumyw6bxWs=;
        fh=mCD/mjmAnDYZtMjkjxSIc6K0SRbwyUESznG4V6022h4=;
        b=TEa1JpTw2rm33bOnNyA34dtu4U1/jnSmTnLEMLwBD/KIInMh/+AqzRjT3xEISqgTjz
         sNa4gBtAXJlTbMzW8y2HxgsZz4LOq/FEDIscOn5/MYoeIUPUk8TurWoYltAaC6qbqsqa
         GJGZwLZJtAWQTGcq3UmHzPbZojuyznBjTySj09S3Lc4ne1y0tGaNYNIUDr2MQYX/J3/L
         Zsetu/ZfwdQmsASvn7ViTKdTPcCjQFEXCh76ZU+VUo9ApQT6UyquI8PeqG77sj0q7iCa
         PlFyxLOuita9/xnsK99ucJv922BfahI41dhJVrfqXr7NWWZaYui1uGNgo7w+GsVRJjwo
         0Lmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785165940; x=1785770740; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZyQ5PZuTPEONWfNnvhVP4hsLVBIUJquX0mumyw6bxWs=;
        b=cnMlg+ZC5Xaqh6CuSuFvImkISd2XUh+oSEYCCiVEf+g0Fs701fEhOGxwIrdWpBAnWf
         i9XuDK9XVOZByLclKIp5r8tOma7VxGlIkvgcDTUq4kg9yyVxtNi1KSdSehQt8Yc/mnlx
         nBIp15zhsJ/FFw3XP2ed6ao5DURUJ/HUNv9tJ1iPFctEXDx1B161QdhcWHP+MdDR0Y0i
         Njxk7v3jjPe1MFVJA9D0FxbjsB+kgofQCpXdcURN6D03OhbF7Vy5wi2iz168wWlfkyCL
         11tz2LgB3D7wSPA3X9LhpHl0FYBRWGkT+cOgklUjtrYpe0U6E86Zijmk4f9axFDBXRSW
         51dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165940; x=1785770740;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZyQ5PZuTPEONWfNnvhVP4hsLVBIUJquX0mumyw6bxWs=;
        b=PRDLRXxMxBHvDOMsjWIdfwHODjp2Rqkv3jgFGbjLl1GxCtbHUrvLR+M/DPBbySzCKn
         ozodG/NfoKkeU8KnzXxm0GpE53jdhT7S3MzlRw8GmejC8DPNsnCPtosxkH6BeC7bFl1/
         B92mEZxNnwxHcJ1FxZFAUcqcC85eDnaMBIlb/8sjS9pVGz27aooxkIWobWiDjmruNtbz
         DoYfUHTk0ADcdx9QTMNi6m0DdLtk3t07VUGGZjBkkhGhbymXCX0+3z6Nf+Z5od/gxV3f
         bEGKozyXG83eEqlYwvZboQIDWRDehGtF/Qaycp2yG4fRLYMVSaZiiLYFhpRqCUZ9uz1Z
         xiHg==
X-Gm-Message-State: AOJu0Ywra9Ye7xsQyCEhXU7WjypBxTSpswZQNtWpeELaUcr+kJP7cS+c
	/Pv/k17xFonwSzlD/sqBtbB1g/d+U6vh1hTlWr7i5aHNrhhWYHAVncRl7VWySTBn43QTPGwjmSw
	jjCtNwxWFavLLg95gE9mD8Uxe0u856Ng=
X-Gm-Gg: AR+sD10vVzFIyk6N/Q8DSv15evqLf7QiAwj7RnJFoXb3HDcil7gy3grMT4plQx+eQki
	Cp8icMU3dERp2VO43RClz87YY3GDdkDsw6LE/d1jMNY38f0xUtB++0i3ZCVPiuFrWXI+7OKnmAO
	5uGI8ielcWWnGfoAxUtSHj45sv/U56vQibY1VShcUpbxuD0Ut6Q7y0xfp+0jeHzOHPu6wSQkzAr
	sOw0SzvNQsXzHjKKyjuiQsDFosDYkdwr7FkDQDmgEZm6iPgZJPW+nAXRaedOQh+rb6z51HALWV7
	71oUUqMUa6RKyf43I22dHtwqHRCM8MgRL5oOUiYmiXaNZbDxuRZwKygxkQ==
X-Received: by 2002:a17:907:c26:b0:c15:cd7c:fcf0 with SMTP id
 a640c23a62f3a-c1f1eabef74mr350397466b.1.1785165939596; Mon, 27 Jul 2026
 08:25:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717195336.98500-1-nikhilsolanke5@gmail.com>
 <20260717195336.98500-2-nikhilsolanke5@gmail.com> <20260726182946.79a4ef98.michal.pecio@gmail.com>
In-Reply-To: <20260726182946.79a4ef98.michal.pecio@gmail.com>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Mon, 27 Jul 2026 20:55:27 +0530
X-Gm-Features: AUfX_mz3Tx6f_QGAH6lPEIgpArKnzr7KWgpSIZN5Zn993HpKDUv4hxmZ1aapDq8
Message-ID: <CAFgddh+1Bk=CFkKYNzB=L++UejkhCEcTHp4A2JL2v+P6uBuF2w@mail.gmail.com>
Subject: Re: [PATCH 1/2] usbcore: Add quirk for 255-bytes initial config read
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, stern@rowland.harvard.edu, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 26 Jul 2026 at 21:55, Michal Pecio <michal.pecio@gmail.com> wrote:
> > diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> > index 45e20c6d76c0..442c15f92ccd 100644
> > --- a/drivers/usb/core/config.c
> > +++ b/drivers/usb/core/config.c
> > @@ -912,6 +912,17 @@ int usb_get_configuration(struct usb_device *dev)
> >       unsigned char *bigbuffer;
> >       struct usb_config_descriptor *desc;
> >       int result;
> > +     size_t usb_config_req_size;
> > +
> > +     /*
> > +      * Devices with quirky firmware will stall or reset when the initial
>
> Has anyone actually seen a device that stalls?
>


Regarding the "stall" wording, I was referring to the condition where
they fail with -EPIPE error when these devices are connected through
external usb hubs. The directly connected devices I've tested
typically fail with -EPROTO instead.  I'm happy to reword the comment
if you think that would make it clearer.


> Even if no device currently uses both quirks, I think this belongs
> after the msleep() below, to minimize interaction between the quirks.
>
> >               if (dev->quirks & USB_QUIRK_DELAY_INIT)
> >                       msleep(200);
> >


Alright I'll address this change in next revision.

For the remaining comment and log message wording, I'd prefer to keep
the current version for now unless there's a strong objection. The
patch has already gone through several review rounds and I'd like to
avoid extending the review cycle further over comment phrasing,
especially since the implementation itself now seems to be in good
shape.

Thanks,
Nikhil Solanke
