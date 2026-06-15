Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8363E3E451D
	for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2026 11:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781522959; cv=pass; b=ktoFz8BnXPvpn6FJKK22otGxQ8O8rA8c/XorX0pXTBZifieKiWA5B8sZQ2wLWhhLrwzM5IAu0i/wAjxspIx4URMUojFYHXljctjHDMsW7shJyndACP4/qbth520CxyMk3zHJlI4VksLlB6q/OWniUGBFrc0beX9rQQWk902/lg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781522959; c=relaxed/simple;
	bh=XrHQ2ghb9tYk0Fk2TjbdGNyzC8bUC97cBhe5JsKBb+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PVfPQWF+BzXvACpfh7r4NFO6hKlPEfEdgwS46tbDXZM9xnHDg03jBR6r7KMv/dDG4L8ROYw+it0ugdd2brpkFPfJG8wgcaWtAyM9Lp2gy9J/JwxKt0XboQ+zczZ+cQ3zcOUbiqaMlGePjcWc6Mxd5F+vuipyJN2m5LrRlIqLVHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Cf+TxV4I; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cf+TxV4I"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36bd175fdbaso1908775a91.0
        for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2026 04:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781522956; cv=none;
        d=google.com; s=arc-20240605;
        b=btHiaxeJhk9GiiO6grolPCFZfBtLo6tNA+m6jVur5FLr0dLQMX0S/DPyn1aV9qv2B8
         ZXMbnVpUpIVAFWvBzuLCH3PtUH9hHXMe4OBuoiG+XRl/saL2uP/HO9iwSKr0DPveKVRB
         W+Uyzxap2uAu+q8ROUIKYGuNxD4geLFlPVggmU3H3z8MEj/3ZE5pgS+sLIwf6TS41o6z
         0s7zDRWWa9NaCgyjLaBQhXs0sX62M3qL2vAOjzB1Ab1iZLg5TNUuZTBI7kxawKIAQZkW
         hgjcgShL/8xc1qwVaV0kAiAUX/Z/GbSXzJlRcSrMR93vu/yNyD4n/PvZdGtyx00jP/FH
         ITIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y/6BCyXwGm97aBFJu1bGx+oAMGH1MELcxK+J4ZhZkWM=;
        fh=DY739BdZ59rxNTUbCWMwEtn3xLWwb5EWIlO09dlmyFY=;
        b=YgwBIoSSjxAy+pOY/GUjEkrKRmHp90K4RGHh2VD/VcUeOWcy0QAY+1kYt54iwLgirF
         M1bTZGE5siMvHAl89BGiwVzHjaoDpHtcStJzldKX9n945ja6+T+RS+fIsObDGe3Yq/88
         hs5bm7xuUocKQ/KaPuDi+dJSLq4O+H2X9YntrW+srXuzj4uQfGNyvi7E3AbsYqgwZkzq
         WK8ylhXjf0j4z4cmnMorguWlGf/sGVOWfprQuTiKBvth9lGEXVm45Xuzo7mfibywjkXw
         xNE1nGT2JvQ1LRnhmEwmXCC+Ohl5y33Fdo7YnwQ2F96LdyN2s34K1wZE0mc3DVgpQIpL
         O3Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781522956; x=1782127756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/6BCyXwGm97aBFJu1bGx+oAMGH1MELcxK+J4ZhZkWM=;
        b=Cf+TxV4I+zvOf7guOFw7jycfd3AEXrurnw9u4vKoFzRxAYpPcJdliB2wC0N++TnKq5
         kAGUPPyoHuRFSGa3gDfyPYvy8TSVajGb+jNpY0ix01UpLLVx3PkdK5zCFyJcwYe22Q7N
         im7pWb5cmBsZFlWHzVW7I67+nxH52X3qBKPxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781522956; x=1782127756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y/6BCyXwGm97aBFJu1bGx+oAMGH1MELcxK+J4ZhZkWM=;
        b=QaipyBlzJqqHB7YmG2L+E2yGC6K02HZID6xHoz3Q1/hGJLtvwfKL+CD8VGA8gorHRO
         3ah5DuQNDreZb0ug2nOKSZFtShAxsnBFcTHLxSZ0G8LIXzfVmLXx3O5tuTGoWWTcLRGn
         RUPmaXDjYf3J6mU8hLhaW1Y4KHEwhK9sfUZ2A67D97ecIjeZW9Rn2+td1KFK2xj1OERO
         hR0KQIyB2HuH8WoZdCev9sjgmoCIOsY9zhWFrBakMzm5MltiuNlLRsWPqNtHHctUZ2H1
         qLNtcC5Y35/m6bNIwJXZYPJ44yXKpKBCRnsu7z4COyVZrqprjXkaztHdHR/oCEuPa9AB
         Ifgw==
