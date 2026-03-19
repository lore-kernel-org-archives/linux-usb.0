Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBC83CE48C;
	Thu, 19 Mar 2026 11:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921362; cv=none; b=eJdOoClSQyiujyw85FHl8u0MrDHBTRdzOql/dgXdcCXLj+hWMdwYeZMczjXrI0qCEhuN5D5x9iPm/+lsQf/v9g3HVoVCc2+vXZAjK3o+kZisYvM33BpEweFNOh3kTEgGojrb6j12Fr2ocnSLbic+N/AgzE9GNxGilrOhEhbeY5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921362; c=relaxed/simple;
	bh=dAVUH9mB3teH6dDCtop5iHuqb/WwubXRW7awteRoxNA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b56upgmMOEpG4mn9Zbv9KMQJwfL9HOq8loKtiB7eP7fp6XEPVroLiMB7enzoNK3H3WMohaCrXM/BtnAnfTUynDvFao6IGfMO2tmmqNf6ouWU5iKFVQ3+8q4do/zfdeZqzv3X2P0q0UWD8jTNHEYsVDBXxyUUNYeh0P89m1Mpgok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b68cef.dsl.pool.telekom.hu [::ffff:81.182.140.239])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000C70AD.0000000069BBE316.0007D3DF; Thu, 19 Mar 2026 12:50:46 +0100
Message-ID: <3f4d7dc75346339dd8dfc89c473587ce0f140958.camel@irl.hu>
Subject: Re: [PATCH v3 4/4] media: uvcvideo: RFC: Convert
 allow_privacy_override into Kconfig
From: Gergo Koteles <soyer@irl.hu>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Hans de Goede <hansg@kernel.org>,
  Mauro Carvalho Chehab <mchehab@kernel.org>,
  linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-usb@vger.kernel.org
Date: Thu, 19 Mar 2026 12:50:46 +0100
In-Reply-To: <CANiDSCvJnwGix2fZU7KygM8zC1sizkgrW-BVyESnMcmXhGE+zw@mail.gmail.com>
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
	 <20260316-uvcdynctrl-v3-4-19cd4657e1f3@chromium.org>
	 <2026031852-unplowed-ocelot-142a@gregkh>
	 <CANiDSCvJnwGix2fZU7KygM8zC1sizkgrW-BVyESnMcmXhGE+zw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ricardo,

On Wed, 2026-03-18 at 15:57 +0100, Ricardo Ribalda wrote:
> Hi Greg
>=20
> On Wed, 18 Mar 2026 at 15:17, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >=20
> > On Mon, Mar 16, 2026 at 01:34:47PM +0000, Ricardo Ribalda wrote:
> > > This patch is just shared for discussion purposes! Do not land.
> > >=20
> > > In a perfect world, after a deprecation process, we will be able to
> > > remove allow_privacy_override and block all privacy related controls.
> >=20
> > Why add something you are only going to remove in the future?  What has
> > changed to require this now, and will change in the future to make it
> > not needed?
>=20
> Currently, any application with camera access can manipulate the
> privacy LED. I believe this is a security flaw; ideally, the kernel
> should block all such controls by default.
>=20
> However, blocking these controls immediately might be seen as a
> regression for certain users. I added allow_privacy_override to:
> - Prevent breaking existing workflows immediately upon a kernel update.
> - Give users time to report why they still need manual LED control.
>=20
> The goal is to gather these use cases over the next 1=E2=80=932 years. On=
ce we
> understand the legitimate needs, we can either implement a proper
> specialized mechanism for them or move the toggle to a Kconfig option
> for those who explicitly need to opt-in to the old behavior or simply
> remove the toggle altogether.
>=20
> For the record, identified use cases so far:
> - Old hardware with red LEDs that reflect on glasses. (Likely a dying nic=
he).

Older Logitech cameras, like the c920, have fairly large LEDs that can
be reflective, and it's hard to cover them up aesthetically. Laurent
wrote [1] that's why Logitech added this functionality a long time ago.

You can find old Logitech software for Windows that still allows you to
turn off the LEDs [2]. I tried it in a Win10 VM and it really works.

The c920 is a very popular camera, still available in stores today.
Amazon says it sells 12k of them per month [3].

1:
https://lore.kernel.org/all/20251119041907.GH10711@pendragon.ideasonboard.c=
om/

2: https://www.reddit.com/r/logitech/comments/v641x6/comment/nr22zo7/

3: https://www.amazon.com/s?k=3Dlogitech+c920

> - Using cameras as baby monitors where the LED disturbs sleep.

And pet cameras and surveillance cameras don't need LEDs either.

> (Arguably solvable with a piece of tape on the LED, but still a
> reported use case).
>=20

Furthermore, if we filter these two Logitech XUs, we could then add the
similar XUs of the camera modules in laptops and this could be an ever-
growing list.

>=20
Best regards,
Gergo Koteles
