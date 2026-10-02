Received: from mail-yx2-f16.google.com (mail-yx2-f16.google.com [74.125.224.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65EA334688
	for <linux-usb@vger.kernel.org>; Fri,  2 Oct 2026 05:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.144
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790919025; cv=pass; b=ZnyX5NYIX5Xdv7XnFTnXFKhHFONN4F1/mbfkBdyfaHn8o/k4+G6xLu4Q6QFRgxBfYjBH9+A1sqIPlFyy8nM6WA+gVVmuIWsNdL8kfdlDaDssh4U33kTqDYTpgcHcQrxIulAdNDgbB3C/Glj14aIIz8K83hVqLh5pIueGJ1NyUC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790919025; c=relaxed/simple;
	bh=2FN2drQCDcOIEhnWtNx7hv9cEpL2yj/Gwb4Ajj9yhKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SpKfuxIwi2ohsrsiqepwJGx7SPKfsoYiYAXGFIA48rW8TI0XUSOh9uwKlQEzF2T1asoflGP5hEA8qkMSxHO+kUptx0PyxZ+iv5WAqh6oHeVaJ71gDdu/Bjtv+l7R6O779PQ9Rd0P2juR3PnLAp2VKX27846xay8zdgfnpcX+IzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kdy8br0M; arc=pass smtp.client-ip=74.125.224.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kdy8br0M"
Received: by mail-yx2-f16.google.com with SMTP id 956f58d0204a3-6756f62025aso4046442d50.3
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2026 22:30:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790919021; cv=none;
        d=google.com; s=arc-20260327;
        b=ROiDCTG2qVZrhzEyXcOkg7YiLy2TfaAd5vKBonJdiR25bpjH57WkiMlGnjR5gxMrND
         021p64sQ0WpVuN8z68N1MuA2F8UduoaC3rJ18iSWy9dK8kfO1KWoImYqBajI/JGLtgnc
         F81Rk3Y72A8HJqHm0UrVTtfjzTfED3Z8ly3xtv0exnZp1sd/ipROxvD0q2rc8ieBgXOE
         iW+nWw79t9OfFNgRRUsr/Egkt1v6+1R4UU7c1YtjuSusxcCJOO9pCKgU97ldxR5zBFyN
         MEJy1T+uGLWJP7lmZ19faCoo1tASVK7lDy0uvZ2HDe4k9zciNqTfbK0+pmgHseTdSDVU
         haJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j4RSpQmQv+xAXJttA29f+V90nwjJ9XXA1sdJdukgetA=;
        fh=Q+RbxmpUcLh7otiOoBhRmxVLAYpm4Mb1BsL4NKlA6tc=;
        b=IG5/kqkYyeG+jCyZ4CqOVaRVKFBl/HVj8jrBYqiDYYH14QZAwrAWbmDkQxme6kUEvH
         Jk+QjcAOeDtc6qPbzB3cSlcaIGSCLqnPrxHpjwuyiuFLYWta3KujAikugQtEx707JGVM
         WrX5mc9B6px4wf9P1Xq5lHxubvIFqCaJPf3KeLA4kxvxZfpwfhLNY5gFoJwfnM+UFbkJ
         kFYGDgaD+fgjym62JpGs3CDsprMu7l2TF38Aw5MbSsSYTarPT+M+0RLNRAfiK+2qlrsT
         61Z0aRMAyZEsosxVWjnothocspzvaDgQdAnb6LBv9WBT+m2f10RPpyLBRAFfuUljKH8n
         jLKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790919021; x=1791523821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j4RSpQmQv+xAXJttA29f+V90nwjJ9XXA1sdJdukgetA=;
        b=kdy8br0MEo8XgFOEeqaGH3yHZMfrKMfcclL3ElZSNJkXy3hsevJ2UIjxOdcdq2DteI
         1DZ0+j5okspRpzQrzARc1pHT3rgbcMpVT9eXnCBGPIWH/4kF7RSXehR4CIrxrPsSxtNh
         Z6SwLYwNNA2dut9JnzIYjKd3+05i0OrCJq9aU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790919021; x=1791523821;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4RSpQmQv+xAXJttA29f+V90nwjJ9XXA1sdJdukgetA=;
        b=GwoPAd75bvl0CouaoV3QrJZIAkcZh2IwObbOAlWGOZzc+Pjf5zvNoCgiI/p8jW0MxX
         mtv6js0NtHmqgjFpstgCYmwD9tDzFcHXa+fxkEpDpJCv68kAQOm+IjbLdR24t/nuw5Ix
         TMhzy+OprOqbsxm+hOWXdZv7M59Wdgmbi7FvSjgBMB/sIu/gaCz2gFAFyqKInDD6jZc+
         63RrNjCE/VMdLzAIi46Od/2l9R5/jU/5uB/OzZ0vCkHGCVXl5R9MYWr8wNk3e1eURG26
         YErJGxHqinmWeehzAOwJnLG6wMWiruD9fuyN/jk/3bPki6yDxp1hOpgH7Kpa7fCaw1Mu
         mGHA==
X-Forwarded-Encrypted: i=1; AKwUvBwRGy2xEAJLc6DpDJFS+z8Sv0SaFdxNbh5T9qHOAV9Lengasc7q5nzZXpLWIoX3sP6PvMgP5afKHhY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZlaah9ahGOcOGWv9Vs0aQv8OyA/07UGZN9Rn0bBOYoET0Kycb
	NmHnP9ADx3YZBIS+XCmMDT+ZGvrJTK3fxJdqy7WepXUMcGj/qMXWoEz/go7TioGPMpoYAgwBAF+
	n6skHTeAK4uUK0fMmbKuzfvINg7hcFo2CKgzSJckE
X-Gm-Gg: AYBFou0kAb6iLcz0wCw+S5x6VuK/fGVGcljjRr8d0mJm/JxCMpV28f6CllpUQFRWjlD
	TFfnEh14WfmOXiD6WgA2N+LiSSxBU6H7CQUd0ZzFGjFLAHnKT+dSLoFEP0netXw1PNWyhqmeIyN
	Xdr6DXY04l7n0sx0Gv4HafMKGkwfCRW6ij2fYbuy/v7plIY0tDfGwkRWLZ+L8OzviC6AeMRt3Id
	aowTEvE91GmmLip8gCcSLVxgO8r1OP6ZMsbsM+5KGXrbm5YqgLtWRLXZFCFzJlewhx4JhtneDQu
	3d2dqvtutraG5+8vWi53IyzuTrXSw/0kYvAbQtgaPjMbW/k/2nPmait1N0+NQyvr8F88fBYhPv9
	hzT7aMgxKk/BBKK7o5WeO
X-Received: by 2002:a05:690e:169f:b0:677:aee3:424e with SMTP id
 956f58d0204a3-677aee34305mr399083d50.43.1790919021591; Thu, 01 Oct 2026
 22:30:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001110630.1476797-1-wenst@chromium.org> <2026100144-defraud-subarctic-b726@gregkh>
In-Reply-To: <2026100144-defraud-subarctic-b726@gregkh>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 2 Oct 2026 13:30:10 +0800
X-Gm-Features: AclHuK8KtFG9iG6pzsLsK7sS5kycLBWn6HiRtg9sOfQ7De-Rt36thM7LOfPqgRA
Message-ID: <CAGXv+5Feu=pR0tE7qWyBCTGhLufR8QTyjSo-+DAS5BQwaO4FQA@mail.gmail.com>
Subject: Re: [PATCH v3] usb: hub: Set proper message when usb_hub_create_port_device()
 fails
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 7:23=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Oct 01, 2026 at 07:06:30PM +0800, Chen-Yu Tsai wrote:
> > Right now when usb_hub_create_port_device() fails, it prints a separate
> > error message to say which port failed, but otherwise leaves 'message'
> > set to the default "out of memory", which is somewhat misleading.
> >
> > Use a small buffer on the stack to put the custom formatted error messa=
ge
> > in and use it as the error message.
> >
> > Assisted-by: LLM # local reviews
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v2:
> > - Simplify to just using a small buffer on the stack (Alan)
> >
> > Changes since v1:
> > - Explicitly track and free the allocated custom error message instead
> >   of using devm_kasprintf()
> > - Link to v1:
> >   https://lore.kernel.org/all/20260728100005.413868-1-wenst@chromium.or=
g/
> >
> > Sorry Andy, I ended up not using your __free(kfree_const) patch. My LLM
> > was telling me that it won't work correctly if CONFIG_USB=3Dm.
> > ---
> >  drivers/usb/core/hub.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 0e929a4c9fa1..d7f39e86b24c 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -1480,6 +1480,7 @@ static int hub_configure(struct usb_hub *hub,
> >       unsigned int pipe;
> >       int maxp, ret, i;
> >       char *message =3D "out of memory";
> > +     char msg_buf[32] =3D {};
>
> Why are you initializing this?

It seemed sane. I guess this probably isn't needed.

> >       unsigned unit_load;
> >       unsigned full_load;
> >       unsigned maxchild;
> > @@ -1756,8 +1757,8 @@ static int hub_configure(struct usb_hub *hub,
> >       for (i =3D 0; i < maxchild; i++) {
> >               ret =3D usb_hub_create_port_device(hub, i + 1);
> >               if (ret < 0) {
> > -                     dev_err(hub->intfdev,
> > -                             "couldn't create port%d device.\n", i + 1=
);
> > +                     snprintf(msg_buf, sizeof(msg_buf), "couldn't crea=
te port%d device", i + 1);
> > +                     message =3D msg_buf;
>
> Please just do what the other errors do, set message to something else
> and leave the dev_err() here.  That way no extra stack space is needed.

OK.

> And how did you hit this?

My other series adding pwrseq to USB hub port power controls [1] would let
usb_hub_create_port_device() return -EPROBE_DEFER if the pwrseq provider
isn't available yet. Due to probe ordering it is always unavailable the
first time around, as the regulator supplying the pwrseq device (M.2 slot)
hasn't probed yet.

BTW that patch series really needs a look over from the USB maintainers.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20260916075745.3549953-1-wenst@chromium.org=
/