X-Forwarded-Encrypted: i=1; AFNElJ89REzI2ePgmPQqafRpdBA2A9OddSjNefrqdfKdwo9RW8fZ6ba4KY/mu9d1CLP3DQ2vCHbEXMLXx60=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUj1bdHNLl1uZ1t8QkVdw7zgIngBaDuLuYFxj5eVvC7sPDDqPD
	J2CMysMAZnoRyTOCTMCLsM+5Gfa98n17Bop+kLjG/jb6PCipp3al0+SgH6GsAJLbMRt765Ntpmh
	JTBVamzsPjyQm2kNLUoINPfTfPr4+Jy5rAfO13v30
X-Gm-Gg: Acq92OE2IgvzYwwIrwrq+ae/c7Rw5d8LY2P95qDU1/FD/q0gM4H3drYhF7Z7xefnAXf
	R5b/+fMXgx60Nl2DqGzmlL+dP3/pdMZME6AI8McBkDmcYCm4WrE1Vv+ZjuK15lppgkNSZNqUhKY
	vJ+IxnT7LyDMh017L0FgghLnNsDlyn53eZR3SLkcD1Dz0HY8XlIkfE4x4wRspy6dgI2ybzeayfT
	QpU3b/ZaZYeRM5FWCWrlXRcOU5Qq/lvt9os6S/2Jm+9FsKK+bVj3j8I00JMPeEGF7WomtWLpOYo
	u9+e6AtaT9Y+RizuzK6i8D7HOiDZOeAaGLDlSMB8xQswsaGD
X-Received: by 2002:a17:90b:3fcd:b0:36b:b06c:30a1 with SMTP id
 98e67ed59e1d1-37c2bc42814mr10297174a91.1.1781522955846; Mon, 15 Jun 2026
 04:29:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611122146.262184-1-akuchynski@chromium.org>
 <20260611122146.262184-2-akuchynski@chromium.org> <aisCpo9Zmdyo_ovx@google.com>
In-Reply-To: <aisCpo9Zmdyo_ovx@google.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Mon, 15 Jun 2026 13:29:04 +0200
X-Gm-Features: AVVi8CcpbNvNBQEoiHa5pX6EmFLJjR1ewd_DuEsXiwRH2vfOAim4sm1u9TommTI
Message-ID: <CAMMMRMcZcaWbAQbEycaEakysYPQ44GPogVpVV0b9n27r+4Sdpg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] usb: typec: Add helper to check cable altmode support
To: Benson Leung <bleung@google.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 8:47=E2=80=AFPM Benson Leung <bleung@google.com> wr=
ote:
>
> On Thu, Jun 11, 2026 at 12:21:44PM +0000, Andrei Kuchynski wrote:
> > Introduce typec_cable_altmode_unsupported function to evaluate whether =
an
> > alternate mode is restricted based on the connected cable's properties.
> >
> > Implement validation logic that parses the cable's identity to catch
> > incompatible setups early. Alternate modes are restricted over:
>
> I think I follow this logic, and it is correct, but it may be harder to
> understand for a passing code observer who aren't deeply versed in how US=
B-C
> cables work. I think maybe additional comments on each of these resolutio=
n
> cases may be helpful.
>

Hi Benson,

Thanks for your review!
I will add descriptions for all the steps as you suggested.

> >  - cables lacking an identity header
>
> Cable lacking an ID Header indicates a non-emarked cable, which in the ca=
se
> of a detachable C-to-C cable, can only be guaranteed to have USB 2.0 data=
 path
> (D+ and D-).
>
> >  - passive cables with USB 2.0 speed
>
> In this case, it's an affirmative confirmation from an e-marked cable
> (ID Header present, rest of e-mark present), we are sure it's a USB 2.0-o=
nly
> cable.
>
> >  - active cables unless they have corresponding plugs
>
> This case is a little bit nuanced. The "corresponding plugs" means that t=
his
> cable has an e-marker, supports modal operation, and the SOP' alt mode no=
des
> are created. You're looking for a 1:1 match based on SVIDs that this cabl=
e
> has support for the alt mode being queried here. If  yes, then alt mode i=
s
> supported. If there's no match, then the alt mode is unsupported.
>

Yes. The altmode is supported if the cable's SOP' alt mode was registered.
Otherwise, the alt mode is unsupported if the cable is active.

> >
> > The function returns false if the cable is not registered or the identi=
fier
> > is not set.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  drivers/usb/typec/class.c | 35 +++++++++++++++++++++++++++++++++++
> >  include/linux/usb/typec.h |  1 +
> >  2 files changed, 36 insertions(+)
> >
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 0977581ad1b6e..f7f1adbaab7e6 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -1429,6 +1429,41 @@ int typec_cable_is_active(struct typec_cable *ca=
ble)
> >  }
> >  EXPORT_SYMBOL_GPL(typec_cable_is_active);
> >
> > +/**
> > + * typec_cable_altmode_unsupported - Check if a cable restricts altmod=
e
> > + * @alt: The Alternate Mode to evaluate
> > + *
> > + * Returns true if the connected cable is incapable of handling the al=
tmode.
> > + */
> > +bool typec_cable_altmode_unsupported(struct typec_altmode *alt)
> > +{
> > +     struct typec_altmode *plug;
> > +     struct typec_cable *cable;
> > +     bool unsupported =3D false;
> > +
> > +     plug =3D typec_altmode_get_plug(alt, TYPEC_PLUG_SOP_P);
> > +     if (plug) {
>
> In this case,  we have an affirmative match on alt mode
> being queried, so the cable supports this alt mode, which is why you retu=
rn
> false, meaning alt mode is supported.
>

Right. Here we know for sure that the cable supports the alt mode.

> > +             typec_altmode_put_plug(plug);
> > +             return false;
> > +     }
> > +
>
> Past this point, there is no SOP' alt mode object matching the alt mode.
> The only way to return supported is if we find the cable is a passive cab=
le
> of at least USB3 Gen 1 or better speed.
>

The function returns 'unsupported'. This is important because if the cable
isn't registered or the cable identity isn't specified, we can not assert
that the cable supports altmode. However, we can assert that no
restrictions are defined.
Checking cable && cable->identity pointers is necessary not only for
safety reasons, but also to confirm that we have information about the
cable.

> > +     cable =3D typec_cable_get(typec_altmode2port(alt));
> > +     if (cable && cable->identity) {
> > +             const u32 id_header =3D cable->identity->id_header;
> > +             const u32 speed =3D VDO_TYPEC_CABLE_SPEED(cable->identity=
->vdo[0]);
> > +
> > +             if (!id_header || PD_IDH_PTYPE(id_header) =3D=3D IDH_PTYP=
E_ACABLE)
> > +                     unsupported =3D true;
> > +             else if (PD_IDH_PTYPE(id_header) =3D=3D IDH_PTYPE_PCABLE)
> > +                     unsupported =3D (speed =3D=3D CABLE_USB2_ONLY);
>
> This might be a little easier to follow if this was a switch statement on
> PD_IDH_PTYPE(id_header) so the reader can see what different behavior is =
between
> PCABLE and ACABLE.
>

Good point. I will change it.

Thanks,
Andrei
